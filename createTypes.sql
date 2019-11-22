-- craete type 
create type type1 from nvarchar(50) not null

-- create type using procedure
exec sp_addtype 'type2','int','not null'