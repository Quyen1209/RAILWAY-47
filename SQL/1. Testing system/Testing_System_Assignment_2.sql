DROP DATABASE IF EXISTS Testing_System_Assignment_2;
CREATE DATABASE if not EXISTS Testing_System_Assignment_2;
USE Testing_System_Assignment_2;
-- Table1: Department
CREATE TABLE if not EXISTS Department (
    DepartmentID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(50) not null
);
-- Table 2: Position
CREATE TABLE if not exists Position (
    PositionID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    PositionName enum('Dev','Test','ScrumMaster','PM')
);
-- Table 3: Account
CREATE TABLE IF NOT EXISTS `Account` (
    AccountID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(50) NOT NULL,
    Username VARCHAR(40) NOT NULL,
    CHECK (LENGTH(Username) >= 6),
    FullName VARCHAR(30) NOT NULL,
    DepartmentID TINYINT UNSIGNED NOT NULL,
    PositionID TINYINT UNSIGNED NOT NULL,
    CreateDate DATE
);
-- Table 4: Group
CREATE TABLE IF NOT EXISTS `Group` (
    GroupID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    GroupName VARCHAR(30) UNIQUE KEY NOT NULL,
    CHECK (LENGTH(Groupname) >= 3),
    CreatorID TINYINT UNSIGNED NOT NULL,
    CreateDate DATE
);
-- Table 5: Group Account
CREATE TABLE IF NOT EXISTS GroupAccount (
    GroupID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    AccountID TINYINT UNSIGNED UNIQUE KEY NOT NULL,
    JoinDate DATE
);
-- Table 6: Type Questione
CREATE TABLE IF NOT EXISTS TypeQuestion (
    TypeID INT UNSIGNED KEY AUTO_INCREMENT,
    TypeName ENUM('Essay', 'Multiple-Choice')
);
-- Table 7: Category Questione
CREATE TABLE IF NOT EXISTS CategoryQuestion (
    CategoryID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(20) NOT NULL
);
-- Table 8: Question
CREATE TABLE IF NOT EXISTS Question (
    QuestionID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content VARCHAR(250),
    CategoryID INT UNSIGNED NOT NULL,
    TypeID TINYINT UNSIGNED NOT NULL,
    CreatorID TINYINT UNSIGNED NOT NULL,
    CreateDate DATE NOT NULL
);
-- Table 9: Answer
CREATE TABLE IF NOT EXISTS Answer (
    AnswerID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content VARCHAR(250) NOT NULL,
    QuestionID INT UNSIGNED,
    isCorrect ENUM('Dung', 'Sai')
);
-- Table 10: Exam
CREATE TABLE IF NOT EXISTS Exam (
    ExamID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Code` TINYINT UNSIGNED NOT NULL,
    Title VARCHAR(50),
    CategoryID TINYINT UNSIGNED NOT NULL,
    Duration TIME,
    CreatorID TINYINT UNSIGNED NOT NULL,
    CreateDate DATE NOT NULL
);
-- Table 11: Exam Questione
CREATE TABLE IF NOT EXISTS ExamQuestion (
    ExamID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    QuestionID INT UNSIGNED NOT NULL
);
-- Add data Department
INSERT into Department (DepartmentID, DepartmentName) 
values 
(1, 'a'),
(2, 'b'),
(3, 'c'),
(4, 'd'),
(5, 'e');
-- Add data Position
INSERT into Position (PositionID, PositionName) 
values 
(1, 'Dev'),
(2, 'Test'),
(3, 'ScrumMaster'),
(4, 'PM'),
(5, 'Dev');
-- Add data Account
INSERT into `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) 
values 
(1, 'a@gmail.com', 'aaaaaa', "a", 1, 1, '2011-2-2'),
(2, 'b@gmail.com', 'bbbbbb', "b", 2, 2, '2011-2-2'),
(3, 'c@gmail.com', 'cccccc', "c", 3, 3, '2011-2-2'),
(4, 'd@gmail.com', 'dddddd', "d", 4, 4, '2011-2-2'),
(5, 'e@gmail.com', 'eeeeee', "e", 5, 5, '2011-2-2');
-- Add data Groupp
INSERT into `Group` (GroupID, GroupName, CreatorID, CreateDate) 
values 
(1, 'aaaa', 1, '2011-2-2'),
(2, 'bbbb', 2, '2011-2-2'),
(3, 'cccc', 3, '2011-2-2'),
(4, 'dddd', 4, '2011-2-2'),
(5, 'eeee', 5, '2011-2-2');
-- Add data GroupAccount
INSERT into GroupAccount (GroupID, AccountID, JoinDate) 
values 
(1, 1, '2011-2-2'),
(2, 2, '2011-2-2'),
(3, 3, '2011-2-2'),
(4, 4, '2011-2-2'),
(5, 5, '2011-2-2');
-- Add data TypeQuestion
INSERT into TypeQuestion (TypeID, TypeName)
values 
(1, 'Essay'),
(2, 'Essay'),
(3, 'Multiple-Choice'),
(4, 'Essay'),
(5, 'Multiple-Choice');
-- Add data CategoryQuestion
INSERT into CategoryQuestion (CategoryID, CategoryName)
values 
(1, 'a'),
(2, 'b'),
(3, 'c'),
(4, 'd'),
(5, 'e');
-- Add data Question
INSERT into Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) 
values 
(1, 'aaaa', 1, 1, 1, '2011-2-2'),
(2, 'bbbb', 2, 2, 2, '2011-2-2'),
(3, 'cccc', 3, 3, 3, '2011-2-2'),
(4, 'dddd', 4, 4, 4, '2011-2-2'),
(5, 'eeee', 5, 5, 5, '2011-2-2');
-- Add data Anwer
INSERT into Answer (AnswerID, Content, QuestionID, isCorrect)
values 
(1, 'aaaa', 1, 'Dung'),
(2, 'bbbb', 2, 'Sai'),
(3, 'cccc', 3, 'Sai'),
(4, 'dddd', 4, 'Dung'),
(5, 'eeee', 5, 'Sai');
-- Add data Exam
INSERT into Exam (ExamID, Code, Title, CategoryID, Duration, CreatorID, CreateDate) 
values 
(1, 1, 'aaaaaa', "1", '2:00:00', 1, '2011-2-2'),
(2, 3, 'bbbbbb', "2", '2:00:00', 2, '2011-2-2'),
(3, 5, 'cccccc', "3", '2:00:00', 3, '2011-2-2'),
(4, 7, 'dddddd', "4", '2:00:00', 4, '2011-2-2'),
(5, 9, 'eeeeee', "5", '2:00:00', 5, '2011-2-2');
-- Add data ExamQuestion
INSERT into ExamQuestion (ExamID, QuestionID)
values 
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1);

-- Bai tap testing bai 2