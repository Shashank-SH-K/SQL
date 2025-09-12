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

