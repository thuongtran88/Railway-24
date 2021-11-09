-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
USE sql_lesson_3;

SELECT *
FROM 	`account` a
INNER JOIN 	department b ON a.DepartmentID = b.DepartmentID;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2019
SELECT 
		a.FullName,
        a.AccountID,
        a.Email,
        a.CreateDate,
        b.JoinDate
FROM 	`account` a
INNER JOIN 	Groupaccount b ON a.AccountID = b.AccountID
WHERE	CreateDate > '2019-12-20 00:00:00';

-- Question 3: Viết lệnh để lấy ra tất cả các developer

SELECT 
		a.FullName,
        a.PositionID,
        a.Email,
        b.positionName
FROM 	`account` a
INNER JOIN 	position b ON a.PositionID = b.PositionID
WHERE	PositionName = 'Dev';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên

SELECT 
		a.FullName,
        a.DepartmentID,
        count(a.DepartmentID) as SL,
        a.Email,
        b.DepartmentName
FROM 	`account` a
INNER JOIN 	department b ON a.DepartmentID = b.DepartmentID
GROUP BY a.DepartmentID
HAVING COUNT(a.DepartmentID) > 3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều
-- nhất
INSERT INTO ExamQuestion(ExamID	, QuestionID	) 
VALUES 					(	1	,		2		),
						(	2	,		6		), 
						(	3	,		10		), 
						(	4	,		4		), 
						(	5	,		2		), 
						(	6	,		1		), 
						(	7	,		6		), 
						(	8	,		10		), 
						(	9	,		1		), 
						(	10	,		6		);
SELECT * FROM sql_lesson_3.question;
                        
SELECT 
				a.ExamID,
                COUNT(a.ExamID),
                a.QuestionID,
                b.Content
FROM 			examquestion a
LEFT JOIN 		question b ON a.QuestionID = b.QuestionID
GROUP BY		a.QuestionID
ORDER BY		COUNT(a.ExamID) DESC LIMIT 1;

                

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT
				a.Content,
				COUNT(a.CategoryID) as SLCH,
				a.CategoryID,
				b.categoryName
FROM 			question a
JOIN			categoryquestion b ON a.CategoryID = b.CategoryID
GROUP BY 		a.CategoryID
ORDER BY		a.CategoryID;	


-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT
			a.Content,
            a.QuestionID,
            COUNT(a.QuestionID) AS SL,
            b.ExamID
FROM		question a
INNER JOIN 		examquestion b ON a.QuestionID = b.QuestionID
GROUP BY a.QuestionID;


-- Question 8: Lấy ra Question có nhiều câu trả loi nhat


SELECT

			a.Content,
            a.QuestionID,
            Count(a.QuestionID) as SL,
            b.AnswerID,
            b.content
FROM 		Question a
INNER JOIN 		Answer b ON a.QuestionID = b.QuestionID
GROUP BY 	a.QuestionID
HAVING 		COUNT(a.QuestionID)
ORDER BY    Count(a.QuestionID) DESC LIMIT 1;

-- Question 9: Thống kê số lượng account trong mỗi group

SELECT 
			a.FullName,
            a.AccountID,
            COUNT(a.AccountID) AS SL,
            b.GroupID
FROM `account` a
INNER JOIN groupaccount b ON a.AccountID = b.AccountID
GROUP BY 	b.GroupID
ORDER BY 	b.GroupID;

-- Question 10: Tìm chức vụ có ít người nhất

SELECT 
				a.FullName,
                a.PositionID,
                COUNT(a.positionID) AS SL,
                b.PositionName
FROM 			`account` a
INNER JOIN 		position b ON a.PositionID = b.PositionID
GROUP BY		 b.PositionName
ORDER BY		a.PositionID DESC LIMIT 1;

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT * FROM sql_lesson_3.account;
SELECT 
			a.FullName,
            a.DepartmentID,
            a.PositionID,
            COUNT(b.PositionName)  AS SL,
            b.PositionName
FROM		`account` a
LEFT JOIN 	Position b ON a.PositionID = b.PositionID
GROUP BY 	a.DepartmentID
HAVING 		count(b.PositionName)
ORDER BY 	a.DepartmentID;


-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
-- question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
   SELECT * FROM sql_lesson_3.answer; 
    SELECT * FROM sql_lesson_3.question;
    SELECT
				a.Content,
                a.CategoryID,
                a.TypeID,
                a.CreatorID,
                b.answerID,
                b.isCorrect
FROM 			question a
LEFT JOIN 		answer b ON a.QuestionID = b.QuestionID;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT
				a.Content,
                a.TypeID,
                COUNT(a.TypeID) AS SL,
                b.TypeName
FROM			question a
LEFT JOIN 		typequestion b ON a.TypeID = b.TypeID
GROUP BY		TypeName;

-- Question 14:Lấy ra group không có account nào
SELECT * FROM sql_lesson_3.group;
SELECT * FROM sql_lesson_3.groupaccount;

SELECT 
				a.GroupID,
                a.GroupName,
                b.AccountID
FROM			`group`a
LEFT JOIN 		groupaccount b ON a.GroupID = b.GroupID
WHERE			b.GroupID is Null;

-- Question 16: Lấy ra question không có answer nào

SELECT
				a.questionID,
                a.Content,
                b.answerID
FROM			question a
LEFT JOIN 		 answer b ON a.QuestionID = b.QuestionID
WHERE			b.QuestionID IS NULL;


-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1
-- b) Lấy các account thuộc nhóm thứ 2
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau


SELECT *
FROM 	groupaccount
WHERE	GroupID =1
UNION
SELECT *
FROM 	groupaccount
WHERE	GroupID =2;

-- Question 18:
-- a) Lấy các group có lớn hơn 5 thành viên
-- b) Lấy các group có nhỏ hơn 7 thành viên
-- c) Ghép 2 kết quả từ câu a) và câu b)
SELECT
				a.GroupID,
                a.GroupName,
                b.AccountID,
                COUNT(b.accountID) AS SL
FROM			`group`a
LEFT JOIN		groupaccount b ON a.GroupID = b.GroupID
GROUP BY		b.AccountID
HAVING			COUNT(b.AccountID) > 2
union all
SELECT
				a.GroupID,
                a.GroupName,
                b.AccountID,
                COUNT(b.accountID) AS SL
FROM			`group`a
LEFT JOIN		groupaccount b ON a.GroupID = b.GroupID
GROUP BY		b.AccountID
HAVING			COUNT(b.AccountID) <7;	

	

		


			

                
            



            



            
            


        