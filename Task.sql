
 create table stu (
    Stu_id int primary key,
    FName varchar(20) NOT NULL,
    LName varchar(20),
    Age smallint,
    Addr varchar(30) default 'Zag',
    Dep_id int
)

create table Dep
(
Dep_id int primary key ,
Dep_Name varchar (20) not null ,
Hirring_Date date default getdate(),
Ins_id int 
)


create table Ins 
(
Ins_id int primary key ,
Ins_Name varchar(20) not null ,
Addr varchar(30),
bouns int ,
Salary int not null,
Hour_Rate int ,
Dep_id int 
)

create table Course 
(
Course_id int primary key ,
Course_Name varchar (20) not null,
Duration varchar(20),
Course_Descrip varchar(50),
top_id int 
)

create table Topic
(
Topic_id int primary key, 
Topic_Name varchar (20)
)

create table Stu_Course
(
Stu_id int not null ,
Course_id int not null ,
Grade int 
primary key (Stu_id , Course_id )
)

create table Course_INS 
(
Course_id int not null ,
Ins_id int not null ,
Evaluation int
primary key (Ins_id , Course_id )
)

insert into stu (Stu_id , FName)
values (1 , 'Uosif' )

insert into stu (Stu_id , FName)
values (2,'Hassan') , (3,'Ahmed')

insert into stu 
values (4, 'Uosif' , 'NeGm', 20 ,'Sharqia',null)

update stu 
    set Dep_id = 1
	where 
	Stu_id = 4



insert into Dep
values (1, 'CS', '2025-03-10' ,4 )

insert into Ins 
values (4, 'Yomna', 'Cairo' ,10,12000,3,1 )

insert into Course
values (1, 'Data Structure', 'Tow Months' ,'Problem Solving',1 )

SELECT * FROM stu
SELECT * FROM Course

update Course
    set Duration = 'Three Months'
	where 
	Course_id  = 1

insert into Topic
values (1 , 'Any')

insert into Stu_Course 
values (4 , 1 , 90)

SELECT * FROM Stu_Course

insert into Course_INS 
values (4 , 1 , 'good')

alter table Course_INS alter column Evaluation varchar (20)

SELECT * FROM Course_INS 