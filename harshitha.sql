create database sales;
create table Item_Sales(
Item_Id int,
Names varchar(30),
Sales_Date date,
Sales_Price int 
);

insert into Item_Sales(Item_Id,Names,Sales_Date,Sales_Price)
values (1,'Apple','10/12/2022',50);
update Item_Sales set Sales_Date='12/10/2022' where Sales_Date='10/12/2022';
select * from Item_Sales;
insert into Item_Sales(Item_Id,Names,Sales_Date,Sales_Price)
values (1,'Apple','11/1/2022',50);
delete from Item_Sales where Sales_Date='11/1/2022'
update Item_Sales set Sales_Date='11/1/2022' where Sales_Date='1/11/2022';
insert into Item_Sales(Item_Id,Names,Sales_Date,Sales_Price)
values (2,'Pear','12/31/2022',100);
insert into Item_Sales(Item_Id,Names,Sales_Date,Sales_Price)
values (2,'Pear','12/3/2022',100);
insert into Item_Sales(Item_Id,Names,Sales_Date,Sales_Price)
values (3,'grapes','3/3/2022',20);
update Item_Sales set Sales_Price=200 where Names='grapes';
create table Item_Discount(
Item_Id int,
Names varchar(30),
discount_price int,
Date_From date,
Date_To date
);
insert into Item_Discount(Item_Id,Names,discount_price,Date_From,Date_To)
values (1,'Apple',10,'12/1/2022','12/31/2022');
insert into Item_Discount(Item_Id,Names,discount_price,Date_From,Date_To)
values (2,'Pear',20,'12/1/2022','12/5/2022');
select * from Item_Discount;

select a.Item_Id, a.Names, a.Sales_Date ,
case 
when a.Sales_Date between b.Date_From and b.Date_To then a.Sales_Price-b.discount_price 
else a.Sales_Price end as Overall_Price
from Item_Sales a
left join Item_Discount b on a.Item_Id=b.Item_Id  ;