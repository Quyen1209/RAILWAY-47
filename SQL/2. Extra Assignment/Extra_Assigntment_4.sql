DROP DATABASE IF EXISTS 		Ass_4;
CREATE DATABASE IF NOT EXISTS 	Ass_4;
USE								Ass_4;

		-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu Cho table sau:
-- Department (Department_Number, Department_Name)
DROP TABLE IF EXISTS Department;
CREATE TABLE IF NOT EXISTS Department
(
	Department_Number	TINYINT PRIMARY key AUTO_INCREMENT,
    Department_Name		VARCHAR(250)
);
-- Employee_Table (Employee_Number, Employee_Name, Department_Number)
DROP TABLE IF EXISTS 		Employee_Table;
CREATE TABLE IF NOT EXISTS 	Employee_Table
(
	Employee_Number		TINYINT PRIMARY key AUTO_INCREMENT,
    Employee_Name		VARCHAR(250),
    Department_Number	TINYINT,
    FOREIGN KEY	(Department_Number) REFERENCES	Department(Department_Number)
);
-- Employee_Skill_Table (Employee_Number, Skill_Code, Date Registered)
DROP TABLE IF EXISTS 		Employee_Skill_Table;
CREATE TABLE IF NOT EXISTS 	Employee_Skill_Table
(
	ID				TINYINT PRIMARY key AUTO_INCREMENT,
    Employee_Number	TINYINT,
    Skill_Code		VARCHAR(250),
    Date_Registered	DATE,
    FOREIGN KEY	(Employee_Number) REFERENCES	Employee_Table(Employee_Number)
);
				-- Question 2: Thêm ít nhất 10 bản ghi vào table
-- Add Department 
insert into Department (Department_Number, Department_Name) values (1, 'Marketing');
insert into Department (Department_Number, Department_Name) values (2, 'Research and Development');
insert into Department (Department_Number, Department_Name) values (3, 'Training');
insert into Department (Department_Number, Department_Name) values (4, 'Human Resources');
insert into Department (Department_Number, Department_Name) values (5, 'Sales');
insert into Department (Department_Number, Department_Name) values (6, 'Marketing');
insert into Department (Department_Number, Department_Name) values (7, 'Accounting');
insert into Department (Department_Number, Department_Name) values (8, 'Marketing');
insert into Department (Department_Number, Department_Name) values (9, 'Services');
insert into Department (Department_Number, Department_Name) values (10, 'Product Management');
insert into Department (Department_Number, Department_Name) values (11, 'Product Management');
insert into Department (Department_Number, Department_Name) values (12, 'Legal');
insert into Department (Department_Number, Department_Name) values (13, 'Marketing');
insert into Department (Department_Number, Department_Name) values (14, 'Product Management');
insert into Department (Department_Number, Department_Name) values (15, 'Business Development');
insert into Department (Department_Number, Department_Name) values (16, 'Marketing');
insert into Department (Department_Number, Department_Name) values (17, 'Support');
insert into Department (Department_Number, Department_Name) values (18, 'Marketing');
insert into Department (Department_Number, Department_Name) values (19, 'Accounting');
insert into Department (Department_Number, Department_Name) values (20, 'Legal');

-- Add Employee_Table
insert into Employee_Table (Employee_Number, Employee_Name, Department_Number) values (1, 'Marketing', 13);
insert into Employee_Table (Employee_Number, Employee_Name, Department_Number) values (2, 'Business Development', 1);
insert into Employee_Table (Employee_Number, Employee_Name, Department_Number) values (3, 'Accounting', 6);
insert into Employee_Table (Employee_Number, Employee_Name, Department_Number) values (4, 'Business Development', 2);
insert into Employee_Table (Employee_Number, Employee_Name, Department_Number) values (5, 'Services', 15);
insert into Employee_Table (Employee_Number, Employee_Name, Department_Number) values (6, 'Product Management', 18);
insert into Employee_Table (Employee_Number, Employee_Name, Department_Number) values (7, 'Services', 10);
insert into Employee_Table (Employee_Number, Employee_Name, Department_Number) values (8, 'Research and Development', 14);
insert into Employee_Table (Employee_Number, Employee_Name, Department_Number) values (9, 'Engineering', 1);
insert into Employee_Table (Employee_Number, Employee_Name, Department_Number) values (10, 'Human Resources', 8);
insert into Employee_Table (Employee_Number, Employee_Name, Department_Number) values (11, 'Business Development', 14);
insert into Employee_Table (Employee_Number, Employee_Name, Department_Number) values (12, 'Research and Development', 17);
insert into Employee_Table (Employee_Number, Employee_Name, Department_Number) values (13, 'Sales', 15);
insert into Employee_Table (Employee_Number, Employee_Name, Department_Number) values (14, 'Business Development', 2);
insert into Employee_Table (Employee_Number, Employee_Name, Department_Number) values (15, 'Sales', 15);
insert into Employee_Table (Employee_Number, Employee_Name, Department_Number) values (16, 'Sales', 19);
insert into Employee_Table (Employee_Number, Employee_Name, Department_Number) values (17, 'Services', 15);
insert into Employee_Table (Employee_Number, Employee_Name, Department_Number) values (18, 'Legal', 18);
insert into Employee_Table (Employee_Number, Employee_Name, Department_Number) values (19, 'Legal', 18);
insert into Employee_Table (Employee_Number, Employee_Name, Department_Number) values (20, 'Business Development', 15);

-- Add Employee_Skill_Table
insert into Employee_Skill_Table (ID, Employee_Number, Skill_Code, Date_Registered) values (1, 9, 'Test', '2020-06-11');
insert into Employee_Skill_Table (ID, Employee_Number, Skill_Code, Date_Registered) values (2, 4, 'CSAT', '2020-11-05');
insert into Employee_Skill_Table (ID, Employee_Number, Skill_Code, Date_Registered) values (3, 8, 'Rent to Own', '2021-03-17');
insert into Employee_Skill_Table (ID, Employee_Number, Skill_Code, Date_Registered) values (4, 18, 'Java', '2021-01-09');
insert into Employee_Skill_Table (ID, Employee_Number, Skill_Code, Date_Registered) values (5, 19, 'PHP', '2021-02-05');
insert into Employee_Skill_Table (ID, Employee_Number, Skill_Code, Date_Registered) values (6, 6, 'CBR', '2021-02-03');
insert into Employee_Skill_Table (ID, Employee_Number, Skill_Code, Date_Registered) values (7, 10, 'JRuby', '2020-05-26');
insert into Employee_Skill_Table (ID, Employee_Number, Skill_Code, Date_Registered) values (8, 5, 'PPPoA', '2020-06-01');
insert into Employee_Skill_Table (ID, Employee_Number, Skill_Code, Date_Registered) values (9, 1, 'OTM', '2021-03-09');
insert into Employee_Skill_Table (ID, Employee_Number, Skill_Code, Date_Registered) values (10, 2, 'Java', '2020-11-16');
insert into Employee_Skill_Table (ID, Employee_Number, Skill_Code, Date_Registered) values (11, 10, 'GLP', '2021-04-10');
insert into Employee_Skill_Table (ID, Employee_Number, Skill_Code, Date_Registered) values (12, 13, 'Outerwear', '2021-05-07');
insert into Employee_Skill_Table (ID, Employee_Number, Skill_Code, Date_Registered) values (13, 10, 'SQL', '2021-03-19');
insert into Employee_Skill_Table (ID, Employee_Number, Skill_Code, Date_Registered) values (14, 7, 'Leadership', '2021-02-02');
insert into Employee_Skill_Table (ID, Employee_Number, Skill_Code, Date_Registered) values (15, 8, 'Hyperion', '2020-12-31');
insert into Employee_Skill_Table (ID, Employee_Number, Skill_Code, Date_Registered) values (16, 1, 'Robotics', '2020-12-29');
insert into Employee_Skill_Table (ID, Employee_Number, Skill_Code, Date_Registered) values (17, 14, 'AQTF compliance', '2021-03-29');
insert into Employee_Skill_Table (ID, Employee_Number, Skill_Code, Date_Registered) values (18, 11, 'Image Manipulation', '2021-02-14');
insert into Employee_Skill_Table (ID, Employee_Number, Skill_Code, Date_Registered) values (19, 17, 'ICT', '2020-06-05');
insert into Employee_Skill_Table (ID, Employee_Number, Skill_Code, Date_Registered) values (20, 2, 'Epic Systems', '2021-01-29');


-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java
SELECT	ET.*
FROM	employee_table as ET
JOIN	employee_skill_table as EST
ON		ET.Employee_Number = EST.Employee_Number
WHERE	EST.Skill_Code = 'Java';
-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT		D.*, COUNT(D.Department_Number) as So_thanh_vien
FROM		Department as D
JOIN		employee_table as ET
ON			D.Department_Number = ET.Department_Number
GROUP BY	D.Department_Number
HAVING		COUNT(D.Department_Number) > 3;
-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.
SELECT		D.*, COUNT(D.Department_Number), GROUP_CONCAT(Employee_Name) as Danh_sach_nhanvien
FROM		Department as D
JOIN		employee_table as ET
ON			D.Department_Number = ET.Department_Number
GROUP BY	D.Department_Number;
-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.
SELECT		ET.*, COUNT(EST.Employee_Number) as total_skill, GROUP_CONCAT(Skill_Code) as danhsach_skill
FROM		Employee_table as ET
JOIN		Employee_skill_table as EST
ON			ET.Employee_Number = EST.Employee_Number
GROUP BY	EST.Employee_Number
HAVING		total_skill > 1;


    
    
    