create database foriegnKey
go

use foriegnKey;
go

create table emp (
id int primary key,
name nvarchar(50))

-- create forieng key constraint with default option(no action)
create table department (
id int primary key,
name nvarchar(50),
emp_id int,
constraint fk_constraint foreign key (emp_id) references emp(id)
on delete no action
);
go

-----------------
-- set default 
create default dept_default as 4;
go

exec sp_bindefault 'dept_default','department2.id';
go

create table department2 (
id int primary key,
name nvarchar(50),
emp_id int,
constraint fk_constraint foreign key (emp_id) references emp(id)
on delete set Default
);

-----------------------------------------------------

-- on delete null

create table department3 (
id int primary key,
name nvarchar(50),
emp_id int,
constraint fk_constraint_2 foreign key (emp_id) references emp(id)
on delete set null on update cascade
);
go
-------------------------------------------------------------------
-- on delete cascade (will delete from every table)

create table department4 (
id int primary key,
name nvarchar(50),
emp_id int,
constraint fk_constraint_3 foreign key (emp_id) references emp(id)
on delete cascade
);
--------------------------------------------------------