-- (INNER) JOIN: Returns records that have matching values in both tables
-- LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
-- RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
-- FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table

select * from store
right join address 
on store.address_id = address.address_id;


--Aggregate data using count function and group by command

select customer.customer_id, customer.first_name, customer.last_name, count(rental.rental_id) rentals_checked_out
from customer
left join rental
on rental.customer_id  = customer.customer_id
group by customer.customer_id;