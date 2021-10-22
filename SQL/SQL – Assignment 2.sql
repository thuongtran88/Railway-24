CREATE DATABASE IF NOT EXISTS Management;
 
-- Exercise 1:Design a table
CREATE TABLE Training 
(
		TraineeID			INT PRIMARY KEY AUTO_INCREMENT,
        FullName 			VARCHAR(100) NOT NULL,
        Birth_Date			DATETIME NOT NULL,
        GENDER				ENUM('male', 'female', 'unknow'),
        ET_IQ 				INT(20) UNSIGNED NOT NULL,
        ET_Gmath			INT(20) UNSIGNED NOT NULL,
        ET_English			INT(50) UNSIGNED NOT NULL,
        Training_Class		VARCHAR(100) NOT NULL UNIQUE,
        Evaluation_Notes	VARCHAR(250));
        
        -- Exercise 2: Data Types
        
CREATE TABLE Quan_ly
(
		ID					INT PRIMARY KEY AUTO_INCREMENT,
        `Name`				VARCHAR(100),
        `Code`				CHAR(5),
        ModifiedDate		DATETIME );
        
        -- Exercise 3: Data Types (2)
 
 CREATE TABLE Quan_ly_2
(
		ID					INT PRIMARY KEY AUTO_INCREMENT,
        `Name`				VARCHAR(100),
        Gender  			BOOLEAN,
        IsDeletedFlag  		ENUM('0','1')
        );
        

        
        
        