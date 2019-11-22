create database tableTypes;
go

use tableTypes;
go

-- temporary tables lives within the user session or connection only
create table Peoples(ID uniqueidentifier,
name nvarchar(50),
DataofBirth date,
gender char(1)
);
go

declare @x int =1 ;
while (@x <= 1000)
begin
	insert into Peoples values (newid(),'Mohamed',GETDATE(),'M');
	set @x = @x+1;
end

select count(*) from Peoples

go

create table #Peoples (ID uniqueidentifier,
name nvarchar(50),
DataofBirth date,
gender char(1)
);
go

insert into #Peoples select top(200) * from dbo.Peoples;
go

select * from #Peoples
go

-----------------------------------------------------------------------
-- table variables it's work within patch scope

declare @Peoples table (ID uniqueidentifier,
name nvarchar(50),
DataofBirth date,
gender char(1)
);
insert into @Peoples select top(100) * from dbo.Peoples;
select * from @Peoples;
go
----------------------------------------------------------------------------

-- command table expression
with cte_name
as
(
	select * from dbo.Peoples as names
)

select name from cte_name;
go

---------------------------------------------------------
-- recursive CTE
with emp_cte 
as 
(
	select empID , mgrid,lastname,firstname from HR.Employees wher empId = 5
	union all 
	select emp.empId , emp.mgrId, emp.lastname,emp.firstname
	from emp_cte as manger join hr.employee as emp
	on emp.mgrid = manger.empid
)
select empID , mgrid,lastname,firstname from emp_cte