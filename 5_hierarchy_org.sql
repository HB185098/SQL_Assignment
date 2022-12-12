create database Company
create table CompanyTree
(Id int,Position varchar(100),Level int
)
insert into CompanyTree(Id,Position,Level)
values (1,'CEO',0);
insert into CompanyTree(Id,Position,Level)
values (2,'Sales Manager',1);
insert into CompanyTree(Id,Position,Level)
values (3,'Project Manager',1);
insert into CompanyTree(Id,Position,Level)
values (4,'Secretary',1);
insert into CompanyTree(Id,Position,Level)
values (5,'Representative 1',2);
insert into CompanyTree(Id,Position,Level)
values (6,'Representative 2',2);
insert into CompanyTree(Id,Position,Level)
values (7,'Team Leader',2);
insert into CompanyTree(Id,Position,Level)
values (8,'Designer',3);
insert into CompanyTree(Id,Position,Level)
values (9,'Programmer 1',3);
insert into CompanyTree(Id,Position,Level)
values (10,'Programmer 2',3);
select * from CompanyTree


WITH cte (Id, Position, report_to, reprot_to_LEVEL) AS (
SELECT Id, Position, CAST('' AS VARCHAR) as report_to, 1 AS reprot_to_LEVEL
FROM CompanyTree
WHERE Level=0

UNION ALL

SELECT c1.Id, c1.Position, CAST(cte.Position AS VARCHAR) report_to, (c1.Level + 1) AS reprot_to_LEVEL
FROM CompanyTree c1
    JOIN cte ON c1.Level = cte.Id   
)

SELECT Position, report_to, reprot_to_LEVEL FROM cte
ORDER BY reprot_to_LEVEL