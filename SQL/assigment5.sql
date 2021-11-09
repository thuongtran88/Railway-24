-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các
-- account thuộc phòng ban đó
USE sql_lesson_3;
DROP PROCEDURE IF EXISTS sp_dept;
DELIMITER $$
CREATE PROCEDURE sp_dept  (IN in_dep_Name VARCHAR (50))
			BEGIN 
				SELECT 		a.FullName,
							a.AccountID,
                            COUNT(AccountID),
                            a.DepartmentID,
                            b.DepartmentName
				FROM 		`account` a
                JOIN 		Department b ON a.DepartmentID = b.DepartmentID
                WHERE		in_Dep_Name = b.DepartmentName;
			END $$
DELIMITER ;

-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS sp_group;
DELIMITER $$
CREATE PROCEDURE sp_group ( IN in_groupName VARCHAR(50))
			BEGIN	
				SELECT
							COUNT(a.AccountID) AS SL,
                            b.GroupName
				FROM 		groupaccount a
                JOIN 		`group` b ON a.groupID = b.groupID
                WHERE		in_groupName = b.GroupName;
			END $$
DELIMITER ;

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo
-- trong tháng hiện tại
DROP PROCEDURE IF EXISTS sp_type;
DELIMITER $$
CREATE PROCEDURE		sp_type( IN In_typeName ENUM('Essay',' Multiple-Choice'))
			BEGIN	
				SELECT
							a.typeID,
							COUNT(a.typeID) AS SL,
                            a.Createdate,
							a.Content,
							b.TypeName
				FROM		 Question a
				LEFT JOIN 	TypeQuestion b ON a.TypeID = b.TypeID
                WHERE 		In_typeName = b.typeName 
					AND	
						MONTH(a.createdate) = MONTH( NOW()) AND YEAR(a.Createdate) = year(NOW());
                
			END $$
DELIMITER ;

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất

DROP PROCEDURE IF EXISTS	sp_typeID;
DELIMITER $$
 CREATE PROCEDURE			sp_typeID(IN In_Content ENUM('Essay',' Multiple-Choice' ))
			BEGIN
				SELECT		a.Content,
							a.TypeID,
                            COUNT(a.TypeID) AS SL,
                            b.TypeName
				FROM		Question a
                JOIN		typeQuestion b ON a.TypeID = b.TypeID
                 WHERE 		In_Content = b.typeName
                 GROUP BY 	b.TypeName
                 ORDER BY 	b.TypeID DESC LIMIT 1;
			END $$
DELIMITER ;

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
                
                            


                
                        
                        



					