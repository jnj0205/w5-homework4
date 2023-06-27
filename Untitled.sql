--1. List all customers who live in Texas (use JOINs)
SELECT first_name, last_name, district
FROM customer c
JOIN address a 
ON c.address_id = a.address_id 
WHERE district = 'Texas';

--2. List all payments of more than $7.00 with the customer’s first and last name 
SELECT first_name, last_name, amount
FROM customer c 
JOIN payment p 
ON c.customer_id = p.customer_id
WHERE amount > 7.00;

--3. Show all customer names who have made over $175 in payments (use
--subqueries)
SELECT*
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING sum(amount) > 175
);

--4. List all customers that live in Argentina (use the city table)
SELECT c.first_name, c.last_name, a.address, a.district, a.city_id, ci.city, ci.country_id, co.country
FROM customer c 
JOIN address a 
ON c.address_id = a.city_id 
JOIN city ci
ON ci.city_id = a.city_id
JOIN country co
ON co.country_id = ci.country_id
WHERE country = 'Argentina';


--5. Show all the film categories with their count in descending order
SELECT fc.category_id, c.name, count(film_id) 
AS num_movies_in_cat
FROM film_category fc
JOIN category c 
ON fc.category_id = c.category_id 
GROUP BY c.name, fc.category_id 
ORDER BY count(film_id) DESC;

--6. What film had the most actors in it (show film info)?
SELECT f.film_id, count(*) AS num_actors, title
FROM film_actor fa
JOIN film f
ON fa.film_id = f.film_id
GROUP BY f.film_id, title 
ORDER BY num_actors DESC
LIMIT 1;

--7. Which actor has been in the least movies?
SELECT a.actor_id, a.first_name, a.last_name, count(*) AS num_movies
FROM actor a
JOIN film_actor AS fa ON a.actor_id = fa.actor_id 
GROUP BY a.actor_id, a.first_name, a.last_name 
ORDER BY num_movies ASC 
LIMIT 1;

--8. Which country has the most cities?
SELECT country, count(*) AS num_cities
FROM city 
JOIN country
ON city.country_id = country.country_id 
GROUP BY country.country
ORDER BY num_cities DESC 
LIMIT 5;

--9. List the actors who have been in between 20 and 25 films.

SELECT a.first_name, a.last_name, count(*) AS total
FROM film_actor fa
JOIN actor a 
ON a.actor_id  = fa.actor_id 
GROUP BY a.actor_id
HAVING count(*) BETWEEN 20 AND 25;



