-- Creating table with some values
create table t1 (Id int);
go

insert into t1 values (1),(2),(3);
go

select * from t1

-- Create snapshot
Create database testSnapShot 
on(name =test,filename='C:\Program Files\Microsoft SQL Server\MSSQL14.DAFRO\MSSQL\DATA\test_snap.ss')
as snapshot of test
go 

-- restore data from database_snapshot to the source database
delete from t1
select * from t1

-- use master before restore
use master
go


restore database test  from database_snapshot ='testSnapShot';
go

use test
go
select * from t1 

-- delet snapshot
drop database testSnapShot

-- now we can delte the test database 