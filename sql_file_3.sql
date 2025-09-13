use sakila;

select * from customer;

select * from payment;

select min(amount) from payment;
-- 0.00 

select max(amount) from payment;
-- 11.99

select * from payment;

select amount, if(amount < 5, "lower", "higher") as category from payment;

select amount,
case 
	when amount < 5.00 then 'low'
    when amount > 5 and amount < 9 then 'medium'
    else 'higher'
    end as result from payment;
    
    

select st_id, st_name, marks,
case
	when marks >= 90 and marks <= 100 then 'toppers'
    when marks >= 80 and marks <= 89 then 'A'
    when marks >= 70 and marks <= 79 then 'B'
    when marks >= 60 and marks <= 69 then 'C'
    when marks >= 50 and marks <= 59 then 'D'
    else 'Fail'
    end as grades from student
    
    

-- Create the sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    category VARCHAR(20),
    quantity INT,
	region VARCHAR(20),
    price DECIMAL(10,2),
    sale_date DATE
);

-- Insert 10 sample rows
INSERT INTO sales (product_name, category, quantity, price, sale_date, region) VALUES
('iPhone 14', 'Mobile', 2, 999.99, '2025-08-01', 'North'),
('Samsung Galaxy S23', 'Mobile', 3, 899.99, '2025-08-02', 'West'),
('OnePlus 11', 'Mobile', 1, 749.50, '2025-08-03', 'North'),
('MacBook Pro 14', 'Laptop', 2, 1999.99, '2025-08-04', 'South'),
('Dell XPS 13', 'Laptop', 1, 1399.00, '2025-08-05', 'West'),
('HP Spectre x360', 'Laptop', 3, 1250.75, '2025-08-06', 'East'),
('iPad Pro 12.9', 'Tablet', 2, 1099.49, '2025-08-07', 'West'),
('Samsung Galaxy Tab S9', 'Tablet', 4, 849.99, '2025-08-08', 'East'),
('Microsoft Surface Pro 9', 'Tablet', 1, 999.00, '2025-08-09', 'South'),
('Lenovo Tab P12 Pro', 'Tablet', 2, 699.50, '2025-08-10', 'East');


select * from sales;

select product_name, category, quantity from sales group by product_name, category, quantity;


select category, count(*) from sales group by category;

select * from sales;

select category, sum(price) from sales group by category;

select category, sum(price) from sales group by category;




-- always use "group by" after the "where clause"
-- use where clause with group by 

select * from sales;

select category, sum(price) from sales where price < 900 group by category;



-- use having with group by 

-- always use having after group by 

-- having => filter out the group by result 

-- we cannot use aggregate function with having clause 

select category, sum(price) from sales where price < 900 group by category having category != 'tablet'; 

-- Step 1: Create the sales table
CREATE TABLE sale (
  sale_id INT PRIMARY KEY,
  sale_date DATE,
  product_name VARCHAR(100),
  region VARCHAR(50),
  quantity_sold INT,
  price_per_unit DECIMAL(10, 2)
);

-- Step 2: Insert sample data
INSERT INTO sale (
  sale_id,
  sale_date,
  product_name,
  region,
  quantity_sold,
  price_per_unit
) VALUES
  (1001, '2025-08-01', 'Laptop',      'North',  5, 50000.00),
  (1002, '2025-08-02', 'Smartphone',  'South', 10, 30000.00),
  (1003, '2025-08-03', 'Headphones',  'East',  15, 2000.00),
  (1004, '2025-08-04', 'Keyboard',    'West',   8, 1500.00),
  (1005, '2025-08-05', 'Mouse',       'North', 12, 800.00),
  (1006, '2025-08-06', 'Monitor',     'South',  7, 12000.00),
  (1007, '2025-08-07', 'Printer',     'East',   3, 15000.00),
  (1008, '2025-08-08', 'Tablet',      'West',   6, 25000.00);
  
  
   select * from sale;


-- average quantity sold per product
select product_name, avg(quantity_sold) as result from sale group by product_name;



-- number of distinct product sold per rgion 
select region, count(*) as result from sale group by region;


-- Number of transactions per product per region
select distinct product_name, region, count(*) as result from sale group by product_name, region;


-- Identify regions where more than 2 types of products were sold
select region, count(distinct product_name) as result from sale group by region having count(distinct product_name) > 2;


-- Total quantity and average price per unit of 'Mobile' across all regions 
select product_name, sum(quantity_sold) as quantity, avg(price_per_unit) as average from sale where product_name = 'mobile';


-- Find total sales revenue per year
select year(sale_date) as oneyear, sum(price_per_unit) as price from sale group by oneyear;


-- Monthly breakdown per year (uses both YEAR and MONTH) 
select year(sale_date) as year, month(sale_date) as month, count(*) from sale group by year, month;


select * from sales;


select distinct category from sales;  

select distinct(category), count(category) as quantity, sum(price) as total_results from sales group by category;

select distinct(category), count(category) as quantity, sum(price) as total from sales group by category having quantity > 3;

select * from sales;

select distinct category, count(category) as total_quantity, sum(price) as total_price from sales group by category having category != 'tablet';



-- group by with where clause:=> using where clause we apply the condition firstly before applying group by

select distinct category, count(category) as quantity from sales where category != 'tablet' group by category;


-- joins 

-- using joins we combine two or more tables 

-- 1 column is always same before performing joins

-- we also perform join in one table 


select * from customer;

select * from payment;

-- what is inner join

-- inner join is basically to show the matching records between two tables



CREATE TABLE t2 (
    id INT
);

INSERT INTO t2 (id) VALUES (1), (1), (2), (3), (4), (5);



select * from t1;


select * from t2;


drop table t1;

CREATE TABLE t1 (
    id INT
);

INSERT INTO t1 (id) VALUES (1), (2), (3), (4), (5), (6);

select * from t1;

select * from t2;

-- syntax of inner join
-- select table1name.colname, table2name.colname from lefttablename nameofjoin righttablename on lefttable.col=righttable.col
-- we can perform inner join without primary key or foreign key 

select * from customer;

select * from t1 inner join t2 on t1.id = t2.id;

select * from customer;

select * from payment;

-- join 2 tables like customer table or payment table 
select * from customer inner join payment on customer.customer_id = payment.customer_id;


select customer.first_name, payment.amount from customer inner join payment on customer.customer_id = payment.customer_id;

-- we apply group by because names are repeating in first_name group by filter the group of first_name and i want total amount paid by the customer

select customer.first_name, sum(payment.amount) from customer inner join payment on customer.customer_id = payment.customer_id group by customer.first_name; 
 
 
select * from t2 where id is null; 
-- this query will return only null values

 
 select * from t2 where id is not null;
 -- this query will return other than null values
 
 



 -- left outer join => in left outer join we have left table data and we also have inner join data 
 -- left outer join main aapke left table ka data rahega or aapke inner join waala data bee rahega 
 
 select * from t1;
 
 select * from t2;
 
 
 select * from t1 inner join t2 on t1.id = t2.id;
 
 select * from t1 left join t2 on t1.id = t2.id;
 
 
 
 -- right join is opposite of left join

select * from t1 right join t2 on t1.id = t2.id; 


select * from customer;

select * from sales;

select * from payment;

select * from rental;

-- 	Q. rental_id, first_name, total amount 

select c.first_name, r.rental_id, p.amount from customer c left join rental r on c.customer_id = r.customer_id left join payment p on p.customer_id = r.customer_id group by p;

select * from sales;

select category, count(*) as quantity, sum(price) from sales group by category;

select category, count(*) as quantity from sales group by category having quantity < 4;

select * from sales;

drop table sales;

select category, count(*) as quantity from sales group by category;

select product_name, quantity_sold as quantity, region from sale group by product_name, quantity_sold, region;

select product_name, quantity_sold from sale where region != 'North' group by  product_name, quantity_sold;

select * from sale;


select product_name, quantity_sold from sale where product_name = 'Laptop' group by product_name, quantity_sold;
-- i can do this task using having clause
select product_name, quantity_sold from sale group by product_name, quantity_sold having product_name = 'Laptop';


select * from customer;

select * from payment;

select * from t1;

select * from t2;

select * from t1 inner join t2 on t1.id = t2.id;


select c.first_name, sum(p.amount) as total_amount from customer c inner join payment p on c.customer_id = p.customer_id group by c.first_name; 

select c.first_name, sum(p.amount) as total_amount from customer c join payment p on c.customer_id = p.customer_id group by c.first_name;


select * from t1;

select * from t2 where id is null;

select * from t1;

drop table t1;

select * from t1;

select * from t2;

select * from t1 left join t2 on t1.id = t2.id;

select * from t1 right join t2 on t1.id = t2.id;

-- display customer see first_name, renatl_id, amount

select * from customer; 

select * from rental;

select * from payment;

select c.customer_id, c.first_name, r.rental_id, sum(p.amount) as total_amount from customer c left join rental r on c.customer_id = r.customer_id left join payment p on r.rental_id = p.rental_id group by c.customer_id, c.first_name, r.rental_id;

SELECT 
    c.first_name,
    r.rental_id,
    SUM(p.amount) AS total_amount
FROM customer c
LEFT JOIN rental r 
    ON c.customer_id = r.customer_id
LEFT JOIN payment p 
    ON r.rental_id = p.rental_id
GROUP BY c.customer_id, c.first_name, r.rental_id;



select * from t1;

select * from t2;

select count(*) as total from t1 cross join t2;  

select * from customer;

select * from store;

select count(*) as total from customer cross join store;

select c.first_name, s.store_id from customer c cross join store s;

select c.first_name, s.store_id from customer c cross join store s limit 4;

select * from actor;

select * from language;

select a.first_name, l.name from actor a cross join language l;

select * from t1 cross join t2;

select count(*) as total_records from t1 cross join t2;

select * from customer;

select * from store;

select c.first_name, s.store_id from customer c cross join store s;

select a.first_name, l.name from actor a cross join language l;

select * from t1;

select * from t2;

select count(*) as total from t1 cross join t2;

select * from customer;

select * from store;

select c.first_name, s.store_id from customer c cross join store s;

select * from actor;

select * from language;

select a.first_name, l.name from actor a cross join language l;

select * from customer;

-- Create the employees table
CREATE TABLE employees (
    e_id INT NULL,
    name VARCHAR(100) NOT NULL,
    manager_id INT NULL
);

DROP TABLE EMPLOYEES;
-- Insert first employee with no manager
INSERT INTO employees (e_id, name, manager_id)
VALUES (1, 'John Doe', NULL),
(2, 'Alice', 1),
(3, 'bob', 1),
(4, 'george', 3),
(5, 'marvel', 4);

select * from employees;

select e1.name, e2.manager_id from employees e1 inner join employees e2 on e1.e_id = e2.manager_id;

SELECT *
FROM Books
WHERE price = (SELECT MAX(price) FROM Books);



SELECT 
    sale_date,
    price,
    quantity_sold,
    (price * quantity_sold) AS revenue,
    SUM(price * quantity_sold) OVER (ORDER BY sale_date) AS running_total_revenue
FROM Sales
ORDER BY sale_date;



SELECT author
FROM Books
GROUP BY author
HAVING COUNT(*) > 1;

SELECT *
FROM Books b
WHERE price > (
    SELECT AVG(price)
    FROM Books
    WHERE genre = b.genre
);


SELECT author, SUM(price * quantity_sold) AS total_revenue
FROM Books
GROUP BY author;


SELECT 
    book_id,
    title,
    price,
    RANK() OVER (ORDER BY price DESC) AS price_rank
FROM Books;





SELECT 
    author_name,
    SUM(price * copies_sold) AS total_revenue
FROM 
    Books
GROUP BY 
    author_name;














SELECT 
    book_name,
    genre,
    price
FROM 
    Books b1
WHERE 
    price > (
        SELECT AVG(price)
        FROM Books b2
        WHERE b2.genre = b1.genre
    );







SELECT 
    a.author_name,
    SUM(b.price * s.quantity) AS total_revenue
FROM 
    Authors a
JOIN 
    Books b ON a.author_id = b.author_id
JOIN 
    Sales s ON b.book_id = s.book_id
GROUP BY 
    a.author_name
ORDER BY 
    total_revenue DESC;
    
    
    
    
    
    
    
    
    
    
    
    
    SELECT author_id, author_name, GROUP_CONCAT(title SEPARATOR ', ') AS books
FROM books
GROUP BY author_id, author_name
HAVING COUNT(*) > 1;


SELECT b.book_id, 
       b.title, 
       SUM(s.quantity * b.price) AS total_revenue
FROM books b
JOIN sales s ON b.book_id = s.book_id
GROUP BY b.book_id, b.title
ORDER BY total_revenue DESC
LIMIT 1;



SELECT DISTINCT c.customer_id, c.customer_name
FROM Customers c
WHERE (
    SELECT COUNT(*)
    FROM Orders o
    WHERE o.customer_id = c.customer_id
) > 1;


use sakila;

select * from actor;

select * from actor where first_name like 'E';
-- IF E NAME PRESENT IN THE FIRST_NAME IT WILL SHOW OTHERWISE SHOW NULL;

SELECT * FROM ACTOR WHERE FIRST_NAME = 'E';
-- RETURN SAME OUPUT AS ABOVE EXAMPLE 

-- FUNCTIONS => A BLOCK OF REUSEABLE CODE

SELECT FIRST_NAME, length(first_name) from actor;

select first_name, char_length(first_name) from actor;

-- length() => function give you the size in bytes

-- char-length() => function give you the size in number of characters  

select first_name, last_name, concat('Mr.', ' ', first_name, ' ', last_name) from actor;

select first_name, last_name, concat_ws(' ', 'Mr.', first_name, last_name) from actor;

select first_name, substr(first_name, 2) as results from actor;
-- it starts the character from 2 index 

select first_name, substr(first_name, 3) as results from actor; 
-- it starts the character from 3 index 

select first_name, locate("E", first_name, 5) from actor;
-- mujhe e dundhana hai first_name main woh bee first_name ki 5th positon see 
-- I want to find 'e' in first_name which is the 5th position of first_name

select first_name, reverse(first_name) as result from actor;
-- it reverse the first_name

select first_name, replace(first_name, 'E', '-') AS R1 FROM ACTOR;
-- replace e from underscore 


-- TRIM() :=> IS USE TO REMOVE THE WHITESPACE FROM THE STARING AND ENDING


select char_length(trim( '  hey  ' ));


SELECT trim(leading from ' hey ');
-- leading from is use to remove the whitespace from the starting


SELECT char_length(trim(leading from ' hey '));

-- function are of 2 types => 1).scaler function() :=> apply on one row and return one row  2).multi row function() :=> apply on multiple rows and return one or more row as output

-- aggregate function => are those function which is use to perform calculation over the rows.

select * from payment; 

select count(amount) from payment;

select sum(amount) from payment;

select avg(amount) from payment;

-- 	Q1. calculate total number of transcation, total amount spend, and average amount spend by customer_id = 1;
select count(amount) as total_count, sum(amount) as total_number_amount_spend, avg(amount) as total_number_average_amount_spend from payment where customer_id = 1;


-- Q2. calculate total number of transcation done by each customer and calculate total amount spend by each customer and calculate average amount spend by each customer  using group by
select customer_id, count(amount) as number_of_transcation, sum(amount) as total_amount_spend, avg(amount) as average_amount_spend from payment group by customer_id;


-- Q3. get the total number of customer serve by staff_id = 1
select staff_id, count(payment_id) as total_count from payment where staff_id = 1 group by staff_id; -- this is the best practice apply where clause before group by
select staff_id, count(payment_id) as number_of_payment from payment group by staff_id having staff_id = 1; 



-- Q4. Get the total amount spend and the average amount spend by customer_id = 5
select customer_id, sum(amount) as total_amount, avg(amount) as average_amount from payment where customer_id = 5 group by customer_id; -- this is the best practice apply where clause before group by
select customer_id, sum(amount) as total_amount, avg(amount) as average_amount from payment group by customer_id having customer_id = 5;


-- Q5. get the total amount spend and the maximum amount spend in the month of may
select sum(amount) as total_amount_spend, max(amount) as maximum_amount_spend from payment where month(payment_date) = 5;
select month(payment_date) as month_name, sum(amount) AS total_amount_spend, max(amount) as maximum_amount_spend from payment where month(payment_date) = 5 group by month(payment_date);


-- 	Q6. get the number of transcation and the average transcation amount done for each month
select year(payment_date) as years, month(payment_date) as months, count(amount) as number_of_transcation, avg(amount) as average_number_of_transcation from payment group by year(payment_date), month(payment_date);

-- best approch to follow year with month and with count(*) 
select year(payment_date) as years, month(payment_date) as months, count(*) as number_of_transcation, avg(amount) as average_number_of_amount from payment group by year(payment_date), month(payment_date) order by years, months;

select * from payment;