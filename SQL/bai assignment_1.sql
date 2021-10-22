DROP DATABASE assignment;
CREATE DATABASE assignment_1;
use assignment_1;
-- table 2 DEPARTMENT
CREATE TABLE IF NOT EXISTS department
(
		DepartmentID         	INT PRIMARY KEY AUTO_INCREMENT,
		Departmentname     		VARCHAR (255)
);
           
-- table 2 POSITION
CREATE TABLE IF NOT EXISTS Position
(
		PositionID         	INT PRIMARY KEY AUTO_INCREMENT,
		PositionName     	ENUM ('Dev', 'Test', 'Scrum Master', 'PM')
);

-- table 3		Account		
 CREATE TABLE IF NOT EXISTS `Account` (   
		accountid        	INT PRIMARY KEY AUTO_INCREMENT,
		Email            	 VARCHAR(100) NOT NULL UNIQUE KEY,
		Username         	 VARCHAR(100) NOT NULL UNIQUE KEY,
		Fullname          	VARCHAR(255) NOT NULL,
		DepartmentID     	INT,
		PositionID      	 INT,
		Createdate     		DATETIME,
 FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID),
 FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID)
 );
 
 -- table 4  Group
  CREATE TABLE IF NOT EXISTS `Group`
  (   
		GroupID      INT PRIMARY KEY AUTO_INCREMENT,
		GroupName     VARCHAR(100) NOT NULL,
		CreatorID     INT ,
		CreateDate   DATETIME
);
  
  -- table 5 GroupAccount
  CREATE TABLE IF NOT EXISTS GroupAccount
  (
		GroupID 		INT ,
		AccountID 		INT ,
		JoinDate  		DATETIME,
		FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID),
		FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID)
	);
  
   -- table 6 TypeQuestion
     CREATE TABLE IF NOT EXISTS TypeQuestion
(  
     
		TypeID  		INT PRIMARY KEY AUTO_INCREMENT,
		TypeName		ENUM('essay', 'Multiple-Choice')
);
     
     -- table 7 CategoryQuestion
     
      CREATE TABLE IF NOT EXISTS CategoryQuestion
(   
      CategoryID     INT PRIMARY KEY AUTO_INCREMENT,
      CategoryName   VARCHAR(100)
);
      
      -- table 8 Question

	   CREATE TABLE IF NOT EXISTS Question
(   
        QuestionID		 INT PRIMARY KEY AUTO_INCREMENT,
        Content    		VARCHAR(100) ,
        CategoryID 		INT  ,
        TypeID    		INT  , 
        CreatorID  		INT ,
        Createdate 		DATETIME, 
      FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion (CategoryID),
	  FOREIGN KEY(TypeID) REFERENCES TypeQuestion (TypeID)
);
        
        
        -- table 9 Answer


	CREATE TABLE IF NOT EXISTS Answer
    (
			AnswerID   	 INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
			Content      VARCHAR (255),
			QuestionID   INT ,
			isCorrect	 ENUM ('1','0')
);
  
  
    -- table 10 Exam
    
CREATE TABLE IF NOT EXISTS Exam
(
			ExamID       INT PRIMARY KEY AUTO_INCREMENT,
			`Code`       VARCHAR(100) not null,
			Title        VARCHAR(255) ,
			CategoryID    INT ,
			Duration      INT,
			CreatorID     INT NOT NULL ,
			CreateDate    DATETIME,
            
   FOREIGN KEY(CategoryID) REFERENCES Categoryquestion(CategoryID)
);
    
    --  Tạo bảng ExamQuestion
    
CREATE TABLE IF NOT EXISTS ExamQuestion
(
    ExamID				INT UNSIGNED ,
	QuestionID			INT UNSIGNED,
	FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
	FOREIGN KEY(questionID) REFERENCES question(questionID)
);
    
INSERT INTO department(DepartmentName)
			values 			('thu ki'),
							('giam doc'),
                            ('pho giam doc'),
							('bao ve'),
							('nhan su'),
							('ki thuat'),
							('tai chinh'),
                            ('sales');
                            
-- ---Nhập dữ liệu bảng Position
INSERT INTO `Position`(PositionName)
			 VALUES   ('DEV'),
					  ('Test'),
                      ('Scrum Master'),
                      ('PM');

                            
-- ---Nhập dữ liệu bảng Account

INSERT INTO `Account`
					
                    (Email				,		UserName  ,		 FullName		,  DepartmentID ,PositionID , CreateDate )
                    
             values ( 'ttthuong108@gmail.com' , 'thuong'	  , 'Tran Thi Thuong',		1       , 1		, '2019-07-12 00:00:00'),
					('huynhthai@gmail.com' 	  ,  'huynh'		,'Thai Thi Huynh',     3		, 4     ,  '2021-12-12 00:00:00'),
			         ('huynhhienlong@gmail.com', 'longpro'		,'Huynh Hien Long',		2		,2		,  '2020-07-21 00:00:00'),
                    ('hhvu@gmail.com'		  ,	 'vu'		, 'Huynh Hoang Vu'   ,       7		,3      ,  '2019-08-19 00:00:00'),
                    ('ttthuong111@gmail.com'  ,'huong'		, 'Tran Thi Huong'   ,		8		,2		,  '2018-07-21 00:00:00'),
                    ('tvmen198@gmail.com'	  ,'men'		, 'Tran Van Men'	 ,		4       ,4      , '2021-06-30 00:00:00' ),
                    ('tqthang304@gmail.com'	  ,'thang'		, 'Tran Quoc Thang'  ,      5       ,3      , '2020-10-10 00:00:00'	),
                    ('Lvduoc@gamil.com'		  ,'long'		, 'Ly Van Duoc'		 ,      6       ,3       ,'2017-06-07 00:00:00' );
                    
                    -- nhap bang du lieu group
   
   INSERT INTO `Group`(GroupName			, CreatorID, CreateDate				)
				VALUES
					  ('khoanglang'			,1			,'2020-12-24'),
                      ('hanhphuc'           ,3          ,'2017-08-24'),
                      ('railway1'           ,2			,'2018-09-19'),
                      ('railway2'           ,4   		,'2021-07-31'),
                      ('railway3'			,5          ,'2020-09-07'),
                      ('railway4'			,7			,'2019-08-08'),
                      ('railway5'			,6			,'2021-10-19');  
                      
        -- nhap bang du lieu Groupaccount
        
  INSERT INTO  Groupaccount (GroupID, AccountID,JoinDate)
				VALUES      (	1	,  3		,'2017-08-24'),
							(	4	,	2		,'2020-09-07'),
                            (	3   ,   4		,'2020-12-24'),
                            (	7	,	6		,'2019-08-08'),
                            (	5	,	1		,'2021-07-31'),
                            (	2	,	5		,'2021-10-19'),
                            (	6	,	7		,'2018-09-19');
                            
        -- nhap bang du lieu TypeQuestion
        
INSERT INTO TypeQuestion (TypeID, TypeName)
				VALUES   (	1	, 'Essay'),
						 (	2	,  'Multiple-Choice');
                         
         -- nhap bang du lieu TypeQuestion
 
 INSERT INTO CategoryQuestion ( CategoryID, CategoryName)
				VALUES	    	(	1	  ,'cau hoi ve JAVA'),
								(	3 	  ,'Cau hoi ve Net'),
                                (   4	  , 'Cau hoi ve SQL'),
                                (	2	  , 'Cau hoi ve Postman'),
                                (	5	  ,	'Cau hoi ve Ruby');
                                
         -- nhap bang du lieu Question     
		
 INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate)
			  VALUES  ('JAVA1'  , 	1	  , 	1 , 	1	 ,'2017-08-24'),
					  ('NET'	,	3	  ,    2  ,     2    ,'2018-09-19'),
                      ('SQL'	, 	4	  ,    1  ,     3    ,'2021-10-19'),
                      ('POSTMAN' ,   2	  ,    2  ,     5    ,'2021-07-31'),
                      ('RUBY'	,    5	  ,    1  ,     4    ,'2020-12-24'),
                      ('JAVA'	,    1    ,    2  ,     7	 ,'2020-12-24');
                      
                      
 -- nhap bang du lieu Answer
 
  INSERT INTO Answer ( Content 			 , QuestionID, isCorrect)
			  VALUES ('cau tra loi ve JAVA'	,   	7	 , 		'1' ),
					 ('tra loi ve POSTMAN' , 		4	 , 		'0'	),
                     ('tra loi ve RUBY'     ,		5	 , 		'0' ),
                     ('tra loi ve SQL'		,		3	 , 		'1'	),
                     ('tra loi ve NET'		,		2	 ,		'0'	),
                     ('tra loi ve JAVA1'	,    	1	 ,		'1'	);
                     
                     
  -- nhap bang du lieu Exam
  
  INSERT INTO Exam (`Code`  ,Title	, 	CategoryID , Duration,	CreatorID, CreateDate		)
			VALUES ('A1'	,'doc hieu',	1		,	'120' ,  	4	 ,'2021-10-19'),
					('A2'	, 'tu vung', 	2		,	'60'	,	2	 ,'2020-12-24'),
                    ('A3'	,'nghe hieu',	3		,	'90'	,	1	 ,'2021-07-31'),
                    ('B1'	,'JAVA1'	,	4		,	'90'	,	7	 ,'2021-10-19'),
                    ('B2'	,'JAVA2'	,	5		,	'150'	,	6	 ,'2017-08-24'),
                    ('B3'	,'NET'		,	4		,	'60'	,	5	 ,'2018-09-19'),
                    ('C'	,'RUBY'		,	3		, 	'90'	,	3	 ,'2021-10-19');
                    
                    

                            
                            
                      
                      
                      
   
   
   
             



