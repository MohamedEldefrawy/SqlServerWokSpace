use master ; 
go

drop database testSchema;
go

create database testSchema;
go

use testSchema
go

-- create login
create login mohamed with password ='123';
go 

-- create user to login mohamed (login can have more than one user)
create user u1 for login mohamed ;
go

-- give create permission to user u1
grant create table to u1 
go

select user_name () as users , SUSER_NAME() as logins;
go

-- login as u1
execute as login ='mohamed';
go

select user_name () as users , SUSER_NAME() as logins;
go

-- faild because u1 dosn't have permission to create in dbo schema 
create table tb1 (id int primary key , name nvarchar(50));
go

-- relogin as dbo
revert ;
go

-- create new schema and give u1 authorization on it
create schema sales authorization u1;
go

-- make it the default schema to u1
alter user u1 with default_schema = sales;
go

execute as login ='mohamed';
go

-- succes and the table created in sales schema y u1
create table test1 (id int primary key , name nvarchar(50));
go

-- another schema 
create schema orders authorization dbo;
go

-- creating table in orders schema 
create table orders.salary (id int primary key, salary int)

-- moving table from schema to other 
alter schema [orders] transfer [sales].[test1]

-- delete table from schema
drop table orders.salary

-- delete schema but it must be empty one
drop schema orders 