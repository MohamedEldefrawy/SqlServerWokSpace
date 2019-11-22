-- Crating database 
create database TableDemo;
go;

use TableDemo;
go

-- creating table
create table employees( ID int primary key identity,
name nvarchar(30) not null,
salary decimal(9,2) not null,
address nvarchar(100),
DateOfBirth date,
hireDate date);
go

-- rename table
exec sp_rename 'dbo.employees','emptable','Object'  
go
-- delete table
drop table [dbo].[emptable];
go


-- Modefying table Alter (Add col , drop col )
create table t1 (id int,
name nvarchar(10));
go

alter table t1 add mobile varchar(12);
alter table t1 alter column mobile varchar(11) not null;
alter table t1 alter column name nvarchar(30) not null;
go

alter table t1 drop column mobile;
go

-- add identity to exist column
alter table t1 add idnew int identity;
alter table t1 drop column id;
exec sp_rename 't1.idnew','id';
go