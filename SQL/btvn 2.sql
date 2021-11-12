DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;

USE Testing_System_Assignment_1;

-- CREATE TABLE: Department
CREATE TABLE Department (
	DepartmentID 			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- tự động tăng
    DepartmentName 			VARCHAR(50) NOT NULL UNIQUE KEY
);
 INSERT INTO Department (DepartmentName)
   VALUES 
         ('maketting'),
   ('saleeeeee'),
   ('bao ve'),
   ('nhan su'),
   ('ky thuat'),
   ('tai chinh'),
   ('pho giam doc'),
   ('giam doc'),
   ('thu ki'),
   ('ban hang');
   SELECT * FROM Department;

-- CREATE TABLE: position
CREATE TABLE Position (
	PositionID 				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    PositionName 			ENUM('Dev', 'Test', 'Scrum Master', 'PM')
);

INSERT INTO Position (PositionName)
VALUE   ('Dev'             ),
        ('Test'         ), 
        ('Scrum Master'),
        ('PM'           );
SELECT * FROM Position;

-- CREATE TABLE: account
CREATE TABLE `Account` (
	AccountID 				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Email 					VARCHAR(50) UNIQUE KEY,
    Username 				VARCHAR(20) NOT NULL UNIQUE KEY,
    FullName 				VARCHAR(20),
    DepartmentID 			TINYINT UNSIGNED NOT NULL,
    PositionID 				TINYINT UNSIGNED NOT NULL,
    CreateDate 				DATE,
     FOREIGN KEY (DepartmentID) REFERENCES department (DepartmentID),
     FOREIGN KEY (PositionID) REFERENCES position (PositionID)
    );
    INSERT INTO `Account` (Email,Username,FullName,DepartmentID,PositionID,CreateDate)
    VALUES ('hu1@gmail.com','huong','thu huong','2','3','2012-02-12'),
           ('hu2@gmail.com','hoang','huy hoang','2','4','2012-03-12'),
           ('hu3@gmail.com','hung','huy hung','1','2','2012-01-11'),
           ('hu4@gmail.com','huynh','van huynh','3','4','2012-03-01'),
           ('hu5@gmail.com','hu','van hu','4','2','2013-01-01'),
           ('hoa1@gmail.com','hoa','thuy hoa','5','2','2013-03-01'),
           ('hoa12@gmail.com','hoan','le hoan','6','3','2014-03-01'),
           ('hoa2@gmail.com','linh','thuy linh','5','2','2014-04-01'),
           ('ho12@gmail.com','mai','thuy mai','2','4','2013-05-01'),
           ('ho1@gmail.com','anh','ngoc anh','7','1','2012-03-06');
SELECT * FROM  `Account`;

-- CREATE TABLE: group
CREATE TABLE `Group` (
	GroupID 				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	GroupName 				VARCHAR(20) UNIQUE KEY,
    CreatorID 				TINYINT UNSIGNED NOT NULL,
    CreateDate 				DATE
    );
    INSERT INTO `Group` (GroupName,CreatorID,CreateDate)
    VALUES ('thanh cong','1','2012-02-01'),
           ('le','3','2011-01-01'),
           ('xoai','3','2012-04-01'),
           ('man','2','2013-01-02'),
           ('dua hau','4','2011-06-02'),
           ('thanh long','2','2013-09-01'),
           ('hong','5','2011-08-02'),
           ('quyt','2','2011-07-02'),
           ('chom chom','3','2017-01-01'),
           ('cam','2','2013-04-02');
    
SELECT * FROM `Group`;
           
-- CREATE TABLE: GroupAccount
    CREATE TABLE GroupAccount (
		GroupID 			TINYINT UNSIGNED NOT NULL,
        AccountID 			TINYINT UNSIGNED NOT NULL,
        JoinDate 			DATE,
     FOREIGN KEY (AccountID) REFERENCES `Account` (AccountID)
    );
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate)
VALUES ('2','1','2012-02-03'),
       ('3','1','2011-03-01'),
       ('1','1','2012-01-02'),
       ('4','2','2013-01-01'),
       ('2','3','2014-01-01'),
       ('3','2','2012-02-09'),
       ('5','4','2013-09-05'),
       ('2','1','2019-02-01'),
       ('2','7','2019-05-01'),
       ('6','5','2018-02-01');
SELECT * FROM GroupAccount;
       
    -- CREATE TABLE: TypeQuestion
    CREATE TABLE TypeQuestion (
		TypeID 				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        TypeName            ENUM('Essay','Multiple-Choice')
    );
INSERT INTO TypeQuestion (TypeName)
VALUES  ('Essay'          ),
        ('Multiple-Choice');
SELECT * FROM TypeQuestion;

    
    -- CREATE TABLE: CategoryQuestion
    CREATE TABLE CategoryQuestion (
		CategoryID 			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        CategoryName 		VARCHAR(30) NOT NULL UNIQUE KEY
    );
    INSERT INTO CategoryQuestion (CategoryName)
    VALUES ('than'),
           ('hoan'),
           ('hung'),
           ('lien'),
           ('anh'),
           ('mai'),
           ('nga'),
           ('cuc'),
           ('dong'),
           ('thu');
SELECT * FROM CategoryQuestion;
    
    -- CREATE TABLE: Question
    CREATE TABLE Question (
		QuestionID 			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        Content 			VARCHAR(50) UNIQUE KEY,
        CategoryID 			TINYINT UNSIGNED,
        TypeID 				TINYINT UNSIGNED,
        CreatorID 			TINYINT UNSIGNED UNIQUE KEY,
        CreateDate 			DATE
	);
INSERT INTO Question (Content,CategoryID,TypeID,CreatorID,CreateDate)
VALUES ('asd','1','2','3','2012-02-01'),
       ('aqs','2','1','2','2012-03-01'),
       ('ads','3','1','4','2012-01-04'),
       ('adf','2','3','1','2012-05-09'),
       ('sad','6','4','5','2021-01-02'),
       ('fer','2','3','6','2010-02-01'),
       ('fgd','1','5','7','2013-01-09'),
       ('hgy','3','1','8','2014-09-09'),
       ('jhg','2','7','9','2012-07-09'),
       ('dgf','5','3','10','2019-08-07');
SELECT * FROM Question;
    
    -- CREATE TABLE: Answer
    CREATE TABLE Answer (
		AnswerID 			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        Content 			VARCHAR(50),
        QuestionID 			TINYINT UNSIGNED,
        isCorrect 			VARCHAR(10),
        FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
    );
INSERT INTO Answer (Content,QuestionID,isCorrect)
VALUES ('xcv','2','dung'),
       ('fgh','1','dung'),
       ('jhk','3','sai'),
       ('dfg','2','dung'),
       ('ghj','4','sai'),
       ('mjk','3','sai'),
       ('chj','6','sai'),
       ('trg','4','dung'),
       ('oij','7','dung'),
       ('loj','6','sai');
SELECT * FROM Answer;
    
    -- CREATE TABLE: exam
    CREATE TABLE Exam (
        ExamID              TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        `Code`              TINYINT UNSIGNED NOT NULL UNIQUE KEY,
        Title               VARCHAR (20),
        CategoryID          TINYINT UNSIGNED,
        Duration            TIME,
        CreatorID           TINYINT UNSIGNED UNIQUE KEY,
        CreateDate          DATE
    );
INSERT INTO Exam (`Code` ,Title,CategoryID,Duration,CreatorID,CreateDate)
VALUES ('01','tam','2','09:30:12','1','2011-01-01'),
       ('02','dia','1','07:30:13','2','2010-01-02'),
       ('03','su','3','09:05:12','3','2012-09-08'),
       ('04','hoa','2','08:10:20','4','2011-02-09'),
       ('06','vat li','3','07:20:10','5','2010-11-12'),
       ('09','cong nghe','1','10:00:00','6','2014-04-12'),
       ('05','van','4','08:30:01','7','2010-12-01'),
       ('07','cong dan','3','08:00:00','8','2019-11-05'),
       ('08','anh','5','09:10:02','9','2021-01-01'),
       ('10','suc khoe','6','08:30:01','10','2014-04-02');
SELECT * FROM Exam;
    
    -- CREATE TABLE:ExamQuestion
    CREATE TABLE ExamQuestion (
        ExamID              TINYINT UNSIGNED,
        QuestionID          TINYINT UNSIGNED,
        FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
    );
INSERT INTO ExamQuestion (ExamID,QuestionID)
VALUES ('1','2'),
       ('2','1'),
       ('1','3'),
       ('4','2'),
       ('4','5'),
       ('5','2'),
       ('7','4'),
       ('2','7'),
       ('8','5'),
       ('4','8');
        SELECT * FROM ExamQuestion;
  
   
   
   