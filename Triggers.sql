create database triggersDb;
go  

use triggersDb;
go 

create table deprt
(
id int primary key,
name nvarchar(30)
)
go

insert into deprt values (1,'IT') , (2,'Sales'), (3,'HR');
go
--------------------------------------------------------------------

-- Create trigger
create trigger printMsg
on deprt
after insert 
as
begin 
	print 'Complete insert the new department';
end

insert into deprt values (4,'R&D');
--------------------------------------------------------------------
use Northwind;
go

select * from dbo.products
-------------------------------------------------------------------
create trigger order_Insert
on [dbo].[Order Details]
after insert
as 
begin
	update P set P.unitsInStock = (P.unitsInStock - I.quantity)
	from products as P inner join inserted as I
	on P.productId = I.productId
end
go

select unitsinstock from products where productid = 11;
go

insert into [dbo].[Order Details] (orderid,productid,unitprice,quantity,discount) values 
(10525,11,19.00,5,0.2);
go
--------------------------------------------------------------------------
use triggersDb;
go

create table dept_history
( id int primary key,
name nvarchar(30))
go

-- delete trigger
create trigger dept_archive
on deprt
after delete 
as 
begin
	insert into dept_history select * from deleted;
end
go

delete from dbo.deprt where deprt.id = 1;
select * from dbo.deprt;
select * from dbo.dept_history;
go
-----------------------------------------------------------------------------
-- update trigger
create table employee (id int primary key, name nvarchar(20), salary decimal(9,2))
insert into employee values (1,'mohamed',1200);
insert into employee values (2,'Asmaa',1100);
create table salary_audit (id int primary key, name nvarchar(20),old_salary decimal(9,2),
new_salary decimal(9,2),date_modifed date);
go

--create update trigger
create trigger audit_salary
on employee
for update
as
begin
	insert into salary_audit (id,name,old_salary,new_salary,date_modifed) 
	select  d.id,d.name,d.salary,i.salary,GETDATE()
	from deleted as d , inserted as i
end
go

update employee 
set salary = 1500 
where employee.id = 1;
go

select * from employee;
select * from salary_audit;
go
-----------------------------------------------------------------------
-- DDL trigger
drop table log_TABLE;

create table dbo.log_table(
	id int primary key identity,
	descr nvarchar(max),
	username nvarchar(max),
	actionDate date
)

go

create or alter trigger log_trigger 
on database 
after Create_table -- or any event
as
begin
	insert into dbo.log_table (descr,username,actionDate) values(N'table created',SUSER_NAME(),GETDATE());
end
go

create table t1(id int);
create table t2(id int);

select * from log_table
----------------------------------------------

