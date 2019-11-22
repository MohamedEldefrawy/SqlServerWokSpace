create function fn_Sum(@x int , @y int)
returns int
as
begin
	return @x+@y;
end
go

select dbo.fn_Sum(10,5);
go

-- function with default param
create function fn_Sum2(@x int = 5, @y int)
returns int
as
begin
	return @x+@y;
end
go

select dbo.fn_Sum2(default,10);
----------------------------------------------
use Northwind;
go

select * from Employees;
go
-----------------------------------
create function fn_getName(@cityName nvarchar(15))
returns nvarchar(10)
as
begin
declare @firstName nvarchar(10);
set @firstName = (select Employees.FirstName from Employees where City = @cityName)
return @firstName
end
go

select dbo.fn_getName('Redmond');