-- CREATE DATABASE --
DROP DATABASE IF EXISTS			ThucTap;
CREATE DATABASE IF NOT EXISTS	ThucTap;
USE 							ThucTap;

-- Question 1. Tạo table với các ràng buộc và kiểu dữ liệu. Thêm ít nhất 3 bản ghi vào table
	
    -- CREATE TABLE --
DROP TABLE IF EXISTS Country;
CREATE TABLE IF NOT EXISTS Country 
	(	country_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		country_name	NVARCHAR(250)
    );

DROP TABLE IF EXISTS Location;
CREATE TABLE IF NOT EXISTS Location
	(	location_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		street_address	NVARCHAR(250),
        postal_code		TINYINT UNSIGNED,
        country_id		TINYINT UNSIGNED,
        CONSTRAINT fk_country FOREIGN KEY	Location(country_id) REFERENCES	Country(country_id)
    );
    
DROP TABLE IF EXISTS Employee;
CREATE TABLE IF NOT EXISTS Employee  
	(	employee_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		full_name		NVARCHAR(250),
        email			VARCHAR(50),
        location_id		TINYINT UNSIGNED,
        CONSTRAINT fk_location FOREIGN KEY	Employee(location_id) REFERENCES	Location(location_id)
	);
  
  -- INSERT data ban ghi vao table --
	SET autocommit	= OFF; 
    -- Country --
    START TRANSACTION;
    INSERT INTO Country	(country_id, country_name)
    VALUES				(1,			N'Việt Nam'		),
						(2,			N'Lào'			),
                        (3,			N'Thái Lan'		),
						(4,			N'Trung Quốc'	),
                        (5,			N'Ấn Độ'		);
	COMMIT;
    
    -- Location --
	START TRANSACTION;
   INSERT INTO Location	(location_id,	street_address,						postal_code,	country_id	)
		VALUES			(1,				N'84 Chùa Láng, Đống Đa, Hà Nội',	101,			1			),
						(2,				N'212 Sầm Nưa, Lào',				102,			2			),
                        (3,				N'12 Thành Đô, TQ',					104,			4			),
                        (4,				N'62 BăngKok, Thái Lan',			103,			3			),
                        (5,				N'61 Ando hindu, Ấn Độ',			105,			5			);
	COMMIT;
    
    -- Employee --
    START TRANSACTION;
   INSERT INTO Employee	(employee_id,	full_name,				email,						location_id	)	
	VALUES					(1,			N'Lê Quốc Huy',			'lequochuynn03@gmail.com',	1			),
							(2,			N'Nguyễn Kiều My',		'kieumynn03@gmail.com',		1			),
                            (3,			N'Nguyễn Tuấn Anh',		'tuânnhnguyen@gmail.com',	1			),
                            (4,			N'Sầm Tớ',				'santonn045@gmail.com',		2			),
                            (5,			N'Linh Linh Đan Đan',	'linhlinhdan@gmail.com',	3			),
                            (6,			N'Lạch Chay',			'lachchay@gmail.com',		4			),
							(7,			N'A la Đin',			'aladin@gmail.com',			5			);
    COMMIT;
 
 -- Question 2. Viết lệnh để
		-- a) Lấy tất cả các nhân viên thuộc Việt nam
WITH CTE_location_country AS 
(
	SELECT		*
	FROM		location 	AS L
	INNER JOIN 	country 	AS C USING(country_id)
)
SELECT		E.*, CTE.street_address, CTE.country_name
FROM 		employee 				AS E
INNER JOIN 	CTE_location_country 	AS CTE USING (location_id)
WHERE		CTE.country_name = 'Việt Nam';
		
        -- b) Lấy ra tên quốc gia của employee có email là "nn03@gmail.com"
WITH CTE_location_country AS 
(
	SELECT		*
	FROM		location 	AS L
	INNER JOIN 	country 	AS C USING(country_id)
)
SELECT		CTE.country_name, E.*
FROM 		employee 				AS E
INNER JOIN 	CTE_location_country 	AS CTE USING (location_id)
WHERE		E.email LIKE '%nn03@gmail.com';
        
		-- c) Thống kê mỗi country, mỗi location có bao nhiêu employee đang làm việc
WITH CTE_location_country AS 
(
	SELECT		*
	FROM		location 	AS L
	INNER JOIN 	country 	AS C USING(country_id)
)
SELECT		CTE.country_name, CTE.location_id, COUNT(E.employee_id) AS So_luong_nhanvien_lamviec
FROM 		employee 				AS E
INNER JOIN 	CTE_location_country 	AS CTE USING (location_id)
GROUP BY	CTE.country_name, CTE.location_id;

-- Question 3. Tạo trigger cho table Employee chỉ cho phép insert mỗi quốc gia có tối đa 10 employee
DROP TRIGGER IF EXISTS trigger_insert_max_10_employee;
	DELIMITER //
CREATE TRIGGER trigger_insert_max_10_employee 
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    DECLARE v_Count_employee INT;
    
					WITH CTE_location_employee AS 
				(	SELECT		*
					FROM		location 	AS L
					INNER JOIN 	employee 	AS E USING(location_id))
					
                    SELECT		COUNT(CTE.employee_id) INTO	v_Count_employee
					FROM 		CTE_location_employee 	AS CTE
					INNER JOIN 	country 				AS C USING (country_id)
					WHERE		CTE.employee_id = NEW.employee_id
                    GROUP BY	C.country_name;
    

    IF 	v_Count_employee > 10	THEN
	SIGNAL SQLSTATE '12345'
	SET MESSAGE_TEXT = 'CANT INSERT MORE DATA!!';
	END IF;
END //
	DELIMITER ;
-- Question 4: Hãy cấu hình table sao cho khi xóa 1 location nào đó thì tất cả employee ở location đó sẽ có location_id = null
-- Cách 1:
DROP TRIGGER IF EXISTS Trig_set_location_null;
	DELIMITER //
CREATE TRIGGER Trig_set_location_null 
BEFORE DELETE ON location
FOR EACH ROW
BEGIN
   UPDATE	employee AS E
   SET		E.employee_id = NULL
   WHERE	E.location_id = OLD.location_id;
END //
DELIMITER ;
DELETE FROM location WHERE location_id = 2;
-- Cách 2: 
ALTER TABLE Employee
ADD CONSTRAINT fk_location FOREIGN KEY Employee(location_id) REFERENCES Location(location_id) ON DELETE SET NULL;