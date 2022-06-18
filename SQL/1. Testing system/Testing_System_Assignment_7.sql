					-- Exercise 1: Tiếp tục với Database Testing System
-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước

-- Use
INSERT INTO `Group` (GroupName, 				CreatorID, 	CreateDate) 
VALUES 				('klawleyu@phoacaqa.cza', 	32, 		'2019-10-23');

-- Trigger
DROP TRIGGER IF EXISTS Insert_CreateDate_into_Group;
	Delimiter //
CREATE TRIGGER 		Insert_CreateDate_into_Group
BEFORE INSERT ON 	`Group`
FOR EACH ROW
BEGIN

IF 
	NEW.CreateDate <= (curdate() - interval 1 year) THEN
	SIGNAL SQLSTATE 	'12345'
	SET MESSAGE_TEXT = 	'Can not insert more';
END IF;


END //
	Delimiter ;

-- 		Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào
-- department "Sale" nữa, khi thêm thì hiện ra thông báo "Department
-- "Sale" cannot add more user"

-- Use
INSERT INTO `Account` 	(	Email, 							Username, 		FullName, 			DepartmentID, 	PositionID, CreateDate) 
VALUES 					(	'lgillionh@chicagotribune.com', 'lgillionh', 	'Luelle Gillion', 	62, 			78, 		'2019-01-19');

-- Trigger
DROP TRIGGER IF EXISTS Cannot_Insert_username_departmentSale_into_Group;
	Delimiter //
CREATE TRIGGER 		Cannot_Insert_username_departmentSale_into_Group
BEFORE INSERT ON 	`Account`
FOR EACH ROW
BEGIN
	DECLARE	v_id_of_departmentSale INT;
    
    SELECT	DepartmentID INTO v_id_of_departmentSale
    FROM	Department 
    WHERE 	DepartmentName = 'Sale';
    
IF 
	NEW.departmentID = v_id_of_departmentSale	THEN
	SIGNAL SQLSTATE 	'12345'
	SET MESSAGE_TEXT = 	'Department "Sale" cannot add more user';
END IF;


END //
Delimiter ;

-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user

DROP TRIGGER IF EXISTS Insert_max_5user;
	Delimiter //
CREATE TRIGGER 		Insert_max_5user
BEFORE INSERT ON 	groupaccount
FOR EACH ROW
BEGIN

DECLARE	v_Count_user INT;
SELECT	COUNT(GA.AccountID) INTO	v_Count_user
FROM	groupaccount AS GA
WHERE	NEW.GroupID = GA.GroupID;


IF 
	v_Count_user >	5 THEN
	SIGNAL SQLSTATE '12345'
	SET MESSAGE_TEXT = 'Can not creat more user';
END IF;


END //
Delimiter ;

-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question

DROP TRIGGER IF EXISTS Insert_max_5question_into_examQuestion;
	Delimiter //
CREATE TRIGGER 		Insert_max_5question_into_examQuestion
BEFORE INSERT ON 	examquestion
FOR EACH ROW
BEGIN

DECLARE	v_Count_question INT;
SELECT	COUNT(1) INTO	v_Count_question
FROM	examquestion AS EQ
WHERE	NEW.ID = GA.ID;


IF 
	v_Count_question >	10 THEN
	SIGNAL SQLSTATE 	'12345'
	SET MESSAGE_TEXT = 	'Can not creat more Question';
END IF;


END //
Delimiter ;

-- 		Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là
-- admin@gmail.com (đây là tài khoản admin, không cho phép user xóa),
-- còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông
-- tin liên quan tới user đó


-- Use
DELETE FROM `account` WHERE Email = 'admin@gmail.com';

-- Trigger
DROP TRIGGER IF EXISTS Cannot_delete_email_Admin;
	Delimiter //
CREATE TRIGGER 		Cannot_delete_email_Admin
BEFORE DELETE ON 	`account`
FOR EACH ROW
BEGIN

IF 
	OLD.Email = 'admin@gmail.com' THEN
	SIGNAL SQLSTATE '12345'
	SET MESSAGE_TEXT = 'Cannot delete email-admin';
END IF;


END //
Delimiter ;


-- 	Question 6: Không sử dụng cấu hình default cho field DepartmentID của table
-- Account, hãy tạo trigger cho phép người dùng khi tạo account không điền
-- vào departmentID thì sẽ được phân vào phòng ban "waiting Department"


-- Use
INSERT INTO `Account` (Email, 					Username, 		FullName, 			PositionID, 	CreateDate) 
VALUES 				('lehuuquyen@gmail.com', 	'lgillionh', 	'Luelle Gillion', 	78, 			'2019-01-19');

-- Trigger
DROP TRIGGER IF EXISTS New_Account_departmentID_null;
	Delimiter //
CREATE TRIGGER 		New_Account_departmentID_null
BEFORE INSERT ON 	`account`
FOR EACH ROW
BEGIN

DECLARE v_DepartmentID_of_waitingDepartment INT;
SELECT	DepartmentID INTO v_DepartmentID_of_waitingDepartment
FROM 	department
WHERE 	DepartmentName = "waiting Department";

IF 
	NEW.DepartmentID is NULL THEN
	SET NEW.DepartmentID = v_DepartmentID_of_waitingDepartment;
END IF;


END //
	Delimiter ;

-- Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi question, trong đó có tối đa 2 đáp án đúng.

DROP TRIGGER IF EXISTS Question_7;
	Delimiter //
CREATE TRIGGER 		Question_7
BEFORE INSERT ON 	answer
FOR EACH ROW
BEGIN

DECLARE Count_answer INT;
DECLARE Count_isCorrect INT;

SELECT 		COUNT(A.QuestionID) INTO Count_answer
FROM		answer AS A
WHERE		A.QuestionID = NEW.QuestionID;


SELECT 		COUNT(A.isCorrect) INTO Count_isCorrect
FROM		answer AS A
WHERE		A.QuestionID = NEW.QuestionID AND A.isCorrect = NEW.isCorrect;

IF (Count_answer > 4) OR (Count_isCorrect > 2) THEN	
SIGNAL SQLSTATE 	'12345'
SET MESSAGE_TEXT = 	'Can not insert more data';
END IF;


END //
Delimiter ;

-- Question 8: Viết trigger sửa lại dữ liệu cho đúng:
-- Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định
-- Thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database
ALTER TABLE `account`
add Gender ENUM ('Nam', 'Nữ','Chưa xác định');

DROP TRIGGER IF EXISTS Question_8;
	Delimiter //
CREATE TRIGGER 		Question_8
BEFORE INSERT ON 	`account`
FOR EACH ROW
BEGIN

IF 		
		NEW.Gender = 'Nam' 				THEN SET NEW.Gender = 'M';
ELSEIF 	NEW.Gender = 'Nữ' 				THEN SET NEW.Gender = 'F';
ELSEIF 	NEW.Gender = 'Chưa xác định' 	THEN SET NEW.Gender = 'U';
END IF;

END //
	Delimiter ;

INSERT INTO `account` (Gender) VALUES ('Chưa xác định');

-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày

DROP TRIGGER IF EXISTS Question_9;
	Delimiter //
CREATE TRIGGER 		Question_9
BEFORE DELETE ON 	exam
FOR EACH ROW
BEGIN

IF	
	OLD.CreateDate > (CURRENT_DATE() - INTERVAL 2 DAY) THEN
	SIGNAL SQLSTATE '12345'
	SET MESSAGE_TEXT = ' Cannot delete Exam created since 2d';
END IF;

END //
	Delimiter ;

-- Question 12: Lấy ra thông tin exam trong đó:
-- Duration <= 30 thì sẽ đổi thành giá trị "Short time"
-- 30 < Duration <= 60 thì sẽ đổi thành giá trị "Medium time"
-- Duration > 60 thì sẽ đổi thành giá trị "Long time"

SELECT	*,
	CASE
		WHEN Duration <= 30 THEN 'Shoet time'
        WHEN Duration <= 60 THEN 'Medium time'
        ELSE 'Long time'
        END as Sap_xep
FROM	exam;

-- 	Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa có tên
-- là the_number_user_amount và mang giá trị được quy định như sau:
		-- Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
		-- Nếu số lượng user trong group <= 20 và > 5 thì sẽ có giá trị là normal
		-- Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher

SELECT	GroupID, COUNT(Accountid), 
	CASE
		WHEN COUNT(Accountid) <= 5 THEN 'few'
        WHEN COUNT(Accountid) <= 20 THEN 'normal'
        ELSE 'higher'
	END as the_number_user_amount
FROM	groupaccount
GROUP BY	GroupID;
-- Question 14: Thống kê số mỗi phòng ban có bao nhiêu user, nếu phòng ban nào
-- không có user thì sẽ thay đổi giá trị 0 thành "Không có User"
SELECT 		D.*, COUNT(A.AccountID), 
	CASE
		WHEN	COUNT(A.AccountID) = 0 THEN "Không có User"
        ELSE	COUNT(A.AccountID)
	END as Statistic_user_eachDepartment
FROM		department as D
LEFT JOIN	`account` as A USING(DepartmentID)
GROUP BY	A.DepartmentID;

-- 	Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các
-- question khi question đó chưa nằm trong exam nào


-- update
DROP TRIGGER IF EXISTS Question_10_Update;
	Delimiter //
CREATE TRIGGER 		Question_10_Update
BEFORE UPDATE ON 	question
FOR EACH ROW
BEGIN

IF	
	NEW.QuestionID NOT IN (SELECT Q.QuestionID
							FROM	question AS Q
							LEFT JOIN examquestion AS EQ USING(QuestionID)
							WHERE EQ.QuestionID IS NULL)
THEN	
    SIGNAL SQLSTATE 	'12345'
	SET MESSAGE_TEXT = 	'Can not update data';
END IF;

END //
	Delimiter ;
    
-- delete

DROP TRIGGER IF EXISTS Question_10_Dalete;
	Delimiter //
CREATE TRIGGER 		Question_10_Dalete
BEFORE DELETE ON 	question
FOR EACH ROW
BEGIN

IF	
	OLD.QuestionID NOT IN (SELECT Q.QuestionID
							FROM	question AS Q
							LEFT JOIN examquestion AS EQ USING(QuestionID)
							WHERE EQ.QuestionID IS NULL)
THEN	
    SIGNAL SQLSTATE 	'12345'
	SET MESSAGE_TEXT = 	'Khong the xoa data';
END IF;

END //
	Delimiter ;
    