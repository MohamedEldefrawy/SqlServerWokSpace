use Northwind
go

select * from Orders
select * from Employees
go
--------------------------

-- creatig view (we trearing view exactly as tables)
create view Vw_order_emp 
as 
select OrderID , FirstName + ' ' + LastName as [Full Name], OrderDate
from Orders as o inner join Employees as e
on o.EmployeeID = e.EmployeeID
go

select * from Vw_order_emp

select * from Vw_order_emp where OrderID like '%48'
go

-- meta data query
select OBJECT_DEFINITION(OBJECT_ID('Vw_order_emp','V'));
go

-- prevint meta data quering on view
alter view Vw_order_emp 
with encryption
as 
select OrderID , FirstName + ' ' + LastName as [Full Name], OrderDate
from Orders as o inner join Employees as e
on o.EmployeeID = e.EmployeeID
go

-- drop view 
drop view Vw_order_emp;
go
