create database records_of_employee;
create table employee  
(empid int,
empname varchar(30),
salary int);
create type employee1  as table
(empid int,
empname varchar(30),
salary int);

go
create  procedure Emp_Record
(@MyTable employee1 readonly)
as
insert into employee(empid,empname,salary)
select empid,empname,salary from @MyTable;
declare @emp as employee1
insert into @emp values (1,'John',20000)
exec Emp_Record @emp 
select * from employee

declare @emp1 employee1
insert into @emp1 values (2,'Claire',30000)
exec Emp_Record @emp1
select * from employee

declare @emp2 employee1
insert into @emp2 values (3,'Shaun',50000)
insert into @emp2 values (4,'Jared',40000)
exec Emp_Record @emp2

