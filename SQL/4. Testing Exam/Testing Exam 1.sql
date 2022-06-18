-- CREATE DATABASE --
DROP DATABASE IF EXISTS			testting_exam_1;
CREATE DATABASE IF NOT EXISTS	testting_exam_1;
USE 							testting_exam_1;

-- Question 1. Tạo table với các ràng buộc và kiểu dữ liệu. Thêm ít nhất 5 bản ghi vào table.
-- CREAT TABLE --

DROP TABLE IF EXISTS customer;
CREATE TABLE IF NOT EXISTS customer 
	(	CustomerID	TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		`Name`		NVARCHAR(90),
        Phone		VARCHAR(11),
        Email		VARCHAR(50),
        Address		NVARCHAR(255),
        Note		TEXT
    );

DROP TABLE IF EXISTS car;
CREATE TABLE IF NOT EXISTS car
	(	CarID	TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		Maker	ENUM('HONDA','TOYOTA','NISSAN'),
        Model	VARCHAR(50),
        `Year`	VARCHAR(4),
        Color	VARCHAR(15),
        Note	text
    );
    
DROP TABLE IF EXISTS car_order;
CREATE TABLE IF NOT EXISTS car_order  
	(	OrderID			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		CustomerID		TINYINT UNSIGNED,
        CarID			TINYINT UNSIGNED,
        Amount			TINYINT DEFAULT 1,
        SalePrice		INT,
        OrderDate		DATE,
        DeliveryDate	DATE,
        DeliveryAddress	NVARCHAR(255),
       `Status`			TINYINT(1) DEFAULT 0,
		Note			TEXT,  
        CONSTRAINT fk_costumer FOREIGN KEY	car_order(CustomerID) REFERENCES	customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_car FOREIGN KEY	car_order(CarID) REFERENCES	car(CarID) ON UPDATE CASCADE ON DELETE CASCADE
	);
    
    -- INSERT % ban ghi vao table --
    -- Customer --
    SET autocommit	= OFF; 
    START TRANSACTION;
    
    INSERT INTO customer	(CustomerID, 	`Name`, 			Phone, 		Email)
    VALUES					(1			,	N'Nguyễn Công Anh',	0969654852,	'nguyenconganh@gmail.com'),
							(2			,	N'Nguyễn Minh Tú',	0906712845,	'nguyenminhtu@gmail.com'),
                            (3			,	N'Lê Quốc Huy',		0968495045,	'lequochuy@gmail.com'),
                            (4			,	N'Vũ Lan Anh',		0894146821,	'vulananh@gmail.com'),
                            (5			,	N'Nguyễn Tuấn Anh',	0985462895,	'nguyentuananh@gmail.com');
	COMMIT;
    
    -- Car --
	START TRANSACTION;
   INSERT INTO car	(CarID,			Maker,		Model,	`Year`,		Color)
	VALUES			(1			,	'HONDA',	'CR-V',	'2018',	'white'),
					(2			,	'TOYOTA',	'Fortuner',	'2019',	'Black'),
                    (3			,	'HONDA',	'CR-D',	'2020',	'Gray'),
                    (4			,	'NISSAN',	'NISSAN-Full4',	'2016',	'Yellow'),
                    (5			,	'TOYOTA',	'Sport',	'2021',	'white');
    
	COMMIT;
    -- car_order --
    START TRANSACTION;
   INSERT INTO car_order	(OrderID,	CustomerID,	CarID,	Amount,	SalePrice,	OrderDate,		DeliveryDate, `Status`)
	VALUES					(1,			3,			5,		1,		30000,		'2022-3-15',	'2022-4-15',	1),
							(2,			4,			1,		1,		40000,		'2022-3-25',	'2022-4-25',	1),
							(3,			1,			4,		1,		34000,		'2022-4-15',	'2022-5-15',	1),
							(4,			5,			3,		1,		26000,		'2022-5-15',	'2022-6-15',	1),
							(5,			2,			2,		1,		41000,		'2022-3-11',	'2022-4-11',	2),
                            (6,			1,			5,		1,		30000,		'2022-3-15',	'2022-4-15',	2),
							(7,			2,			1,		1,		40000,		'2022-3-25',	'2022-4-25',	1),
							(8,			1,			4,		1,		34000,		'2021-4-15',	'2022-5-15',	2),
							(9,			3,			3,		1,		26000,		'2022-5-15',	'2022-6-15',	1),
							(10,		1,			2,		1,		41000,		'2022-3-11',	'2022-4-11',	0);
    COMMIT;
    
-- Question 2. Viết lệnh lấy ra thông tin của khách hàng: tên, số lượng oto khách hàng đã mua và sắp sếp tăng dần theo số lượng oto đã mua.

SELECT 	C.CustomerID, C.Name, COUNT(CO.Amount) as So_luong_oto_khach_da_mua
FROM		car_order AS CO
INNER JOIN	Customer  AS C USING (CustomerID)
WHERE		CO.`Status` = 1 -- Da giao = da mua
GROUP BY	C.CustomerID
ORDER BY	So_luong_oto_khach_da_mua;

-- Question 3. Viết hàm (không có parameter) trả về tên hãng sản xuất đã bán được nhiều oto nhất trong năm nay.
DROP PROCEDURE IF EXISTS pro_HangSanXuat_ban_nhieu_oto_nhat;
DELIMITER //
CREATE PROCEDURE pro_HangSanXuat_ban_nhieu_oto_nhat()
BEGIN
		WITH CTE_so_luong_oto_ban_trong_nam_nay as 
		(	SELECT		C.CarID, C.Maker, CO.OrderDate , COUNT(CO.Amount) as SL
			FROM		car_order AS CO
			INNER JOIN	car AS C USING(CarID)
			WHERE		YEAR(CO.OrderDate) = YEAR(now())
			GROUP BY	C.Maker
		)

		SELECT		C.CarID, C.Maker, CO.OrderDate 
		FROM		car_order AS CO
		INNER JOIN	car AS C USING(CarID)
		GROUP BY	C.Maker
		HAVING		Count(CO.Amount) = (SELECT Max(SL) FROM CTE_so_luong_oto_ban_trong_nam_nay);
END //
DELIMITER ;
CALL pro_HangSanXuat_ban_nhieu_oto_nhat();

-- Question 4. Viết 1 thủ tục (không có parameter) để xóa các đơn hàng đã bị hủy của những năm trước. In ra số lượng bản ghi đã bị xóa.

DROP PROCEDURE IF EXISTS 	pro_Xoa_donhang_bi_huy;
DELIMITER //
CREATE PROCEDURE 			pro_Xoa_donhang_bi_huy()
BEGIN
	DECLARE SL_record_bi_xoa INT;
		WITH CTE_don_hang_bi_huy_nhung_nam_truoc as
		(
			SELECT	*
			FROM	car_order
			WHERE	`status` = 2 AND year(OrderDate) < year(now())
		)
		DELETE FROM car_order WHERE OrderID = (SELECT OrderID FROM CTE_don_hang_bi_huy_nhung_nam_truoc);
		SELECT row_count() INTO SL_record_bi_xoa;
		
        
        SELECT concat('Da xoa ', SL_record_bi_xoa, ' record') as Print_output;
END //
DELIMITER ;

CALL pro_Xoa_donhang_bi_huy();

-- Question 5. Viết 1 thủ tục (có CustomerID parameter) để in ra thông tin của các đơn 
-- hàng đã đặt hàng bao gồm: tên của khách hàng, mã đơn hàng, số lượng oto và tên hãng sản xuất.
DROP PROCEDURE IF EXISTS	pro_get_info_customer;
DELIMITER //
CREATE PROCEDURE 			pro_get_info_customer(IN in_customerId TINYINT(255))
BEGIN
		SELECT		C.Name, CO.OrderID, COUNT(CO.Amount) AS So_luong_oto_da_mua, CR.Maker
		FROM		car_order AS CO
		JOIN		Customer AS C USING (CustomerID)
		JOIN		car	AS CR	USING	(CarID)
		WHERE		C.CustomerID = in_customerId AND CO.Status = 1 -- DA mua thi status = 1
		GROUP BY	C.`Name`;
END //
DELIMITER ;
CALL pro_get_info_customer(1);

-- Question 6. Viết trigger để tránh trường hợp người dụng nhập thông tin không hợp lệ vào database (DeliveryDate < OrderDate + 15).

DROP TRIGGER IF EXISTS trigger_insert_data;
	DELIMITER //
CREATE TRIGGER trigger_insert_data 
BEFORE INSERT ON car_order
FOR EACH ROW
BEGIN
    IF (NEW.DeliveryDate < NEW.OrderDate + INTERVAL 15 DAY) THEN
	SIGNAL SQLSTATE '12345'
	SET MESSAGE_TEXT = 'Cant INSERT data!!';
	END IF;
END //
	DELIMITER ;

INSERT INTO car_order	(OrderID,	CustomerID,	CarID,	Amount,	SalePrice,	OrderDate,		DeliveryDate, `Status`)
VALUES					(12,			3,			5,		1,		30000,		'2022-3-15',	'2022-3-17',	1);