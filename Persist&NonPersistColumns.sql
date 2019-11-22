create database DataTest;
go 

use DataTest;
go

-- Non Presisted column example
create table Employees (ID int primary key identity,
						Name nvarchar(50) not null,
						Salary decimal(9,2) not null,
						tax decimal(9,2) not null,
						DoB Date not null,
						NetSalary as Salary - tax
						);
go

insert into Employees values ('mody',3000,100,'3-7-1995');

select * from Employees

alter table Employees add Age as (Datediff(year,Dob,getDate()));
go

alter table Employees add overtime decimal(9,2);
go

alter table Employees add NetAfterOver as Salary - tax + overtime persisted;
go

select * from Employees