USE Testing_System_Assignment_1;
-- account = tai khoan
-- position = chuc vu
-- answer = cau tra loi
-- categoryquestion = cau hoi danh muc
-- department = phong ban
-- exam = thi
-- examquestion = de thi
-- group = nhom
-- groupaccount = tai khoan nhom
--  question = cau hoi
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
-- danh sach nhan vien = account va thong tin phong ban = department
SELECT      *
FROM        `account` aw
JOIN        department D ON D.DepartmentID = aw.DepartmentID
GROUP BY     D.DepartmentID
HAVING      COUNT(D.DepartmentID) ='2';

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
 -- account va exam
 SELECT     *
 FROM       `account` 
 WHERE      CreateDate > 2010-12-20;
 
-- Question 3: Viết lệnh để lấy ra tất cả các developer
-- devaloper = lap trinh vien (co chuc vu)
-- chuc vu = position => position va account
SELECT      *
FROM        `account` C 
JOIN        position V ON V.PositionID = C.PositionID
GROUP BY     V.PositionID
HAVING      COUNT(V.PositionID);

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
 -- phong ban = department nhan vien = account
 SELECT        N.DepartmentID,N.FullName
 FROM          `account` N 
 JOIN           department P ON P.DepartmentID = N.DepartmentID
 GROUP BY       N.DepartmentID
 HAVING         COUNT(N.DepartmentID) < '3';
 
 
--  Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhat
 -- cau hoi = question va de thi = examquestion
SELECT          COUNT(QuestionID) AS C
FROM            examquestion
GROUP BY        QuestionID;

SELECT          MAX(C) AS B
FROM            (SELECT          COUNT(QuestionID) AS C
FROM            examquestion
GROUP BY        QuestionID) AB;

SELECT          s.Content,aw.QuestionID
FROM            examquestion aw
JOIN            Question s ON s.QuestionID = aw.QuestionID
GROUP BY        s.QuestionID
HAVING          (aw.QuestionID) = (SELECT          MAX(C) AS B
                                    FROM            (SELECT          COUNT(QuestionID) AS C
                                                    FROM            examquestion
                                                    GROUP BY        QuestionID) AB);

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
 -- categoryquestion va question
 SELECT         q.CategoryName,COUNT(q.CategoryID) 
 FROM           categoryquestion q 
 JOIN           categoryquestion b ON b.CategoryID = q.CategoryID
 GROUP BY       b.CategoryID;
 
 -- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
  -- Question va  Examquestion
SELECT      q.ExamID,a.QuestionID
FROM        examquestion q  
JOIN        question a ON a.QuestionID = q.QuestionID
GROUP BY    a.QuestionID;

-- 8: Lấy ra Question có nhiều câu trả loi nhat
SELECT      AnswerID,COUNT(QuestionID)
FROM        answer
GROUP BY    QuestionID; 
 
SELECT      MAX(aw)
FROM        (SELECT      AnswerID,COUNT(QuestionID) AS aw
FROM        answer
GROUP BY    QuestionID) AB; 



SELECT      sd.QuestionID,qe.Content
FROM        answer sd
JOIN        Question qe ON sd.QuestionID = qe.QuestionID
GROUP BY    qe.QuestionID 
HAVING      COUNT(sd.QuestionID) = (    SELECT      MAX(aw)
                                        FROM        (   SELECT      AnswerID,COUNT(QuestionID) AS aw
                                                        FROM        answer
                                        GROUP BY    QuestionID) AB);

-- Question 9: Thống kê số lượng account trong mỗi group
 -- account va groupaccount
 SELECT         s.GroupID,COUNT(q.AccountID)
FROM            groupaccount s 
JOIN            `account` q ON q.AccountID = s.AccountID
GROUP BY        q.AccountID;


 -- Question 10: Tìm chức vụ có ít người nhất
  -- chuc vu = position, nguoi = account => position va account
SELECT          PositionName,COUNT(PositionID) AS 'nho'
  FROM          position
  GROUP BY      PositionID;
  
  
  DROP VIEW IF EXISTS position_list;
  
  CREATE VIEW position_list AS
  SELECT          PositionName,COUNT(PositionID) AS 'nho'
                FROM          position
                GROUP BY      PositionID;
                
                SELECT * FROM position_list;
                
  SELECT        MIN(nho)
    FROM position_list;

  
SELECT      q.PositionName,q.PositionID
FROM         `account` a 
JOIN        position q ON q.PositionID = a.PositionID
GROUP BY    q.PositionID
HAVING       COUNT(a.AccountID) = (SELECT        MIN(nho)
                                FROM         (SELECT          COUNT(AccountID) AS nho
                                FROM          `account`
                                GROUP BY      PositionID) AB);

 
 
-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM

SELECT          DepartmentName,COUNT(DepartmentID) 
FROM            department
GROUP BY        DepartmentID;

SELECT          s.DepartmentID,q.PositionName
FROM            `account` a
JOIN            department s ON s.DepartmentID = a.DepartmentID
JOIN            position q ON q.PositionID = a.PositionID
GROUP BY        s.DepartmentID;



-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
-- question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
SELECT              a.QuestionID,a.isCorrect,d.TypeID,d.CreatorID
FROM                question d 
JOIN                answer a ON a.QuestionID = d.QuestionID
GROUP BY             a.QuestionID;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm



-- Question 14:Lấy ra group không có account nào
SELECT          *
FROM            `group` a  
LEFT JOIN       groupaccount q ON q.GroupID = a.GroupID
WHERE           AccountID IS NULL;       

-- Question 15: Lấy ra group không có account nào
SELECT          *
FROM            `group`
WHERE           GroupID NOT IN (SELECT      GroupID 
                                FROM        groupaccount);

-- Question 16: Lấy ra question không có answer nào
SELECT      *
FROM        question
WHERE       QuestionID NOT IN ( SELECT  QuestionID
                                FROM    answer);
                                


