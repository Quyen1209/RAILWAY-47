CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(50)
);
CREATE TABLE Position (
    PositioneID INT PRIMARY KEY AUTO_INCREMENT,
    PositioneName VARCHAR(30)
);
CREATE TABLE `Account` (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(50),
    Username VARCHAR(40),
    Fullname VARCHAR(30),
    DepartmentID INT,
    PositioneID INT,
    CreateDate DATE
);
CREATE TABLE `Group` (
    GroupID INT PRIMARY KEY AUTO_INCREMENT,
    Groupname VARCHAR(30),
    CreatorID INT,
    CreateDate DATE
);
CREATE TABLE GroupAccount (
    GroupID INT PRIMARY KEY AUTO_INCREMENT,
    AccountID INT,
    JoinDate DATE
);
CREATE TABLE TypeQuestion (
    TupeID INT PRIMARY KEY AUTO_INCREMENT,
    TypeName VARCHAR(50)
);
CREATE TABLE CategoryQuestion (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(20)
);
CREATE TABLE Questione (
    QuestioneID INT PRIMARY KEY AUTO_INCREMENT,
    Content VARCHAR(250),
    CategoryID INT,
    TypeID INT,
    CreatorID INT,
    CreateDate DATE
);
CREATE TABLE Answer (
    AnswerID INT PRIMARY KEY AUTO_INCREMENT,
    Content VARCHAR(250),
    QuestioneID INT,
    isCorrect ENUM('Dung', 'Sai')
);
CREATE TABLE Exam (
    ExamID INT PRIMARY KEY AUTO_INCREMENT,
    `Code` INT,
    Title VARCHAR(50),
    CategoryID INT,
    Duration TIME,
    CreatorID INT,
    CreateDate DATE
);
CREATE TABLE ExamQuestion (
    ExamID INT PRIMARY KEY AUTO_INCREMENT,
    QuestionID INT
);