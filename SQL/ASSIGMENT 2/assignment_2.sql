CREATE DATABASE IF NOT EXISTS Management;
 USE Management;
-- Exercise 1:Design a table
CREATE TABLE  IF NOT EXISTS Trainee
(
		TraineeID			INT PRIMARY KEY AUTO_INCREMENT,
        FullName 			VARCHAR(100) NOT NULL,
        Birth_Date			DATE ,
        GENDER				ENUM('male', 'female', 'unknow'),
        ET_IQ 				INT(20) UNSIGNED NOT NULL,
        ET_Gmath			INT(20) UNSIGNED NOT NULL,
        ET_English			INT(50) UNSIGNED NOT NULL,
        Training_Class		VARCHAR(100) NOT NULL UNIQUE,
        Evaluation_Notes	VARCHAR(250),
        VTI_Account 		INT NOT NULL UNIQUE
);
        
        -- Exercise 2: Data Types
        
CREATE TABLE IF NOT EXISTS Quan_ly
(
		ID					INT PRIMARY KEY AUTO_INCREMENT,
        `Name`				VARCHAR(100),
        `Code`				CHAR(5),
        ModifiedDate		DATETIME );
        
        -- Exercise 3: Data Types (2)
 DROP DATABASE assignment_1;
 CREATE TABLE IF NOT EXISTS Quan_ly_2
(
		ID					INT PRIMARY KEY AUTO_INCREMENT,
        `Name`				VARCHAR(100),
        Gender  			ENUM('0','1','Unknow'),
        IsDeletedFlag  		ENUM('0','1')
        );
        -- Question 1: Thêm ít nhất 10 bản ghi vào table
INSERT INTO TRAINEE (FullName			, Birth_Date		, Gender	, ET_IQ, ET_Gmath, ET_English, Training_Class, VTI_Account)
			 VALUE	
					('Tran Thi Thuong'	,'1988-07-12'		,'Female'	, 	10	,	10	, 		25	 , 		 'A101'  ,		2	 ),
                    ('Vo Ba Dien'		,'1999-12-08'		,'Male'		,  	15	, 	17	,		40	 , 		 'A201'	 ,		4	 ),
                    ('Nguyen Hai Au'	,'1991-09-29'		,'Female'	, 	19	,	17	,		47	 ,		 'A103'	 ,		1	 ),
                    ('Nguyen Thanh Danh','2002-03-31'		,'Female'	,	12	, 	15	,		36	 ,		 'A123'  ,		10	 ),
                    ('Thai Thi Binh'	,'1987-04-25'		,'Female'	,	7 	, 	10 	,		49	 ,		  'A101' ,		3	 ),
                    ('Tran Van Tra'		,'1999-12-21'		,'Male'		,	19	,  	7	,		30	 ,		  'A103' ,		5	 ),
                    ('Huynh Hien Long'	,'1994-04-30'		,'Male'		,	14	,	20	,		38	 ,		  'B101' ,		6	 ),
                    ('Tran Thi Huong'	,'1995-06-12'		,'Female'	,	17	,	16	,		30	 ,		  'A102' ,		7	 ),
                    ('Huynh Hoang Vu'	,'1988-08-19'		,'Male'		,	14	,	15	,		35	 ,		  'B104' ,	 	9	 ),
                    ('Tran Thanh Binh' 	,'1997-07-12'		,'Male'		,	16	,	18	,		31	 ,		  'A101' ,		8	 );

-- Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau:
-- tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)

SELECT FullName
FROM TRAINEE
GROUP BY FullName
HAVING MAX(length(Fullname)) LIMIT 1;

    
    