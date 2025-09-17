use sakila;

select * from payment;

select @@autocommit;

use regex1;

show tables;

select * from courses;

insert into courses values(777, "abc", "science");

set @@autocommit = 0;

insert into courses values(999, "def", "maths");

insert into courses values(778, "ghi", "social-science");

select * from courses;

select @@autocommit;

insert into courses values(776, "kamal", "kamal khan");

select * from courses;

update courses set coursename = "regex";

rollback;

insert into courses values(900, "kamal", "regex");

commit;
rollback;

select * from courses;


select @@autocommit;

set @@autocommit = 1;

start transaction;

insert into courses values(901, "kamal", "kamal-hassan");

select * from courses;

create table tushar123(id int);

-- difference between commit and rollback


start transaction;

insert into courses values(902, "a", "xe");

insert into courses values(903, "b", "ev");

update courses set coursename = "regex" where courseid = 903;

select * from courses;

rollback;

use sakila;

select @@autocommit;

use regex1;

show tables;

select * from courses;

insert into courses values(666, "dst", "general-knowledge");

select * from courses;

set @@autocommit = 0;

insert into courses values(667, "abc1", "gk");

select * from courses;

select @@autocommit;

insert into courses values(650, "abc2", "msi");

update courses set 	CourseName = 'regex2.0' where 1=1;

select * from courses;

set @@autocommit = 0;

insert into courses values(651, "abc3", "ssc");

select * from courses;

commit;

rollback;

select @@autocommit;

set @@autocommit = 1;

start transaction;

insert into courses values(906, "abc5", "sales");

select * from courses;

create table tushar123(id int);

select * from courses;

-- what is the difference betweeen commit and rollback

start transaction;

insert into courses values(11, "1b2", "1bb");

insert into courses values(12, "1b3", "2bb");


SAVEPOINT courses_check_insert_c1;

update courses set coursename = "regex2.0" where courseid = 101;

ROLLBACK;

rollback to courses_check_insert_c1;

select * from courses;

start transaction;

insert into courses values(13, "1b5", "1bc");

insert into courses values(14, "1b6", "1bbc");

SAVEPOINT courses_chk_point;

select * from courses;

insert into courses values(15, "1b7", "1cb");

rollback to courses_chk_point;

-- what is the difference between rollback and rollback to savepoint

-- dcl(data control language)

select * from mysql.user; 

create user test identified by "test1234";

drop user test;

create database ecom;

use ecom;

create table customer(id int, cname varchar(20));

insert into customer values(1, 'abc'), (2, 'def'), (3, 'ghi'), (4, 'jkl'), (5, 'mno'), (6, 'pqr');

select * from customer;

grant all privileges on ecom. * to test;

show grants for test;

revoke all privileges on ecom.* from test;

show grants for test;

grant select on ecom.* to test;

-- create user yash and give them a select privilege on a specific column
-- and give him select and update priveleges
-- you have to create a role name as sale and in that role add two user yash and aditiya GIVE THE SELECT AND INSERT PRIVILAGES TO ROLE AND ASSIGN THIS PARTICULAR ROLE IN YOUR TABLE


select * from mysql.user;

create user yash identified by 'yash123';

drop user yash;

drop user test;

drop database ecom;

create database ecommerce;

use ecommerce;

create table products(id int, products_name varchar(20), price int);

drop table products;

insert into products values(1, "laptop", 10000), (2, "mobile", 20000), (3, "tablet", 30000), (4, "mouse", 40000), (5, "iphone", 50000), (6, "speaker", 60000);

select * from products;

grant select on products.products_name to yash;

REVOKE ALL PRIVILEGES ON ecommerce.products FROM 'yash'@'%';

SHOW GRANTS FOR 'yash'@'%';

select user, host from mysql.user where user = 'yash';

-- create user yash and give them a select privilege on a specific column
grant select (products_name) on ecommerce.products to 'yash'@'%';

use ecommerce;

-- and give him select and update priveleges
grant select (products_name, price, id), update (products_name, price, id) on ecommerce.products to 'yash'@'%';

show grants for yash;

-- -- you have to create a role name as sale and in that role add two user yash and aditiya GIVE THE SELECT AND INSERT PRIVILAGES TO ROLE AND ASSIGN THIS PARTICULAR ROLE IN YOUR TABLE
 create role sale;
 
 
grant select, insert on products to sale;

create user 'rajveer'@'%' identified by 'rajveer@123';

create user 'aditiya'@'%' identified by 'aditiya@123';

grant sale to 'rajveer'@'%';

grant sale to 'aditiya'@'%';

set default role sale to 'rajveer'@'%';

set default role sale to 'aditiya'@'%';





