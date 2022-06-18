-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó

DROP PROCEDURE IF EXISTS pro_getaccount_inputdepartmentname;
	DELIMITER //
CREATE PROCEDURE	pro_getaccount_inputdepartmentname
		(IN in_departmentname VARCHAR(50))
BEGIN
		SELECT	A.AccountID, A.Username
		FROM	`account` as A
		JOIN	department as D USING (DepartmentID)
		WHERE	D.DepartmentName = in_departmentname;
END//
	DELIMITER ;
Call 	pro_getaccount_inputdepartmentname('sales');
-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS pro_get_Count_account_inGroup;
	DELIMITER //
CREATE PROCEDURE	pro_get_Count_account_inGroup
		(IN In_groupID int(250))
BEGIN

		SELECT		GroupID, COUNT(AccountID) as so_luong_accountOfGroup
		FROM		groupaccount 
		WHERE		GroupID = In_groupID
        GROUP BY	GroupID;


END//
	DELIMITER ;
CALL	pro_get_Count_account_inGroup(63);

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
 
	-- input TypeID
DROP PROCEDURE IF EXISTS pro_get_Count_Question_inTypeQuestion_byTypeID;
	DELIMITER //
CREATE PROCEDURE	pro_get_Count_Question_inTypeQuestion_byTypeID
		(IN in_typeID int(250))
BEGIN

		SELECT		TypeID, Count(QuestionID) AS so_luong_question_in_typequestion
		FROM		question
		WHERE		TypeID = in_typeID and month(CreateDate) = month(now()) AND year(Q.CreateDate) = year(now())
		GROUP BY	TypeID
		ORDER BY	so_luong_question_in_typequestion DESC;

END//
	DELIMITER ;
CALL	pro_get_Count_Question_inTypeQuestion_byTypeID(12);


	-- input TypeName
DROP PROCEDURE IF EXISTS pro_get_Count_Question_inTypeQuestion_byTypeName;
DELIMITER //
CREATE PROCEDURE	pro_get_Count_Question_inTypeQuestion_byTypeName
		(IN in_typeName Enum('Essay','Multiple-Choice'))
BEGIN

		SELECT		Q.TypeID, TQ.TypeName, COUNT(QuestionID) as so_luong_question_in_typequestion
        FROM		question as Q
        JOIN		typequestion as TQ USING(TypeID)
        WHERE		TQ.TypeName = in_typeName and month(Q.CreateDate) = month(now()) AND year(Q.CreateDate) = year(now())
        GROUP BY	Q.TypeID
        ORDER BY	so_luong_question_in_typequestion DESC;

END//
	DELIMITER ;
CALL	pro_get_Count_Question_inTypeQuestion_byTypeName('Multiple-Choice');

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXISTS pro_get_typeId_of_max_count_question;
	DELIMITER //
CREATE PROCEDURE	pro_get_typeId_of_max_count_question()
BEGIN
			WITH	CTE_Max_Question_in_typeID as 
			(
					SELECT		TypeID, COUNT(QuestionID) as Max_question_in_typeid
					FROM		question
					GROUP BY	TypeID
					ORDER BY	Max_question_in_typeid DESC
					LIMIT		1
			)
			SELECT		TypeID
			FROM		question
			GROUP BY	TypeID
			HAVING		COUNT(QuestionID) = (SELECT Max_question_in_typeid FROM CTE_Max_Question_in_typeID);
END//
	DELIMITER ;
CALL	pro_get_typeId_of_max_count_question();

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
DROP PROCEDURE IF EXISTS pro_get_typeName_of_max_count_question;
	DELIMITER //
CREATE PROCEDURE	pro_get_typeName_of_max_count_question()
BEGIN
			WITH	CTE_Max_Question_in_typeID as 
			(
					SELECT		TypeID, COUNT(QuestionID) as Max_question_in_typeid
					FROM		question
					GROUP BY	TypeID
					ORDER BY	Max_question_in_typeid DESC
					LIMIT		1
			)
			SELECT		TQ.TypeName
			FROM		question as Q
            JOIN		typequestion as TQ USING(TypeID)
			GROUP BY	TQ.TypeID
			HAVING		COUNT(QuestionID) =(SELECT Max_question_in_typeid FROM CTE_Max_Question_in_typeID);
END//
	DELIMITER ;
CALL pro_get_typeName_of_max_count_question();

-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và trong store sẽ tự động gán:
				-- username sẽ giống email nhưng bỏ phần @..mail đi
				-- positionID: sẽ có default là developer
				-- departmentID: sẽ được cho vào 1 phòng chờ
-- Sau đó in ra kết quả tạo thành công

DROP PROCEDURE IF EXISTS pro_insert_to_account;
	DELIMITER //
CREATE PROCEDURE	pro_insert_to_account
		(	IN in_fullName VARCHAR(50),
			IN	in_email VARCHAR(50)
        )
BEGIN
DECLARE	update_userName VARCHAR(50) DEFAULT substring_index(in_email, '@', 1);
DECLARE update_possitionID TINYINT DEFAULT 1;
DECLARE	Update_departmentID	TINYINT DEFAULT 123;
DECLARE	Update_createDate DATE DEFAULT now();

INSERT INTO `account`(FullName, Email, Username, PositionID, DepartmentID, CreateDate)
VALUES (in_fullName, in_email, update_userName, update_possitionID, Update_departmentID, Update_createDate)
;
SELECT	*
FROM	`Account`
WHERE	account.Username = update_userName;

END //
	DELIMITER ;
CALL pro_insert_to_account('Le Huu Quyen', 'lehuuquyen@gmail.com');

-- 		Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên 
-- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa
-- chuỗi của người dùng nhập vào

DROP PROCEDURE IF EXISTS pro_get_Groupname_or_username2;
	DELIMITER //
CREATE PROCEDURE	pro_get_Groupname_or_username2 (IN in_string_random2 Varchar(250))
BEGIN
		SELECT	G.GroupName, A.Username
		FROM	groupaccount as GA
		RIGHT JOIN	`group` as G USING (GroupID)
		RIGHT JOIN	`account` as A USING (AccountID)
		WHERE	A.Username LIKE concat('%', in_string_random2, '%') or G.GroupName LIKE concat('%', in_string_random2,'%');
END //
	DELIMITER ;
CALL pro_get_Groupname_or_username2('2p');

-- 		Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
-- để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất

DROP PROCEDURE IF EXISTS pro_get_MaxLengthContent_countQuestion;
	DELIMITER //
CREATE PROCEDURE	pro_get_MaxLengthContent_countQuestion (IN in_typeQuestion ENUM('Essay','Multiple-Choice'))
BEGIN
	WITH CTE_content_max as 
    (
		SELECT		length(Q.Content) as Length_of_content
        FROM		question as Q
        ORDER BY	Length_of_content DESC
        LIMIT		1
	)
    SELECT		Q.QuestionID, TQ.TypeName, Q.Content, length(Q.Content) as Length_max
    FROM		question as Q
    JOIN		typequestion as TQ USING (TypeID)
    WHERE		TQ.TypeName = in_typeQuestion and length(Q.Content) = (SELECT * FROM CTE_content_max)
    GROUP BY	Q.QuestionID;
        
END //
	DELIMITER ;
CALL pro_get_MaxLengthContent_countQuestion('Essay');

-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID

DROP PROCEDURE IF EXISTS pro_delete_exam_by_examID;
	DELIMITER //
CREATE PROCEDURE	pro_delete_exam_by_examID (IN in_ExamID TINYINT(250))
BEGIN

DELETE
FROM	exam as E
WHERE	E.ExamID = in_ExamID;

END //
	DELIMITER ;
CALL pro_delete_exam_by_examID('12');

-- 		Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử dụng store ở câu 9 để xóa)
-- Sau đó in số lượng record đã remove từ các table liên quan trong khi removing
DROP PROCEDURE IF EXISTS remove_exam;
DELIMITER //
CREATE PROCEDURE remove_exam()
BEGIN
		DECLARE Total_examid_exam INT;
		DECLARE Total_examid_exam_question INT;
	WITH CTE_examID as 
		(SELECT	ExamID
		FROM	exam
		WHERE	year(CreateDate) < year(current_date() - interval 3 year))
        DELETE FROM examquestion 
		WHERE ExamID in (SELECT	*	FROM	CTE_examID);
		SELECT row_count() INTO Total_examid_exam_question;
		
        WITH CTE_examID as 
		(SELECT	ExamID
		FROM	exam
		WHERE	year(CreateDate) < year(current_date() - interval 3 year))
		DELETE FROM exam 
		WHERE ExamID in (SELECT	*	FROM	CTE_examID);
		SELECT row_count() INTO Total_examid_exam;
		
		SELECT Total_examid_exam_question, Total_examid_exam;
END //
DELIMITER ;

CALL	remove_exam();

-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay - 3year
DROP PROCEDURE IF EXISTS pro_countQuestion_eachMonth_yearNow;
	DELIMITER //
CREATE PROCEDURE	pro_countQuestion_eachMonth_yearNow()
BEGIN
		WITH CTE_12month_year_now (month)  as
		(	SELECT 1 UNION
			SELECT 2 UNION
			SELECT 3 UNION
			SELECT 4 UNION
			SELECT 5 UNION
			SELECT 6 UNION
			SELECT 7 UNION
			SELECT 8 UNION
			SELECT 9 UNION
			SELECT 10 UNION
			SELECT 11 UNION
			SELECT 12	),
            
            
		CTE_Question_year_now as 
		(	SELECT * 
			FROM question as Q
			WHERE year(Q.CreateDate) = year(now() - interval 3 year))


		SELECT 		CM.*, COUNT(QQ.questionID) as So_luong_cauhoi_duoc_tao
		FROM 		CTE_12month_year_now as CM
		LEFT JOIN 	CTE_Question_year_now as QQ
		ON CM.month = month(QQ.CreateDate)
		GROUP BY	CM.month;
        
        END //
	DELIMITER ;
CALL pro_countQuestion_eachMonth_yearNow();

-- 		Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6 tháng gần đây nhất
DROP PROCEDURE IF EXISTS pro_countQuestion_6Month_nearest;
	DELIMITER //
CREATE PROCEDURE	pro_countQuestion_6Month_nearest()
BEGIN


	WITH	CTE_6thanggannhat as
			(	SELECT	Month(curdate() - INTERVAL 5 month) as M, 
						Year((curdate() - INTERVAL 5 month)) as Y 
                        UNION
				SELECT	Month(curdate() - INTERVAL 4 month) as M, 
						Year((curdate() - INTERVAL 4 month)) as Y 
                        UNION
				SELECT	Month(curdate() - INTERVAL 3 month) as M, 
						Year((curdate() - INTERVAL 3 month)) as Y 
                        UNION
				SELECT	Month(curdate() - INTERVAL 2 month) as M, 
						Year((curdate() - INTERVAL 2 month)) as Y 
                        UNION
				SELECT	Month(curdate() - INTERVAL 1 month) as M, 
						Year((curdate() - INTERVAL 1 month)) as Y 
                        UNION
				SELECT	Month(curdate()) as M, Year((curdate())) as Y	),

			CTE_Question_in_6month_nearest as
			(	SELECT	*
				FROM	question as Q
				WHERE	(SELECT curdate() - interval 5 month) < Q.CreateDate AND Q.CreateDate <= now())
        
        
	SELECT		concat(CC.Y, '-', CC.M) as Year_Month_Created ,COUNT(CCQQ.CreateDate) as Total_question_created_in_month
	FROM		CTE_6thanggannhat as CC
	LEFT JOIN	CTE_Question_in_6month_nearest as CCQQ
	ON			CC.M = month(CCQQ.CreateDate)
	GROUP BY	CC.M;
            
END //
	DELIMITER ;
CALL pro_countQuestion_6Month_nearest();  

-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
-- nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được
-- chuyển về phòng ban default là phòng ban chờ việc
DROP PROCEDURE IF EXISTS pro_DeleteDepartment_updateAccount;
DELIMITER //
CREATE PROCEDURE pro_DeleteDepartment_updateAccount (IN in_department_name Varchar(250))

BEGIN
	DECLARE v_departmentID tinyint(250);
    
		SELECT	D.DepartmentID INTO v_departmentID
		FROM	department as D
		WHERE	D.DepartmentName = in_department_name;
    
		
        UPDATE	`account` As A
        SET		A.DepartmentID = "1"
        WHERE	A.DepartmentID = v_departmentID;
        
        DELETE
        FROM	department as D
        WHERE D.DepartmentName = in_department_name;
    
    

END //
	DELIMITER ;

CALL pro_DeleteDepartment_updateAccount('Eng');


