use sakila;

create database db2;

use db2;

create table student(rollno int primary key, name varchar(255), email varchar(255), mobile varchar(15));

create table course(course_id int primary key, course_name varchar(255), duration int);

create table batch(batchid int primary key, course_id int, startdate date, time time, days varchar(20), size int, constraint fk_course_batch foreign key (course_id) REFERENCES course(course_id));

CREATE TABLE STUDENT_BATCH(id INT PRIMARY KEY, rollno int, batchid int, joindate date, foreign key(rollno) references student(rollno), foreign key(batchid) references batch(batchid));

insert into student values(1, 'dilip', 'dilip@gmail.com', '564123'),
(2, 'anand', 'anand@gmail.com', '564456'),
(3, 'nikita', 'nikita@gmail.com', '564646'),
(4, 'rajesh', 'rajesh@gmail.com', '565456'),
(5, 'arun', 'arun@gmail.com', '567564'),
(6, 'jai', 'jai@gmail.com', '654897'),
(7, 'aditi', 'aditi@gmail.com', '756456'),
(8, 'manish', 'manish@gmail.com', '545897');

select * from student;

insert into course values(1, 'c', 3),
(2, 'c++', 3),
(3, 'python', 3),
(4, 'java', 4),
(5, 'php', 2),
(6, 'html', 1),
(7, 'dsa', 2);

select * from course;

insert into batch values
(1, 1, '2023-05-10', '09:00:00', 'MWF', 100),
(2, 2, '2023-05-11', '10:00:00', 'TTS', 200),
(3, 1, '2023-06-10', '11:00:00', 'MWF', 300),
(4, 3, '2024-05-10', '12:00:00', 'MWF', 200),
(5, 1, '2023-06-20', '01:00:00', 'MWF', 100),
(6, 2, '2023-07-12', '02:00:00', 'TTS', 200),
(7, 1, '2024-08-15', '03:00:00', 'MWF', 300),
(8, 3, '2024-05-16', '04:00:00', 'MWF', 200);

SELECT * FROM BATCH;

INSERT INTO STUDENT_BATCH VALUES(1,1,1, '2024-05-16'),
(2,2,1, '2024-05-17'),
(3,3,1, '2024-05-18'),
(4,1,2, '2024-05-16'),
(5,2,3, '2024-05-16'),
(6,4,3, '2024-05-19'),
(7,5,3, '2024-01-22');

SELECT * FROM STUDENT_BATCH;

SELECT * FROM STUDENT;

SELECT NAME, EMAIL FROM STUDENT WHERE ROLLNO IN (SELECT ROLLNO FROM STUDENT_BATCH WHERE BATCHID = 1);

USE DB1;

SELECT * FROM EMPLOYEE;

SELECT * FROM EMPLOYEE e1 WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE e2 where e1.department = e2.department);

use world;

select * from city;

select * from country;

-- find out those cities where population is greater than amsterdam population
select name, population from city where population > (select population from city where name = 'amsterdam'); 


-- find out those cities where population is greater than  population of batna
select name, population from city where population > (select population from city where name = 'batna');


select district from city where name = 'amsterdam';

select name, district from city where district = (select district from city where name = 'amsterdam');


-- Q. get the country code and country name where the continent matches with the continent of the country 'albania' 
select code, name from country where continent = (select continent from country where name = 'albania');
 
 
 -- Q. "Get the continent, name of the country where life expectancy matches with the life expectancy of the country name as 'Cook Islands'"
 select continent, name from country where lifeexpectancy = (select lifeExpectancy from country where name = 'cook islands');
 
 select * from country;
 
 
 -- Q. get the country code, continent and gnp values for the country where the region do not match with the region of the country name as 'benin' 
 select code, continent, GNP from country where region != ( select region from country where name = 'benin');

use world; 


-- mujhe un city ka naam chahiye jinki population kabul ki population see zayda ho 
select name, population from city where population > (select population from city where name = 'kabul'); 

select name, population from city where population > (select population from city where name = 'amsterdam');

select name, district from city where district in (select district from city where name = 'amsterdam');

select code as country_code, name as country_name from country where continent in (select continent from country where name = 'albania');

select continent, name as name_of_the_country from country where lifeExpectancy in (select lifeExpectancy from country where name = 'cook islands');

select * from country; 

select code as country_code, continent, GNP as GNP_VALUES from country where region != (select region from country where name = 'benin');

-- Q. I need to get the country name and population for all the countries available in the continent name as 'europe'
select name, population, continent from country where name in (select name from country  where continent = 'europe');


-- Q. i need to get the country name, country code where the life expectancy match with the life expectancy of country name as 'bahamas' 
select name, code, lifeexpectancy from country where lifeexpectancy in (select lifeexpectancy from country where name = 'bahamas');

select * from country;

use sakila;

select * from payment;

-- Q. find payment_id, customerid, amount where the amount is same as of the paymentid = 5; 
select payment_id, customer_id, amount from payment where amount in (select amount from payment where payment_id = 5);

-- Q. find payment_id, customerid, amount where the amount is same as of the paymentid = 2 and paymentid = 3;
select payment_id, customer_id, amount from payment where amount in (select amount from payment where payment_id = 2 or payment_id = 3);

-- >any => return the minimum value of subquery
select payment_id, customer_id, amount from payment where amount >any (select amount from payment where payment_id = 2 or payment_id = 3);

-- <any(less than any) => less than any value for ex:-> 0.99 or 5.99
select payment_id, customer_id, amount from payment where amount <any (select amount from payment where payment_id = 2 or payment_id = 3); 

-- <=any:=> less than or equal to any value for ex:=> 0.99 or 5.99
-- >=any:=> greater than or equal to any value for ex:=> 0.99 or 5.99

use sakila;

select * from payment;

-- Q. find payment_id, customerid, amount where the amount is same as of the paymentid = 2 and paymentid = 3;
select payment_id, customer_id, amount from payment where amount >all (select amount from payment where payment_id = 2 or payment_id = 3);

select * from payment where payment_id = 3;

select payment_id, customer_id, amount from payment where amount =all (select amount from payment where payment_id = 3);

select * from payment;

use world;

select * from country;

select * from city;

-- get the name of the country whose population is greater  than the population among name as armenia 
select name, population from country where population >all (select population from country where name = 'armenia');

use sakila;

select * from customer;

select * from payment;

select payment_id, customer_id, amount from payment where amount <any (select amount from payment where payment_id = 2 or payment_id = 3);

select * from world.country;

-- get the name of the country whose population is greater than the population among name as 'armenia' 
select name as country_name, population from world.country where population > (select population from world.country where name = 'armenia');

use world;

select * from country;

-- get the country code, the name of the country whose life expectancy is same as for the country name as 'europe'
select code, name, lifeexpectancy from country where lifeexpectancy in (select lifeexpectancy from country where name = 'europe');


-- get the name, continent of the countries who have got their independence near by the independence year of the continents from 'asia' 
select c1.name, c1.continent, c1.indepyear from country as c1 where exists (select 1 from country as c2 where c2.continent = 'asia' and abs(c1.indepyear - c2.indepyear)<=5);

use world;


-- kitne aise country hai jinka independence year equal hai continent 'asia'  ke
select count(*) from country where indepyear in (select indepyear from country where continent = 'asia');


-- har ek continent main kitni countries hai 'asia' ko chodkar jinka independence year same hai
select continent, count(*) from country where indepyear in (select indepyear from country where continent != 'asia') group by continent;


-- har ek continent main kitni countries hai jinka independence year same hai contient 'asia' ke
select continent, count(*) from country where indepyear in (select indepyear from country where continent = 'asia') group by continent;


select * from country;

