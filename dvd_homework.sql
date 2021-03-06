-- 1: List all customers who live in Texas (use JOINS)

SELECT first_name, last_name, district
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- 2: Get all payments above $6.99 with the customer's full name.

SELECT first_name, last_name, amount
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE (amount) > 6.99;

-- 3: Show all customers names who have made payments over $175 (use subqueries)

SELECT first_name, last_name, store_id
FROM customer
WHERE customer_id IN (
    SELECT customer_id --, SUM(amount) as total
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175.00
    ORDER BY SUM(amount) DESC
);

-- 4: List all customers that live in Nepal (use the city table)

SELECT first_name, last_name, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

-- 5: Which staff member had the most transactions?

SELECT staff_id, COUNT(staff_id)
FROM payment
GROUP BY staff_id
ORDER BY COUNT(staff_id) DESC;

-- 6: How many movies of each rating are there?

SELECT rating, COUNT(*)
FROM film
GROUP BY rating;

-- 7: Show all customers who have made a single payment above 6.99 (use Subqueries)

SELECT customer_id,
  first_name,
  last_name
FROM customer
WHERE customer_id IN
  (SELECT customer_id
  FROM payment
  WHERE amount > 6.99
  );

-- 8: How many free rentals did our stores give away?

SELECT *
FROM payment
WHERE payment.amount = 0.00;


