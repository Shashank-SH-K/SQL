use tushar;

create table sale(
Sale_id int primary key auto_increment,
sale_date Date,
product_name varchar(20),
region varchar(20),
quantity_sold int,
price_per_unit decimal(10, 2)
);

insert into sale (Sale_id, sale_date, product_name, region, quantity_sold, price_per_unit) values(101, '2025-07-01', 'Laptop', 'East', 5, 55000),
(102, '2025-07-02', 'Laptop', 'West', 3, 56000),
(103, '2025-07-03', 'Mobile', 'East', 10, 15000),
(104, '2025-07-03', 'Laptop', 'East', 2, 55000),
(105, '2025-07-04', 'Mobile', 'South', 7, 14500),
(106, '2025-07-04', 'Tablet', 'North', 4, 22000),
(107, '2025-07-05', 'Mobile', 'East', 6, 15000),
(108, '2025-07-05', 'Tablet', 'North', 3, 21000);

select * from sale;


-- Q. Average quantity sold per product
select product_name, avg(quantity_sold) as total_average from sale group by product_name;


-- Q.  Number of distinct products sold per region
select region, count(distinct product_name) as number_of_distinct_product_sold from sale group by region;


-- Q. Number of transactions per product per region
select product_name, region, count(*) as total_quantity from sale group by product_name, region; 
-- number of transcation:=> ke liye hamesha count(*) ka use karna chahiye kyuki count(*) har row ko count karta hai chahe usme null values ho yaa phir naa ho
-- count(column_name):=> sirf usse row ko count karega jisme value de rakhi hogi agar kisi row main null de rakha hai toh woh row count nahi hogi  


-- Q. Identify regions where more than 2 types of products were sold
select region, count(DISTINCT product_name) as products from sale group by region having products > 2;


-- 	Q. Total quantity and average price per unit of 'Mobile' across all regions 
select region, sum(quantity_sold) as total_quantity, avg(price_per_unit) as average_price from sale where product_name = 'mobile' group by region;  

-- sabhi region milakar mobile ki kitni qunatity sale hui hai aur average price per unit kya hai mobile ka
select sum(quantity_sold) as total_quantity, avg(price_per_unit) as average_price from sale where product_name = 'Mobile';

-- Q. Find total sales revenue per year
select year(sale_date) as years, sum(quantity_sold * price_per_unit) as total_sales_revenue from sale group by years;

-- Q. Monthly breakdown per year (uses both YEAR and MONTH)
select year(sale_date) as years, month(sale_date) as months, sum(quantity_sold * price_per_unit) as total_revenue from sale group by years, months;