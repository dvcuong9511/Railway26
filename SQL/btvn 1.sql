DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;

USE Testing_System_Assignment_1;

CREATE TABLE Department (
	DepartmentID 			INT,
    DepartmentName 			VARCHAR(10)
);

CREATE TABLE Position (
	PositionID 				INT,
    PositionName 			VARCHAR(50)
);

CREATE TABLE `Account` (
	AccountID 				INT,
    Email 					VARCHAR(50),
    Username 				VARCHAR(10),
    FullName 				VARCHAR(10),
    DepartmentID 			INT,
    PositionID 				INT,
    CreateDate 				DATE
);

CREATE TABLE `Group` (
	GroupID 				INT,
	GroupName 				VARCHAR(10),
    CreatorID 				INT,
    CreateDate 				DATE
    );
    CREATE TABLE GroupAccount (
		GroupID 			INT,
        AccountID 			INT,
        JoinDate 			DATE
    );
    CREATE TABLE TypeQuestion (
		TypeID 				INT
    );
    CREATE TABLE CategoryQuestion (
		CategoryID 			INT,
        CategoryName 		VARCHAR(10)
    );
    CREATE TABLE Question (
		QuestionID 			INT,
        Content 			VARCHAR(50),
        CategoryID 			INT,
        TypeID 				INT,
        CreatorID 			INT,
        CreateDate 			DATE
	);
    CREATE TABLE Answer (
		AnswerID 			INT,
        Content 			VARCHAR(50),
        QuestionID 			INT,
        isCorrect 			VARCHAR(5)
    );
    CREATE TABLE Exam (
        ExamID              INT,
        `Code`              INT,
        Title               VARCHAR(20),
        CategoryID          INT,
        Duration            DATE,
        CreatorID           INT,
        CreateDate          DATE
    );
    CREATE TABLE ExamQuestion (
        ExamID              INT,
        QuestionID          INT
    );