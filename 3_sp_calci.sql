create database calculator;
create table calci1
(
num1 int,
num2 int,
op varchar(1),
result int
);
alter table calci1 drop column result 
select * from calci1;
go

create proc calculate(
@no1 int,@no2 int,@operator varchar(1) ,@re int output
)as begin
update calci1 
set num1=@no1, num2=@no2,op =@operator
if @operator='+' set @re=@no1+@no2;
else if @operator='-' set @re=@no1-@no2; 
else if @operator='*' set @re=@no1*@no2;
else if @operator='/' set @re=@no1/@no2;
else if @operator='%' set @re=@no1%@no2;
end;

declare @re int
exec calculate 11,10,'*',@re out
print @re
