/*
 * You want to watch a movie tonight.
 * But you're superstitious,
 * and don't want anything to do with the letter 'F'.
 * List the titles of all movies that:
 * 1) do not have the letter 'F' in their title,
 * 2) have no actors with the letter 'F' in their names (first or last),
 * 3) have never been rented by a customer with the letter 'F' in their names (first or last).
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */

SELECT title
FROM film WHERE title NOT LIKE '%F%'

EXCEPT

SELECT DISTINCT title FROM film
	JOIN film_actor USING (film_id)
	JOIN actor USING (actor_id)
WHERE first_name LIKE '%F%' OR last_name LIKE '%F%'

EXCEPT

SELECT DISTINCT title
FROM film
	JOIN inventory USING (film_id)
	JOIN rental USING (inventory_id)
	JOIN customer USING (customer_id)
WHERE first_name LIKE '%F%' OR last_name LIKE '%F%';
