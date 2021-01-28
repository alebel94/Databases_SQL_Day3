-- Week 5 - Wednesday Questions
--Alejandro Beltran

-- 1. List all customers who live in Texas (use JOINs)
SELECT * FROM address;

SELECT first_name, last_name, district
FROM customer
FULL JOIN address
on customer.address_id = address.address_id
WHERE district LIKE 'Texas';
-- Answer: 5 customers in Texas


-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, amount
FROM customer
FULL JOIN payment
on customer.customer_id = payment.customer_id
WHERE amount > 6.99;
-- Answer: 1406 payments

-- 3. Show all customers names who have made payments over $175(use subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) >175
);
-- Answer: 6 customers

-- 4. List all customers that live in Nepal (use the city table)
SELECT first_name, last_name
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';
-- Answer: 1 customer: Kevin Schuler


-- 5. Which staff member had the most transactions?
SELECT first_name, last_name, COUNT(rental_id)
FROM staff
LEFT JOIN payment
ON payment.staff_id = staff.staff_id
GROUP BY first_name, last_name;
--Answer: Jon Stephens 7304 > Mike Hiyer 7292


-- 6. How many movies of each rating are there?
SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating;
--Answer: R= 195, PG = 194, NC-17 = 210, PG-13 = 223, G = 178


-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
);
--Answer: 539 customers


-- 8. How many free rentals did our stores give away?
SELECT amount
FROM rental
FULL JOIN payment
ON rental.rental_id = payment.rental_id
WHERE payment.amount IS NULL;
--Answer: 1452
