-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
DROP VIEW IF EXISTS List_Employee_ofSale;
CREATE VIEW List_Employee_ofSale AS
    
SELECT	A.accountID, A.Email, A.Username, A.FullName
FROM	`Account` AS A
WHERE	A.DepartmentID  
in 
	(SELECT departmentID
	FROM	department AS D
	WHERE departmentname = 'Sales');

SELECT	*
FROM	List_Employee_ofSale;



-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
DROP VIEW IF EXISTS Statistic_AcccountID_joinGroup_max;
CREATE VIEW Statistic_AcccountID_joinGroup_max AS

SELECT	A.*, COUNT(A.AccountID) AS Statistic_toltal_acccountID
FROM	`Account` AS A
JOIN	groupaccount AS GA ON A.AccountID = GA.AccountID
GROUP BY A.AccountID
HAVING COUNT(GA.AccountID) = (	SELECT COUNT(GA.AccountID)
								FROM	`account` AS A
                                JOIN	groupaccount AS GA ON A.AccountID = GA.AccountID
								GROUP BY GA.AccountID
								ORDER BY COUNT(GA.AccountID) DESC
								LIMIT 1);
SELECT * FROM Statistic_AcccountID_joinGroup_max;

-- Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
DROP VIEW IF EXISTS lengthConten_tren28_kytu;
CREATE VIEW lengthConten_tren28_kytu AS
SELECT Content, length(Content)
FROM	Question
WHERE	length(Content) > 28;

SELECT * FROM lengthConten_tren28_kytu;

DELETE
FROM	Content
WHERE	length(Content) = (	SELECT length(Content)
							FROM	Question
							WHERE	length(Content) > 28)
;


-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
DROP VIEW IF EXISTS Department_employee_max;
CREATE VIEW Department_employee_max as

SELECT		A.DepartmentID, D.DepartmentName, COUNT(A.DepartmentID)
FROM		department as D
JOIN		`account` as A on D.DepartmentID = A.DepartmentID
GROUP BY	A.DepartmentID
HAVING		COUNT(A.DepartmentID) = (	SELECT		COUNT(A.DepartmentID)
										FROM		department as D
										JOIN		`account` as A on D.DepartmentID = A.DepartmentID
										GROUP BY	A.DepartmentID
										ORDER BY	COUNT(A.DepartmentID) DESC
										LIMIT		1)
;
SELECT	* FROM Department_employee_max;

-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Neile tạo

DROP VIEW IF EXISTS Creator_firtname_Neile;
CREATE VIEW Creator_firtname_Neile as

SELECT	Q.QuestionID, Q.Content, Q.CategoryID, Q.TypeID, A.FullName
FROM	question as Q
JOIN	`account` as A on Q.CreatorID = A.AccountID
WHERE	substring_index(A.FullName,' ',1) = 'Neile';

SELECT	*	FROM Creator_firtname_Neile;

-- HET TESTING SYSTEM ASSIGNMENT 5 --