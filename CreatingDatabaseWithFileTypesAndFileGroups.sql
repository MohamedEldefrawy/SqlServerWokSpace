-- Creating database
create database test2

-- Creating database with specific file types properties 
 create database test3 
 on primary(name= 'test3_primary',
			filename= 'C:\Program Files\Microsoft SQL Server\MSSQL14.DAFRO\MSSQL\DATA\test3_primary.mdf',
			size= 5mb,
			maxsize= 10mb,
			filegrowth= 1mb )
log on (name = 'test3_log',
		filename = 'C:\Program Files\Microsoft SQL Server\MSSQL14.DAFRO\MSSQL\DATA\test3_log.ldf',
		size= 1mb,
		maxsize= 10mb,
		filegrowth= 1mb
		)

-- Creating database with specific file types and saperated into various .ndf files
 create database test4 
 on primary(name= 'test4_primary',
			filename= 'C:\Program Files\Microsoft SQL Server\MSSQL14.DAFRO\MSSQL\DATA\test4_primary.mdf',
			size= 5mb,
			maxsize= 10mb,
			filegrowth= 1mb ),
filegroup Mytest_fg1
(name='Mytest_fg1_dat1',
filename= 'C:\Program Files\Microsoft SQL Server\MSSQL14.DAFRO\MSSQL\DATA\Mytest_fg1_dat1.ndf',
			size= 5mb,
			maxsize= 10mb,
			filegrowth= 1mb),
			(name='Mytest_fg1_dat2',
filename= 'C:\Program Files\Microsoft SQL Server\MSSQL14.DAFRO\MSSQL\DATA\Mytest_fg1_dat2.ndf',
			size= 5mb,
			maxsize= 10mb,
			filegrowth= 1mb)
log on (name = 'test3_log',
		filename = 'C:\Program Files\Microsoft SQL Server\MSSQL14.DAFRO\MSSQL\DATA\test4_log.ldf',
		size= 1mb,
		maxsize= 10mb,
		filegrowth= 1mb
		)

-- Adding file group to database and adding file to the file group
alter database test4 add filegroup Mytest_fg2
go
alter database test4 add file (name='Mytest_fg2_dat1',
filename= 'C:\Program Files\Microsoft SQL Server\MSSQL14.DAFRO\MSSQL\DATA\Mytest_fg2_dat1.ndf',
			size= 5mb,
			maxsize= 10mb,
			filegrowth= 1mb) to filegroup Mytest_fg2

-- remove filegroup from database
alter database test4 remove file Mytest_fg2_dat1
go 
alter database test4 remove filegroup Mytest_fg2 

-- delete database 
drop database test3