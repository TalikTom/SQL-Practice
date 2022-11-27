-- (INNER) JOIN: Returns records that have matching values in both tables
-- LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
-- RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
-- FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table

select * from store
right join address 
on store.address_id = address.address_id;

--select distinct

select distinct customer_id from rental;

--select where

select * from film
where length > 80 and length < 90;

--not

select * from staff
where not first_name = 'Mike';

--or

select * from staff
where first_name = 'Jon'
or first_name = 'Mike';

--order, order reverse

select * from actor
order by first_name;

select * from actor
order by first_name desc;





--Aggregate data using count function and group by command

select customer.customer_id, customer.first_name, customer.last_name, count(rental.rental_id)
from customer
left join rental
on rental.customer_id  = customer.customer_id
group by customer.customer_id;


--Multiple joins in one query

select 
	customer.customer_id, 
	customer.first_name, 
	customer.last_name, 
	count(rental.rental_id),
	address.address as store_address
from customer
left join rental
on rental.customer_id  = customer.customer_id
left join store 
on store.store_id = customer.store_id
left join address
on address.address_id = store.address_id 
group by customer.customer_id, address.address;



