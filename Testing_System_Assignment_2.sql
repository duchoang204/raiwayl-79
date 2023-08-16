DROP DATABASE IF EXISTS assignment_01;
CREATE DATABASE assignment_01;
USE assignment_01;
-- Table 1: Department
drop table if exists Derpartment;
CREATE TABLE Department (
    Department_ID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Department_Name VARCHAR(50)UNIQUE NOT NULL
);

-- Table 2: Position
drop table if exists Position;
CREATE TABLE Position (
    Position_ID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Position_Name ENUM('DEV', 'TEST', 'SCUM MASTER', 'PM') UNIQUE NOT NULL  
);

-- Table 3: Account
drop table if exists Account;
CREATE TABLE Account (
    Account_ID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(50) UNIQUE NOT NULL,
    User_name VARCHAR(50) UNIQUE NOT NULL,
    FullName VARCHAR(50) UNIQUE NOT NULL,
    Department_ID TINYINT UNSIGNED,
    Position_ID TINYINT UNSIGNED,
    Create_Date DATE NOT NULL,
    FOREIGN KEY ( Department_ID) REFERENCES Department (Department_ID),
    FOREIGN KEY ( Position_ID) REFERENCES Position (Position_ID)
 
);

-- Table 4: Group
drop table if exists `Group`;
CREATE TABLE `Group` (
    Group_ID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Group_Name VARCHAR(50) UNIQUE NOT NULL,
    Creator_ID TINYINT UNSIGNED,
    Create_Date DATE NOT NULL,
    FOREIGN KEY ( Creator_ID) REFERENCES Account (Account_ID)
);

-- Table 5: GroupAccount
drop table if exists Group_account;
CREATE TABLE Group_account (
    Group_ID TINYINT UNSIGNED,
    Account_ID TINYINT UNSIGNED,
    Joined_Date DATE NOT NULL DEFAULT(CURRENT_DATE),
    Primary key (Group_ID, Account_ID),
    FOREIGN KEY ( Group_ID) REFERENCES `Group`  (Group_ID),
	FOREIGN KEY ( Account_ID) REFERENCES Account (Account_ID)
);

-- Table 6: TypeQuestion
drop table if exists Type_Question;
CREATE TABLE Type_Question (
    Type_ID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Type_Name VARCHAR(50) UNIQUE NOT NULL
);

-- Table 7: CategoryQuestion
drop table if exists Category_Question;
CREATE TABLE Category_Question (
    Category_ID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Category_Name VARCHAR(50) UNIQUE NOT NULL
);
-- Table 8: Question
drop table if exists Question;
CREATE TABLE Question (
    Question_ID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content varchar(50) UNIQUE NOT NULL,
    Category_ID TINYINT UNSIGNED,
    Type_ID TINYINT UNSIGNED,
    Creator_ID TINYINT UNSIGNED,
    Create_Date DATE NOT NULL DEFAULT (CURRENT_DATE),
	FOREIGN KEY ( Category_ID) REFERENCES Category (Category_ID),
	FOREIGN KEY (Type_ID) REFERENCES Type_Question (Type_ID),
	FOREIGN KEY (Type_ID) REFERENCES Account (Account_ID)
);

-- Table 9: Answer
drop table if exists Answer;
CREATE TABLE Answer (
    Answer_ID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content varchar (50) UNIQUE NOT NULL,
    Question_ID TINYINT UNSIGNED,
    is_correct BOOLEAN NOT NULL,
    FOREIGN KEY (Question_ID) REFERENCES Question (Question_ID)
);

-- Table 10: Exam
drop table if exists Exam;
CREATE TABLE Exam (
    Exam_ID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    code CHAR(10) UNIQUE NOT NULL,
    Title VARCHAR(50) NOT NULL ,
    Category_ID TINYINT UNSIGNED,
    Duration TINYINT UNSIGNED NOT NULL CHECK (duration >=15),
    Creator_ID TINYINT UNSIGNED,
    Create_Date DATE NOT NULL DEFAULT (CURRENT_DATE),
    CHECK (Duration >=15),
    FOREIGN KEY ( Category_ID) REFERENCES Category (Category_ID),
    FOREIGN KEY ( Creator_ID) REFERENCES Account (Account_ID)
);

-- Table 11: ExamQuestion
drop table if exists Exam_Question ;
CREATE TABLE Exam_Question (
    Exam_ID TINYINT UNSIGNED,
    Question_ID TINYINT UNSIGNED,
    PRIMARY KEY AUTO_INCREMENT ( Exam_ID ,  Question_ID),
	FOREIGN KEY ( Exam_ID) REFERENCES Exam (Exam_ID),
    FOREIGN KEY ( Question_ID) REFERENCES Question (Question_ID)

);

insert into Derpartment (Derpartment_ID, Derpartment_Name)
Values  (1, ' Marketing'),
		(2, ' Sale '),
        (3, ' Bao Ve'),
        (4, ' Nhan su '),
        (5, 'Ky thuat');
table Derpartment;
insert into Position (Position_ID, Position_Name)
values (1, 'Dev'),
	   (2, 'Test'),
       (3, ' Scum Master'),
       (4, 'PM'),
       (5, 'Dev');
table Position;       
insert into Account ( Account_ID, Email, User_Name, FullName, Derpartment_ID, Position_ID, Create_Date)
values      (1, 'hoangduc123', 'hoangduc', 'hoang viet duc', 1, 1, '2023-08-11'),
			(2, 'duchoang123', 'duchoang', 'duc viet hoang', 2, 2, '2023-08-11'),
			(3, 'vietduc123', 'vietduc', ' viet hoang duc', 3, 3, '2023-08-11'),
			(4, 'hoangviet123', 'hoangviet', 'hoang duc viet ', 4, 4, '2023-08-11'),
			(5, 'ducviet123', 'ducviet', 'duc hoang viet', 5,5, '2023-08-11');
table Account;            
insert into `Group` ( Group_ID, Group_Name, Creator_ID, Create_Date)
values ( 1, 'Vti1 ', 1, '2023-08-12'),
	   ( 2, 'Vti2 ', 2, '2023-08-12'),
       ( 3, 'Vti3 ', 3, '2023-08-12'),
       ( 4, 'Vti4 ', 4, '2023-08-12'),
       ( 5, 'Vti5 ', 5, '2023-08-12');
table `Group`;
insert into  Group_account  (Group_ID, Account_ID, Joined_Date)
values    (1, 1,' 2023-08-12'),
		  (2, 2,' 2023-08-12'),
		  (3, 3,' 2023-08-12'),
          (4, 4,' 2023-08-12'),
		  (5, 5,' 2023-08-12');
table Group_account;
insert into  Type_Question ( Type_ID, Type_Name)
values (1,'Essay'),
	   (2,'Multiple_choise'),
	   (3,'Essay'),
       (4,'Multiple_choise'),
	   (5,'Essay');
table Type_Question;       
insert into Category_Question ( Category_ID, Category_Name)
values (1, 'java'),
	   (2, '.net'),	
       (3, 'sql'),
	   (4, 'postman'),
       (5, 'ruby');
table Category_Question;       
insert into Question (Question_ID, Content, Category_ID, Type_ID, Creator_ID, Create_Date)
values ( 1,'Vti001',1,1,1,'2023-08-14'),
	    ( 2,'Vti002',2,2,2,'2023-08-14'),
        ( 3,'Vti003',3,3,3,'2023-08-14'),
        ( 4,'Vti004',4,4,4,'2023-08-14'),
        ( 5,'Vti005',5,5,5,'2023-08-14');
table Question;
insert into Answer ( Answer_ID, Content, Question_ID)
values (1, 'A', 1),
	   (2, 'B', 2),
       (3, 'C', 3),
       (4, 'D', 4),
       (5, 'E', 5);
table Answer;
insert into Exam ( Exam_ID, code, Tiltle, Category_ID, Duration, Creator_ID, Create_Date)
values (1,' VtiA' 'De thi java', 1, 1,1,'2023-08-18'),
(2,' VtiB' 'De thi .net', 2, 2,2,'2023-08-18'),
(3,' VtiC' 'De thi sql', 3, 3,3,'2023-08-18'),
(4,' VtiD' 'De thi postman', 4, 4, 4,'2023-08-18'),
(5,' VtiA' 'De thi ruby', 5, 5,5,'2023-08-18');
table Exam;
insert into Exam_Question ( Exam_ID, Question_ID)
values (1,1),
(2,2),
(3,3),
(4,4),
(5,5);
table Exam_Question;

