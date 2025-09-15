use practice;

show tables;

select * from picture;

select * from employee;

describe picture;

alter table picture modify column actor_id int;

alter table picture modify column budget float;

alter table picture modify column production varchar(20);

drop table picture;

create table emv(
emp_id int,
name varchar(20),
salary float(10)
);

insert into emv(emp_id, name, salary)values(1, 'tushar', 25000),
(2, 'rohit', 30000),
(3, 'ajeet', 40000);

describe emv;

select * from emv;

drop table emv;

describe emv;

alter table emv add unique(emp_id);

alter table emv add unique(name);

alter table emv add unique(salary);

drop table emv;

alter table emv add unique(emp_id);

describe emv;

-- 
select * from emv;

insert into emv(name, salary)values('pranjal', 60000);

select * from emv;

insert into emv(name, salary)values('mohit', 20000);

drop table emv;

alter table emv add constraint c1 unique(emp_id);

alter table emv add constraint c2 unique(name);

alter table emv add constraint c3 unique(salary);

alter table emv drop index c1;

alter table emv drop index c2;

alter table emv drop index c3;

describe emv;

create table emp(
emp_id int,
name varchar(20),
salary varchar(20),
des varchar(20)
);

alter table emp add constraint c11 primary key(name);

alter table emp drop primary key;

drop table emp;

describe emp;

alter table emp add primary key(emp_id);

alter table emp drop primary key;

-- union all => will have a duplicate value 

-- intersect is use to filter out the comman records between 2 or more query

-- except  

-- cte it will be there in memmory upto the time

-- recursive cte => it is use to find the hierarchical record in which we use use to find the comman records until are condition in match. ex => who is the boss of his or her we find by the recursive cte.

with recursive cte as
 (select 1 as num 
 union
 select num+1 from cte where num < 6
 )
 

select * from cte;

show tables;

use practice;

-- Q.v.i.=> to find out the factorial of a number using recursive cte

WITH RECURSIVE FactorialCTE AS (
    -- Anchor member: start with 1! = 1
    SELECT 1 AS n, 1 AS fact
    UNION ALL
    -- Recursive member: multiply previous factorial by next number
    SELECT n + 1, fact * (n + 1)
    FROM FactorialCTE
    WHERE n < 5   -- Change 5 to the number you want factorial of
)
SELECT fact AS Factorial
FROM FactorialCTE
WHERE n = 5;  -- Final result for 5!


with recursive cte as
(select 1 as i, 1 as factorial
union
select i+1, factorial*(i+1) from cte where i<6
)


use regex1;

drop table employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT NULL
);


INSERT INTO employees (employee_id, name, manager_id) VALUES
(1, 'Alice', NULL),       -- CEO
(2, 'Bob', 1),            -- Reports to Alice
(3, 'Carol', 1),          -- Reports to Alice
(4, 'David', 2),          -- Reports to Bob
(5, 'Eve', 2),            -- Reports to Bob
(6, 'Frank', 3),          -- Reports to Carol
(7, 'Grace', 4);          -- Reports to David

select * from employees;

with recursive cte as
(select employee_id, name, manager_id, 1 as level
from employees where manager_id is null
union
select etemp.employee_id, etemp.name, etemp.manager_id, leves+1
from employees as etemp join cte where etemp.manager_id = cte.employee_id)

select * from cte

-- what is views
-- why we use views
-- views vs cte
-- materialized views vs non materialized views


-- Q.V.I=>	in vs exist   
-- how using the exist keyword will optimize my query




use sakila;

show tables;

select * from actor

-- views stored only query because it reuse again and again

create view temp2 as(select first_name, last_name from actor);

select * from temp2;

-- ctas => create table as select

create table factors as (select actor_id, first_name, last_name from actor where actor_id < 7); 

select * from factors;

-- view write insert and update query create second view actor_id, first_name



-- Q.V.I => CTE VS TEMPORARY TABLE VS VIEWS

-- windows function :=> are called as analytical function used to perform calculation on multiple rows in relation to current row

-- in aggregate function the output of multiple rows return in one row but here in window function each row is given with the calculated data(windows of rows)  

-- over clause => is used to perform operation over set of rows.

 -- partition by => is a keyword use inside the over it is used to divide or separate the similar values like group by. 
 
 -- group by vs partition by :=> group by hide the data AND PARTITION BY SHOWS THE DATA.
 
create database tushar;
use tushar;
CREATE TABLE EmployeeSales (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);


INSERT INTO EmployeeSales (EmployeeID, EmployeeName, Department, SaleDate, SaleAmount) VALUES
(1, 'Alice', 'Sales', '2025-06-01', 1200.00),
(1, 'Alice', 'Sales', '2025-06-03', 1800.00),
(1, 'Alice', 'Sales', '2025-06-07', 1500.00),
(2, 'Bob', 'Sales', '2025-06-01', 2000.00),
(2, 'Bob', 'Sales', '2025-06-05', 2200.00),
(2, 'Bob', 'Sales', '2025-06-08', 2100.00),
(3, 'Carol', 'Marketing', '2025-06-02', 3000.00),
(3, 'Carol', 'Marketing', '2025-06-06', 2800.00),
(3, 'Carol', 'Marketing', '2025-06-10', 2700.00),
(4, 'Dave', 'Marketing', '2025-06-01', 1000.00),
(4, 'Dave', 'Marketing', '2025-06-03', 1100.00),
(4, 'Dave', 'Marketing', '2025-06-09', 1300.00),
(5, 'Eve', 'HR', '2025-06-04', 900.00),
(5, 'Eve', 'HR', '2025-06-07', 950.00),
(5, 'Eve', 'HR', '2025-06-10', 1000.00),
(6, 'Frank', 'Sales', '2025-06-02', 1700.00),
(6, 'Frank', 'Sales', '2025-06-05', 1900.00),
(6, 'Frank', 'Sales', '2025-06-09', 1600.00),
(7, 'Grace', 'Finance', '2025-06-01', 2500.00),
(7, 'Grace', 'Finance', '2025-06-06', 2400.00),
(7, 'Grace', 'Finance', '2025-06-10', 2600.00),
(8, 'Hank', 'Finance', '2025-06-03', 2300.00),
(8, 'Hank', 'Finance', '2025-06-04', 2200.00),
(8, 'Hank', 'Finance', '2025-06-08', 2100.00),
(9, 'Ivy', 'HR', '2025-06-02', 800.00),
(9, 'Ivy', 'HR', '2025-06-06', 850.00),
(9, 'Ivy', 'HR', '2025-06-09', 950.00),
(10, 'Jake', 'IT', '2025-06-05', 3000.00),
(10, 'Jake', 'IT', '2025-06-07', 3200.00),
(10, 'Jake', 'IT', '2025-06-10', 3100.00);

select * from employeeSales; 

SELECT *, AVG(saleamount) over(), avg(saleamount) over(partition by employeename) from employeeSales;

SELECT *, AVG(saleamount) over(), avg(saleamount) over(partition by saledate) from employeeSales;

SELECT *, avg(saleamount) over(partition by department), avg(saleamount) over(partition by department, employeename)  from employeeSales;

SELECT *, avg(saleamount) over(partition by department), avg(saleamount) over(partition by department, saledate)  from employeeSales;

SELECT *, avg(saleamount) over(partition by department), avg(saleamount) over(partition by saledate)  from employeeSales;

SELECT *, avg(saleamount) over(partition by department), avg(saleamount) over(partition by department)  from employeeSales;

-- order by => is use inside the over clause used to specify the order of rows in each partition. it is use in running sum question

--  running sum question is very important for interview.

use tushar;

-- running sum question example:=>
select *, sum(saleamount) over(order by saleamount) from employeeSales; 

-- in running sum there is no partition by use because we use order by. 



-- running sum average question example:=> 
select *, avg(saleamount) over(order by saleamount) from employeeSales; 


select *, sum(saleamount) over(partition by department order by saleamount) from employeeSales; 


select *, sum(saleamount) over(partition by saledate order by saleamount) from employeeSales; 


select *, max(saleamount) over(partition by department order by saleamount) from employeeSales; 


use sakila;

select * from payment;

select payment_id, customer_id, amount, payment_date, sum(amount) over (order by payment_date) as runing_total from payment;

select payment_id, customer_id, amount, payment_date, sum(amount) over (partition by staff_id order by payment_date) as staff_runing_total from payment;

-- rank, denserank, row number read these 3 functions. 

select *, sum(saleamount) over(order by saleamount) from employeesales order by saleamount;

select * from employeesales where saleamount = (select max(saleamount) from employeesales);

-- find second highest salary using subquery very important question for interview

--  find third highest salary using subquery very important question for interview

select *, row_number() over(partition by department) from employeesales;

select *, row_number() over() from employeesales;

select *, rank() over(order by saleamount) from employeesales; -- rank() example

-- rank() => which is used to give value of each rows if the values are same rankings are shared and the next values of ranking skipped.


select *, rank() over(partition by department order by saleamount) from employeesales; -- rank() example with partition by


-- dense_rank() :=> 

select *, rank() over(partition by department order by saleamount desc), dense_rank() over(partition by department order by saleamount desc) from employeesales; 
-- dense_rank() example with partition by


-- 	Q. second highest sale amount
with datarank as
(select *, 
dense_rank() over(order by saleamount desc) as `ranks` from employeesales) select * from datarank where ranks = 2; 


-- lag() vs lead()

-- lead()
select *, lead(saleamount) over() from employeesales;


select *, lead(saleamount, 2) over() from employeesales;


-- lag():=>
select *, lag(saleamount, 1) over() from employeesales;

insert into employeesales values(1, 'Alice', 'Sales', '2025-06-02', 600.00);


-- null if vs if null => V.I.Q


select *, lag(saleamount) over(partition by department, employeename), saleamount - lag(saleamount) over(partition by department, employeename) from employeesales;

select *, lag(saleamount) over(partition by department, employeename), saleamount - lag(saleamount) over(partition by department, employeename order by saledate) from employeesales where employeename = 'Alice';

select *, lead(saledate) over(partition by department, employeename order by saledate) from employeesales where employeename = 'Alice' and department = 'Sales';

use sakila;

select * from courses;

select @@autocommit;

select @@autocommit=0;

insert into courses values(778, "abc", "science");

select * from courses;

-- when transcation start :=>
-- 1. if we start transaction
-- or
-- 2. autocommit is disable
-- or
-- 3. dml operation ( this operation will temporary when transcation start)
-- 4. transcation stop:=> commit, rollback, or use ddl statement

select * from staff;

select @@autocommit;

insert into courses values(900, "kamal", "14");

update courses set coursename = "regex";

select * from courses;

rollback;

insert into courses values(900, "kamal", "14");

select * from courses;

commit;

rollback;

select @@autocommit;

set @@autocommit=1;

start transaction;

insert into courses values(911, "kamal1", 15);

-- V.I.Q what is tcl

-- V.I.Q commit vs rollback

CREATE TABLE TUSHAR123(ID INT); -- TRANSCATION IS SAVED HERE

SELECT * FROM COURSES;

START TRANSACTION;

INSERT INTO COURSES VALUES(920,  "GUI", 16);

INSERT INTO COURSES VALUES(922,  "ABCE", 17);

UPDATE COURSES SET COURSENAME = "REGEX" WHERE COURSE_ID = 911;

ROLLBACK TO COURSE_INSERT_CHECK;

select * from courses;

-- DCL(DATA CONTROL LANGUAGE):=> 

-- AUTHENTICATION AND AUTHORIZATION:=>   

SELECT * FROM mysql.user;

create user test identified by 'test1234';

create database ecell;

use ecell;

create table customer(id int, cname varchar(20));

insert into customer values(1, "abhi"), (2, "rishi");

select * from customer;

grant all privileges on ecell.* to test;

show grants for test;

revoke all privileges on ecell.* from test;

-- Q. object ownership:=> in mysql object ownership not supported but in oracle object ownership supported with all privillages.
-- ASSINGNEMENT => YASH USER HAVE ONLY ONE COLUMN ACCESS
-- SELECT AND UPDATE PRIVILLAGES ASSIGN TO USER
-- YOU HAVE TO CREATE A ROLE NAME AS SALES IN SALES WE HAVE TWO USER YASH AND ADITIYA GIVE THE SELECT AND INSERT PRIVILAGES TO ROLE AND ASSIGN THIS PARTICULAR ROLE IN YOUR TABLE
 

CREATE USER YASH identified BY 'YASH123';





 
 