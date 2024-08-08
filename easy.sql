-- 1. Who is the senior most employee based on job title?
select * from employee
order by levels desc 
limit 1;

-- 2. Which countries have the most Invoices?
select billing_country , count(billing_country) as c
from invoice
group by billing_country
order by c desc;


-- 3. What are top 3 values of total invoice?
select total
from invoice
order by total desc
limit 3;

-- 4. Which city has the best customers? We would like to throw a promotional Music
-- Festival in the city we made the most money. Write a query that returns one city that
-- has the highest sum of invoice totals. Return both the city name & sum of all invoice
-- totals
select billing_city,sum(total) as s
from invoice
group by billing_city
order by s desc
limit 1;

-- 5. Who is the best customer? The customer who has spent the most money will be
-- declared the best customer. Write a query that returns the person who has spent the
-- most money
-- solution break the problem into small steps.. specialization...

--  solution 1-> nested queries..
select * from customer;
select customer_id , sum(total)
from invoice
group by customer_id
order by sum(total) desc;

select first_name, last_name from customer
where customer_id IN
(select customer_id 
from invoice
group by customer_id
order by sum(total) desc
limit 1);

--  sol 2 -> with join
select i.customer_id , first_name ,last_name , sum(total)  
from customer as c
inner join invoice as i
on c.customer_id = i.customer_id
group by i.customer_id
order by total desc;