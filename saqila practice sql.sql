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

select customer.customer_id, customer.first_name, customer.last_name, count(rental.rental_id) rentals_checked_out
from customer
left join rental
on rental.customer_id  = customer.customer_id
group by customer.customer_id;


--Multiple joins in one query

select a.customer_id, a.first_name, a.last_name, count(b.rental_id), d.address
from customer a
left join rental b
on b.customer_id = a.customer_id
left join store c
on c.store_id = a.store_id
left join address d
on d.address_id = c.address_id
group by a.customer_id


--U kojim je sve filmovima glumio BURT POSEY

select concat(c.first_name, ' ', c.last_name), a.title
from film a
inner join film_actor b
on a.film_id = b.film_id
inner join actor c
on c.actor_id = b.actor_id
where c.first_name = 'Burt'
and c.last_name = 'Posey';




