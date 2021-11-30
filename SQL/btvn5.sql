
USE Testing_System_Assignment_1;
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
DROP VIEW IF EXISTS as_account;
CREATE VIEW as_account AS
SELECT  a.AccountID,q.DepartmentName
FROM    `account` a
JOIN    department q ON q.DepartmentID = a.DepartmentID
WHERE   q.DepartmentName = 'saleeeeee';
SELECT * FROM as_account;


-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
 -- account va group
 DROP VIEW IF EXISTS ac_account;
 CREATE VIEW ac_account AS
 SELECT     AccountID,COUNT(GroupID) AS ad 
 FROM       groupaccount
 GROUP BY   GroupID
 HAVING     COUNT(GroupID) = (  SELECT  MAX(ad)  
                                FROM    (SELECT     AccountID,COUNT(GroupID) AS ad
                                         FROM       groupaccount
                                         GROUP BY   GroupID) AB );
 SELECT * FROM ac_account;

 -- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ
-- được coi là quá dài) và xóa nó đi
  -- cau hoi = question content trong bang answer
  DROP VIEW IF EXISTS as_ansewer;
  CREATE VIEW as_ansewer AS
  SELECT        length(Content)
  FROM          answer
  WHERE         length(Content) > 5; 
  DELETE
  FROM          answer
  WHERE        length(Content) > 5;


-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
 -- phong ban = department nhan vien = account => department va account
SELECT          COUNT(AccountID) AS f
FROM            `account`
GROUP BY        DepartmentID;

SELECT          MAX(f)
FROM            (   SELECT          COUNT(AccountID) AS f
                    FROM            `account`
                    GROUP BY        DepartmentID) AB;
DROP VIEW IF EXISTS aq_account;
CREATE VIEW aq_account AS
SELECT      d.DepartmentID,COUNT(w.AccountID), group_concat(w.Username)
FROM        `account` w
JOIN        department d ON d.DepartmentID = w.DepartmentID
GROUP BY    d.DepartmentID
HAVING      COUNT(w.AccountID) = (SELECT          MAX(f)
                                FROM            (   SELECT          COUNT(AccountID) AS f
                                                    FROM            `account`
                                                    GROUP BY        DepartmentID) AB);
                                                    
SELECT * FROM aq_account;
-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
-- question va account
DROP VIEW IF EXISTS as_account;
CREATE VIEW as_account AS

SELECT      a.QuestionID,w.Username
FROM        `account` w
JOIN        question a ON a.CreatorID = w.AccountID
GROUP BY    a.CreatorID
HAVING      w.Username LIKE 'ng%';
SELECT * FROM as_account;
 
 