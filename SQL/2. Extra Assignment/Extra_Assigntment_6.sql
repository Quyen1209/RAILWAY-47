DROP DATABASE IF EXISTS Extra_assignment_6;
CREATE DATABASE Extra_assignment_6;
USE Extra_assignment_6;
-- TẠO BẢNG DỮ LIỆU
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee(
	EmployeeID 					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    EmployeeLastName			NVARCHAR(30) NOT NULL,
    EmployeeFirstName			NVARCHAR(30) NOT NULL,
    EmployeeHireDate			DATETIME DEFAULT NOW(),
    EmployeeStatus				BIT NOT NULL,
    SupervisorID				TINYINT UNSIGNED NOT NULL,
    SocialSecurityNumber		CHAR(5)
);
DROP TABLE IF EXISTS Projects;
CREATE TABLE Projects(
	ProjectID 					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ManagerID					TINYINT	UNSIGNED NOT NULL,
    ProjectName 				NVARCHAR(50) NOT NULL,
    ProjectStartDate			DATETIME DEFAULT NOW(),
    ProjectDescription			NVARCHAR(50) NOT NULL,
    ProjectDetail				NVARCHAR(50) NOT NULL,
    ProjectCompletedOn			DATETIME DEFAULT NOW()
);
DROP TABLE IF EXISTS Project_Modules;
CREATE TABLE Project_Modules
(
	ModuleID 					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ProjectID					TINYINT UNSIGNED NOT NULL,
    EmployeeID					TINYINT UNSIGNED NOT NULL,
    ProjectModulesDate			DATETIME DEFAULT NOW(),
    ProjectModulesOn			DATETIME DEFAULT NOW(),
    ProjectModulesDescription	NVARCHAR(50),
	CONSTRAINT fk_employee FOREIGN KEY Project_Modules(EmployeeID) REFERENCES Employee(EmployeeID) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_projects FOREIGN KEY Project_Modules(ProjectID) REFERENCES Projects(ProjectID) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS Work_Done;
CREATE TABLE Work_Done(
	WorkDoneID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    EmployeeID					TINYINT UNSIGNED NOT NULL,
    ModuleID					TINYINT UNSIGNED NOT NULL,
    WorkDoneDate				DATETIME DEFAULT NOW(),
    WorkDoneDescription			NVARCHAR(50) NOT NULL,
    WorkDoneStatus				BIT NOT NULL, -- 1: Hoàn thành, 0: Không hoàn thành
    CONSTRAINT fk_employee2 FOREIGN KEY Work_Done(EmployeeID) REFERENCES Employee(EmployeeID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_Project_Modules FOREIGN KEY Work_Done(ModuleID) REFERENCES Project_Modules(ModuleID) ON UPDATE CASCADE ON DELETE CASCADE
);


/* ====INSERT DỮ LIỆU===== */
INSERT INTO Project_Modules (ProjectID	, EmployeeID, ProjectModulesDate, ProjectModulesOn	, ProjectModulesDescription	)
VALUE						(	1		,	1		,	'2019-06-06'	, '2019-06-06'		,	'Làm đúng hạn'			),
							(	2		,	2		,	'2019-07-06'	, '2019-06-06'		,	'Làm trước hạn'			),
                            (	3		,	3		,	'2019-08-06'	, '2019-09-06'		,	'Làm quá hạn'			),
                            (	4		,	1		,	'2019-07-06'	, '2019-06-06'		,	'Làm trước hạn'			);

INSERT INTO Projects		 ( ManagerID , ProjectName 		, ProjectStartDate	, ProjectDescription	, ProjectDetail		, ProjectCompletedOn	)
VALUE						(	1		,'Java'				,	'2019-06-06'	, 'Làm đúng vào'		,'Làm đúng hạn'		,	'2019-08-06'		),
							(	2		,'C#'				,	'2019-07-06'	, 'Làm nhanh lên'		,'Làm trước hạn'	,	'2019-09-06'		),
                            (	3		,'Android'			,	'2019-08-06'	, 'Nộp trước ngày 17/3'	,'Làm quá hạn'		,	'2019-10-06'		),
                            (	1		,'C++'				,	'2019-07-06'	, 'Không biết đừng làm'	,'Làm trước hạn'	,	'2019-11-06'		);

INSERT INTO Work_Done		( EmployeeID, ModuleID	, WorkDoneDate	, WorkDoneDescription	, WorkDoneStatus	)
VALUE						(	1		,	1		,'2019-06-06'	, 'Làm được phết'		,		1			),
							(	2		,	2		,'2019-07-06'	, 'Làm ổn phết'			,		1			),
                            (	3		,	3		,'2019-08-06'	, 'Không biết làm'		,		0			),
                            (	1		,	4		,'2019-07-06'	, 'Không biết ko làm'	,		0			);
INSERT INTO Employee		( EmployeeLastName	, EmployeeFirstName	, EmployeeHireDate	, EmployeeStatus, SupervisorID	, SocialSecurityNumber	)
VALUE						(N'Nguyễn Hải'		,N'Đăng'			,'2019-06-06'		, 		1		,		1		,'SS001'				),
							(N'Lê Thị'			,N'Thư'				,'2019-07-06'		, 		1		,		1		,'SS002'				),
                            (N'Nguyễn Hữu'		,N'Thắng'			,'2019-08-06'		, 		1		,		2		,'SS003'				),
                            (N'Dương Văn'		,N'Hữu'				,'2019-07-06'		, 		0		,		2		,'SS004'				);
                            

-- Questions b) Viết stored procedure (không có parameter) để Remove tất cả thông tin project đã hoàn thành sau 3 tháng kể từ ngày hiện. 
-- In số lượng record đã remove từ các table liên quan trong khi removing (dùng lệnh print)
DROP PROCEDURE IF EXISTS remove_info_project_complete_after_3month;
DELIMITER //
CREATE PROCEDURE remove_info_project_complete_after_3month()
BEGIN
	DECLARE Total_remove_project_modules INT;
    DECLARE Total_remove_project INT;
		
        WITH CTE_project_complete_after_3month as
		(
			SELECT	ProjectID
			FROM	projects
			WHERE	ProjectCompletedOn < (ProjectStartDate + INTERVAL 3 MONTH)
		)
        
		DELETE FROM project_modules AS PM
		WHERE PM.ProjectID in (SELECT * FROM CTE_project_complete_after_3month);
		SELECT row_count() INTO Total_remove_project_modules;
        
		WITH CTE_project_complete_after_3month as
		(
			SELECT	ProjectID
			FROM	projects
			WHERE	ProjectCompletedOn < (ProjectStartDate + INTERVAL 3 MONTH)
		)
		DELETE FROM projects AS P
		WHERE P.ProjectID in (SELECT * FROM CTE_project_complete_after_3month);
		SELECT row_count() INTO Total_remove_project;
        SELECT Total_remove_project_modules, Total_remove_project;
END //
DELIMITER ;

CALL remove_info_project_complete_after_3month();

-- c) Viết stored procedure (có parameter) để in ra các module đang được thực hiện)
DROP PROCEDURE IF EXISTS out_module_during;
DELIMITER //
CREATE PROCEDURE out_module_during(IN input_WorkDoneStatus bit)
BEGIN
SELECT	*
FROM	work_done 
WHERE	WorkDoneStatus = input_WorkDoneStatus;
END //
DELIMITER ;
CALL out_module_during(0);

-- d) Viết hàm (có parameter) trả về thông tin 1 nhân viên đã tham gia làm mặc dù không ai giao việc cho nhân viên đó (trong bảng Works)
DROP PROCEDURE IF EXISTS Find_employee;
DELIMITER //
CREATE PROCEDURE Find_employee()
BEGIN
SELECT	E.*
FROM	work_done as WD
LEFT JOIN project_modules as PM on WD.ModuleID = PM.ModuleID
LEFT JOIN employee as E ON WD.EmployeeID = E.EmployeeID
WHERE PM.EmployeeID is NULL;
END //
DELIMITER ;
CALL Find_employee();

