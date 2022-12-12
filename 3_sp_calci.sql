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

create proc calcu(
@no1 int,@no2 int,@operator varchar(1) ,@re int output
)as begin
update calci1 
set num1=@no1, num2=@no2,op =@operator
begin try
if @operator='+' set @re=@no1+@no2;
else if @operator='-' set @re=@no1-@no2; 
else if @operator='*' set @re=@no1*@no2;
else if @operator='/' set @re=@no1/@no2;
else if @operator='%' set @re=@no1%@no2;
end try
begin catch
select		 ERROR_NUMBER() as ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
end catch
end;

declare @re1 int
exec calcu 11,0,'%',@re1 out
print @re1
