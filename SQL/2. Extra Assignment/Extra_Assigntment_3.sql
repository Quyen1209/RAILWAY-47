DROP DATABASE IF EXISTS 		Fresher_Training_Management;
CREATE DATABASE IF NOT EXISTS 	Fresher_Training_Management;
USE Fresher_Training_Management;

-- Question 1: Creat table ---------------------------------------------

DROP TABLE IF EXISTS 		Trainee;
CREATE TABLE IF NOT EXISTS 	Trainee 
(
	TraineeID			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Full_Name			VARCHAR(60) NOT NULL,
    Birth_Date			DATE NOT NULL,
    Gender				ENUM('Male','Female','Unknown'),
    ET_IQ				TINYINT UNSIGNED NOT NULL,
    ET_Gmath			TINYINT UNSIGNED NOT NULL,
    ET_English			TINYINT UNSIGNED NOT NULL,
    Training_Class		INT UNSIGNED NOT NULL,
    Evaluation_Notes	TEXT	
);

-- SQL Assigntment 3 -------------------------------------

-- Question 1. Thêm ít nhất 10 bản ghi vào table 

insert into Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values (1, 'Audie', '1991-09-12', 'Male', 7, 16, 32, 17, 'Tin');
insert into Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values (2, 'Hershel', '1997-12-26', 'Male', 8, 19, 34, 15, 'Domainer');
insert into Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values (3, 'Fran', '1998-04-20', 'Unknown', 12, 19, 9, 3, 'Veribet');
insert into Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values (4, 'Carly', '1998-07-16', 'Unknown', 16, 20, 36, 15, 'Matsoft');
insert into Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values (5, 'Aurelea', '1993-07-11', 'Unknown', 7, 12, 37, 3, 'Lotlux');
insert into Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values (6, 'Wilfred', '1996-02-13', 'Male', 7, 18, 16, 18, 'Transcof');
insert into Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values (7, 'Misty', '1999-01-18', 'Unknown', 13, 6, 47, 5, 'Zontrax');
insert into Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values (8, 'Chad', '1996-12-07', 'Male', 4, 1, 19, 3, 'Domainer');
insert into Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values (9, 'Marnia', '1996-04-02', 'Female', 8, 8, 21, 5, 'Tampflex');
insert into Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values (10, 'Myrtice', '1995-12-01', 'Male', 6, 5, 23, 15, 'Home Ing');
insert into Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values (11, 'Skelly', '1997-08-01', 'Unknown', 10, 3, 46, 6, 'Tin');
insert into Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values (12, 'Theodor', '1995-06-03', 'Female', 9, 18, 45, 11, 'Ronstring');
insert into Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values (13, 'Ulysses', '1998-09-27', 'Male', 14, 9, 31, 9, 'Overhold');
insert into Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values (14, 'Erina', '1991-05-27', 'Female', 9, 14, 26, 16, 'Stronghold');
insert into Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values (15, 'Jaime', '1991-03-09', 'Male', 6, 7, 32, 7, 'Stim');
insert into Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values (16, 'Aguie', '1992-08-05', 'Unknown', 16, 16, 20, 19, 'Keylex');
insert into Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values (17, 'Adriaens', '1997-06-18', 'Female', 11, 17, 18, 9, 'Biodex');
insert into Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values (18, 'Kathryne', '1992-02-09', 'Female', 8, 17, 46, 13, 'Opela');
insert into Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values (19, 'Markos', '1999-04-27', 'Male', 12, 3, 3, 20, 'Sonsing');
insert into Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) values (20, 'Danell', '1995-04-20', 'Female', 14, 13, 45, 6, 'Fix San');

-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, nhóm chúng thành các tháng sinh khác nhau
-- (Chưa làm được question 2)
SELECT	Full_Name, month(Birth_Date)
FROM	Trainee
Group by Full_Name, month(Birth_Date)
ORDER BY month(Birth_Date) ASC;

-- Question 3: Viết lệnh để lấy ra thông tin của thực tập sinh có tên dài nhất.

SELECT	*
FROM	Trainee
WHERE	length(Full_Name) = (SELECT Max(length(Full_Name)) FROM Trainee);

-- Questione 4: Viết lệnh để lấy ra tất cả các thực tập sinh ET

SELECT	*
FROM	Trainee
WHERE	(ET_IQ + ET_Gmath) >= 20 
	AND
		ET_IQ >= 8 
	AND
        ET_Gmath >= 8 
	AND
        ET_English >= 18;

-- Question 5: Xoá thực tập sinh có TraineeID = 3

DELETE
FROM Trainee
WHERE TraineeID = 3;

-- Question 6: Thực tập sinh có TraineeID=5 chuyển sang lớp 2. Hãy cập nhật thông tin vào database
UPDATE Trainee
SET Training_Class = 2
WHERE TraineeID = 5;

