use sakila;

select * from customer;

select round(10.4);

select 10.5, round(10.5);

select round(10.35, 1);

select round(45.15, -1);

select round(42.58, -1);

select round(46.98, -1);

select round(43.25, -1);

select round(47.89, -2);

select round(45.58, -2);

select round(54.65, -2);

select truncate(76.35, 1);

select truncate(77.98, 1);

-- truncate :=> is use to extract the value

select round(76.58, 1);

-- group-by-test

select * from payment;


select staff_id, count(*) from payment group by staff_id;

-- get the city name and district where the district do not have 'noord' keyword
select c.name as city_name, c.district as district_name from city as c join country as co on c.countrycode = co.code where c.district not like '%Noord%';

select * from city;

select * from country;

-- get the total no. of cities present in each country having the population greater than 1.5 lakhs
select co.name as country_name, count(c.id) as total_cities from country as co join city as c on c.countrycode = co.code  where c.population > 150000 group by co.name order by total_cities desc;


-- get the district name which has more than two city
select c.district as district_name, count(c.id) as city_count from city as c join country as co on c.countrycode = co.code group by c.district having count(c.id) > 2 order by city_count desc;


-- find the city_name, country_code, country_name where the country population is greater than 50000? 
select c.name as city_name, co.code as country_code, co.name as country_name from city as c join country as co on c.countrycode = co.code where co.population > 50000; 


-- get the district and the total population for each country
select co.name as country_name, c.district as district_name, sum(c.population) as total_population from city as c join country as co on c.countrycode = co.code group by co.name, c.district order by co.name, c.district;



