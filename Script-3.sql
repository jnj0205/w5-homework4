;--1. Create a Stored Procedure that will insert a new film into the film table with the
---following arguments: title, description, release_year, language_id, rental_duration,
---rental_rate, length, replace_cost, rating
SELECT *
FROM film;


CREATE OR REPLACE PROCEDURE add_film(title VARCHAR, description VARCHAR, release_year INTEGER, language_id INTEGER, rental_duration INTEGER,
rental_rate INTEGER, length INTEGER, replace_cost INTEGER, rating VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO film(title, description, release_year, language_id, rental_duration,
	rental_rate, length, replace_cost, rating)
	VALUES (title, description, release_year, language_id, rental_duration,
	rental_rate, length, replace_cost, rating);	
END;
$$;

DROP PROCEDURE IF EXISTS add_film;

SELECT *
FROM film;


CREATE OR REPLACE PROCEDURE add_film(title VARCHAR(255) , description TEXT, release_year INTEGER, language_id INTEGER, rental_duration INTEGER,
rental_rate decimal(4,2), length INTEGER, replace_cost decimal (5,2), rating VARCHAR(10))
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO film(title, description, release_year, language_id, rental_duration,
	rental_rate, length, replace_cost, rating)
	VALUES (title, description, release_year, language_id, rental_duration,
	rental_rate, length, replace_cost, rating);	
END;
$$;

--2. ---Create a Stored Function that will take in a category_id and return the number of
---films in that category
SELECT *
FROM film_category;

CREATE OR REPLACE FUNCTION get_film_count(category_id integer)
RETURNS integer
LANGUAGE plpgsql
AS $$
		DECLARE film_count integer;
BEGIN
		SELECT count(*) INTO film_count
		FROM film
		WHERE category_ig = category_id;
		RETURN film_count;
END;
$$;












