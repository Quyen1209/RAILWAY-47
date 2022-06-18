-- Exercise 1: Tiếp tục với Database ở buổi 6 - Viết triggers để tránh trường hợp người dùng nhập thông tin module Project không hợplệ
-- (Project_Modules.ProjectModulesDate < Projects.ProjectStartDate,
-- Project_Modules.ProjectModulesOn > Projects.ProjectCompletedOn)

DROP TRIGGER IF EXISTS insert_data_in_project_module;
	DELIMITER //
CREATE TRIGGER insert_data_in_project_module 
BEFORE INSERT ON project_modules
FOR EACH ROW
BEGIN
	DECLARE v_ProjectStartDate DATE;
	DECLARE v_ProjectCompletedOn DATE;
    SELECT 	ProjectStartDate INTO	v_ProjectStartDate
    FROM Projects as P
    WHERE P.ProjectID = New.ProjectID;
    SELECT 	ProjectCompletedOn INTO	v_ProjectCompletedOn
    FROM Projects as P
    WHERE P.ProjectID = New.ProjectID;
    IF		New.ProjectModulesDate < v_ProjectStartDate
		or New.ProjectModulesOn > v_ProjectCompletedOn
	THEN 
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'Cant INSERT data!!';
	END IF;

END//
DELIMITER ;
