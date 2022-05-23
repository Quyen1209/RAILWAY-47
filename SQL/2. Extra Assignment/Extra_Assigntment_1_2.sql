DROP DATABASE IF EXISTS 		Fresher_Training_Management;
CREATE DATABASE IF NOT EXISTS 	Fresher_Training_Management;
USE Fresher_Training_Management;

-- Question 1: Creat table ---------------------------------------------

DROP TABLE IF EXISTS 		Trainee;
CREATE TABLE IF NOT EXISTS 	Trainee 
(
	TraineeID			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Full_Name			VARCHAR(60) NOT NULL,
    Birth_Day			DATE NOT NULL,
    Gender				ENUM('Male','Female','Unknown'),
    ET_IQ				TINYINT UNSIGNED NOT NULL,
    ET_Gmath			TINYINT UNSIGNED NOT NULL,
    ET_English			TINYINT UNSIGNED NOT NULL,
    Training_Class		INT UNSIGNED NOT NULL,
    Evaluation_Notes	TEXT	
);


-- Question 2: Change the table Trainee to add one moer field named VTI_Account 
-- which is a not-null and unique field

ALTER TABLE Trainee 
ADD			
	VTI_Account	VARCHAR(50) UNIQUE NOT NULL;
    
-- Exercise 2: Data types
DROP TABLE IF EXISTS		Exercise_2;
CREATE TABLE IF NOT EXISTS	Exercise_2
(
	ID				MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
    `Name`			VARCHAR(50),
    `Code`			CHAR(5),
    ModifiedDate	DATETIME
);

-- Exercise 3: Data types (2)
DROP TABLE IF EXISTS		Exercise_3;
CREATE TABLE IF NOT EXISTS	Exercise_3
(
	ID				MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
    `Name`			VARCHAR(50),
    BirthDate		Date,
    Gender			ENUM('0','1') DEFAULT('Unknown'),
    isDeletedFlag	ENUM('0','1')
);


-- Het Extra Assigntment 1_2 -----------------------------------





