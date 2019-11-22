create database IndexDb;
go

use IndexDb;
go

create table emp (id int , name nvarchar(30));
go

-- creating cluster index (only one clusterd index per table)
create clustered index Ix_emp on emp(id);	

insert into emp values (10,'ahmed'), (1,'ramy'),(5,'asmaa');

-- sorted even when I inserted them randomly that's because of clusterd index on id
select * from emp;

-- drop index 
drop index emp.ix_emp;
--------------------------------------------------------
-- non clustered index
create nonclustered index nameIndex on emp(name);
select * from emp

----------------------------------------------------------
-- primary key is creating a clusterd index
create table emp2(id int primary key, name nvarchar(20));
insert into emp2 values (10,'ahmed'), (1,'ramy'),(5,'asmaa');
select * from emp2;

