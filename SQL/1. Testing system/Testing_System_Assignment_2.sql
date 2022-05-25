DROP DATABASE IF EXISTS 		Testing_System_Assignment_2;
CREATE DATABASE IF NOT EXISTS 	Testing_System_Assignment_2;
USE 							Testing_System_Assignment_2;

-- Table1: Department --
DROP TABLE IF EXISTS 		Department;
CREATE TABLE if not EXISTS 	Department 
(
    DepartmentID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(50) NOT NULL
);


-- Table 2: Position --
DROP TABLE IF EXISTS 		Position;
CREATE TABLE IF NOT EXISTS 	Position 
(
    PositionID 		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    PositionName 	ENUM('Dev','Test','Scrum Master', 'PM')
);


-- Table 3: Account --
DROP TABLE IF EXISTS 		`Account`;
CREATE TABLE IF NOT EXISTS `Account` 
(
    AccountID 		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Email 			VARCHAR(50) NOT NULL,
    Username 		VARCHAR(250) NOT NULL,
    FullName 		VARCHAR(30) NOT NULL,
    DepartmentID 	TINYINT UNSIGNED NOT NULL,
    PositionID 		TINYINT UNSIGNED NOT NULL,
    CreateDate 		DATE,
					CHECK (LENGTH(Username) >= 6),
                    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
                    FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
);


-- Table 4: Group --
DROP TABLE IF EXISTS `Group`;
CREATE TABLE IF NOT EXISTS `Group` 
(
    GroupID 	TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    GroupName 	VARCHAR(250) UNIQUE KEY NOT NULL,
    CreatorID 	TINYINT UNSIGNED NOT NULL,
    CreateDate 	DATE,
				CHECK (LENGTH(Groupname) >= 3)
);



-- Table 5: Group Account --
DROP TABLE IF EXISTS 		GroupAccount;
CREATE TABLE IF NOT EXISTS 	GroupAccount 
(
	ID			INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    GroupID 	TINYINT UNSIGNED NOT NULL,
    AccountID 	TINYINT UNSIGNED NOT NULL,
    JoinDate 	DATE,
				FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID),
                FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID)
);


-- Table 6: Type Questione --
DROP TABLE IF EXISTS 		TypeQuestion;
CREATE TABLE IF NOT EXISTS 	TypeQuestion 
(
    TypeID 		TINYINT UNSIGNED KEY AUTO_INCREMENT,
    TypeName 	ENUM('Essay', 'Multiple-Choice')
);



-- Table 7: Category Questione --
DROP TABLE IF EXISTS 		CategoryQuestion;
CREATE TABLE IF NOT EXISTS 	CategoryQuestion 
(
    CategoryID 		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    CategoryName 	VARCHAR(20) NOT NULL
);



-- Table 8: Question --
DROP TABLE IF EXISTS 		Question;
CREATE TABLE IF NOT EXISTS 	Question 
(
    QuestionID 	TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content 	VARCHAR(250),
    CategoryID 	TINYINT UNSIGNED NOT NULL,
    TypeID 		TINYINT UNSIGNED NOT NULL,
    CreatorID 	TINYINT UNSIGNED NOT NULL,
    CreateDate 	DATE NOT NULL,
				FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
				FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID)
);


-- Table 9: Answer --
DROP TABLE IF EXISTS		Answer;
CREATE TABLE IF NOT EXISTS 	Answer 
(
    AnswerID 	TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content 	VARCHAR(250) NOT NULL,
    QuestionID 	TINYINT UNSIGNED,
    isCorrect 	ENUM('Dung', 'Sai'),
				FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);



-- Table 10: Exam
DROP TABLE IF EXISTS		Exam;
CREATE TABLE IF NOT EXISTS 	Exam 
(
    ExamID 		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Code` 		INT UNSIGNED NOT NULL,
    Title 		VARCHAR(250),
    CategoryID 	TINYINT UNSIGNED NOT NULL,
    Duration	INT NOT NULL,
    CreatorID 	TINYINT UNSIGNED NOT NULL,
    CreateDate 	DATE NOT NULL,
				FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID)
);


-- Table 11: Exam Questione --
DROP TABLE IF EXISTS 		ExamQuestion;
CREATE TABLE IF NOT EXISTS 	ExamQuestion 
(
	ID			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ExamID 		TINYINT UNSIGNED NOT NULL,
    QuestionID 	TINYINT UNSIGNED NOT NULL,
				FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID),
                FOREIGN KEY (ExamID) REFERENCES Exam(ExamID)
);



-- Add data Department --------------------------------------------------------------------------
insert into Department (DepartmentID, DepartmentName) values (1, 'Support');
insert into Department (DepartmentID, DepartmentName) values (2, 'Engineering');
insert into Department (DepartmentID, DepartmentName) values (3, 'Business Development');
insert into Department (DepartmentID, DepartmentName) values (4, 'Research and Development');
insert into Department (DepartmentID, DepartmentName) values (5, 'Business Development');
insert into Department (DepartmentID, DepartmentName) values (6, 'Business Development');
insert into Department (DepartmentID, DepartmentName) values (7, 'Product Management');
insert into Department (DepartmentID, DepartmentName) values (8, 'Engineering');
insert into Department (DepartmentID, DepartmentName) values (9, 'Legal');
insert into Department (DepartmentID, DepartmentName) values (10, 'Human Resources');
insert into Department (DepartmentID, DepartmentName) values (11, 'Support');
insert into Department (DepartmentID, DepartmentName) values (12, 'Training');
insert into Department (DepartmentID, DepartmentName) values (13, 'Accounting');
insert into Department (DepartmentID, DepartmentName) values (14, 'Human Resources');
insert into Department (DepartmentID, DepartmentName) values (15, 'Human Resources');
insert into Department (DepartmentID, DepartmentName) values (16, 'Marketing');
insert into Department (DepartmentID, DepartmentName) values (17, 'Engineering');
insert into Department (DepartmentID, DepartmentName) values (18, 'Support');
insert into Department (DepartmentID, DepartmentName) values (19, 'Engineering');
insert into Department (DepartmentID, DepartmentName) values (20, 'Product Management');
insert into Department (DepartmentID, DepartmentName) values (21, 'Marketing');
insert into Department (DepartmentID, DepartmentName) values (22, 'Accounting');
insert into Department (DepartmentID, DepartmentName) values (23, 'Business Development');
insert into Department (DepartmentID, DepartmentName) values (24, 'Sales');
insert into Department (DepartmentID, DepartmentName) values (25, 'Business Development');
insert into Department (DepartmentID, DepartmentName) values (26, 'Training');
insert into Department (DepartmentID, DepartmentName) values (27, 'Legal');
insert into Department (DepartmentID, DepartmentName) values (28, 'Research and Development');
insert into Department (DepartmentID, DepartmentName) values (29, 'Support');
insert into Department (DepartmentID, DepartmentName) values (30, 'Accounting');
insert into Department (DepartmentID, DepartmentName) values (31, 'Legal');
insert into Department (DepartmentID, DepartmentName) values (32, 'Human Resources');
insert into Department (DepartmentID, DepartmentName) values (33, 'Product Management');
insert into Department (DepartmentID, DepartmentName) values (34, 'Training');
insert into Department (DepartmentID, DepartmentName) values (35, 'Business Development');
insert into Department (DepartmentID, DepartmentName) values (36, 'Engineering');
insert into Department (DepartmentID, DepartmentName) values (37, 'Business Development');
insert into Department (DepartmentID, DepartmentName) values (38, 'Business Development');
insert into Department (DepartmentID, DepartmentName) values (39, 'Services');
insert into Department (DepartmentID, DepartmentName) values (40, 'Support');
insert into Department (DepartmentID, DepartmentName) values (41, 'Business Development');
insert into Department (DepartmentID, DepartmentName) values (42, 'Accounting');
insert into Department (DepartmentID, DepartmentName) values (43, 'Sales');
insert into Department (DepartmentID, DepartmentName) values (44, 'Product Management');
insert into Department (DepartmentID, DepartmentName) values (45, 'Engineering');
insert into Department (DepartmentID, DepartmentName) values (46, 'Support');
insert into Department (DepartmentID, DepartmentName) values (47, 'Legal');
insert into Department (DepartmentID, DepartmentName) values (48, 'Legal');
insert into Department (DepartmentID, DepartmentName) values (49, 'Marketing');
insert into Department (DepartmentID, DepartmentName) values (50, 'Marketing');
insert into Department (DepartmentID, DepartmentName) values (51, 'Sales');
insert into Department (DepartmentID, DepartmentName) values (52, 'Engineering');
insert into Department (DepartmentID, DepartmentName) values (53, 'Training');
insert into Department (DepartmentID, DepartmentName) values (54, 'Services');
insert into Department (DepartmentID, DepartmentName) values (55, 'Engineering');
insert into Department (DepartmentID, DepartmentName) values (56, 'Product Management');
insert into Department (DepartmentID, DepartmentName) values (57, 'Research and Development');
insert into Department (DepartmentID, DepartmentName) values (58, 'Human Resources');
insert into Department (DepartmentID, DepartmentName) values (59, 'Legal');
insert into Department (DepartmentID, DepartmentName) values (60, 'Legal');
insert into Department (DepartmentID, DepartmentName) values (61, 'Product Management');
insert into Department (DepartmentID, DepartmentName) values (62, 'Sale');
insert into Department (DepartmentID, DepartmentName) values (63, 'Marketing');
insert into Department (DepartmentID, DepartmentName) values (64, 'Sales');
insert into Department (DepartmentID, DepartmentName) values (65, 'Human Resources');
insert into Department (DepartmentID, DepartmentName) values (66, 'Marketing');
insert into Department (DepartmentID, DepartmentName) values (67, 'Accounting');
insert into Department (DepartmentID, DepartmentName) values (68, 'Legal');
insert into Department (DepartmentID, DepartmentName) values (69, 'Services');
insert into Department (DepartmentID, DepartmentName) values (70, 'Engineering');
insert into Department (DepartmentID, DepartmentName) values (71, 'Training');
insert into Department (DepartmentID, DepartmentName) values (72, 'Sales');
insert into Department (DepartmentID, DepartmentName) values (73, 'Accounting');
insert into Department (DepartmentID, DepartmentName) values (74, 'Training');
insert into Department (DepartmentID, DepartmentName) values (75, 'Training');
insert into Department (DepartmentID, DepartmentName) values (76, 'Training');
insert into Department (DepartmentID, DepartmentName) values (77, 'Training');
insert into Department (DepartmentID, DepartmentName) values (78, 'Sales');
insert into Department (DepartmentID, DepartmentName) values (79, 'Accounting');
insert into Department (DepartmentID, DepartmentName) values (80, 'Product Management');
insert into Department (DepartmentID, DepartmentName) values (81, 'Accounting');
insert into Department (DepartmentID, DepartmentName) values (82, 'Engineering');
insert into Department (DepartmentID, DepartmentName) values (83, 'Research and Development');
insert into Department (DepartmentID, DepartmentName) values (84, 'Human Resources');
insert into Department (DepartmentID, DepartmentName) values (85, 'Marketing');
insert into Department (DepartmentID, DepartmentName) values (86, 'Marketing');
insert into Department (DepartmentID, DepartmentName) values (87, 'Human Resources');
insert into Department (DepartmentID, DepartmentName) values (88, 'Sale');
insert into Department (DepartmentID, DepartmentName) values (89, 'Legal');
insert into Department (DepartmentID, DepartmentName) values (90, 'Support');
insert into Department (DepartmentID, DepartmentName) values (91, 'Human Resources');
insert into Department (DepartmentID, DepartmentName) values (92, 'Business Development');
insert into Department (DepartmentID, DepartmentName) values (93, 'Engineering');
insert into Department (DepartmentID, DepartmentName) values (94, 'Support');
insert into Department (DepartmentID, DepartmentName) values (95, 'Research and Development');
insert into Department (DepartmentID, DepartmentName) values (96, 'Training');
insert into Department (DepartmentID, DepartmentName) values (97, 'Training');
insert into Department (DepartmentID, DepartmentName) values (98, 'Legal');
insert into Department (DepartmentID, DepartmentName) values (99, 'Support');
insert into Department (DepartmentID, DepartmentName) values (100, 'Human Resources');



-- Add data Position -----------------------------------------------------------
insert into Position (PositionID, PositionName) values (1, 'Scrum Master');
insert into Position (PositionID, PositionName) values (2, 'Dev');
insert into Position (PositionID, PositionName) values (3, 'Scrum Master');
insert into Position (PositionID, PositionName) values (4, 'Test');
insert into Position (PositionID, PositionName) values (5, 'PM');
insert into Position (PositionID, PositionName) values (6, 'Dev');
insert into Position (PositionID, PositionName) values (7, 'Test');
insert into Position (PositionID, PositionName) values (8, 'PM');
insert into Position (PositionID, PositionName) values (9, 'PM');
insert into Position (PositionID, PositionName) values (10, 'Scrum Master');
insert into Position (PositionID, PositionName) values (11, 'Dev');
insert into Position (PositionID, PositionName) values (12, 'Dev');
insert into Position (PositionID, PositionName) values (13, 'PM');
insert into Position (PositionID, PositionName) values (14, 'Test');
insert into Position (PositionID, PositionName) values (15, 'PM');
insert into Position (PositionID, PositionName) values (16, 'PM');
insert into Position (PositionID, PositionName) values (17, 'PM');
insert into Position (PositionID, PositionName) values (18, 'PM');
insert into Position (PositionID, PositionName) values (19, 'Test');
insert into Position (PositionID, PositionName) values (20, 'PM');
insert into Position (PositionID, PositionName) values (21, 'Dev');
insert into Position (PositionID, PositionName) values (22, 'Scrum Master');
insert into Position (PositionID, PositionName) values (23, 'Test');
insert into Position (PositionID, PositionName) values (24, 'Dev');
insert into Position (PositionID, PositionName) values (25, 'Dev');
insert into Position (PositionID, PositionName) values (26, 'PM');
insert into Position (PositionID, PositionName) values (27, 'Test');
insert into Position (PositionID, PositionName) values (28, 'Scrum Master');
insert into Position (PositionID, PositionName) values (29, 'Scrum Master');
insert into Position (PositionID, PositionName) values (30, 'PM');
insert into Position (PositionID, PositionName) values (31, 'PM');
insert into Position (PositionID, PositionName) values (32, 'Test');
insert into Position (PositionID, PositionName) values (33, 'Dev');
insert into Position (PositionID, PositionName) values (34, 'Scrum Master');
insert into Position (PositionID, PositionName) values (35, 'Scrum Master');
insert into Position (PositionID, PositionName) values (36, 'Scrum Master');
insert into Position (PositionID, PositionName) values (37, 'Scrum Master');
insert into Position (PositionID, PositionName) values (38, 'Scrum Master');
insert into Position (PositionID, PositionName) values (39, 'PM');
insert into Position (PositionID, PositionName) values (40, 'Test');
insert into Position (PositionID, PositionName) values (41, 'Dev');
insert into Position (PositionID, PositionName) values (42, 'Test');
insert into Position (PositionID, PositionName) values (43, 'Test');
insert into Position (PositionID, PositionName) values (44, 'Scrum Master');
insert into Position (PositionID, PositionName) values (45, 'Scrum Master');
insert into Position (PositionID, PositionName) values (46, 'Dev');
insert into Position (PositionID, PositionName) values (47, 'Scrum Master');
insert into Position (PositionID, PositionName) values (48, 'PM');
insert into Position (PositionID, PositionName) values (49, 'Test');
insert into Position (PositionID, PositionName) values (50, 'PM');
insert into Position (PositionID, PositionName) values (51, 'Scrum Master');
insert into Position (PositionID, PositionName) values (52, 'Scrum Master');
insert into Position (PositionID, PositionName) values (53, 'Scrum Master');
insert into Position (PositionID, PositionName) values (54, 'Test');
insert into Position (PositionID, PositionName) values (55, 'PM');
insert into Position (PositionID, PositionName) values (56, 'Dev');
insert into Position (PositionID, PositionName) values (57, 'Dev');
insert into Position (PositionID, PositionName) values (58, 'Scrum Master');
insert into Position (PositionID, PositionName) values (59, 'Test');
insert into Position (PositionID, PositionName) values (60, 'Test');
insert into Position (PositionID, PositionName) values (61, 'Dev');
insert into Position (PositionID, PositionName) values (62, 'Test');
insert into Position (PositionID, PositionName) values (63, 'Scrum Master');
insert into Position (PositionID, PositionName) values (64, 'PM');
insert into Position (PositionID, PositionName) values (65, 'Test');
insert into Position (PositionID, PositionName) values (66, 'Dev');
insert into Position (PositionID, PositionName) values (67, 'Scrum Master');
insert into Position (PositionID, PositionName) values (68, 'Dev');
insert into Position (PositionID, PositionName) values (69, 'Scrum Master');
insert into Position (PositionID, PositionName) values (70, 'Test');
insert into Position (PositionID, PositionName) values (71, 'Scrum Master');
insert into Position (PositionID, PositionName) values (72, 'Dev');
insert into Position (PositionID, PositionName) values (73, 'Dev');
insert into Position (PositionID, PositionName) values (74, 'Scrum Master');
insert into Position (PositionID, PositionName) values (75, 'Test');
insert into Position (PositionID, PositionName) values (76, 'Test');
insert into Position (PositionID, PositionName) values (77, 'Test');
insert into Position (PositionID, PositionName) values (78, 'PM');
insert into Position (PositionID, PositionName) values (79, 'PM');
insert into Position (PositionID, PositionName) values (80, 'Scrum Master');
insert into Position (PositionID, PositionName) values (81, 'Test');
insert into Position (PositionID, PositionName) values (82, 'Test');
insert into Position (PositionID, PositionName) values (83, 'Test');
insert into Position (PositionID, PositionName) values (84, 'PM');
insert into Position (PositionID, PositionName) values (85, 'Dev');
insert into Position (PositionID, PositionName) values (86, 'Dev');
insert into Position (PositionID, PositionName) values (87, 'Test');
insert into Position (PositionID, PositionName) values (88, 'PM');
insert into Position (PositionID, PositionName) values (89, 'Scrum Master');
insert into Position (PositionID, PositionName) values (90, 'Dev');
insert into Position (PositionID, PositionName) values (91, 'Test');
insert into Position (PositionID, PositionName) values (92, 'Scrum Master');
insert into Position (PositionID, PositionName) values (93, 'Test');
insert into Position (PositionID, PositionName) values (94, 'PM');
insert into Position (PositionID, PositionName) values (95, 'Test');
insert into Position (PositionID, PositionName) values (96, 'Dev');
insert into Position (PositionID, PositionName) values (97, 'Test');
insert into Position (PositionID, PositionName) values (98, 'Scrum Master');
insert into Position (PositionID, PositionName) values (99, 'Dev');
insert into Position (PositionID, PositionName) values (100, 'Test');






-- Add data Account ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (1, 'dbengtson0@arizona.edu', 'dbengtson0', 'Devland Bengtson', 43, 11, '2016-10-29');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (2, 'bswayne1@wsj.com', 'bswayne1', 'Binni Swayne', 49, 16, '2018-04-06');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (3, 'wmollitt2@tuttocitta.it', 'wmollitt2', 'Thorpe Alessandretta', 60, 42, '2015-10-22');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (4, 'acornish3@java.com', 'acornish3', 'Ambrose Cornish', 63, 68, '2016-09-30');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (5, 'fcovet4@loc.gov', 'fcovet4', 'Filberte Covet', 28, 67, '2016-01-25');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (6, 'arizzardini5@issuu.com', 'arizzardini5', 'Alexandr Rizzardini', 4, 52, '2020-03-23');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (7, 'rcoggles6@yahoo.co.jp', 'rcoggles6', 'Raddie Coggles', 100, 43, '2015-09-04');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (8, 'hhabbeshaw7@qq.com', 'hhabbeshaw7', 'Hetty Habbeshaw', 47, 70, '2018-03-17');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (9, 'mbatcock8@sun.com', 'mbatcock8', 'Morgun Batcock', 47, 94, '2018-02-18');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (10, 'gtrevan9@freewebs.com', 'gtrevan9', 'Gerti Trevan', 38, 59, '2016-06-29');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (11, 'rstradlinga@time.com', 'rstradlinga', 'Roselia Stradling', 68, 97, '2017-09-27');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (12, 'lpieronib@youtube.com', 'lpieronib', 'Lemmie Pieroni', 9, 31, '2016-08-24');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (13, 'sgathererc@accuweather.com', 'sgathererc', 'Sandie Gatherer', 29, 81, '2019-10-11');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (14, 'rseggied@ucoz.com', 'rseggied', 'Roselle Seggie', 14, 87, '2017-02-16');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (15, 'mfranzelinie@unesco.org', 'mfranzelinie', 'Merrile Franzelini', 66, 71, '2018-05-21');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (16, 'bmcdermidf@addthis.com', 'bmcdermidf', 'Beck McDermid', 38, 75, '2020-09-17');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (17, 'ewhippleg@usnews.com', 'ewhippleg', 'Esdras Whipple', 34, 52, '2020-12-03');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (18, 'lgillionh@chicagotribune.com', 'lgillionh', 'Luelle Gillion', 14, 78, '2019-01-19');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (19, 'isherreardi@who.int', 'isherreardi', 'Izabel Sherreard', 35, 85, '2020-11-09');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (20, 'akubicekj@rakuten.co.jp', 'akubicekj', 'Ave Kubicek', 29, 34, '2020-04-22');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (21, 'gsawnwyk@cloudflare.com', 'gsawnwyk', 'Gibbie Sawnwy', 90, 19, '2020-06-02');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (22, 'scrosherl@tamu.edu', 'scrosherl', 'Sue Crosher', 18, 80, '2018-02-25');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (23, 'jmacgilpatrickm@mashable.com', 'jmacgilpatrickm', 'Jamal MacGilpatrick', 78, 7, '2019-12-08');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (24, 'mnealandn@spotify.com', 'mnealandn', 'Melli Nealand', 4, 69, '2018-11-25');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (25, 'rnestero@dailymail.co.uk', 'rnestero', 'Randolph Nester', 9, 1, '2019-05-19');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (26, 'nmccafferkyp@reddit.com', 'nmccafferkyp', 'Natala McCafferky', 43, 50, '2017-09-25');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (27, 'bstampferq@washingtonpost.com', 'bstampferq', 'Byrom Stampfer', 43, 57, '2015-12-25');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (28, 'gvindenr@deliciousdays.com', 'gvindenr', 'Georgeanna Vinden', 10, 89, '2018-03-27');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (29, 'jgogins@tiny.cc', 'jgogins', 'Jodi Gogin', 23, 73, '2016-01-01');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (30, 'lwimst@xing.com', 'lwimst', 'Laurie Wims', 24, 3, '2018-02-24');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (31, 'kumplebyu@techcrunch.com', 'kumplebyu', 'Kimberlyn Umpleby', 76, 31, '2017-04-13');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (32, 'gpirsonv@pinterest.com', 'gpirsonv', 'Gilemette Pirson', 81, 22, '2016-10-08');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (33, 'echelamw@discuz.net', 'echelamw', 'Else Chelam', 18, 96, '2015-06-23');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (34, 'rmckeefryx@discuz.net', 'rmckeefryx', 'Riobard McKeefry', 61, 88, '2016-11-05');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (35, 'eshankstery@taobao.com', 'eshankstery', 'Elisabetta Shankster', 77, 66, '2018-02-07');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (36, 'dsafflez@china.com.cn', 'dsafflez', 'Daron Saffle', 84, 98, '2017-03-04');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (37, 'ckretchmer10@fc2.com', 'ckretchmer10', 'Candace Kretchmer', 79, 62, '2020-09-02');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (38, 'amattacks11@aol.com', 'amattacks11', 'Augustine Mattacks', 29, 28, '2015-11-21');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (39, 'lhanlon12@printfriendly.com', 'lhanlon12', 'Lowell Hanlon', 80, 90, '2019-05-10');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (40, 'eofeeney13@bbc.co.uk', 'eofeeney13', 'Esther O''Feeney', 50, 13, '2017-06-14');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (41, 'yellaman14@globo.com', 'yellaman14', 'Yank Ellaman', 45, 84, '2018-03-20');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (42, 'talessandretti15@people.com.cn', 'talessandretti15', 'Thorpe Alessandretti', 56, 33, '2016-06-21');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (43, 'khalliwell16@spotify.com', 'khalliwell16', 'Kristos Halliwell', 18, 83, '2016-01-20');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (44, 'churrion17@xrea.com', 'churrion17', 'Clementine Hurrion', 45, 90, '2018-03-25');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (45, 'emeggison18@opera.com', 'emeggison18', 'Elwira Meggison', 3, 35, '2018-05-21');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (46, 'tlambie19@example.com', 'tlambie19', 'Tod Lambie', 34, 13, '2020-05-23');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (47, 'cedden1a@feedburner.com', 'cedden1a', 'Cyndy Edden', 82, 98, '2018-07-02');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (48, 'vfeare1b@shop-pro.jp', 'vfeare1b', 'Virgina Feare', 90, 4, '2020-03-23');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (49, 'mascrofte1c@rakuten.co.jp', 'mascrofte1c', 'Madonna Ascrofte', 11, 4, '2018-06-11');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (50, 'lwestmorland1d@blinklist.com', 'lwestmorland1d', 'Lorianna Westmorland', 11, 37, '2018-10-18');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (51, 'sriddles1e@ox.ac.uk', 'sriddles1e', 'Solly Riddles', 7, 2, '2015-08-25');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (52, 'bweems1f@hp.com', 'bweems1f', 'Brietta Weems', 100, 24, '2019-10-06');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (53, 'roldrey1g@themeforest.net', 'roldrey1g', 'Rriocard Oldrey', 55, 6, '2020-05-05');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (54, 'gcardis1h@last.fm', 'gcardis1h', 'Gwynne Cardis', 74, 45, '2017-10-14');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (55, 'glittlepage1i@ed.gov', 'glittlepage1i', 'Gabrielle Littlepage', 61, 65, '2018-02-03');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (56, 'osutty1j@yahoo.com', 'osutty1j', 'Obie Sutty', 42, 51, '2019-02-18');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (57, 'nphilipeau1k@pcworld.com', 'nphilipeau1k', 'Noel Philipeau', 98, 67, '2020-12-15');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (58, 'jdellenbach1l@google.com.hk', 'jdellenbach1l', 'Jill Dellenbach', 37, 93, '2019-09-16');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (59, 'ijudd1m@nationalgeographic.com', 'ijudd1m', 'Izzy Judd', 49, 50, '2016-01-04');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (60, 'vornils1n@google.com.hk', 'vornils1n', 'Vernice Ornils', 7, 25, '2015-06-15');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (61, 'usoloway1o@hubpages.com', 'usoloway1o', 'Ursa Soloway', 25, 40, '2019-12-17');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (62, 'kwincer1p@fda.gov', 'kwincer1p', 'Kerry Wincer', 9, 16, '2019-06-23');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (63, 'mtinner1q@studiopress.com', 'mtinner1q', 'Morgun Tinner', 86, 2, '2016-05-21');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (64, 'lhalesworth1r@netlog.com', 'lhalesworth1r', 'Leonerd Halesworth', 49, 21, '2020-07-03');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (65, 'sbulter1s@taobao.com', 'sbulter1s', 'Sabine Bulter', 97, 65, '2018-06-17');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (66, 'lhaddrell1t@twitter.com', 'lhaddrell1t', 'Lanae Haddrell', 91, 85, '2018-06-25');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (67, 'mjennions1u@hhs.gov', 'mjennions1u', 'Marshal Jennions', 43, 52, '2019-04-19');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (68, 'pheathcott1v@paginegialle.it', 'pheathcott1v', 'Paula Heathcott', 75, 67, '2019-06-14');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (69, 'tbrandacci1w@weather.com', 'tbrandacci1w', 'Thorny Brandacci', 73, 84, '2016-08-04');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (70, 'cclubb1x@sina.com.cn', 'cclubb1x', 'Cirstoforo Clubb', 28, 55, '2016-06-26');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (71, 'swhaites1y@cafepress.com', 'swhaites1y', 'Shelby Whaites', 12, 93, '2016-12-02');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (72, 'kdunkerly1z@auda.org.au', 'kdunkerly1z', 'Kipp Dunkerly', 35, 78, '2020-08-20');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (73, 'scaldaro20@uol.com.br', 'scaldaro20', 'Seumas Caldaro', 75, 92, '2020-12-09');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (74, 'rinsole21@cornell.edu', 'rinsole21', 'Ripley Insole', 9, 71, '2018-12-16');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (75, 'umatyatin22@furl.net', 'umatyatin22', 'Ula Matyatin', 63, 24, '2021-05-01');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (76, 'vlukesch23@census.gov', 'vlukesch23', 'Vilma Lukesch', 27, 40, '2019-04-05');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (77, 'yshovelbottom24@youtube.com', 'yshovelbottom24', 'Yulma Shovelbottom', 15, 65, '2019-11-06');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (78, 'ldaeth25@google.pl', 'ldaeth25', 'Lottie D''Aeth', 47, 59, '2017-12-09');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (79, 'staggett26@army.mil', 'staggett26', 'Sayer Taggett', 84, 80, '2016-07-04');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (80, 'nmollen27@wikispaces.com', 'nmollen27', 'Nona Mollen', 21, 98, '2016-01-01');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (81, 'mmoyers28@nyu.edu', 'mmoyers28', 'Matt Moyers', 32, 7, '2017-10-25');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (82, 'pphilbrick29@nymag.com', 'pphilbrick29', 'Pall Philbrick', 54, 88, '2016-02-23');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (83, 'lbanham2a@utexas.edu', 'lbanham2a', 'Lisle Banham', 53, 45, '2017-06-16');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (84, 'jverbeek2b@google.es', 'jverbeek2b', 'Jerrilee Verbeek', 30, 58, '2019-12-08');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (85, 'dmahady2c@si.edu', 'dmahady2c', 'Dominique Mahady', 56, 100, '2016-02-05');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (86, 'ojiggen2d@theglobeandmail.com', 'ojiggen2d', 'Orin Jiggen', 37, 68, '2020-01-22');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (87, 'fbuckhurst2e@parallels.com', 'fbuckhurst2e', 'Fifi Buckhurst', 2, 30, '2019-06-13');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (88, 'cpurchon2f@va.gov', 'cpurchon2f', 'Clarabelle Purchon', 63, 75, '2019-11-17');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (89, 'rcopin2g@tmall.com', 'rcopin2g', 'Rory Copin', 87, 25, '2016-03-23');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (90, 'keastby2h@exblog.jp', 'keastby2h', 'Keriann Eastby', 89, 32, '2018-09-01');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (91, 'nfleury2i@merriam-webster.com', 'nfleury2i', 'Neile Fleury', 40, 78, '2018-09-17');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (92, 'nde2j@privacy.gov.au', 'nde2j', 'Nealy De Laci', 6, 10, '2021-04-27');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (93, 'rchatband2k@liveinternet.ru', 'rchatband2k', 'Roosevelt Chatband', 32, 84, '2016-03-19');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (94, 'lstockford2l@slideshare.net', 'lstockford2l', 'Lian Stockford', 5, 27, '2018-06-08');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (95, 'ikinsett2m@amazon.de', 'ikinsett2m', 'Isiahi Kinsett', 10, 59, '2016-11-15');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (96, 'cbantham2n@paginegialle.it', 'cbantham2n', 'Cortie Bantham', 92, 98, '2016-03-09');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (97, 'qvel2o@wordpress.org', 'qvel2o', 'Quill Vel', 75, 99, '2017-05-23');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (98, 'ndupoy2p@tripadvisor.com', 'ndupoy2p', 'Nanice Dupoy', 58, 44, '2017-07-10');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (99, 'bbehning2q@reference.com', 'bbehning2q', 'Barnard Behning', 34, 73, '2017-10-14');
insert into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) values (100, 'cbretherick2r@chicagotribune.com', 'cbretherick2r', 'Cleo Bretherick', 77, 51, '2021-04-05');



-- Add data Groupp ------------------------------------------------------------------------------------------------------
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (1, 'fvertey0@wikimedia.org', 25, '2016-01-18');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (2, 'mlagde1@last.fm', 88, '2018-09-24');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (3, 'jjarred2@amazon.co.jp', 60, '2019-06-10');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (4, 'wfisbburne3@yolasite.com', 82, '2018-11-25');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (5, 'mgiannini4@aboutads.info', 42, '2017-06-05');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (6, 'zjantel5@nyu.edu', 83, '2020-04-18');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (7, 'shartup6@histats.com', 40, '2018-05-03');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (8, 'orupke7@flickr.com', 5, '2017-09-28');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (9, 'rrablan8@ibm.com', 3, '2018-10-30');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (10, 'thaldin9@walmart.com', 2, '2015-12-11');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (11, 'ikasparskia@npr.org', 39, '2019-01-24');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (12, 'bisardb@webs.com', 49, '2019-01-07');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (13, 'acotherillc@archive.org', 19, '2019-10-04');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (14, 'eglentond@dyndns.org', 9, '2018-11-30');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (15, 'jscuttere@seesaa.net', 17, '2017-05-01');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (16, 'lhoulsonf@toplist.cz', 37, '2015-08-21');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (17, 'shambidgeg@google.com', 2, '2020-03-19');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (18, 'ghalversenh@arizona.edu', 64, '2021-02-12');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (19, 'cgrealeyi@digg.com', 46, '2016-10-04');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (20, 'fmathesonj@thetimes.co.uk', 99, '2020-06-23');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (21, 'mkaesmakersk@networksolutions.com', 12, '2015-07-12');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (22, 'yandryszczakl@privacy.gov.au', 53, '2020-08-22');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (23, 'tlushm@mediafire.com', 26, '2017-08-26');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (24, 'dnoakesn@hatena.ne.jp', 97, '2021-02-04');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (25, 'bdawtryo@nhs.uk', 87, '2017-05-26');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (26, 'spiquardp@wunderground.com', 19, '2018-09-23');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (27, 'roldeyq@arstechnica.com', 13, '2017-10-10');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (28, 'cbadamr@dion.ne.jp', 89, '2019-12-20');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (29, 'ddoolers@answers.com', 74, '2018-01-29');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (30, 'nconeybeert@jugem.jp', 56, '2021-02-10');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (31, 'klawleyu@phoca.cz', 32, '2018-10-23');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (32, 'nfrisbyv@epa.gov', 76, '2018-12-09');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (33, 'smaudettw@vistaprint.com', 30, '2018-02-04');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (34, 'sohannenx@ibm.com', 39, '2016-12-27');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (35, 'pmccaigy@squarespace.com', 60, '2017-10-08');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (36, 'lriddingz@github.com', 72, '2019-10-20');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (37, 'meyre10@pinterest.com', 44, '2018-08-23');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (38, 'rparade11@chicagotribune.com', 11, '2018-06-04');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (39, 'ctruckell12@elegantthemes.com', 45, '2019-10-28');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (40, 'rroostan13@unesco.org', 46, '2020-09-12');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (41, 'mcockney14@blogtalkradio.com', 25, '2018-06-21');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (42, 'brance15@wisc.edu', 81, '2018-06-04');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (43, 'rfortie16@ox.ac.uk', 29, '2016-06-18');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (44, 'khulle17@bizjournals.com', 56, '2016-01-02');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (45, 'sbalsdone18@privacy.gov.au', 36, '2016-08-11');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (46, 'mcullinan19@artisteer.com', 83, '2018-02-11');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (47, 'yseivwright1a@accuweather.com', 35, '2016-09-02');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (48, 'tbirkhead1b@lulu.com', 58, '2018-11-03');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (49, 'rhurne1c@dropbox.com', 76, '2017-12-16');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (50, 'jkenson1d@tripadvisor.com', 54, '2015-07-26');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (51, 'esheard1e@google.co.uk', 47, '2020-09-16');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (52, 'lbanbury1f@archive.org', 88, '2017-10-20');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (53, 'kgotts1g@sun.com', 53, '2019-03-17');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (54, 'dteanby1h@engadget.com', 16, '2017-08-31');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (55, 'jlefebre1i@hubpages.com', 31, '2018-12-27');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (56, 'kbillows1j@tripod.com', 53, '2017-08-14');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (57, 'lschanke1k@princeton.edu', 15, '2015-10-18');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (58, 'jeastby1l@harvard.edu', 70, '2015-11-09');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (59, 'pwroth1m@huffingtonpost.com', 91, '2017-03-15');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (60, 'aaberhart1n@booking.com', 71, '2017-10-16');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (61, 'jverrier1o@microsoft.com', 57, '2017-07-16');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (62, 'npecha1p@epa.gov', 14, '2018-10-26');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (63, 'siorio1q@weather.com', 68, '2021-02-16');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (64, 'aboddington1r@indiatimes.com', 70, '2020-06-21');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (65, 'cagius1s@unicef.org', 49, '2020-01-29');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (66, 'bcaret1t@unicef.org', 100, '2017-06-24');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (67, 'gmaliphant1u@elpais.com', 84, '2016-08-07');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (68, 'psmowton1v@lycos.com', 19, '2019-09-28');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (69, 'cboame1w@123-reg.co.uk', 10, '2016-07-23');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (70, 'smorforth1x@smugmug.com', 30, '2020-06-16');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (71, 'jlimon1y@dailymail.co.uk', 85, '2016-10-07');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (72, 'ckezor1z@macromedia.com', 49, '2018-01-18');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (73, 'gyukhtin20@mtv.com', 75, '2021-02-12');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (74, 'jcohn21@jimdo.com', 85, '2015-08-07');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (75, 'psimonini22@reddit.com', 81, '2017-09-03');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (76, 'fmatveyev23@who.int', 36, '2017-05-10');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (77, 'cbarti24@squarespace.com', 32, '2018-08-10');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (78, 'mirons25@bigcartel.com', 58, '2018-06-19');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (79, 'icollishaw26@reuters.com', 58, '2020-03-27');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (80, 'akerrane27@instagram.com', 4, '2020-08-01');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (81, 'fgostall28@examiner.com', 42, '2019-03-23');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (82, 'wgallagher29@economist.com', 9, '2015-12-19');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (83, 'gtuxsell2a@odnoklassniki.ru', 85, '2019-01-06');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (84, 'gcoke2b@google.co.jp', 43, '2018-01-11');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (85, 'pvanarsdall2c@wikimedia.org', 87, '2018-05-30');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (86, 'jkubelka2d@drupal.org', 24, '2016-11-09');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (87, 'gbazek2e@amazon.co.jp', 63, '2016-05-22');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (88, 'rbremond2f@time.com', 7, '2017-07-22');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (89, 'koldrey2g@ocn.ne.jp', 89, '2016-04-14');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (90, 'mgilphillan2h@scribd.com', 45, '2015-07-31');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (91, 'fmatresse2i@tumblr.com', 60, '2018-12-02');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (92, 'ffairley2j@ifeng.com', 17, '2021-01-09');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (93, 'rorneblow2k@blogtalkradio.com', 81, '2018-03-15');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (94, 'zrikard2l@mashable.com', 25, '2021-01-26');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (95, 'dmcgarry2m@joomla.org', 93, '2016-07-18');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (96, 'mmacanellye2n@vkontakte.ru', 65, '2017-04-24');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (97, 'dtreacher2o@cargocollective.com', 30, '2017-02-10');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (98, 'tdaouze2p@forbes.com', 42, '2021-01-17');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (99, 'gkirwan2q@tripadvisor.com', 48, '2021-04-26');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (100, 'rleschelle2r@cnbc.com', 85, '2019-03-16');



-- Add data GroupAccount ---------------------------------------------------------------

insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (1, 63, 11, '2015-08-31');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (2, 28, 85, '2016-02-04');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (3, 9, 64, '2019-09-14');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (4, 50, 71, '2015-08-07');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (5, 65, 4, '2019-10-06');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (6, 82, 20, '2018-01-19');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (7, 35, 42, '2015-09-13');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (8, 23, 40, '2019-09-28');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (9, 13, 2, '2018-09-20');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (10, 2, 70, '2019-06-06');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (11, 82, 20, '2020-06-19');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (12, 34, 45, '2018-03-21');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (13, 9, 27, '2018-01-08');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (14, 76, 6, '2016-02-05');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (15, 8, 87, '2016-02-10');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (16, 54, 60, '2019-04-11');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (17, 20, 58, '2016-11-24');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (18, 33, 27, '2019-12-16');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (19, 24, 94, '2015-12-14');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (20, 50, 49, '2017-03-12');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (21, 35, 1, '2020-10-14');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (22, 88, 61, '2020-02-20');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (23, 10, 34, '2019-04-09');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (24, 65, 35, '2017-08-17');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (25, 37, 91, '2020-01-09');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (26, 80, 11, '2019-02-06');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (27, 85, 15, '2019-01-15');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (28, 17, 51, '2019-02-23');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (29, 10, 81, '2018-03-31');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (30, 100, 76, '2018-06-04');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (31, 35, 94, '2015-09-14');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (32, 17, 5, '2018-04-06');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (33, 64, 91, '2016-03-08');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (34, 14, 90, '2016-06-03');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (35, 92, 74, '2021-03-17');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (36, 83, 41, '2019-08-07');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (37, 34, 35, '2016-08-17');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (38, 16, 84, '2016-02-07');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (39, 81, 86, '2019-06-16');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (40, 70, 58, '2019-10-06');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (41, 99, 76, '2020-12-18');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (42, 15, 30, '2021-02-27');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (43, 30, 56, '2019-01-29');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (44, 89, 3, '2018-12-11');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (45, 20, 58, '2019-02-11');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (46, 62, 95, '2018-05-31');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (47, 75, 30, '2015-11-24');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (48, 70, 68, '2016-11-24');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (49, 69, 71, '2017-02-09');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (50, 61, 31, '2015-10-12');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (51, 64, 78, '2016-01-18');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (52, 53, 49, '2018-06-22');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (53, 19, 71, '2019-06-08');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (54, 67, 14, '2021-02-17');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (55, 88, 85, '2016-06-05');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (56, 92, 72, '2019-04-19');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (57, 19, 88, '2019-12-12');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (58, 15, 87, '2020-01-30');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (59, 45, 99, '2018-07-19');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (60, 60, 15, '2015-06-13');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (61, 67, 97, '2017-10-27');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (62, 57, 6, '2017-09-06');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (63, 30, 85, '2016-10-17');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (64, 13, 66, '2017-01-25');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (65, 8, 5, '2017-11-03');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (66, 20, 74, '2017-08-05');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (67, 88, 11, '2017-06-04');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (68, 82, 24, '2016-05-04');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (69, 58, 61, '2016-03-23');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (70, 41, 58, '2017-08-30');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (71, 89, 52, '2015-06-09');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (72, 15, 71, '2020-04-25');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (73, 38, 50, '2017-08-06');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (74, 24, 9, '2018-08-28');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (75, 37, 86, '2016-10-03');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (76, 24, 69, '2016-08-27');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (77, 14, 6, '2018-07-22');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (78, 50, 100, '2017-01-04');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (79, 60, 14, '2018-10-26');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (80, 63, 60, '2019-08-24');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (81, 64, 61, '2017-04-21');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (82, 2, 62, '2019-08-09');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (83, 71, 86, '2015-11-16');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (84, 80, 90, '2018-12-13');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (85, 61, 19, '2020-06-11');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (86, 42, 50, '2020-03-20');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (87, 74, 21, '2020-03-10');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (88, 69, 94, '2020-11-07');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (89, 63, 36, '2017-09-03');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (90, 15, 39, '2020-05-05');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (91, 41, 34, '2020-07-14');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (92, 44, 40, '2019-07-15');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (93, 28, 86, '2017-03-20');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (94, 7, 100, '2019-09-02');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (95, 100, 66, '2017-06-12');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (96, 86, 51, '2016-10-30');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (97, 100, 40, '2020-01-02');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (98, 63, 42, '2020-06-26');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (99, 36, 8, '2018-07-25');
insert into GroupAccount (ID, GroupID, AccountID, JoinDate) values (100, 27, 72, '2018-12-05');




-- Add data TypeQuestion ----------------------------------------------------------------
insert into TypeQuestion (TypeID, TypeName) values (1, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (2, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (3, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (4, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (5, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (6, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (7, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (8, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (9, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (10, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (11, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (12, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (13, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (14, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (15, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (16, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (17, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (18, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (19, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (20, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (21, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (22, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (23, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (24, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (25, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (26, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (27, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (28, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (29, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (30, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (31, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (32, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (33, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (34, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (35, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (36, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (37, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (38, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (39, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (40, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (41, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (42, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (43, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (44, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (45, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (46, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (47, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (48, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (49, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (50, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (51, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (52, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (53, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (54, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (55, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (56, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (57, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (58, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (59, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (60, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (61, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (62, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (63, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (64, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (65, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (66, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (67, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (68, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (69, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (70, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (71, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (72, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (73, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (74, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (75, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (76, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (77, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (78, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (79, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (80, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (81, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (82, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (83, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (84, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (85, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (86, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (87, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (88, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (89, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (90, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (91, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (92, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (93, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (94, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (95, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (96, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (97, 'Essay');
insert into TypeQuestion (TypeID, TypeName) values (98, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (99, 'Multiple-Choice');
insert into TypeQuestion (TypeID, TypeName) values (100, 'Essay');


-- Add data CategoryQuestion --------------------------------------------------
insert into CategoryQuestion (CategoryID, CategoryName) values (1, '.Net');
insert into CategoryQuestion (CategoryID, CategoryName) values (2, 'Pyrit');
insert into CategoryQuestion (CategoryID, CategoryName) values (3, 'Postman');
insert into CategoryQuestion (CategoryID, CategoryName) values (4, 'Ryby');
insert into CategoryQuestion (CategoryID, CategoryName) values (5, 'SQL');
insert into CategoryQuestion (CategoryID, CategoryName) values (6, 'Magma');
insert into CategoryQuestion (CategoryID, CategoryName) values (7, 'Ryby');
insert into CategoryQuestion (CategoryID, CategoryName) values (8, '.Net');
insert into CategoryQuestion (CategoryID, CategoryName) values (9, 'Java');
insert into CategoryQuestion (CategoryID, CategoryName) values (10, 'Pyrit');
insert into CategoryQuestion (CategoryID, CategoryName) values (11, 'Ryby');
insert into CategoryQuestion (CategoryID, CategoryName) values (12, 'Pegmatit');
insert into CategoryQuestion (CategoryID, CategoryName) values (13, 'Silicat');
insert into CategoryQuestion (CategoryID, CategoryName) values (14, 'Magma');
insert into CategoryQuestion (CategoryID, CategoryName) values (15, 'Postman');
insert into CategoryQuestion (CategoryID, CategoryName) values (16, 'Pegmatit');
insert into CategoryQuestion (CategoryID, CategoryName) values (17, 'SQL');
insert into CategoryQuestion (CategoryID, CategoryName) values (18, 'Pyrotin');
insert into CategoryQuestion (CategoryID, CategoryName) values (19, 'Pyrit');
insert into CategoryQuestion (CategoryID, CategoryName) values (20, 'Java');
insert into CategoryQuestion (CategoryID, CategoryName) values (21, '.Net');
insert into CategoryQuestion (CategoryID, CategoryName) values (22, 'Postman');
insert into CategoryQuestion (CategoryID, CategoryName) values (23, 'SQL');
insert into CategoryQuestion (CategoryID, CategoryName) values (24, 'Pegmatit');
insert into CategoryQuestion (CategoryID, CategoryName) values (25, 'Pyrit');
insert into CategoryQuestion (CategoryID, CategoryName) values (26, 'Pyrit');
insert into CategoryQuestion (CategoryID, CategoryName) values (27, 'Pyrit');
insert into CategoryQuestion (CategoryID, CategoryName) values (28, 'Ryby');
insert into CategoryQuestion (CategoryID, CategoryName) values (29, 'Postman');
insert into CategoryQuestion (CategoryID, CategoryName) values (30, 'SQL');
insert into CategoryQuestion (CategoryID, CategoryName) values (31, 'Magma');
insert into CategoryQuestion (CategoryID, CategoryName) values (32, 'Magma');
insert into CategoryQuestion (CategoryID, CategoryName) values (33, 'Java');
insert into CategoryQuestion (CategoryID, CategoryName) values (34, 'Postman');
insert into CategoryQuestion (CategoryID, CategoryName) values (35, 'Java');
insert into CategoryQuestion (CategoryID, CategoryName) values (36, 'SQL');
insert into CategoryQuestion (CategoryID, CategoryName) values (37, 'Pyrit');
insert into CategoryQuestion (CategoryID, CategoryName) values (38, 'SQL');
insert into CategoryQuestion (CategoryID, CategoryName) values (39, '.Net');
insert into CategoryQuestion (CategoryID, CategoryName) values (40, 'Postman');
insert into CategoryQuestion (CategoryID, CategoryName) values (41, 'Java');
insert into CategoryQuestion (CategoryID, CategoryName) values (42, 'Postman');
insert into CategoryQuestion (CategoryID, CategoryName) values (43, 'Ryby');
insert into CategoryQuestion (CategoryID, CategoryName) values (44, 'Java');
insert into CategoryQuestion (CategoryID, CategoryName) values (45, 'SQL');
insert into CategoryQuestion (CategoryID, CategoryName) values (46, 'Ryby');
insert into CategoryQuestion (CategoryID, CategoryName) values (47, 'Pyrit');
insert into CategoryQuestion (CategoryID, CategoryName) values (48, 'Postman');
insert into CategoryQuestion (CategoryID, CategoryName) values (49, 'Postman');
insert into CategoryQuestion (CategoryID, CategoryName) values (50, 'Magma');
insert into CategoryQuestion (CategoryID, CategoryName) values (51, 'Pegmatit');
insert into CategoryQuestion (CategoryID, CategoryName) values (52, 'Magma');
insert into CategoryQuestion (CategoryID, CategoryName) values (53, 'Pyrotin');
insert into CategoryQuestion (CategoryID, CategoryName) values (54, 'Granit');
insert into CategoryQuestion (CategoryID, CategoryName) values (55, 'Magma');
insert into CategoryQuestion (CategoryID, CategoryName) values (56, 'Magma');
insert into CategoryQuestion (CategoryID, CategoryName) values (57, 'Magma');
insert into CategoryQuestion (CategoryID, CategoryName) values (58, 'Java');
insert into CategoryQuestion (CategoryID, CategoryName) values (59, 'Ryby');
insert into CategoryQuestion (CategoryID, CategoryName) values (60, 'Silicat');
insert into CategoryQuestion (CategoryID, CategoryName) values (61, 'Granit');
insert into CategoryQuestion (CategoryID, CategoryName) values (62, 'Granit');
insert into CategoryQuestion (CategoryID, CategoryName) values (63, 'Magma');
insert into CategoryQuestion (CategoryID, CategoryName) values (64, 'Pegmatit');
insert into CategoryQuestion (CategoryID, CategoryName) values (65, 'Pyrit');
insert into CategoryQuestion (CategoryID, CategoryName) values (66, 'Magma');
insert into CategoryQuestion (CategoryID, CategoryName) values (67, 'Java');
insert into CategoryQuestion (CategoryID, CategoryName) values (68, '.Net');
insert into CategoryQuestion (CategoryID, CategoryName) values (69, 'Pegmatit');
insert into CategoryQuestion (CategoryID, CategoryName) values (70, 'Pyrotin');
insert into CategoryQuestion (CategoryID, CategoryName) values (71, 'Pyrit');
insert into CategoryQuestion (CategoryID, CategoryName) values (72, '.Net');
insert into CategoryQuestion (CategoryID, CategoryName) values (73, 'Ryby');
insert into CategoryQuestion (CategoryID, CategoryName) values (74, 'Ryby');
insert into CategoryQuestion (CategoryID, CategoryName) values (75, 'Postman');
insert into CategoryQuestion (CategoryID, CategoryName) values (76, 'Postman');
insert into CategoryQuestion (CategoryID, CategoryName) values (77, '.Net');
insert into CategoryQuestion (CategoryID, CategoryName) values (78, 'Pyrotin');
insert into CategoryQuestion (CategoryID, CategoryName) values (79, 'Magma');
insert into CategoryQuestion (CategoryID, CategoryName) values (80, 'Ryby');
insert into CategoryQuestion (CategoryID, CategoryName) values (81, 'Pyrit');
insert into CategoryQuestion (CategoryID, CategoryName) values (82, 'Java');
insert into CategoryQuestion (CategoryID, CategoryName) values (83, 'Granit');
insert into CategoryQuestion (CategoryID, CategoryName) values (84, 'Silicat');
insert into CategoryQuestion (CategoryID, CategoryName) values (85, 'Pyrit');
insert into CategoryQuestion (CategoryID, CategoryName) values (86, 'Ryby');
insert into CategoryQuestion (CategoryID, CategoryName) values (87, 'Silicat');
insert into CategoryQuestion (CategoryID, CategoryName) values (88, 'Postman');
insert into CategoryQuestion (CategoryID, CategoryName) values (89, 'Silicat');
insert into CategoryQuestion (CategoryID, CategoryName) values (90, '.Net');
insert into CategoryQuestion (CategoryID, CategoryName) values (91, 'Magma');
insert into CategoryQuestion (CategoryID, CategoryName) values (92, 'Silicat');
insert into CategoryQuestion (CategoryID, CategoryName) values (93, 'Silicat');
insert into CategoryQuestion (CategoryID, CategoryName) values (94, 'Pyrit');
insert into CategoryQuestion (CategoryID, CategoryName) values (95, 'Java');
insert into CategoryQuestion (CategoryID, CategoryName) values (96, 'Granit');
insert into CategoryQuestion (CategoryID, CategoryName) values (97, '.Net');
insert into CategoryQuestion (CategoryID, CategoryName) values (98, 'Pyrit');
insert into CategoryQuestion (CategoryID, CategoryName) values (99, 'Silicat');
insert into CategoryQuestion (CategoryID, CategoryName) values (100, 'Granit');



-- Add data Question --------------------------------------------------------------------------------------------------------------------------------------
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (1, 'Bassariscus astutus', 20, 5, 91, '2020-11-02');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (2, 'Genetta genetta', 43, 99, 41, '2020-01-14');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (3, 'Centrocercus urophasianus', 40, 2, 48, '2018-12-06');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (4, 'Oncorhynchus nerka', 49, 36, 80, '2017-11-16');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (5, 'Felis silvestris lybica', 42, 99, 86, '2015-07-13');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (6, 'Eudromia elegans', 53, 62, 74, '2015-06-18');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (7, 'Acrobates pygmaeus', 98, 30, 66, '2016-01-30');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (8, 'Crotalus triseriatus', 19, 31, 12, '2016-10-21');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (9, 'Mungos mungo', 18, 55, 13, '2018-05-05');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (10, 'Heloderma horridum', 8, 87, 83, '2017-05-01');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (11, 'Ictonyx striatus', 68, 65, 45, '2017-11-21');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (12, 'Trichosurus vulpecula', 75, 77, 96, '2017-01-24');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (13, 'Halcyon smyrnesis', 2, 19, 67, '2019-11-01');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (14, 'Antidorcas marsupialis', 90, 32, 81, '2020-11-02');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (15, 'Phoeniconaias minor', 72, 21, 31, '2016-08-20');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (16, 'Equus hemionus', 49, 62, 3, '2016-06-21');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (17, 'Centrocercus urophasianus', 53, 31, 74, '2017-05-03');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (18, 'Ninox superciliaris', 46, 3, 67, '2019-07-08');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (19, 'Buteo regalis', 32, 47, 48, '2020-03-25');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (20, 'Sciurus niger', 7, 35, 71, '2016-08-22');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (21, 'Ceratotherium simum', 61, 85, 89, '2016-06-06');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (22, 'Carphophis sp.', 87, 4, 61, '2016-06-10');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (23, 'Picoides pubescens', 51, 44, 49, '2020-05-10');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (24, 'unavailable', 99, 93, 22, '2020-03-09');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (25, 'Gerbillus sp.', 79, 98, 17, '2018-12-08');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (26, 'Coluber constrictor', 41, 51, 34, '2019-09-12');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (27, 'Paraxerus cepapi', 40, 26, 96, '2021-03-21');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (28, 'Macaca mulatta', 70, 27, 64, '2019-06-14');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (29, 'Caiman crocodilus', 18, 29, 69, '2017-12-24');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (30, 'Mazama americana', 78, 35, 40, '2020-12-16');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (31, 'Canis aureus', 55, 91, 3, '2015-10-12');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (32, 'Pycnonotus nigricans', 94, 23, 67, '2020-02-01');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (33, 'Felis concolor', 66, 95, 12, '2015-11-15');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (34, 'Dasypus novemcinctus', 30, 99, 39, '2017-05-18');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (35, 'Paroaria gularis', 61, 68, 77, '2016-06-10');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (36, 'Geochelone radiata', 52, 18, 27, '2021-05-11');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (37, 'Threskionis aethiopicus', 99, 5, 5, '2018-05-30');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (38, 'Semnopithecus entellus', 53, 48, 43, '2019-01-21');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (39, 'Nyctanassa violacea', 78, 8, 55, '2016-09-23');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (40, 'Gyps bengalensis', 43, 21, 21, '2021-03-22');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (41, 'Naja haje', 20, 18, 87, '2018-06-12');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (42, 'Ictonyx striatus', 75, 79, 28, '2016-09-05');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (43, 'Passer domesticus', 1, 90, 62, '2019-12-20');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (44, 'unavailable', 95, 87, 83, '2015-10-19');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (45, 'Coluber constrictor', 71, 28, 50, '2016-09-27');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (46, 'Phoca vitulina', 63, 20, 42, '2018-02-03');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (47, 'Tragelaphus strepsiceros', 60, 100, 38, '2016-07-28');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (48, 'Anas punctata', 68, 10, 77, '2020-09-12');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (49, 'Gyps bengalensis', 68, 84, 1, '2018-10-19');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (50, 'Dolichitus patagonum', 58, 35, 28, '2018-07-28');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (51, 'Phoca vitulina', 6, 46, 90, '2019-03-13');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (52, 'Bison bison', 43, 28, 37, '2020-11-20');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (53, 'Pycnonotus nigricans', 83, 32, 98, '2015-12-23');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (54, 'Felis caracal', 18, 1, 33, '2020-06-21');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (55, 'Loris tardigratus', 58, 12, 29, '2016-08-20');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (56, 'unavailable', 35, 84, 29, '2016-02-26');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (57, 'Sciurus niger', 74, 23, 11, '2018-09-20');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (58, 'Spermophilus tridecemlineatus', 49, 59, 10, '2017-09-10');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (59, 'Marmota caligata', 70, 90, 82, '2016-04-21');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (60, 'Scolopax minor', 18, 28, 84, '2019-06-11');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (61, 'Paradoxurus hermaphroditus', 66, 66, 43, '2017-03-25');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (62, 'Suricata suricatta', 96, 67, 98, '2016-04-10');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (63, 'Catharacta skua', 20, 28, 91, '2016-10-13');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (64, 'Catharacta skua', 74, 17, 92, '2015-12-10');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (65, 'Felis caracal', 90, 62, 75, '2020-03-11');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (66, 'Sarcophilus harrisii', 56, 12, 25, '2017-02-16');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (67, 'Recurvirostra avosetta', 49, 84, 56, '2017-02-25');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (68, 'Tockus erythrorhyncus', 49, 24, 45, '2018-05-28');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (69, 'Sarcophilus harrisii', 1, 3, 91, '2019-08-06');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (70, 'Geochelone elephantopus', 15, 64, 43, '2019-11-10');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (71, 'Sula nebouxii', 54, 80, 74, '2016-02-18');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (72, 'Acrantophis madagascariensis', 97, 55, 71, '2019-01-12');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (73, 'Panthera pardus', 10, 22, 91, '2020-04-11');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (74, 'Acrantophis madagascariensis', 14, 43, 1, '2015-10-16');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (75, 'Bos taurus', 89, 74, 92, '2020-02-16');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (76, 'Ratufa indica', 95, 27, 38, '2017-05-04');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (77, 'Ephippiorhynchus mycteria', 79, 42, 86, '2015-07-08');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (78, 'Spermophilus lateralis', 7, 96, 42, '2015-11-21');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (79, 'Canis mesomelas', 5, 51, 43, '2017-06-30');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (80, 'Anas platyrhynchos', 18, 78, 30, '2016-05-05');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (81, 'Lemur fulvus', 79, 47, 46, '2020-11-24');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (82, 'Cordylus giganteus', 5, 87, 52, '2018-08-22');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (83, 'Macropus fuliginosus', 33, 54, 84, '2019-05-08');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (84, 'Sciurus niger', 68, 66, 74, '2019-07-13');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (85, 'Colaptes campestroides', 43, 52, 93, '2017-11-23');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (86, 'Terrapene carolina', 68, 81, 28, '2018-11-19');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (87, 'Ratufa indica', 52, 52, 25, '2020-03-25');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (88, 'Coendou prehensilis', 59, 11, 98, '2017-01-25');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (89, 'Galago crassicaudataus', 70, 18, 78, '2016-10-22');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (90, 'Nasua narica', 43, 95, 3, '2020-09-02');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (91, 'Deroptyus accipitrinus', 91, 69, 3, '2019-05-17');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (92, 'Eudyptula minor', 83, 74, 48, '2019-07-24');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (93, 'Meles meles', 85, 21, 96, '2017-09-04');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (94, 'Sula nebouxii', 34, 64, 74, '2018-12-29');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (95, 'Chlamydosaurus kingii', 38, 12, 83, '2021-05-24');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (96, 'Lama guanicoe', 65, 92, 86, '2016-07-03');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (97, 'Ceratotherium simum', 58, 84, 4, '2020-07-10');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (98, 'Ceratotherium simum', 46, 92, 41, '2019-12-24');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (99, 'Uraeginthus granatina', 31, 37, 28, '2019-07-29');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (100, 'Gyps bengalensis', 70, 51, 35, '2016-11-09');



-- Add data Anwer --------------------------------------------------------------------------
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (1, 'Nycticorax nycticorax', 32, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (2, 'Cervus elaphus', 12, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (3, 'Hystrix cristata', 5, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (4, 'Ploceus intermedius', 14, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (5, 'Estrilda erythronotos', 11, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (6, 'Streptopelia senegalensis', 9, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (7, 'Equus burchelli', 21, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (8, 'Canis lupus baileyi', 71, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (9, 'Hystrix cristata', 77, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (10, 'Vulpes vulpes', 84, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (11, 'Alces alces', 72, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (12, 'Acrobates pygmaeus', 28, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (13, 'Lepus arcticus', 9, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (14, 'Spermophilus tridecemlineatus', 9, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (15, 'Chauna torquata', 94, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (16, 'Panthera leo', 77, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (17, 'Bucephala clangula', 14, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (18, 'Felis concolor', 39, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (19, 'Petaurus norfolcensis', 7, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (20, 'Haematopus ater', 96, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (21, 'Ursus americanus', 23, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (22, 'Vanellus armatus', 15, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (23, 'Acanthaster planci', 76, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (24, 'Larus fuliginosus', 34, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (25, 'Sylvicapra grimma', 67, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (26, 'Cygnus atratus', 7, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (27, 'Propithecus verreauxi', 100, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (28, 'Bubo virginianus', 32, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (29, 'Cordylus giganteus', 97, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (30, 'Acanthaster planci', 47, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (31, 'Hystrix cristata', 73, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (32, 'Corythornis cristata', 73, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (33, 'Zonotrichia capensis', 7, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (34, 'Spermophilus parryii', 45, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (35, 'Equus hemionus', 39, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (36, 'Geochelone elegans', 1, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (37, 'Myrmecophaga tridactyla', 71, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (38, 'Bassariscus astutus', 81, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (39, 'Coluber constrictor', 30, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (40, 'Canis lupus', 78, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (41, 'Corvus albicollis', 20, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (42, 'Phoca vitulina', 65, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (43, 'Bucorvus leadbeateri', 44, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (44, 'Eolophus roseicapillus', 6, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (45, 'unavailable', 67, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (46, 'Alopex lagopus', 8, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (47, 'Morelia spilotes variegata', 83, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (48, 'Ceratotherium simum', 10, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (49, 'Prionace glauca', 53, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (50, 'Acanthaster planci', 49, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (51, 'Bubalus arnee', 70, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (52, 'Lasiorhinus latifrons', 77, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (53, 'Ninox superciliaris', 24, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (54, 'Ninox superciliaris', 1, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (55, 'Felis concolor', 45, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (56, 'Merops bullockoides', 30, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (57, 'Varanus sp.', 64, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (58, 'Erethizon dorsatum', 75, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (59, 'Eudyptula minor', 22, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (60, 'Phalaropus fulicarius', 86, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (61, 'Macaca fuscata', 21, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (62, 'Ara chloroptera', 54, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (63, 'Marmota caligata', 9, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (64, 'Semnopithecus entellus', 29, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (65, 'Scolopax minor', 69, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (66, 'Pelecans onocratalus', 33, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (67, 'Dipodomys deserti', 73, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (68, 'Paraxerus cepapi', 9, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (69, 'Paraxerus cepapi', 80, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (70, 'Cathartes aura', 5, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (71, 'Charadrius tricollaris', 76, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (72, 'Phascogale tapoatafa', 55, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (73, 'Tapirus terrestris', 1, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (74, 'Funambulus pennati', 20, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (75, 'Sterna paradisaea', 64, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (76, 'Sciurus vulgaris', 64, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (77, 'Alopex lagopus', 57, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (78, 'Boa constrictor mexicana', 59, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (79, 'Bettongia penicillata', 75, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (80, 'Lophoaetus occipitalis', 52, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (81, 'Didelphis virginiana', 62, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (82, 'Xerus sp.', 18, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (83, 'Ursus americanus', 80, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (84, 'Ninox superciliaris', 7, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (85, 'Taxidea taxus', 6, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (86, 'unavailable', 62, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (87, 'Pycnonotus barbatus', 25, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (88, 'Cereopsis novaehollandiae', 79, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (89, 'Felis silvestris lybica', 35, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (90, 'Macropus robustus', 21, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (91, 'Ursus arctos', 96, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (92, 'Sula nebouxii', 87, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (93, 'Papio ursinus', 91, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (94, 'Felis silvestris lybica', 56, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (95, 'Canis lupus baileyi', 8, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (96, 'Neophron percnopterus', 92, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (97, 'Terrapene carolina', 97, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (98, 'Cynictis penicillata', 13, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (99, 'Zalophus californicus', 25, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (100, 'Merops bullockoides', 95, 'Dung');





-- Add data Exam ----------------------------------------------------------------------
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (1, 355, 'Holy Cross', 69, 60, 69, '2016-11-16');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (2, 315, 'Roth', 39, 90, 63, '2016-03-02');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (3, 262, 'Prairie Rose', 6, 150, 93, '2015-10-21');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (4, 297, 'Lawn', 18, 180, 4, '2019-03-24');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (5, 395, 'North', 64, 90, 4, '2018-01-20');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (6, 312, 'Commercial', 63, 180, 96, '2017-04-03');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (7, 398, 'Dorton', 75, 60, 16, '2020-09-25');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (8, 323, 'Jackson', 58, 200, 86, '2018-05-07');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (9, 210, 'Packers', 41, 60, 43, '2018-05-26');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (10, 274, 'Cherokee', 50, 90, 9, '2016-02-07');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (11, 202, 'Del Mar', 12, 120, 85, '2016-08-08');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (12, 261, 'Morrow', 32, 90, 6, '2020-03-24');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (13, 316, 'Graceland', 80, 60, 29, '2015-10-14');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (14, 354, 'Florence', 57, 120, 81, '2015-12-28');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (15, 317, 'Johnson', 94, 180, 1, '2018-01-06');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (16, 325, 'Amoth', 32, 90, 36, '2019-07-30');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (17, 341, 'Shasta', 33, 90, 38, '2018-06-24');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (18, 311, 'Lakeland', 100, 150, 27, '2019-12-22');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (19, 375, 'Sugar', 18, 200, 89, '2016-11-10');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (20, 385, 'Crownhardt', 37, 90, 88, '2019-05-24');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (21, 246, 'John Wall', 14, 90, 2, '2021-04-16');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (22, 388, 'Lyons', 10, 200, 74, '2019-06-10');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (23, 235, 'Vermont', 17, 180, 21, '2019-02-16');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (24, 365, 'Esch', 8, 90, 54, '2015-06-03');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (25, 340, 'Artisan', 93, 120, 34, '2019-03-03');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (26, 238, 'Roxbury', 100, 30, 17, '2018-10-30');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (27, 345, 'Lawn', 44, 90, 17, '2019-08-23');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (28, 391, 'Columbus', 90, 200, 21, '2016-03-15');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (29, 238, 'Prairieview', 46, 60, 96, '2021-02-27');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (30, 352, 'Basil', 88, 150, 52, '2017-05-28');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (31, 309, 'Loeprich', 77, 90, 11, '2018-03-21');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (32, 388, 'Meadow Valley', 7, 180, 64, '2016-01-14');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (33, 201, 'Jana', 51, 30, 40, '2020-05-26');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (34, 210, 'American Ash', 61, 90, 44, '2020-11-25');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (35, 357, 'Monument', 76, 200, 63, '2016-08-09');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (36, 255, 'Melvin', 11, 60, 62, '2020-03-03');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (37, 314, 'Schlimgen', 53, 90, 76, '2021-03-17');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (38, 324, 'Talmadge', 51, 60, 27, '2015-10-11');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (39, 365, 'Hudson', 12, 30, 21, '2018-04-19');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (40, 336, 'Huxley', 84, 90, 77, '2018-01-05');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (41, 380, 'Pine View', 20, 120, 70, '2020-12-08');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (42, 318, 'Veith', 92, 150, 28, '2017-01-25');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (43, 258, 'Ilene', 22, 60, 54, '2018-02-22');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (44, 366, 'Southridge', 74, 60, 76, '2020-03-31');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (45, 252, 'Jana', 52, 90, 66, '2020-02-17');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (46, 355, 'Chinook', 36, 300, 83, '2016-01-25');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (47, 204, 'Del Sol', 18, 90, 15, '2016-08-12');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (48, 237, 'Ridgeway', 57, 90, 77, '2015-05-27');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (49, 349, 'Anniversary', 89, 60, 55, '2016-08-08');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (50, 212, 'Vermont', 46, 200, 7, '2021-05-08');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (51, 370, 'Doe Crossing', 93, 150, 70, '2021-04-21');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (52, 385, 'Main', 1, 150, 15, '2018-08-24');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (53, 318, 'Continental', 3, 300, 47, '2020-11-19');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (54, 226, 'Shoshone', 73, 30, 77, '2019-11-15');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (55, 262, 'Lukken', 24, 60, 81, '2019-12-01');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (56, 396, 'Donald', 98, 300, 42, '2016-10-28');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (57, 297, 'Loeprich', 60, 150, 71, '2016-03-08');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (58, 321, 'Grasskamp', 99, 180, 68, '2019-06-14');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (59, 204, 'Eastlawn', 28, 180, 45, '2016-07-21');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (60, 264, 'Vermont', 83, 120, 18, '2021-01-30');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (61, 202, 'Red Cloud', 85, 30, 49, '2018-12-16');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (62, 343, 'Thierer', 36, 180, 4, '2017-05-31');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (63, 392, 'Park Meadow', 76, 150, 42, '2021-01-26');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (64, 287, 'Center', 90, 200, 28, '2015-09-07');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (65, 248, 'Packers', 7, 180, 59, '2018-09-26');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (66, 349, 'Milwaukee', 39, 180, 51, '2015-12-20');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (67, 212, 'Debs', 10, 300, 47, '2017-02-03');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (68, 209, 'Schiller', 25, 30, 77, '2019-11-10');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (69, 319, 'Manley', 15, 60, 2, '2021-03-11');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (70, 330, 'Glendale', 45, 30, 65, '2019-08-14');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (71, 385, 'Del Sol', 76, 120, 95, '2018-04-02');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (72, 286, 'Sullivan', 87, 90, 81, '2017-07-21');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (73, 334, 'Anniversary', 51, 120, 77, '2017-02-16');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (74, 329, 'Cottonwood', 18, 30, 85, '2017-05-08');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (75, 208, 'Randy', 14, 200, 41, '2018-03-14');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (76, 246, 'Warner', 87, 180, 72, '2017-12-13');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (77, 221, 'Badeau', 87, 150, 23, '2021-05-10');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (78, 306, 'Heath', 43, 90, 27, '2018-01-31');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (79, 277, 'Meadow Valley', 57, 150, 13, '2020-05-19');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (80, 252, 'Stang', 9, 150, 2, '2018-02-11');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (81, 278, 'Stone Corner', 73, 30, 71, '2015-11-16');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (82, 238, 'Barnett', 43, 180, 40, '2015-12-31');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (83, 347, 'Summer Ridge', 7, 90, 68, '2018-11-08');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (84, 310, 'Gina', 47, 180, 35, '2017-04-28');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (85, 312, 'Anderson', 58, 90, 65, '2017-07-12');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (86, 268, 'Prentice', 91, 150, 64, '2019-11-03');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (87, 349, 'Thackeray', 72, 120, 27, '2017-10-03');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (88, 258, 'Mendota', 73, 180, 84, '2016-05-26');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (89, 201, 'Farwell', 23, 300, 42, '2019-08-25');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (90, 318, 'Springs', 36, 300, 20, '2018-12-23');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (91, 333, 'Pleasure', 17, 200, 10, '2016-12-05');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (92, 249, 'Helena', 50, 30, 30, '2017-06-20');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (93, 336, 'Mallory', 64, 150, 91, '2015-10-25');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (94, 230, 'Commercial', 61, 300, 14, '2017-01-30');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (95, 205, 'Mendota', 8, 300, 84, '2018-10-23');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (96, 329, 'Colorado', 31, 180, 43, '2020-02-27');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (97, 367, 'Kennedy', 9, 180, 77, '2019-03-29');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (98, 248, 'Southridge', 63, 300, 57, '2017-11-21');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (99, 212, 'Washington', 84, 200, 64, '2017-12-18');
insert into Exam (ExamID, `Code` , Title, CategoryID, Duration, CreatorID, CreateDate) values (100, 358, 'Lakeland', 64, 180, 28, '2015-08-13');





-- Add data ExamQuestion ----------------------------------------------------------------------
insert into ExamQuestion (ID, ExamID, QuestionID) values (1, 76, 84);
insert into ExamQuestion (ID, ExamID, QuestionID) values (2, 100, 91);
insert into ExamQuestion (ID, ExamID, QuestionID) values (3, 3, 97);
insert into ExamQuestion (ID, ExamID, QuestionID) values (4, 94, 88);
insert into ExamQuestion (ID, ExamID, QuestionID) values (5, 65, 41);
insert into ExamQuestion (ID, ExamID, QuestionID) values (6, 13, 25);
insert into ExamQuestion (ID, ExamID, QuestionID) values (7, 94, 43);
insert into ExamQuestion (ID, ExamID, QuestionID) values (8, 10, 91);
insert into ExamQuestion (ID, ExamID, QuestionID) values (9, 6, 52);
insert into ExamQuestion (ID, ExamID, QuestionID) values (10, 45, 76);
insert into ExamQuestion (ID, ExamID, QuestionID) values (11, 43, 68);
insert into ExamQuestion (ID, ExamID, QuestionID) values (12, 82, 59);
insert into ExamQuestion (ID, ExamID, QuestionID) values (13, 5, 48);
insert into ExamQuestion (ID, ExamID, QuestionID) values (14, 2, 13);
insert into ExamQuestion (ID, ExamID, QuestionID) values (15, 82, 36);
insert into ExamQuestion (ID, ExamID, QuestionID) values (16, 34, 36);
insert into ExamQuestion (ID, ExamID, QuestionID) values (17, 88, 21);
insert into ExamQuestion (ID, ExamID, QuestionID) values (18, 52, 17);
insert into ExamQuestion (ID, ExamID, QuestionID) values (19, 18, 86);
insert into ExamQuestion (ID, ExamID, QuestionID) values (20, 50, 27);
insert into ExamQuestion (ID, ExamID, QuestionID) values (21, 9, 68);
insert into ExamQuestion (ID, ExamID, QuestionID) values (22, 49, 10);
insert into ExamQuestion (ID, ExamID, QuestionID) values (23, 72, 100);
insert into ExamQuestion (ID, ExamID, QuestionID) values (24, 79, 94);
insert into ExamQuestion (ID, ExamID, QuestionID) values (25, 38, 89);
insert into ExamQuestion (ID, ExamID, QuestionID) values (26, 72, 27);
insert into ExamQuestion (ID, ExamID, QuestionID) values (27, 79, 100);
insert into ExamQuestion (ID, ExamID, QuestionID) values (28, 16, 68);
insert into ExamQuestion (ID, ExamID, QuestionID) values (29, 97, 83);
insert into ExamQuestion (ID, ExamID, QuestionID) values (30, 2, 1);
insert into ExamQuestion (ID, ExamID, QuestionID) values (31, 15, 18);
insert into ExamQuestion (ID, ExamID, QuestionID) values (32, 65, 23);
insert into ExamQuestion (ID, ExamID, QuestionID) values (33, 97, 71);
insert into ExamQuestion (ID, ExamID, QuestionID) values (34, 83, 17);
insert into ExamQuestion (ID, ExamID, QuestionID) values (35, 42, 18);
insert into ExamQuestion (ID, ExamID, QuestionID) values (36, 44, 48);
insert into ExamQuestion (ID, ExamID, QuestionID) values (37, 32, 11);
insert into ExamQuestion (ID, ExamID, QuestionID) values (38, 30, 98);
insert into ExamQuestion (ID, ExamID, QuestionID) values (39, 79, 57);
insert into ExamQuestion (ID, ExamID, QuestionID) values (40, 85, 71);
insert into ExamQuestion (ID, ExamID, QuestionID) values (41, 7, 63);
insert into ExamQuestion (ID, ExamID, QuestionID) values (42, 83, 20);
insert into ExamQuestion (ID, ExamID, QuestionID) values (43, 94, 66);
insert into ExamQuestion (ID, ExamID, QuestionID) values (44, 54, 74);
insert into ExamQuestion (ID, ExamID, QuestionID) values (45, 10, 11);
insert into ExamQuestion (ID, ExamID, QuestionID) values (46, 96, 12);
insert into ExamQuestion (ID, ExamID, QuestionID) values (47, 87, 15);
insert into ExamQuestion (ID, ExamID, QuestionID) values (48, 26, 47);
insert into ExamQuestion (ID, ExamID, QuestionID) values (49, 32, 82);
insert into ExamQuestion (ID, ExamID, QuestionID) values (50, 69, 60);
insert into ExamQuestion (ID, ExamID, QuestionID) values (51, 70, 96);
insert into ExamQuestion (ID, ExamID, QuestionID) values (52, 100, 11);
insert into ExamQuestion (ID, ExamID, QuestionID) values (53, 72, 21);
insert into ExamQuestion (ID, ExamID, QuestionID) values (54, 50, 64);
insert into ExamQuestion (ID, ExamID, QuestionID) values (55, 71, 35);
insert into ExamQuestion (ID, ExamID, QuestionID) values (56, 10, 46);
insert into ExamQuestion (ID, ExamID, QuestionID) values (57, 62, 85);
insert into ExamQuestion (ID, ExamID, QuestionID) values (58, 29, 64);
insert into ExamQuestion (ID, ExamID, QuestionID) values (59, 11, 65);
insert into ExamQuestion (ID, ExamID, QuestionID) values (60, 14, 15);
insert into ExamQuestion (ID, ExamID, QuestionID) values (61, 9, 95);
insert into ExamQuestion (ID, ExamID, QuestionID) values (62, 5, 98);
insert into ExamQuestion (ID, ExamID, QuestionID) values (63, 94, 18);
insert into ExamQuestion (ID, ExamID, QuestionID) values (64, 76, 63);
insert into ExamQuestion (ID, ExamID, QuestionID) values (65, 97, 8);
insert into ExamQuestion (ID, ExamID, QuestionID) values (66, 62, 41);
insert into ExamQuestion (ID, ExamID, QuestionID) values (67, 92, 20);
insert into ExamQuestion (ID, ExamID, QuestionID) values (68, 49, 52);
insert into ExamQuestion (ID, ExamID, QuestionID) values (69, 16, 19);
insert into ExamQuestion (ID, ExamID, QuestionID) values (70, 33, 51);
insert into ExamQuestion (ID, ExamID, QuestionID) values (71, 49, 1);
insert into ExamQuestion (ID, ExamID, QuestionID) values (72, 64, 16);
insert into ExamQuestion (ID, ExamID, QuestionID) values (73, 82, 50);
insert into ExamQuestion (ID, ExamID, QuestionID) values (74, 76, 20);
insert into ExamQuestion (ID, ExamID, QuestionID) values (75, 69, 29);
insert into ExamQuestion (ID, ExamID, QuestionID) values (76, 13, 45);
insert into ExamQuestion (ID, ExamID, QuestionID) values (77, 6, 28);
insert into ExamQuestion (ID, ExamID, QuestionID) values (78, 99, 14);
insert into ExamQuestion (ID, ExamID, QuestionID) values (79, 45, 60);
insert into ExamQuestion (ID, ExamID, QuestionID) values (80, 99, 32);
insert into ExamQuestion (ID, ExamID, QuestionID) values (81, 19, 42);
insert into ExamQuestion (ID, ExamID, QuestionID) values (82, 51, 8);
insert into ExamQuestion (ID, ExamID, QuestionID) values (83, 94, 39);
insert into ExamQuestion (ID, ExamID, QuestionID) values (84, 45, 36);
insert into ExamQuestion (ID, ExamID, QuestionID) values (85, 34, 74);
insert into ExamQuestion (ID, ExamID, QuestionID) values (86, 22, 69);
insert into ExamQuestion (ID, ExamID, QuestionID) values (87, 9, 45);
insert into ExamQuestion (ID, ExamID, QuestionID) values (88, 20, 40);
insert into ExamQuestion (ID, ExamID, QuestionID) values (89, 43, 4);
insert into ExamQuestion (ID, ExamID, QuestionID) values (90, 85, 23);
insert into ExamQuestion (ID, ExamID, QuestionID) values (91, 23, 17);
insert into ExamQuestion (ID, ExamID, QuestionID) values (92, 3, 88);
insert into ExamQuestion (ID, ExamID, QuestionID) values (93, 26, 41);
insert into ExamQuestion (ID, ExamID, QuestionID) values (94, 31, 63);
insert into ExamQuestion (ID, ExamID, QuestionID) values (95, 45, 66);
insert into ExamQuestion (ID, ExamID, QuestionID) values (96, 59, 71);
insert into ExamQuestion (ID, ExamID, QuestionID) values (97, 81, 17);
insert into ExamQuestion (ID, ExamID, QuestionID) values (98, 64, 35);
insert into ExamQuestion (ID, ExamID, QuestionID) values (99, 69, 35);
insert into ExamQuestion (ID, ExamID, QuestionID) values (100, 66, 18);


-- Het Testing system assignment 2 ----------------------------------------------
