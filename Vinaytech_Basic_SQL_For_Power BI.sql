--Create database [storage area in the server]

create database db_dec_9am;

--Using the database

use db_dec_9am;

--Create schema [logical unit inside database which contain objects]

create schema sc;

Note: Default schema is dbo [database object]

--create a table

create table sc.emp(eid integer, enm varchar(30), did integer,esal decimal)

--insert rows into emp table

insert into sc.emp values(1,'vinay',10,20000);
insert into sc.emp values(2,'madhu',20,10000);
insert into sc.emp values(3,'kishore',30,30000);

--display rows from emp table

select * from sc.emp

/* views:
View is a logical object / virtual object / window to a table which is used to bring
required rows and columns.

It contains single select statement without order by clause and semicolon.

*/
--Create view
Syntax:
Create view <viewname> 
as
(
<single select statement>
)
--Create
Create view vw
as
(
select * from sc.emp
)

--Calling
select * from vw
--When you call like this, it is calling the select statement and getting the data

--create view to get dept 10 data
Create view vw_dept10
as
(
select * from sc.emp where did=10
)

--Calling
select * from vw_dept10

--create view to get dept 10 data
Create view vw_dept20
as
(
select * from sc.emp where did=20
)

--Calling
select * from vw_dept20

--create view to get required columns and dept 30 data
Create view vw_dept30
as
(
select eid,enm from sc.emp where did=30
)

--Calling
select * from vw_dept30

/* 
Procedure:
It is the complex object inside a database.
It contains set of sql statements which are pre-compiled.
Useful to implement a process / operation inside database.
It takes input, output parameters and also support return values
*/
--Syntax
Create Procedure <procedurename>(parms)
as
begin
<SQL Statements>
end;

Create procedure pr
as
begin
select * from sc.emp;

end;
--Calling procedure
Exec pr

--Create procedure with input params
create procedure pr_dept(@did integer)
as
begin

select * from sc.emp where did=@did;

end;
--Calling and gettng dept 10 details

Exec pr_dept 10

--Calling and gettng dept 20 details

Exec pr_dept 20

/* Function
Contain set of SQL statements and perform operations.
Returns resultset mandatorily.
It is less complex object then procedure.
It can take only input parameters

*/

View [simple object]----> Function [Little complex]---> Procedure [more complex]

--Syntax
create function<fnctionname>
return <datatype>
as
(
)

--create

create function fn_dept(@id integer)
returns table
as

return (select * from sc.emp where did=@id)

--Calling function and getting dept 10 details

select * from fn_dept(10)

--Calling function and getting dept 20 details

select * from fn_dept(20)








