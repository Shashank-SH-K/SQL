use sakila;

select * from customer;

select * from rental;

select * from payment;

select * from film;

select * from inventory;

select c.first_name, r.rental_id, p.amount from customer c left join rental r on c.customer_id = r.customer_id left join payment p on r.rental_id = p.rental_id;

select c.first_name, r.rental_id, p.amount from customer c left join rental r on c.customer_id = r.customer_id left join payment p on r.rental_id = p.rental_id;

select f.title, i.inventory_id, r.rental_date from film f join inventory i on f.film_id = i.film_id left join rental r on i.inventory_id = r.inventory_id;

select f.title, i.inventory_id, r.rental_id from film f left join inventory i on f.film_id = i.film_id left join rental r on i.inventory_id = r.inventory_id where i.inventory_id is null and r.rental_id is null;

select * from t1;

select * from t2;

select count(*) as total from t1 cross join t2;

select * from store;

select * from customer;

select c.first_name, s.store_id from customer c cross join store s;

select * from actor;

select * from language;

select a.first_name, l.name from actor a cross join language l;


select count(*) as total from t1 cross join t2;


select * from store;

select c.first_name, s.store_id from customer c cross join store s;

select * from employees;

select e1.e_id, e2.manager_id from employees e1 left join employees e2 on e1.e_id = e2.manager_id;

select * from employees e1 left join employees e2 on e1.e_id = e2.manager_id;

select * from customer;

use sakila;

select * from employees;

-- select c1.first_name, c2.address_id from customer c1 left join customer c2 on c1.first_name = c2.address_id;

select * from employees e1 left join employees e2 on e1.e_id = e2.manager_id;

select e1.name, e2.name as manager_name from employees e1 left join employees e2 on e1.e_id = e2.manager_id;

select * from t1;

select * from t2;

select e1.name as manager, e2.name as manager_name from employees e1 right join employees e2 on e1.e_id = e2.manager_id;


select * from customer;


select c1.first_name, c2.address_id as address from customer c1 left join customer c2 on c1.customer_id = c2.address_id;

	-- Q1. you have to find customer name with same address_id
select c1.first_name, c1.address_id, c2.first_name, c2.address_id from customer c1 inner join customer c2 on c1.address_id = c2.address_id and c1.customer_id < c2.customer_id;


select * from t1;

select * from t2;

select count(*) as total_records from t1 cross join t2;

select * from t1 union select * from t2;

-- union=> show the all t1 records and show all the t2 records which is not present in the t1 record(union removes duplicate values)

-- union all=> show all the t1 records and show all the t2 records and does not remove duplicate values.

select * from t1 union all select * from t2;

select store_id, first_name from customer union all select store_id, address_id from store; 

-- full join => cobination of left join + right join

select * from t1 
left join t2 on t1.id = t2.id
union all
select * from t1
right join t2 on t1.id = t2.id;

select * from t1 left join t2 on t1.id = t2.id union select * from t1 right join t2 on t1.id = t2.id;

use sakila;

select round(10.5) as result;

select round(10.4) as result2;

select round(10.46, 1) as result;

select round(44.58, -1);

select round(45.89, -1);

select round(45.90, -2);

select round(45.86, -2);

select round(54.89, -2);

select round(76.67, -2);

select round(46.39, -2);

select round(76.89, -2);

select round(49.29, -2);

select truncate(65.98, 1) as result;

select truncate(46.59, 1) as result;

select truncate(43.78, 1) as result2;

select round(76.35, 1) as result;
-- comma 1 ka matlab hai main point ke baad wali value ko round karna chahta hu

select round(76.89, -1) as result; 
-- -1 means point ke phle waali value ko round karna chahta hu aur round hoga kuch aise for ex=> 35 ya 37 see point see phle toh output hoga 40
-- aur round hoga kuch aise for ex:=> agar main 24 yaa 23 hai toh output main 20 aayega

select round(73.39, -2) as result;
--  -2 hone pee output yaa toh 0 main aayega yaa phir 100 main aayega agar point see phle waali value less than 50 hai toh output 0 aayega
-- aur agar point see phle waali value 50 yaa phir greater than 50 hai toh output 100 main aayega


select mod(13, 4) as result; 
-- mod() give you the remainder

select pow(3, 3) as result;
-- pow() 3 ki power 3 means 27 will be the output

select floor(7.999) as result; 
 
 select floor(5.999) as result; 

select floor(67.999) as result; 

-- floor () point see phle waali value output main deta hai

select ceil(2.30) as result; 

select ceil(2.01) as result;

-- ceil () function hamesha increment value output main deta hai

-- date and time functions:=> 

select curtime(); 
-- this function give you the current time in the output

select curdate();
-- this function give you the current date  

select current_timestamp();
-- this function give you the current date and current time

select now(); 
-- this function also show the current date and time 

select adddate(now(), 20);
-- iss example main maine current date main 20 din add kar diye 

-- adddate() syntax :=> adddate(column_name, number of days are add)

select adddate(now(), interval 2 month);
-- 2 month added in the current date

select adddate(now(), interval 2 year); 
-- 2 year added in the current date

select adddate(now(), interval 2 hour); 
-- 2 hour added in the current time 


select adddate(now(), interval 2 minute); 
-- 2 minute added in the current time 

select adddate(now(), interval 2 second); 
-- 2 second added in the current time 


select now(), extract(year from now()) as year;

select now(), extract(month from now()) as month;

select now(), extract(hour from now()) as result;

select now(), date_format(now(), 'year is %Y AND MONTH IS %M') AS DATE_FORMAT;


-- Q1. HOW MANY TIMES 2.99 COMES IN THE AMOUNT COLUMN CHECK THE COUNT
select count(amount) as total_count from payment where amount = 2.99; 


-- Q2. check how many times amount values occur 
select amount, count(*) from payment group by amount;


-- Q3. check har staff nee kitne payment kare and sum of their payments
select staff_id, count(amount), sum(amount) from payment group by staff_id;
select staff_id, count(*), sum(amount) from payment group by staff_id; -- ye waala code zayda effective hai kyuki isme count ke saath main * use kiya hai


-- Q4. each customer nee kitna payment kiya iss question main sum() ka use karege amount column par kyuki question main total amount spend pucha hai
select customer_id,  sum(amount) from payment group by customer_id;


-- note:=> agar total number of transcation pucha jaata toh hum count() ka use karte  

-- Q. An interviewer ask in interview can we use where clause with group by for filtering the data answer is yes we can 

-- 	Q. mujhe customer_id 3 see upar waalo ka hee total sum niklana hai
select customer_id, sum(amount) as total_amount_spend from payment where customer_id > 3 group by customer_id;

-- Q. mujhe unhe customer ka sum niklana hai jinka sum 100 see jayda hai
select customer_id, sum(amount) as total_amounts from payment group by customer_id having total_amounts > 100;


-- rules of where clause :=>  
-- where ke saath aggregate function use nahi kar sakte hai 
-- where ke saath hum sirf ussi data ko filter kar sakte hai jo ki already humari table main present hai

select * from payment;

-- Q. i need to get that particular customers and the amount spend in the month of june where the total amount spend exceed amount 50
select customer_id, sum(amount) as total_amounts from payment where month(payment_date) = 6 group by customer_id having total_amounts > 50;


-- Q. i need to find out how much amount spend by each customer in each month 
select customer_id, month(payment_date) as months, sum(amount) as total_amount from payment group by customer_id, months;


-- Q. find the average amount spended in each month by the staff
select staff_id, month(payment_date) as months, avg(amount) as average from payment group by staff_id, months order by staff_id, months; 


-- Q. difference between having and where clause

-- Q. difference between distinct and group by

-- Q. what is SQL and type of sql languages

use sakila;
 
 select * from payment;
 
 select count(payment_id) from payment where staff_id = 1;
 
 
 select staff_id, count(payment_id) from payment group by staff_id having count(payment_id) > 8000;
 
 select staff_id, count(*) from payment where amount = 4.99 group by staff_id having staff_id = 1; 
 
 
 
