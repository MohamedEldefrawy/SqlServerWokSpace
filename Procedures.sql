use DataTest;
go

------------------------------------
create proc sp_selectAllEmployees
as
begin
select * from Employees;
end

exec sp_selectAllEmployees
go
------------------------------

create proc sp_selectEmployee
(
	@id int
)
as
begin
	select * from Employees where Employees.ID = @id;
end

exec sp_selectEmployee 1;
go
---------------------------------------------------
create table client (id int primary key identity, name nvarchar(50));
go

create or alter proc sp_insertClient 
(
	@Name nvarchar(20)
)
with encryption
as
begin
	insert into client values(@Name);
end
go

exec sp_insertClient 'ahmed';
select * from client;
go
-----------------------------------------------
-- type of parameters 
-- output param
create proc sp_multi
(
	@x int , @y int , @result int out
)
as
begin
	set @result = @x * @y;
end
go

declare @result int;
exec sp_multi 5,10, @result out
select @result;
go
------------------------------------------