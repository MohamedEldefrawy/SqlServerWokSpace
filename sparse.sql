create database Sparsedb;
go 

use Sparsedb;
go

create table t1(ID int , name nvarchar(20),DateOFBirth Date);

-- sparse data types
create table t2(ID int sparse , name nvarchar(20) sparse,DateOFBirth Date sparse);
go

declare @x int = 0;
while @x <= 1000 
begin
	insert into t1 values (null,null,null);
	insert into t2 values (null,null,null);
	set @x = @x+1;
end
select * from t1;
select * from t2;

exec sp_spaceused 't1';
exec sp_spaceused 't2';
go