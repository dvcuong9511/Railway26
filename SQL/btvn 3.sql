-- Question1: lấy ra tất cả các answerExamIDphòng ban 
SELECT  *
FROM    department;

-- Question2 lấy ra id của phòng ban 'saleeeeee'
SELECT  DepartmentID
FROM    department
WHERE   DepartmentName = 'saleeeeee';


-- Question3 lấy ra thông tin account có fullname dài nhất
SELECT  * 
FROM    `account`
WHERE   length(FullName) = (SELECT MAX(length(FullName)) FROM `account`)
ORDER BY FullName;

-- Question4 lấy ra thông tin account có fullname dài nhất và có id là 2
SELECT  * 
FROM    `account`
WHERE   length(FullName) = (SELECT MAX(length(FullName)) FROM `account`) AND AccountID = 2
ORDER BY FullName;

-- Question5: Lấy ra tên group đã tham gia trước ngày 2012-04-01
SELECT  GroupName
FROM    `group`
WHERE   CreateDate < '2012-04-01';

-- Question 6: Lấy ra ID của question có >= 4 câu trả lời
SELECT  COUNT(QuestionID)
FROM    answer
GROUP BY QuestionID
HAVING  COUNT(QuestionID) >=2;



-- Question7 Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT  * 
FROM    exam
WHERE Duration >= '09:30:12' AND CreateDate < '2019-12-20';
-- Question8 Lấy ra 5 group được tạo gần đây nhất
SELECT  * 
FROM    `group`
ORDER BY CreateDate DESC
LIMIT 5;
-- Question9 Đếm số nhân viên thuộc department có id = 2
SELECT COUNT(1)
FROM department
WHERE DepartmentID =2;
-- Question10 Lấy ra nhân viên có tên bắt đầu bằng chữ "G" và kết thúc bằng chữ "C"
SELECT * 
FROM department
WHERE DepartmentName LIKE 'G%C';
-- Question11 Xóa tất cả các exam được tạo trước ngày 20/12/2019
SET SQL_SAFE_UPDATES = 0;
 DELETE
 FROM       exam
 WHERE      CreateDate < '2019-12-20';
-- Question12 Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
 DELETE 
 FROM       question
 WHERE      (SUBSTRING_INDEX(Content,'',2)) = "câu hỏi";
-- Question13 Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
 UPDATE     `account`
SET         FullName = 'thu huong',
            Email = 'Nhu1@gmail.com'
 WHERE      AccountID = 5;

-- Question14 update account có id = 5 sẽ thuộc group có id = 4
UPDATE      groupaccount
SET         AccountID   = 5
WHERE       GroupID     = 4;



