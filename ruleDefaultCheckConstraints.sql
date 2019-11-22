create database Constrains
go

use Constrains
go

-- create check constraint on age
create table t1 (Id int,
name nvarchar(30),
age int constraint age_check check (age between 10 and 60));
go

insert into t1 values(1,'mody',52);
insert into t1 values(1,'mohamed',9);

select * from dbo.t1;
------------------------------------------------------------
-- add default contrain 
alter table t1 Add constraint name_constraint  default 'No_name' for [name]; 
go

-- more than one default column (Default Object)
Create default name_default as 'No_name';
go

exec sp_bindefault 'name_default','t1.age';
go

exec sp_unbindefault 't1.age';

insert t1(id) values(2);

select * from t1;
----------------------------------------
-- create rule

create table client (
id int not null,
name nvarchar(5)
)
go

insert into client values (1,'mody');
go

create rule name_rule as @NameValue like 's%';
go

exec sp_bindrule 'name_rule','client.name';
go

insert into client values (2,'moha');
insert into client values (2,'soha');
go

exec sp_unbindrule 'client.name';