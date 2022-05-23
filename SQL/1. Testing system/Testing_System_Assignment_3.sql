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

-- Question 1. Thêm ít nhất 10 record vào mỗi table ---------------------------------------------------------------------

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
insert into Department (DepartmentID, DepartmentName) values (62, 'Sales');
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
insert into Department (DepartmentID, DepartmentName) values (88, 'Sales');
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
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (1, 'kgreendale0@fotki.com', 'kgreendale0', 'Karlotte Greendale', 1, 1, '2022-03-14');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (2, 'anickoll1@springer.com', 'anickoll1', 'Anthea Nickoll', 2, 2, '2022-04-04');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (3, 'cspedding2@mail.ru', 'cspedding2', 'Caty Spedding', 3, 3, '2021-11-28');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (4, 'cduffit3@usnews.com', 'cduffit3', 'Conny Duffit', 4, 4, '2021-10-21');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (5, 'dgridon4@wordpress.com', 'dgridon4', 'Derry Gridon', 5, 5, '2021-09-17');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (6, 'jbampton5@dailymail.co.uk', 'jbampton5', 'Jamil Bampton', 6, 6, '2021-12-20');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (7, 'etevlin6@mtv.com', 'etevlin6', 'Ericha Tevlin', 7, 7, '2021-09-23');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (8, 'fcraighead7@reverbnation.com', 'fcraighead7', 'Florri Craighead', 8, 8, '2021-06-16');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (9, 'mbovis8@yale.edu', 'mbovis8', 'Melany Bovis', 9, 9, '2021-06-28');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (10, 'jchetwind9@disqus.com', 'jchetwind9', 'Jami Chetwind', 10, 10, '2021-06-25');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (11, 'jpopplewella@cbsnews.com', 'jpopplewella', 'Judie Popplewell', 11, 11, '2021-12-08');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (12, 'nmcnyscheb@about.com', 'nmcnyscheb', 'Niki McNysche', 12, 12, '2021-06-15');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (13, 'etareec@so-net.ne.jp', 'etareec', 'Eran Taree', 13, 13, '2021-08-05');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (14, 'elangleyd@furl.net', 'elangleyd', 'Eve Langley', 14, 14, '2022-02-20');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (15, 'jmarchmente@arstechnica.com', 'jmarchmente', 'Jacintha Marchment', 15, 15, '2022-03-10');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (16, 'mmelleyf@narod.ru', 'mmelleyf', 'Mannie Melley', 16, 16, '2021-06-27');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (17, 'jfarrahg@sbwire.com', 'jfarrahg', 'Jasmine Farrah', 17, 17, '2021-11-04');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (18, 'jricciardielloh@youtube.com', 'jricciardielloh', 'Jeri Ricciardiello', 18, 18, '2021-12-15');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (19, 'rstadingi@hostgator.com', 'rstadingi', 'Reba Stading', 19, 19, '2021-10-13');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (20, 'bmerrifieldj@edublogs.org', 'bmerrifieldj', 'Bethany Merrifield', 20, 20, '2021-07-23');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (21, 'pkesterk@miibeian.gov.cn', 'pkesterk', 'Pat Kester', 21, 21, '2022-03-14');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (22, 'tdargiel@themeforest.net', 'tdargiel', 'Tobe Dargie', 22, 22, '2022-02-28');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (23, 'jvartym@chronoengine.com', 'jvartym', 'Jesse Varty', 23, 23, '2022-04-14');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (24, 'schapen@fastcompany.com', 'schapen', 'Sharia Chape', 24, 24, '2022-01-17');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (25, 'vstaplefordo@gmpg.org', 'vstaplefordo', 'Valentijn Stapleford', 25, 25, '2022-05-15');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (26, 'ggannp@photobucket.com', 'ggannp', 'Germayne Gann', 26, 26, '2021-10-05');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (27, 'mlillowq@mlb.com', 'mlillowq', 'Mirabelle Lillow', 27, 27, '2022-02-22');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (28, 'mkenyonr@ning.com', 'mkenyonr', 'Mannie Kenyon', 28, 28, '2022-05-15');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (29, 'xcardenass@home.pl', 'xcardenass', 'Xenia Cardenas', 29, 29, '2022-04-24');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (30, 'cboogt@nymag.com', 'cboogt', 'Christiano Boog', 30, 30, '2022-01-25');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (31, 'fdumperu@merriam-webster.com', 'fdumperu', 'Florry Dumper', 31, 31, '2021-09-13');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (32, 'ahenzev@google.com.hk', 'ahenzev', 'Amandi Henze', 32, 32, '2022-03-02');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (33, 'cspiaggiaw@buzzfeed.com', 'cspiaggiaw', 'Chic Spiaggia', 33, 33, '2021-09-11');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (34, 'aregelousx@webs.com', 'aregelousx', 'Anselma Regelous', 34, 34, '2022-02-22');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (35, 'jsargisony@spiegel.de', 'jsargisony', 'Jayne Sargison', 35, 35, '2021-09-08');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (36, 'emceloryz@businessweek.com', 'emceloryz', 'Erroll McElory', 36, 36, '2022-04-18');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (37, 'hluckwell10@com.com', 'hluckwell10', 'Hugh Luckwell', 37, 37, '2021-08-02');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (38, 'rsherer11@google.de', 'rsherer11', 'Rubia Sherer', 38, 38, '2022-01-11');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (39, 'fdominy12@umich.edu', 'fdominy12', 'Frazer Dominy', 39, 39, '2021-06-10');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (40, 'equare13@sun.com', 'equare13', 'Ebba Quare', 40, 40, '2021-09-12');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (41, 'ebraunle14@kickstarter.com', 'ebraunle14', 'Elspeth Braunle', 41, 41, '2021-08-26');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (42, 'ciceton15@nydailynews.com', 'ciceton15', 'Catherine Iceton', 42, 42, '2021-08-27');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (43, 'lglencros16@sourceforge.net', 'lglencros16', 'Lucius Glencros', 43, 43, '2021-09-21');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (44, 'vorring17@ezinearticles.com', 'vorring17', 'Vida Orring', 44, 44, '2022-03-20');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (45, 'bhuskisson18@arizona.edu', 'bhuskisson18', 'Burg Huskisson', 45, 45, '2021-07-15');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (46, 'apasque19@symantec.com', 'apasque19', 'Anne Pasque', 46, 46, '2021-06-20');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (47, 'mseiffert1a@businessweek.com', 'mseiffert1a', 'Milissent Seiffert', 47, 47, '2022-01-05');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (48, 'mredfearn1b@furl.net', 'mredfearn1b', 'Madelin Redfearn', 48, 48, '2021-11-17');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (49, 'tmeynell1c@craigslist.org', 'tmeynell1c', 'Trescha Meynell', 49, 49, '2021-09-07');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (50, 'dgrunson1d@apple.com', 'dgrunson1d', 'Delinda Grunson', 50, 50, '2021-06-17');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (51, 'jtolfrey1e@wufoo.com', 'jtolfrey1e', 'Jania Tolfrey', 51, 51, '2022-02-27');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (52, 'ldrinan1f@yandex.ru', 'ldrinan1f', 'Lissie Drinan', 52, 52, '2022-04-03');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (53, 'tbarenskie1g@mapy.cz', 'tbarenskie1g', 'Tuesday Barenskie', 53, 53, '2021-11-07');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (54, 'nfrangione1h@psu.edu', 'nfrangione1h', 'Nollie Frangione', 54, 54, '2021-07-20');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (55, 'zearles1i@tmall.com', 'zearles1i', 'Zaria Earles', 55, 55, '2021-11-16');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (56, 'jskrzynski1j@blogs.com', 'jskrzynski1j', 'Jordon Skrzynski', 56, 56, '2021-05-27');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (57, 'ciremonger1k@mozilla.org', 'ciremonger1k', 'Carita Iremonger', 57, 57, '2021-08-22');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (58, 'sguly1l@gov.uk', 'sguly1l', 'Spenser Guly', 58, 58, '2022-02-26');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (59, 'ccollacombe1m@sun.com', 'ccollacombe1m', 'Cordell Collacombe', 59, 59, '2021-10-04');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (60, 'kvan1n@icio.us', 'kvan1n', 'Karney Van der Velden', 60, 60, '2021-10-17');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (61, 'cgrigolli1o@squidoo.com', 'cgrigolli1o', 'Cinderella Grigolli', 61, 61, '2021-09-10');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (62, 'gbibby1p@google.com.hk', 'gbibby1p', 'Gwendolyn Bibby', 62, 62, '2022-04-10');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (63, 'ssey1q@pagesperso-orange.fr', 'ssey1q', 'Sapphire Sey', 63, 63, '2022-04-20');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (64, 'dfreckelton1r@clickbank.net', 'dfreckelton1r', 'Dione Freckelton', 64, 64, '2021-08-15');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (65, 'emathelon1s@cisco.com', 'emathelon1s', 'Eula Mathelon', 65, 65, '2021-10-15');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (66, 'ohansom1t@virginia.edu', 'ohansom1t', 'Olimpia Hansom', 66, 66, '2021-07-09');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (67, 'jheap1u@i2i.jp', 'jheap1u', 'Jacquetta Heap', 67, 67, '2022-01-12');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (68, 'cverrico1v@4shared.com', 'cverrico1v', 'Cherey Verrico', 68, 68, '2021-12-02');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (69, 'avan1w@ameblo.jp', 'avan1w', 'Arty Van de Castele', 69, 69, '2022-03-30');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (70, 'csutliff1x@alibaba.com', 'csutliff1x', 'Constancia Sutliff', 70, 70, '2022-01-26');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (71, 'kharpin1y@google.com.au', 'kharpin1y', 'Kippar Harpin', 71, 71, '2021-09-27');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (72, 'fdimeloe1z@seattletimes.com', 'fdimeloe1z', 'Far Dimeloe', 72, 72, '2021-06-15');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (73, 'mmaccaghan20@wufoo.com', 'mmaccaghan20', 'Milena MacCaghan', 73, 73, '2021-09-05');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (74, 'wmarkushkin21@ustream.tv', 'wmarkushkin21', 'Wallas Markushkin', 74, 74, '2021-08-31');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (75, 'sclemerson22@java.com', 'sclemerson22', 'Shaine Clemerson', 75, 75, '2021-05-26');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (76, 'tzelley23@purevolume.com', 'tzelley23', 'Talya Zelley', 76, 76, '2021-06-13');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (77, 'gprator24@a8.net', 'gprator24', 'Grayce Prator', 77, 77, '2021-10-06');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (78, 'nbosson25@1688.com', 'nbosson25', 'Nikaniki Bosson', 78, 78, '2022-01-06');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (79, 'dmartinon26@ted.com', 'dmartinon26', 'Dorothy Martinon', 79, 79, '2022-03-10');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (80, 'rbartoli27@gnu.org', 'rbartoli27', 'Randell Bartoli', 80, 80, '2022-05-16');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (81, 'devetts28@nature.com', 'devetts28', 'Dilan Evetts', 81, 81, '2021-09-14');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (82, 'amenham29@apple.com', 'amenham29', 'Alain Menham', 82, 82, '2021-09-30');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (83, 'ojoblin2a@dell.com', 'ojoblin2a', 'Obadiah Joblin', 83, 83, '2022-03-17');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (84, 'lpatrone2b@cpanel.net', 'lpatrone2b', 'Lira Patrone', 84, 84, '2021-09-05');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (85, 'bsnelgar2c@hhs.gov', 'bsnelgar2c', 'Bonnibelle Snelgar', 85, 85, '2021-05-22');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (86, 'rrheaume2d@t-online.de', 'rrheaume2d', 'Robers Rheaume', 86, 86, '2022-05-11');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (87, 'lwoolvin2e@state.gov', 'lwoolvin2e', 'Langston Woolvin', 87, 87, '2022-05-08');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (88, 'hsandeland2f@so-net.ne.jp', 'hsandeland2f', 'Hans Sandeland', 88, 88, '2022-01-22');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (89, 'spail2g@elpais.com', 'spail2g', 'Shelby Pail', 89, 89, '2022-03-25');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (90, 'emeran2h@cdbaby.com', 'emeran2h', 'Emma Meran', 90, 90, '2021-12-28');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (91, 'bchatteris2i@slate.com', 'bchatteris2i', 'Blondelle Chatteris', 91, 91, '2021-07-29');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (92, 'mgammel2j@slideshare.net', 'mgammel2j', 'Mart Gammel', 92, 92, '2021-08-28');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (93, 'stenby2k@nsw.gov.au', 'stenby2k', 'Stanislaw Tenby', 93, 93, '2021-08-03');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (94, 'gblaik2l@rambler.ru', 'gblaik2l', 'Germayne Blaik', 94, 94, '2021-08-13');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (95, 'kphilliphs2m@xrea.com', 'kphilliphs2m', 'Kathryne Philliphs', 95, 95, '2021-08-12');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (96, 'flearmonth2n@omniture.com', 'flearmonth2n', 'Fey Learmonth', 96, 96, '2021-12-15');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (97, 'fsambath2o@shutterfly.com', 'fsambath2o', 'Flora Sambath', 97, 97, '2021-08-23');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (98, 'bsarjeant2p@yolasite.com', 'bsarjeant2p', 'Berget Sarjeant', 98, 98, '2021-06-04');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (99, 'lfolonin2q@mashable.com', 'lfolonin2q', 'Lloyd Folonin', 99, 99, '2022-03-26');
insert into `Account` (AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate) values (100, 'adillway2r@slashdot.org', 'adillway2r', 'Amerigo Dillway', 100, 100, '2021-06-15');



-- Add data Groupp ------------------------------------------------------------------------------------------------------
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (1, 'bantonacci0@opera.com', 1, '2021-05-25');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (2, 'rdaddow1@buzzfeed.com', 2, '2022-04-22');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (3, 'gaguirre2@omniture.com', 3, '2022-01-13');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (4, 'sfansy3@github.io', 4, '2021-08-16');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (5, 'nglynn4@mashable.com', 5, '2021-11-01');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (6, 'sgoodreid5@naver.com', 6, '2021-11-12');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (7, 'zgniewosz6@tripod.com', 7, '2021-09-15');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (8, 'fshapcote7@example.com', 8, '2022-04-28');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (9, 'lwindebank8@dot.gov', 9, '2021-11-03');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (10, 'aheffernon9@hostgator.com', 10, '2021-07-14');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (11, 'fsangwina@woothemes.com', 11, '2021-11-10');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (12, 'ebengleb@surveymonkey.com', 12, '2015-05-01');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (13, 'whartburnc@icio.us', 13, '2021-06-22');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (14, 'dwitteringd@goo.gl', 14, '2022-04-20');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (15, 'bchecoe@google.es', 15, '2022-02-11');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (16, 'rfontelf@ezinearticles.com', 16, '2021-10-01');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (17, 'cmingardog@themeforest.net', 17, '2022-01-09');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (18, 'cwyperh@booking.com', 18, '2015-05-21');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (19, 'mmegarryi@amazon.co.jp', 19, '2021-10-03');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (20, 'swahlbergj@goodreads.com', 20, '2022-02-10');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (21, 'mdaviesk@yellowpages.com', 21, '2021-08-26');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (22, 'scullinl@geocities.com', 22, '2022-01-04');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (23, 'corodanem@washington.edu', 23, '2022-01-03');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (24, 'vgillicen@cbsnews.com', 24, '2021-09-24');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (25, 'sspiaggiao@paginegialle.it', 25, '2022-03-15');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (26, 'rdainep@cisco.com', 26, '2021-10-11');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (27, 'nmaccollq@bloglines.com', 27, '2021-09-23');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (28, 'dsandisonr@blog.com', 28, '2022-04-05');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (29, 'hsouttars@omniture.com', 29, '2021-11-22');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (30, 'bbretlandt@usa.gov', 30, '2022-03-28');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (31, 'cgodsilu@phpbb.com', 31, '2022-02-15');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (32, 'alandisv@prnewswire.com', 32, '2022-03-12');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (33, 'chudspethw@livejournal.com', 33, '2022-02-25');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (34, 'pcapesx@vkontakte.ru', 34, '2021-07-11');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (35, 'ssilmany@reference.com', 35, '2014-11-29');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (36, 'mkaesz@pagesperso-orange.fr', 36, '2021-10-14');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (37, 'mpessold10@last.fm', 37, '2012-11-23');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (38, 'catwater11@last.fm', 38, '2022-02-24');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (39, 'edobbie12@t-online.de', 39, '2021-05-26');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (40, 'wkidgell13@feedburner.com', 40, '2021-12-21');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (41, 'eleclaire14@tmall.com', 41, '2022-01-02');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (42, 'ebierton15@shareasale.com', 42, '2022-02-23');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (43, 'hhowden16@virginia.edu', 43, '2022-03-07');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (44, 'zcoaker17@jigsy.com', 44, '2021-11-01');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (45, 'hsalleir18@artisteer.com', 45, '2021-11-10');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (46, 'ksange19@godaddy.com', 46, '2022-04-26');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (47, 'tdinwoodie1a@creativecommons.org', 47, '2021-05-29');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (48, 'mverheyden1b@statcounter.com', 48, '2021-07-03');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (49, 'blenz1c@cnbc.com', 49, '2021-06-15');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (50, 'asidnall1d@edublogs.org', 50, '2021-05-19');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (51, 'btitmarsh1e@msu.edu', 51, '2021-05-30');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (52, 'afarrar1f@cam.ac.uk', 52, '2021-10-30');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (53, 'nmcanulty1g@hatena.ne.jp', 53, '2022-03-06');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (54, 'arivalland1h@bloglovin.com', 54, '2021-06-23');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (55, 'lwoolfall1i@smugmug.com', 55, '2022-02-03');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (56, 'rjohnes1j@berkeley.edu', 56, '2021-09-05');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (57, 'dphil1k@ft.com', 57, '2022-01-15');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (58, 'pocorrigane1l@gravatar.com', 58, '2021-06-18');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (59, 'lkitt1m@imdb.com', 59, '2021-07-27');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (60, 'traven1n@businessinsider.com', 60, '2021-10-09');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (61, 'hchieco1o@taobao.com', 61, '2021-08-30');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (62, 'sbaynard1p@irs.gov', 62, '2021-05-25');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (63, 'mtschiersch1q@scribd.com', 63, '2021-06-28');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (64, 'dyurkevich1r@ning.com', 64, '2021-08-18');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (65, 'hjeyness1s@google.com.au', 65, '2021-07-18');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (66, 'gbiasotti1t@gravatar.com', 66, '2021-08-20');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (67, 'ddurram1u@artisteer.com', 67, '2021-06-19');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (68, 'bartois1v@edublogs.org', 68, '2022-03-22');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (69, 'gsekulla1w@yellowpages.com', 69, '2021-12-19');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (70, 'vkindred1x@fda.gov', 70, '2022-03-12');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (71, 'gkiss1y@miitbeian.gov.cn', 71, '2022-05-04');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (72, 'bperview1z@usa.gov', 72, '2022-02-10');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (73, 'maxten20@yahoo.co.jp', 73, '2022-04-09');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (74, 'tborless21@amazonaws.com', 74, '2022-01-30');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (75, 'bmusson22@weebly.com', 75, '2022-05-09');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (76, 'tteather23@networkadvertising.org', 76, '2022-03-28');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (77, 'protherham24@bloglovin.com', 77, '2022-02-13');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (78, 'tbontein25@stumbleupon.com', 78, '2022-01-13');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (79, 'zgregr26@themeforest.net', 79, '2021-05-19');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (80, 'tgeffe27@hatena.ne.jp', 80, '2022-05-17');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (81, 'jdelahaye28@ezinearticles.com', 81, '2022-01-02');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (82, 'athorn29@newyorker.com', 82, '2022-01-04');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (83, 'jkibbee2a@mac.com', 83, '2021-08-24');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (84, 'staig2b@amazon.co.jp', 84, '2021-10-10');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (85, 'sbeneze2c@sogou.com', 85, '2021-07-10');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (86, 'apaladini2d@java.com', 86, '2022-01-20');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (87, 'fkemish2e@webmd.com', 87, '2021-09-04');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (88, 'hstollman2f@about.me', 88, '2021-11-28');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (89, 'mandrioni2g@miitbeian.gov.cn', 89, '2021-10-23');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (90, 'jdilawey2h@dell.com', 90, '2021-11-07');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (91, 'sdanilchenko2i@tinyurl.com', 91, '2022-01-05');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (92, 'krohfsen2j@pagesperso-orange.fr', 92, '2021-12-18');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (93, 'kingrem2k@yandex.ru', 93, '2021-05-28');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (94, 'mcowope2l@usda.gov', 94, '2022-02-07');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (95, 'shiom2m@goo.ne.jp', 95, '2022-01-27');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (96, 'mjefferd2n@multiply.com', 96, '2021-06-26');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (97, 'msulter2o@prlog.org', 97, '2021-11-19');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (98, 'epenticost2p@edublogs.org', 98, '2022-01-09');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (99, 'vlaurencot2q@mozilla.org', 99, '2021-10-08');
insert into `Group` (GroupID, GroupName, CreatorID, CreateDate) values (100, 'rbellino2r@blogger.com', 100, '2021-12-12');



-- Add data GroupAccount ---------------------------------------------------------------
insert into GroupAccount (GroupID, AccountID, JoinDate) values (1, 1, '2022-02-06');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (2, 2, '2021-06-30');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (3, 3, '2021-07-28');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (4, 4, '2022-01-19');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (5, 5, '2021-12-02');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (6, 6, '2021-09-01');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (7, 7, '2021-07-18');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (8, 8, '2022-02-17');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (9, 9, '2022-04-06');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (10, 10, '2022-01-31');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (11, 11, '2022-04-02');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (12, 12, '2021-07-08');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (13, 13, '2022-01-07');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (14, 14, '2021-07-05');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (15, 15, '2021-08-18');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (16, 16, '2021-08-29');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (17, 17, '2021-07-18');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (18, 18, '2022-03-31');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (19, 19, '2022-04-02');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (20, 20, '2021-12-08');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (21, 21, '2022-02-03');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (22, 22, '2021-07-26');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (23, 23, '2021-07-07');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (24, 24, '2022-03-22');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (25, 25, '2021-06-11');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (26, 26, '2022-01-31');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (27, 27, '2022-03-22');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (28, 28, '2021-11-25');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (29, 29, '2022-01-17');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (30, 30, '2021-11-21');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (31, 31, '2021-07-08');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (32, 32, '2022-03-29');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (33, 33, '2021-07-18');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (34, 34, '2021-11-26');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (35, 35, '2021-10-02');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (36, 36, '2021-09-11');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (37, 37, '2021-11-06');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (38, 38, '2021-08-04');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (39, 39, '2021-05-22');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (40, 40, '2022-02-20');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (41, 41, '2022-03-26');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (42, 42, '2021-11-06');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (43, 43, '2022-03-11');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (44, 44, '2021-05-20');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (45, 45, '2022-02-15');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (46, 46, '2022-03-21');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (47, 47, '2022-04-19');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (48, 48, '2021-10-26');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (49, 49, '2021-10-18');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (50, 50, '2021-09-20');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (51, 51, '2022-05-10');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (52, 52, '2022-01-17');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (53, 53, '2022-01-24');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (54, 54, '2022-02-28');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (55, 55, '2022-01-18');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (56, 56, '2021-11-08');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (57, 57, '2021-07-05');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (58, 58, '2021-07-27');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (59, 59, '2021-07-28');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (60, 60, '2021-11-16');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (61, 61, '2021-06-14');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (62, 62, '2022-02-14');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (63, 63, '2021-12-09');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (64, 64, '2021-11-10');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (65, 65, '2021-07-08');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (66, 66, '2021-11-02');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (67, 67, '2021-10-07');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (68, 68, '2022-04-19');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (69, 69, '2021-07-04');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (70, 70, '2021-12-04');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (71, 71, '2021-07-26');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (72, 72, '2021-05-25');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (73, 73, '2021-11-13');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (74, 74, '2021-06-07');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (75, 75, '2021-06-19');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (76, 76, '2021-07-22');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (77, 77, '2021-12-16');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (78, 78, '2022-01-05');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (79, 79, '2021-08-04');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (80, 80, '2021-08-31');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (81, 81, '2021-11-03');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (82, 82, '2021-09-14');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (83, 83, '2022-01-27');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (84, 84, '2021-09-26');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (85, 85, '2022-03-07');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (86, 86, '2021-06-20');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (87, 87, '2022-04-25');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (88, 88, '2021-08-09');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (89, 89, '2022-02-17');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (90, 90, '2021-05-18');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (91, 91, '2022-02-15');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (92, 92, '2021-11-20');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (93, 93, '2021-12-29');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (94, 94, '2021-11-28');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (95, 95, '2021-06-26');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (96, 96, '2021-10-13');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (97, 97, '2022-04-11');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (98, 98, '2022-03-14');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (99, 99, '2021-12-09');
insert into GroupAccount (GroupID, AccountID, JoinDate) values (100, 100, '2022-03-22');




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
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (1, 'Ornamental Railings', 1, 1, 1, '2021-10-01');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (2, 'Drilled Shafts', 2, 2, 2, '2022-01-24');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (3, 'Landscaping & Irrigation', 3, 3, 3, '2021-12-01');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (4, 'Framing (Wood)', 4, 4, 4, '2022-04-17');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (5, 'Framing (Steel)', 5, 5, 5, '2022-02-05');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (6, 'Framing (Steel)', 6, 6, 6, '2022-04-27');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (7, 'Masonry', 7, 7, 7, '2021-06-15');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (8, 'Plumbing & Medical Gas', 8, 8, 8, '2021-06-15');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (9, 'Framing (Steel)', 9, 9, 9, '2021-06-02');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (10, 'Roofing (Metal)', 10, 10, 10, '2022-05-17');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (11, 'Fire Sprinkler System', 11, 11, 11, '2021-07-20');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (12, 'Masonry', 12, 12, 12, '2021-09-16');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (13, 'Fire Protection', 13, 13, 13, '2022-03-17');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (14, 'Termite Control', 14, 14, 14, '2022-03-28');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (15, 'Overhead Doors', 15, 15, 15, '2022-04-03');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (16, 'Prefabricated Aluminum Metal Canopies', 16, 16, 16, '2021-07-27');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (17, 'Sitework & Site Utilities', 17, 17, 17, '2022-01-21');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (18, 'Electrical and Fire Alarm', 18, 18, 18, '2022-01-12');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (19, 'Framing (Steel)', 19, 19, 19, '2021-08-25');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (20, 'Curb & Gutter', 20, 20, 20, '2022-05-10');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (21, 'Electrical and Fire Alarm', 21, 21, 21, '2021-10-05');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (22, 'Site Furnishings', 22, 22, 22, '2022-05-15');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (23, 'Masonry', 23, 23, 23, '2022-05-18');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (24, 'Masonry', 24, 24, 24, '2022-01-19');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (25, 'Epoxy Flooring', 25, 25, 25, '2022-02-02');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (26, 'Drywall & Acoustical (FED)', 26, 26, 26, '2021-10-19');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (27, 'Drywall & Acoustical (FED)', 27, 27, 27, '2022-01-08');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (28, 'RF Shielding', 28, 28, 28, '2021-12-02');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (29, 'Overhead Doors', 29, 29, 29, '2022-02-06');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (30, 'Sitework & Site Utilities', 30, 30, 30, '2022-03-18');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (31, 'Roofing (Asphalt)', 31, 31, 31, '2021-11-26');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (32, 'Prefabricated Aluminum Metal Canopies', 32, 32, 32, '2022-01-26');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (33, 'Prefabricated Aluminum Metal Canopies', 33, 33, 33, '2022-04-05');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (34, 'Electrical and Fire Alarm', 34, 34, 34, '2021-08-09');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (35, 'Masonry & Precast', 35, 35, 35, '2022-05-12');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (36, 'Masonry & Precast', 36, 36, 36, '2022-04-16');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (37, 'Casework', 37, 37, 37, '2021-10-25');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (38, 'Casework', 38, 38, 38, '2021-11-11');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (39, 'Fire Sprinkler System', 39, 39, 39, '2022-01-17');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (40, 'Retaining Wall and Brick Pavers', 40, 40, 40, '2022-01-09');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (41, 'Structural & Misc Steel Erection', 41, 41, 41, '2021-11-05');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (42, 'Glass & Glazing', 42, 42, 42, '2021-10-11');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (43, 'RF Shielding', 43, 43, 43, '2021-11-11');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (44, 'Plumbing & Medical Gas', 44, 44, 44, '2022-02-25');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (45, 'Structural and Misc Steel (Fabrication)', 45, 45, 45, '2021-06-21');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (46, 'Drilled Shafts', 46, 46, 46, '2021-08-03');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (47, 'EIFS', 47, 47, 47, '2021-08-19');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (48, 'Fire Protection', 48, 48, 48, '2021-08-18');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (49, 'Framing (Wood)', 49, 49, 49, '2021-12-31');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (50, 'Electrical and Fire Alarm', 50, 50, 50, '2022-05-09');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (51, 'Construction Clean and Final Clean', 51, 51, 51, '2021-07-21');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (52, 'Fire Sprinkler System', 52, 52, 52, '2022-02-14');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (53, 'Epoxy Flooring', 53, 53, 53, '2022-04-26');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (54, 'Wall Protection', 54, 54, 54, '2022-04-10');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (55, 'Granite Surfaces', 55, 55, 55, '2022-05-02');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (56, 'HVAC', 56, 56, 56, '2021-05-30');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (57, 'Drywall & Acoustical (MOB)', 57, 57, 57, '2022-04-04');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (58, 'Site Furnishings', 58, 58, 58, '2022-03-07');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (59, 'Hard Tile & Stone', 59, 59, 59, '2022-03-11');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (60, 'Structural & Misc Steel Erection', 60, 60, 60, '2021-09-13');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (61, 'Construction Clean and Final Clean', 61, 61, 61, '2021-07-21');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (62, 'Granite Surfaces', 62, 62, 62, '2022-02-09');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (63, 'Framing (Steel)', 63, 63, 63, '2021-07-25');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (64, 'Waterproofing & Caulking', 64, 64, 64, '2022-04-24');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (65, 'HVAC', 65, 65, 65, '2022-05-01');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (66, 'Elevator', 66, 66, 66, '2021-08-26');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (67, 'Casework', 67, 67, 67, '2022-05-10');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (68, 'Retaining Wall and Brick Pavers', 68, 68, 68, '2021-09-21');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (69, 'Fire Protection', 69, 69, 69, '2022-02-11');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (70, 'Epoxy Flooring', 70, 70, 70, '2021-08-20');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (71, 'EIFS', 71, 71, 71, '2021-12-04');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (72, 'Fire Sprinkler System', 72, 72, 72, '2021-09-18');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (73, 'Structural and Misc Steel (Fabrication)', 73, 73, 73, '2021-07-01');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (74, 'Curb & Gutter', 74, 74, 74, '2021-05-20');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (75, 'Hard Tile & Stone', 75, 75, 75, '2022-01-13');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (76, 'Elevator', 76, 76, 76, '2022-04-13');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (77, 'Hard Tile & Stone', 77, 77, 77, '2022-04-03');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (78, 'Fire Protection', 78, 78, 78, '2021-12-01');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (79, 'Fire Sprinkler System', 79, 79, 79, '2021-10-26');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (80, 'Overhead Doors', 80, 80, 80, '2021-09-03');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (81, 'Structural and Misc Steel (Fabrication)', 81, 81, 81, '2022-04-28');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (82, 'Soft Flooring and Base', 82, 82, 82, '2021-08-08');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (83, 'Wall Protection', 83, 83, 83, '2021-06-19');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (84, 'Glass & Glazing', 84, 84, 84, '2021-10-12');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (85, 'Painting & Vinyl Wall Covering', 85, 85, 85, '2022-01-04');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (86, 'Sitework & Site Utilities', 86, 86, 86, '2021-06-17');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (87, 'Structural and Misc Steel (Fabrication)', 87, 87, 87, '2021-07-10');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (88, 'Roofing (Metal)', 88, 88, 88, '2021-09-09');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (89, 'Ornamental Railings', 89, 89, 89, '2022-04-25');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (90, 'Framing (Steel)', 90, 90, 90, '2021-06-15');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (91, 'Structural & Misc Steel Erection', 91, 91, 91, '2021-08-20');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (92, 'Landscaping & Irrigation', 92, 92, 92, '2021-06-21');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (93, 'Construction Clean and Final Clean', 93, 93, 93, '2021-08-27');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (94, 'Asphalt Paving', 94, 94, 94, '2022-02-26');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (95, 'Structural and Misc Steel (Fabrication)', 95, 95, 95, '2021-11-12');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (96, 'Fire Sprinkler System', 96, 96, 96, '2022-03-28');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (97, 'Landscaping & Irrigation', 97, 97, 97, '2022-04-04');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (98, 'Prefabricated Aluminum Metal Canopies', 98, 98, 98, '2022-02-27');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (99, 'Soft Flooring and Base', 99, 99, 99, '2021-08-27');
insert into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) values (100, 'Soft Flooring and Base', 100, 100, 100, '2021-06-14');




-- Add data Anwer --------------------------------------------------------------------------
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (1, 'Elevator', 1, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (2, 'Rebar & Wire Mesh Install', 2, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (3, 'Plumbing & Medical Gas', 3, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (4, 'Fire Protection', 4, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (5, 'HVAC', 5, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (6, 'Granite Surfaces', 6, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (7, 'Casework', 7, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (8, 'Waterproofing & Caulking', 8, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (9, 'EIFS', 9, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (10, 'Drilled Shafts', 10, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (11, 'Elevator', 11, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (12, 'Structural and Misc Steel (Fabrication)', 12, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (13, 'Overhead Doors', 13, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (14, 'Asphalt Paving', 14, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (15, 'Electrical and Fire Alarm', 15, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (16, 'Landscaping & Irrigation', 16, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (17, 'Ornamental Railings', 17, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (18, 'Glass & Glazing', 18, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (19, 'Prefabricated Aluminum Metal Canopies', 19, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (20, 'Glass & Glazing', 20, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (21, 'Construction Clean and Final Clean', 21, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (22, 'Overhead Doors', 22, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (23, 'Landscaping & Irrigation', 23, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (24, 'Rebar & Wire Mesh Install', 24, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (25, 'Rebar & Wire Mesh Install', 25, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (26, 'Casework', 26, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (27, 'Drywall & Acoustical (FED)', 27, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (28, 'Hard Tile & Stone', 28, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (29, 'Electrical and Fire Alarm', 29, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (30, 'Roofing (Metal)', 30, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (31, 'Soft Flooring and Base', 31, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (32, 'Electrical', 32, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (33, 'Marlite Panels (FED)', 33, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (34, 'Termite Control', 34, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (35, 'HVAC', 35, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (36, 'Granite Surfaces', 36, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (37, 'Waterproofing & Caulking', 37, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (38, 'Painting & Vinyl Wall Covering', 38, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (39, 'Wall Protection', 39, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (40, 'Temp Fencing, Decorative Fencing and Gates', 40, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (41, 'Wall Protection', 41, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (42, 'Drywall & Acoustical (MOB)', 42, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (43, 'RF Shielding', 43, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (44, 'Roofing (Asphalt)', 44, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (45, 'Ornamental Railings', 45, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (46, 'Fire Protection', 46, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (47, 'Prefabricated Aluminum Metal Canopies', 47, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (48, 'Elevator', 48, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (49, 'Fire Protection', 49, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (50, 'Temp Fencing, Decorative Fencing and Gates', 50, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (51, 'EIFS', 51, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (52, 'HVAC', 52, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (53, 'Marlite Panels (FED)', 53, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (54, 'Framing (Steel)', 54, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (55, 'EIFS', 55, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (56, 'Fire Protection', 56, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (57, 'Temp Fencing, Decorative Fencing and Gates', 57, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (58, 'Drywall & Acoustical (MOB)', 58, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (59, 'Doors, Frames & Hardware', 59, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (60, 'Temp Fencing, Decorative Fencing and Gates', 60, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (61, 'Ornamental Railings', 61, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (62, 'Site Furnishings', 62, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (63, 'Termite Control', 63, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (64, 'Epoxy Flooring', 64, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (65, 'Fire Protection', 65, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (66, 'Epoxy Flooring', 66, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (67, 'Wall Protection', 67, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (68, 'Drywall & Acoustical (MOB)', 68, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (69, 'Construction Clean and Final Clean', 69, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (70, 'Masonry & Precast', 70, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (71, 'Electrical', 71, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (72, 'Curb & Gutter', 72, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (73, 'Prefabricated Aluminum Metal Canopies', 73, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (74, 'Termite Control', 74, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (75, 'Termite Control', 75, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (76, 'Masonry', 76, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (77, 'Ornamental Railings', 77, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (78, 'Glass & Glazing', 78, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (79, 'Waterproofing & Caulking', 79, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (80, 'Construction Clean and Final Clean', 80, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (81, 'Casework', 81, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (82, 'Termite Control', 82, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (83, 'Granite Surfaces', 83, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (84, 'Rebar & Wire Mesh Install', 84, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (85, 'Granite Surfaces', 85, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (86, 'Prefabricated Aluminum Metal Canopies', 86, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (87, 'Drilled Shafts', 87, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (88, 'Asphalt Paving', 88, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (89, 'Framing (Wood)', 89, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (90, 'Casework', 90, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (91, 'Roofing (Asphalt)', 91, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (92, 'Granite Surfaces', 92, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (93, 'Structural and Misc Steel (Fabrication)', 93, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (94, 'Fire Sprinkler System', 94, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (95, 'Landscaping & Irrigation', 95, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (96, 'Doors, Frames & Hardware', 96, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (97, 'Drilled Shafts', 97, 'Dung');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (98, 'Soft Flooring and Base', 98, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (99, 'Drilled Shafts', 99, 'Sai');
insert into Answer (AnswerID, Content, QuestionID, isCorrect) values (100, 'Drilled Shafts', 100, 'Dung');





-- Add data Exam ----------------------------------------------------------------------
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (1, 297, 'Which Way Is Up?', 1, 30, 1, '2021-10-08');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (2, 215, 'Rembrandt''s J''accuse', 2, 90, 2, '2021-06-15');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (3, 289, 'Uncounted: The New Math of American Elections', 3, 60, 3, '2021-11-21');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (4, 200, 'Balls Out: Gary the Tennis Coach', 4, 120, 4, '2021-10-19');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (5, 214, 'Toothless', 5, 60, 5, '2021-06-16');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (6, 233, 'Taming the Fire (Ukroshcheniye ognya)', 6, 30, 6, '2021-08-07');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (7, 228, 'Nurse 3D', 7, 300, 7, '2021-06-19');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (8, 294, 'Northeast', 8, 120, 8, '2022-05-04');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (9, 244, 'American Ninja', 9, 90, 9, '2021-09-16');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (10, 213, 'Zero de conduite (Zero for Conduct) (Zéro de conduite: Jeunes diables au collège)', 10, 90, 10, '2021-09-28');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (11, 215, 'Kuffs', 11, 180, 11, '2022-04-01');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (12, 208, 'Trails (Veredas)', 12, 120, 12, '2022-03-09');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (13, 207, 'About a Boy', 13, 90, 13, '2022-01-05');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (14, 222, 'The Tattooist', 14, 120, 14, '2021-09-18');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (15, 293, 'Guernica', 15, 180, 15, '2021-10-03');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (16, 207, 'Magic Christian, The', 16, 120, 16, '2021-11-20');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (17, 248, 'Bell for Adano, A (John Hersey''s A Bell for Adano)', 17, 180, 17, '2022-05-18');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (18, 217, 'Pinocchio', 18, 300, 18, '2022-02-07');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (19, 214, 'Trancers', 19, 30, 19, '2021-08-28');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (20, 218, 'Captain America: The First Avenger', 20, 180, 20, '2021-07-05');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (21, 219, 'Wavelength', 21, 120, 21, '2021-12-31');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (22, 209, 'Tango', 22, 60, 22, '2022-04-22');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (23, 211, 'Voices', 23, 60, 23, '2021-07-27');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (24, 261, 'Rush', 24, 300, 24, '2022-01-17');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (25, 219, 'Taking of Pelham One Two Three, The', 25, 60, 25, '2021-09-15');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (26, 214, 'The Floating Castle', 26, 60, 26, '2021-11-28');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (27, 263, 'Dreamworld', 27, 180, 27, '2021-05-28');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (28, 247, 'Cromwell', 28, 60, 28, '2021-08-31');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (29, 258, 'Disco and Atomic War (Disko ja tuumasõda)', 29, 120, 29, '2022-02-03');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (30, 218, 'Fall of the Republic: The Presidency of Barack H. Obama', 30, 180, 30, '2021-06-23');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (31, 292, 'Conflict', 31, 30, 31, '2022-01-09');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (32, 250, 'Thérèse: The Story of Saint Thérèse of Lisieux', 32, 30, 32, '2022-03-24');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (33, 242, 'Kama Sutra: A Tale of Love', 33, 30, 33, '2022-03-05');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (34, 240, 'Lonesome', 34, 30, 34, '2022-04-03');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (35, 219, 'Oh, Heavenly Dog!', 35, 180, 35, '2021-12-25');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (36, 262, 'Up the Academy', 36, 30, 36, '2021-10-25');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (37, 285, 'The Hire: Ticker', 37, 30, 37, '2022-03-26');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (38, 290, 'Ikigami', 38, 180, 38, '2021-12-17');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (39, 282, 'Third Wave, The (Tredje vågen, Den)', 39, 30, 39, '2022-02-28');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (40, 211, 'Good Son, The', 40, 60, 40, '2021-10-26');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (41, 294, 'Louie Bluie', 41, 120, 41, '2022-01-21');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (42, 254, 'Painting Sellers, The (Taulukauppiaat)', 42, 60, 42, '2022-05-09');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (43, 274, 'Kissing Jessica Stein', 43, 30, 43, '2021-07-28');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (44, 229, 'Cold in July', 44, 90, 44, '2021-05-20');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (45, 214, 'Playground', 45, 60, 45, '2022-01-02');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (46, 219, 'Resident Evil: Damnation', 46, 30, 46, '2021-08-24');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (47, 299, 'Dog Year, A', 47, 90, 47, '2022-01-31');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (48, 261, 'Heat and Dust', 48, 300, 48, '2021-08-20');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (49, 240, 'Caller, The', 49, 90, 49, '2021-08-12');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (50, 229, 'Liebelei', 50, 300, 50, '2021-09-07');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (51, 286, 'London - The Modern Babylon ', 51, 120, 51, '2021-12-22');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (52, 262, 'Plato''s Academy', 52, 30, 52, '2021-05-27');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (53, 247, 'Holiday in Handcuffs', 53, 60, 53, '2021-11-19');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (54, 205, 'Answer Man, The (a.k.a. Arlen Faber)', 54, 180, 54, '2021-05-31');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (55, 252, 'Shakespeare''s Globe: Henry V', 55, 180, 55, '2021-11-10');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (56, 283, 'Aria', 56, 300, 56, '2021-10-21');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (57, 201, 'Swamp Thing', 57, 60, 57, '2022-02-23');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (58, 214, 'Miss Sadie Thompson', 58, 300, 58, '2022-01-06');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (59, 247, 'Tulpan', 59, 30, 59, '2021-07-11');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (60, 229, 'Silence, The (Tystnaden)', 60, 120, 60, '2021-10-25');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (61, 263, 'Thirst (Bakjwi)', 61, 300, 61, '2022-05-02');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (62, 215, 'Hatari!', 62, 30, 62, '2021-05-27');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (63, 290, 'All Fall Down', 63, 60, 63, '2021-05-19');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (64, 204, 'Death Race 2000', 64, 120, 64, '2021-08-15');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (65, 232, 'Against the Dark', 65, 180, 65, '2022-02-11');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (66, 213, 'Raid on Rommel', 66, 60, 66, '2022-05-07');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (67, 234, 'Kingsman: The Secret Service', 67, 60, 67, '2022-01-13');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (68, 251, 'Pressed', 68, 60, 68, '2021-08-03');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (69, 229, 'In A Day', 69, 120, 69, '2022-02-21');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (70, 268, 'Dragon Ball: Mystical Adventure (Doragon bôru: Makafushigi dai bôken)', 70, 90, 70, '2021-10-26');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (71, 298, 'Virunga', 71, 30, 71, '2021-07-16');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (72, 298, 'Night Crossing', 72, 30, 72, '2021-09-04');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (73, 275, 'Pups', 73, 30, 73, '2022-04-24');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (74, 217, 'Leave Her to Heaven', 74, 60, 74, '2022-01-10');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (75, 255, 'Gleason', 75, 90, 75, '2021-07-20');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (76, 203, 'Fear X', 76, 120, 76, '2021-12-02');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (77, 230, 'National Lampoon''s Van Wilder', 77, 180, 77, '2021-07-16');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (78, 250, 'Psycho', 78, 300, 78, '2021-07-31');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (79, 300, 'Tango', 79, 90, 79, '2022-01-14');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (80, 234, 'Heaven Is for Real', 80, 300, 80, '2021-05-22');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (81, 235, 'Three Marias, The (Três Marias, As)', 81, 180, 81, '2021-10-15');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (82, 218, 'Mountain Men, The', 82, 180, 82, '2021-07-10');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (83, 208, 'Unholy', 83, 60, 83, '2021-09-10');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (84, 290, 'Thor: Tales of Asgard', 84, 90, 84, '2022-01-07');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (85, 254, 'Han Gong-ju', 85, 300, 85, '2021-11-26');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (86, 259, 'Hot Pepper', 86, 300, 86, '2022-03-04');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (87, 244, 'Asterix and the Vikings (Astérix et les Vikings)', 87, 90, 87, '2021-07-30');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (88, 277, 'Great Bank Hoax, The', 88, 30, 88, '2021-08-06');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (89, 215, 'Booker''s Place: A Mississippi Story', 89, 30, 89, '2021-12-28');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (90, 297, 'The Challenge', 90, 180, 90, '2022-01-12');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (91, 229, 'Let''s Get Lost', 91, 120, 91, '2021-06-27');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (92, 282, 'Frost/Nixon', 92, 90, 92, '2022-01-16');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (93, 257, 'Final Cut, The', 93, 30, 93, '2022-05-05');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (94, 290, 'Living Skeleton, The (Kyûketsu dokuro-sen)', 94, 30, 94, '2021-06-27');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (95, 206, 'Every Other Weekend (Un week-end sur deux)', 95, 60, 95, '2022-03-18');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (96, 221, 'Remember Me (Ricordati di me)', 96, 90, 96, '2022-04-29');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (97, 207, 'Measuring the World (Die Vermessung der Welt)', 97, 180, 97, '2021-06-17');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (98, 202, 'Frozen Ground, The', 98, 30, 98, '2021-11-08');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (99, 278, 'Mother and Son (Mat i syn)', 99, 300, 99, '2021-08-16');
insert into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) values (100, 220, 'Lentsu', 100, 90, 100, '2021-05-27');





-- Add data ExamQuestion ----------------------------------------------------------------------
insert into ExamQuestion (ExamID, QuestionID) values (1, 1);
insert into ExamQuestion (ExamID, QuestionID) values (2, 2);
insert into ExamQuestion (ExamID, QuestionID) values (3, 3);
insert into ExamQuestion (ExamID, QuestionID) values (4, 4);
insert into ExamQuestion (ExamID, QuestionID) values (5, 5);
insert into ExamQuestion (ExamID, QuestionID) values (6, 6);
insert into ExamQuestion (ExamID, QuestionID) values (7, 7);
insert into ExamQuestion (ExamID, QuestionID) values (8, 8);
insert into ExamQuestion (ExamID, QuestionID) values (9, 9);
insert into ExamQuestion (ExamID, QuestionID) values (10, 10);
insert into ExamQuestion (ExamID, QuestionID) values (11, 11);
insert into ExamQuestion (ExamID, QuestionID) values (12, 12);
insert into ExamQuestion (ExamID, QuestionID) values (13, 13);
insert into ExamQuestion (ExamID, QuestionID) values (14, 14);
insert into ExamQuestion (ExamID, QuestionID) values (15, 15);
insert into ExamQuestion (ExamID, QuestionID) values (16, 16);
insert into ExamQuestion (ExamID, QuestionID) values (17, 17);
insert into ExamQuestion (ExamID, QuestionID) values (18, 18);
insert into ExamQuestion (ExamID, QuestionID) values (19, 19);
insert into ExamQuestion (ExamID, QuestionID) values (20, 20);
insert into ExamQuestion (ExamID, QuestionID) values (21, 21);
insert into ExamQuestion (ExamID, QuestionID) values (22, 22);
insert into ExamQuestion (ExamID, QuestionID) values (23, 23);
insert into ExamQuestion (ExamID, QuestionID) values (24, 24);
insert into ExamQuestion (ExamID, QuestionID) values (25, 25);
insert into ExamQuestion (ExamID, QuestionID) values (26, 26);
insert into ExamQuestion (ExamID, QuestionID) values (27, 27);
insert into ExamQuestion (ExamID, QuestionID) values (28, 28);
insert into ExamQuestion (ExamID, QuestionID) values (29, 29);
insert into ExamQuestion (ExamID, QuestionID) values (30, 30);
insert into ExamQuestion (ExamID, QuestionID) values (31, 31);
insert into ExamQuestion (ExamID, QuestionID) values (32, 32);
insert into ExamQuestion (ExamID, QuestionID) values (33, 33);
insert into ExamQuestion (ExamID, QuestionID) values (34, 34);
insert into ExamQuestion (ExamID, QuestionID) values (35, 35);
insert into ExamQuestion (ExamID, QuestionID) values (36, 36);
insert into ExamQuestion (ExamID, QuestionID) values (37, 37);
insert into ExamQuestion (ExamID, QuestionID) values (38, 38);
insert into ExamQuestion (ExamID, QuestionID) values (39, 39);
insert into ExamQuestion (ExamID, QuestionID) values (40, 40);
insert into ExamQuestion (ExamID, QuestionID) values (41, 41);
insert into ExamQuestion (ExamID, QuestionID) values (42, 42);
insert into ExamQuestion (ExamID, QuestionID) values (43, 43);
insert into ExamQuestion (ExamID, QuestionID) values (44, 44);
insert into ExamQuestion (ExamID, QuestionID) values (45, 45);
insert into ExamQuestion (ExamID, QuestionID) values (46, 46);
insert into ExamQuestion (ExamID, QuestionID) values (47, 47);
insert into ExamQuestion (ExamID, QuestionID) values (48, 48);
insert into ExamQuestion (ExamID, QuestionID) values (49, 49);
insert into ExamQuestion (ExamID, QuestionID) values (50, 50);
insert into ExamQuestion (ExamID, QuestionID) values (51, 51);
insert into ExamQuestion (ExamID, QuestionID) values (52, 52);
insert into ExamQuestion (ExamID, QuestionID) values (53, 53);
insert into ExamQuestion (ExamID, QuestionID) values (54, 54);
insert into ExamQuestion (ExamID, QuestionID) values (55, 55);
insert into ExamQuestion (ExamID, QuestionID) values (56, 56);
insert into ExamQuestion (ExamID, QuestionID) values (57, 57);
insert into ExamQuestion (ExamID, QuestionID) values (58, 58);
insert into ExamQuestion (ExamID, QuestionID) values (59, 59);
insert into ExamQuestion (ExamID, QuestionID) values (60, 60);
insert into ExamQuestion (ExamID, QuestionID) values (61, 61);
insert into ExamQuestion (ExamID, QuestionID) values (62, 62);
insert into ExamQuestion (ExamID, QuestionID) values (63, 63);
insert into ExamQuestion (ExamID, QuestionID) values (64, 64);
insert into ExamQuestion (ExamID, QuestionID) values (65, 65);
insert into ExamQuestion (ExamID, QuestionID) values (66, 66);
insert into ExamQuestion (ExamID, QuestionID) values (67, 67);
insert into ExamQuestion (ExamID, QuestionID) values (68, 68);
insert into ExamQuestion (ExamID, QuestionID) values (69, 69);
insert into ExamQuestion (ExamID, QuestionID) values (70, 70);
insert into ExamQuestion (ExamID, QuestionID) values (71, 71);
insert into ExamQuestion (ExamID, QuestionID) values (72, 72);
insert into ExamQuestion (ExamID, QuestionID) values (73, 73);
insert into ExamQuestion (ExamID, QuestionID) values (74, 74);
insert into ExamQuestion (ExamID, QuestionID) values (75, 75);
insert into ExamQuestion (ExamID, QuestionID) values (76, 76);
insert into ExamQuestion (ExamID, QuestionID) values (77, 77);
insert into ExamQuestion (ExamID, QuestionID) values (78, 78);
insert into ExamQuestion (ExamID, QuestionID) values (79, 79);
insert into ExamQuestion (ExamID, QuestionID) values (80, 80);
insert into ExamQuestion (ExamID, QuestionID) values (81, 81);
insert into ExamQuestion (ExamID, QuestionID) values (82, 82);
insert into ExamQuestion (ExamID, QuestionID) values (83, 83);
insert into ExamQuestion (ExamID, QuestionID) values (84, 84);
insert into ExamQuestion (ExamID, QuestionID) values (85, 85);
insert into ExamQuestion (ExamID, QuestionID) values (86, 86);
insert into ExamQuestion (ExamID, QuestionID) values (87, 87);
insert into ExamQuestion (ExamID, QuestionID) values (88, 88);
insert into ExamQuestion (ExamID, QuestionID) values (89, 89);
insert into ExamQuestion (ExamID, QuestionID) values (90, 90);
insert into ExamQuestion (ExamID, QuestionID) values (91, 91);
insert into ExamQuestion (ExamID, QuestionID) values (92, 92);
insert into ExamQuestion (ExamID, QuestionID) values (93, 93);
insert into ExamQuestion (ExamID, QuestionID) values (94, 94);
insert into ExamQuestion (ExamID, QuestionID) values (95, 95);
insert into ExamQuestion (ExamID, QuestionID) values (96, 96);
insert into ExamQuestion (ExamID, QuestionID) values (97, 97);
insert into ExamQuestion (ExamID, QuestionID) values (98, 98);
insert into ExamQuestion (ExamID, QuestionID) values (99, 99);
insert into ExamQuestion (ExamID, QuestionID) values (100, 100);






-- Question 2. Lấy ra tất cả các phòng ban
SELECT 
    *
FROM
    department;
    
    
-- Questione 3. Lấy ra id của phòng ban "Sale"
SELECT 
    departmentID as "Id của phòng ban Sale"
FROM
    department
WHERE
    departmentname = 'sale';
    
    
-- Question 4. Lấy ra thông tin account có full name dài nhất
SELECT	*
FROM 	`Account`
WHERE	length(FullName) = (SELECT	max(length(FullName)) FROM `Account`);


-- Question 5. Lay ra thong tin account co full name dai nhat va thuoc phong ban co id =3 --------
SELECT	*
FROM 	`Account`
WHERE 	length(FullName) = (SELECT Max(length(FullName)) FROM `Account`) AND DepartmentID = 3;


-- 6. Lay ten group da tham gia truoc ngay 20-12-2019
SELECT	GroupName as 'Ten Group'
FROM	`Group`
WHERE	CreateDate < '2019-12-20';
    
    
-- 7. Lấy ra ID của question có >= 4 câu trả lời
SELECT	QuestionID
FROM	Answer
GROUP BY	QuestionID, Content
HAVING	COUNT(Content) >= 4
;

-- 8. Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT	ExamID as 'Mã đề thi'
FROM	Exam
WHERE	Duration >= 60 AND CreateDate < '2019-12-20';
-- 9. Lấy ra 5 group được tạo gần đây nhất
SELECT	*
FROM		`Group`
ORDER BY	CreateDate DESC
LIMIT 5;
-- 10. Đếm số nhân viên thuộc department có id = 2
SELECT	COUNT(Username) as 'Số lượng nhân viên'
FROM	`Account`
WHERE 	DepartmentID = 2;
-- 11. Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT	FullName as ' Tên nhân viên'
FROM	`Account`
WHERE 	FullName LIKE 'D%o';
-- 12. Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE
FROM	Exam
WHERE	CreateDate < '2019-12-20';
-- 13. Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE
FROM	Questione
WHERE 	Content like 'câu hỏi%';
-- 14. Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE	`Account`
SET		FullName = "Nguyễn Bá Lộc",
		Email = 'loc.nguyenba@vti.com.vn'
WHERE	AccountID = 5;
-- 15. Update account có id = 5 sẽ thuộc group có id = 4
UPDATE	GroupAccount
SET		AccountID = 5
WHERE	GroupID = 4;

-- Hết testing system assigntment 3 -------------------------------