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

-- Dung CTE
DROP VIEW IF EXISTS List_Employee_ofSales;
CREATE VIEW 		List_Employee_ofSales AS

WITH list_employee_of_Sales as
(
	SELECT	A.FullName as Nhanvien_thuoc_sales
	FROM	`account` as A 
    Join 	department as D on A.DepartmentID = D.DepartmentID
	WHERE	D.departmentname = 'Sales'
)
SELECT * FROM	list_employee_of_Sales;

SELECT * FROM	List_Employee_ofSales;


-- Question 1.2: Tìm ra danh sách nhân viên thuộc phòng ban Sales và FullNam có độ dài > độ dài trung bình fullname của nhân viên phòng ban
WITH Nhanvien_sales as (
	SELECT	A.*, DepartmentName
	FROM	`account` as A 
    Join 	department as D on A.DepartmentID = D.DepartmentID
	WHERE	D.departmentname = 'Sales'),
    
    Avg_length_fullname_in_sales as 
    (
    SELECT	Avg(length(FullName)) as Avg_Length_fullname
    FROM 	Nhanvien_sales
    )
    
    SELECT	*
    FROM	Nhanvien_sales
    WHERE	length(FullName) > ( SELECT Avg_Length_fullname FROM Avg_length_fullname_in_sales);
    
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

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
			-- Dung CTE --

WITH  CTE_Group_nhieu_account_nhat AS
(
	SELECT 		COUNT(GA.AccountID) as So_lan_thamgia_group
    FROM 		`Account` as A
    JOIN 		groupaccount as GA on A.AccountID = GA.AccountID
    GROUP BY	GA.AccountID 
    ORDER BY	So_lan_thamgia_group DESC
    LIMIT		1
),
Statistic_Account as 
( 
SELECT 		A.*, COUNT(GA.AccountID) So_lan_thamgia_group
FROM 		`Account` as A
JOIN 		groupaccount as GA on A.AccountID = GA.AccountID
GROUP BY	A.AccountID 
HAVING		COUNT(GA.AccountID))

SELECT *
from Statistic_Account 
WHERE	So_lan_thamgia_group = (SELECT * FROM CTE_Group_nhieu_account_nhat);



-- Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
DROP VIEW IF EXISTS lengthConten_tren28_kytu;
CREATE VIEW lengthConten_tren28_kytu AS
SELECT Content, length(Content)
FROM	Question
WHERE	length(Content) > 28;
SELECT * FROM lengthConten_tren28_kytu;

-- Dung CTE ----
WITH CTE_Length_of_Content as
(	SELECT Content, length(Content) as Length_ct
	FROM	question	)
SELECT	Content, Length_ct
FROM	CTE_Length_of_Content
WHERE	Length_ct >28;


-- Xoa Content --
UPDATE Question
SET		Content = NULL
WHERE	QuestionID in (	SELECT	questionID
						FROM	lengthConten_tren28_kytu);


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

-- Dung CTE -- Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
WITH CTE_Max_user_in_department as
(
SELECT Count(A.DepartmentID) as Statistic_User_in_department
FROM	department as D
JOIN	`account` as A on D.DepartmentID = A.DepartmentID
GROUP BY A.DepartmentID
ORDER BY Statistic_User_in_department DESC
LIMIT	1
),
CTE_Statistic_Department as 
(
SELECT D.*, Count(A.DepartmentID) as Statistic_Department
FROM	department as D
JOIN	`account` as A on D.DepartmentID = A.DepartmentID
GROUP BY A.DepartmentID
HAVING	Count(A.DepartmentID))

SELECT * 
FROM	CTE_Statistic_Department
WHERE	Statistic_Department = (SELECT * FROM CTE_Max_user_in_department);


-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Neile tạo

DROP VIEW IF EXISTS Creator_firtname_Neile;
CREATE VIEW Creator_firtname_Neile as

SELECT	Q.QuestionID, Q.Content, Q.CategoryID, Q.TypeID, A.FullName
FROM	question as Q
JOIN	`account` as A on Q.CreatorID = A.AccountID
WHERE	substring_index(A.FullName,' ',1) = 'Neile'; -- or Where A.FullName like 'Neile %';
SELECT	*	FROM Creator_firtname_Neile;

-- Dung CTE: Tạo view có chứa tất các các câu hỏi do user họ Neile tạo
WITH CTE_QuestionNeile as
(
SELECT	Q.QuestionID, Q.Content, Q.CategoryID, Q.TypeID, A.FullName
FROM	question as Q
JOIN	`account` as A on Q.CreatorID = A.AccountID
WHERE	A.FullName like 'Neile %'
)
SELECT * FROM	CTE_QuestionNeile;

-- HET TESTING SYSTEM ASSIGNMENT 5 --