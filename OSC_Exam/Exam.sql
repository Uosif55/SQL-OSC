
-----------------------------------------------------  FLOOR--------------------------------------------------------------

CREATE TABLE Library_Floor (
    Number INT PRIMARY KEY,
    Num_of_blocks INT,
    Emp_id INT
);
-------Insertion--------

---المشكلة ان الفلور والموظفين مرتبطين ببعض ف كان لازم اعمل آي دي للفلور الاول علشان جدول الموظفين يشتغل ---

INSERT INTO Library_Floor (Number) VALUES
(1),
(2);
--- Update & Insert FOR id 1 , 2----
UPDATE Library_Floor
SET Emp_id = CASE
    WHEN Number = 1 THEN 1
    WHEN Number = 2 THEN 2
END
WHERE Emp_id IS NULL;

UPDATE Library_Floor
SET Num_of_blocks = CASE
    WHEN Number = 1 THEN 1
    WHEN Number = 2 THEN 2 
END
WHERE Num_of_blocks IS NULL;

SELECT * FROM Library_Floor;
--------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------Employee---------------------------------------------------------
CREATE TABLE Employee (
    Id INT PRIMARY KEY,
    Address VARCHAR(40),
    B_rowse VARCHAR(40),
    FName VARCHAR(15),
    LName VARCHAR(15),
    E_Mail TEXT ,
    DOB DATE,
    Floor_Num INT,
    Manager_id INT
);
----- اضطريت اني اغير الميل من تيكست ل كاركتر علشان كنت عايزه يونيك

ALTER TABLE Employee
ALTER COLUMN E_Mail VARCHAR(100);

ALTER TABLE Employee
ADD CONSTRAINT unique_email UNIQUE (E_Mail);

-------Insertion -------
INSERT INTO Employee (Id, Address, B_rowse, FName, LName, E_Mail, DOB, Floor_Num, Manager_id) VALUES
(1, 'Zag', 'B1', 'Uosif', 'NeGm', 'Uosif55@gmail.com', '2005-01-01', 1, NULL),
(2 , 'Giza' , 'B2' , 'Hassan' , 'NeGm' , 'Hassan55@gmail.com' , '2002-04-04' ,2 , 1 ),
(3, 'Alex', 'B3', 'Youssef', 'Kamel', 'youssef.gmail@mail.com', '1995-12-05', 2, 1);

SELECT * FROM Employee;

-------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------Users------------------------------------------------------------------------

CREATE TABLE Users (
    SSN INT PRIMARY KEY,
    E_Mail TEXT,
    Name VARCHAR(20),
    Emp_id INT
);
---هنا برضو غيرته----
ALTER TABLE Users
ALTER COLUMN E_Mail VARCHAR(100);

ALTER TABLE Users
ADD CONSTRAINT Uesr_email UNIQUE (E_Mail);

-------------Insertion--------
INSERT INTO Users VALUES 
(1 , 'AHMED@gmail.com' ,'Ahmed' , 1),
(2,'AKRAM@gmail.com ' , 'Akram' ,3),
(3,'ABDULLAH@gmail' ,'Abdullah', 2 );

SELECT * FROM Users;

------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------Phone-------------------------------------------------------------------
CREATE TABLE User_Phone (
    phone INT PRIMARY KEY,
    User_SSN INT
);

---Insertion----
INSERT INTO User_Phone VALUES 
(01095635393 , 1 ),
(01275919103 , 2);

SELECT * FROM User_Phone;

-----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------Category------------------------------------------------------------------------
CREATE TABLE Category (
    Id INT PRIMARY KEY,
    Name VARCHAR(20)
);

---------Insertion--------
INSERT INTO Category VALUES
(1 , 'Science'),
(2, 'History');

SELECT * FROM Category

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------Publisher----------------------------------------------------------------
CREATE TABLE Publisher (
    Id INT PRIMARY KEY,
    Name VARCHAR(20)
);
---------Insertion-----------
INSERT INTO Publisher VALUES
(1 , 'IBN SIENA'),
(2, 'NEGM');
---------
UPDATE Publisher
SET Name= 'OMAR'
WHERE Id = 1;

SELECT * FROM Publisher;

------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------Author------------------------------------------------------------
CREATE TABLE Author (
    Id INT PRIMARY KEY,
    Name VARCHAR(20)
);

----Insertion---
INSERT INTO Author VALUES
(1 , 'IBN SIENA'),
(2, 'CRISTIANO RONALDO');

SELECT * FROM Author;

--------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------Sheif----------------------------------------------------------
CREATE TABLE Sheif (
    Code INT PRIMARY KEY,
    Floor_Num INT
);
---Insertion---

INSERT INTO Sheif VALUES
(1 ,2 ),
(2, 1);

SELECT * FROM Sheif;
------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------Book-----------------------------------------------------------
CREATE TABLE Book (
    Id INT PRIMARY KEY,
    Title VARCHAR(30),
    Code_Sheif INT,
    Category_Id INT,
    Publisher_Id INT
);
----------Insertion---------
INSERT INTO Book VALUES
(1 ,'Elictrons' , 2 , 1 , 2 ),
(2 , 'How to become a legend?', 1 , 2 , 1 );

SELECT * FROM Book;

------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------User_Borrow-------------------------------------------------------

CREATE TABLE User_Borrow (
    Emp_id INT,
    User_SSN INT,
    Book_id INT,
    DueDate DATE,
    Date_Borrowed DATE,
    Amount DECIMAL(10,2),
	------- هنا طبعا التلاتة دول فورين كي لكن كان لازم انشئ الجداول الاول بعدين اعمل ال فورين كي لكل جدول
    PRIMARY KEY (Emp_id, User_SSN, Book_id)

);

--------Insertion---------
INSERT INTO User_Borrow VALUES 
(1,3,1,'2025-06-01', '2025-05-01', 1500.50),
(3,2,2,'2025-05-01', '2025-04-15', 700);

SELECT * FROM User_Borrow;

--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------Book_Author-------------------------------------------------------
CREATE TABLE Book_Author (
    Book_Id INT,
    Author_Id INT,
    PRIMARY KEY (Book_Id, Author_Id),
	--- الجدول دا عملته اخر واحد بعد عملت الفورين كي لكل الجداول لإنه مكنش هيقبل---
    FOREIGN KEY (Book_Id) REFERENCES Book(Id),
    FOREIGN KEY (Author_Id) REFERENCES Author(Id)
);

----Insertion
INSERT INTO Book_Author VALUES
(1,1),
(2,2);

SELECT * FROM Book_Author; 

--------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------Foreign keys--------------------------------------------------------

/*في الاول انا عملت كل جدول وعرفت فيه الفورين كي لكن كل ما اعمل رن لجدول الاقيه مربوط بجدول تاني
و الجدول التاني دا غير معرف اصلا ف دا اضطرني اني اعمل كدا

*/
ALTER TABLE Library_Floor
ADD FOREIGN KEY (Emp_id) REFERENCES Employee(Id);


ALTER TABLE Employee
ADD FOREIGN KEY (Floor_Num) REFERENCES Library_Floor(Number);


ALTER TABLE Employee
ADD FOREIGN KEY (Manager_id) REFERENCES Employee(Id);


ALTER TABLE Users
ADD FOREIGN KEY (Emp_id) REFERENCES Employee(Id);


ALTER TABLE User_Phone
ADD FOREIGN KEY (User_SSN) REFERENCES Users(SSN);


ALTER TABLE Sheif
ADD FOREIGN KEY (Floor_Num) REFERENCES Library_Floor(Number);


ALTER TABLE Book
ADD FOREIGN KEY (Code_Sheif) REFERENCES Sheif(Code);


ALTER TABLE Book
ADD FOREIGN KEY (Category_Id) REFERENCES Category(Id);


ALTER TABLE Book
ADD FOREIGN KEY (Publisher_Id) REFERENCES Publisher(Id);


ALTER TABLE User_Borrow
ADD FOREIGN KEY (Emp_id) REFERENCES Employee(Id);


ALTER TABLE User_Borrow
ADD FOREIGN KEY (User_SSN) REFERENCES Users(SSN);


ALTER TABLE User_Borrow
ADD FOREIGN KEY (Book_id) REFERENCES Book(Id);

----Display all Tables ---
SELECT name 
FROM sys.tables;

-------- Selections -------
SELECT Number As NumFloor FROM Library_Floor ;
SELECT * FROM Employee;
SELECT  E_Mail   As E_mail FROM Users;
SELECT * FROM User_Phone;
SELECT * FROM Category
SELECT * FROM Publisher;
SELECT Id ,  Publisher_Id FROM Book;
SELECT * FROM Author;
SELECT * FROM Sheif;
SELECT User_SSN  , Book_id , Amount FROM User_Borrow;
SELECT * FROM Book_Author ; 


