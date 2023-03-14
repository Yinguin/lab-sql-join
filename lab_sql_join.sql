USE sakila;

# 1. List the number of films per category.
SELECT C.name, COUNT(F. film_id) AS num_of_films
FROM category C
INNER JOIN film_category F
ON C.category_id = F.category_id
GROUP BY C.name;

# 2. Display the first and the last names, as well as the address, of each staff member.
SELECT S.first_name, S.last_name, A.address
FROM staff S
INNER JOIN address A
ON S.address_id = A.address_id;

# 3. Display the total amount rung up by each staff member in August 2005.
SELECT P.staff_id, S.first_name, S.last_name, SUM(amount) AS total_amount_aug05 
FROM payment P 
INNER JOIN staff S 
ON P.staff_id = S.staff_id
WHERE DATE_FORMAT(payment_date, '%Y-%m') LIKE '2005-08%'
GROUP BY P.staff_id;

# 4. List all films and the number of actors who are listed for each film.
SELECT F.title, COUNT(actor_id) AS num_of_actors
FROM film F
INNER JOIN film_actor A
ON F.film_id = A.film_id
GROUP BY title;

# 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT C.last_name, C.first_name, SUM(amount) AS total_amount
FROM payment P
INNER JOIN customer C
ON P.customer_id = C.customer_id
GROUP BY P.customer_id
ORDER BY C.last_name;