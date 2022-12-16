use records_of_employee;

create table employee  
(empid int,
empname varchar(30),
salary int);
create type employ as table
(empid int,
empname varchar(30),
salary int);
--drop table employ
go

create or alter procedure Emp_Rec
(@MyTable employ readonly )
as
begin
declare @emp_id int,@emp_name varchar(30),@sal int,@cnt int,@error int, @MessageText varchar(100);
set @MessageText=FORMATMESSAGE(50010,N'1001');

select @emp_id=empid from @MyTable
select @emp_name=empname  from @MyTable
select  @sal=salary  from @MyTable
begin try
if @emp_id = null throw 50010,@MessageText,1
set @cnt =(select count(*) as f from employee where empid=@emp_id )
if @cnt>0
update employee set empid=@emp_id ,salary =@sal where empid=@emp_id
else
insert into employee 
select @emp_id,@emp_name,@sal from @MyTable;
end try
begin catch
set @MessageText=N'Null is not permitted as Employee Id'
print('Null is not permitted as Employee Id')
end catch
end


drop table employee

declare @emp as employ
insert into @emp values (1,'John',20000)
exec Emp_Rec @emp 
select * from employee

declare @emp4 as employ
insert into @emp4 values (null,'John',20000)
exec Emp_Rec @emp4 
select * from employee

declare @emp1 employ
insert into @emp1 values (1,'John',30000)
exec Emp_Rec @emp1
select * from employee

declare @emp2 employ
insert into @emp2 values (3,'Shaun',50000)
exec Emp_Rec @emp2

declare @emp3 employ
insert into @emp3 values (2,'t',30000)
exec Emp_Rec @emp3


drop table employee


