SELECT customer_id, customer_first_name, customer_last_name, actor_id, actor_first_name, actor_last_name, favorite_actor_count
FROM (
    SELECT c.customer_id, c.first_name AS customer_first_name, c.last_name AS customer_last_name,
           a.actor_id, a.first_name AS actor_first_name, a.last_name AS actor_last_name,
           COUNT(*) AS favorite_actor_count,
           ROW_NUMBER() OVER(PARTITION BY c.customer_id ORDER BY COUNT(*) DESC) AS actor_rank
    FROM blockbuster.customer c
    JOIN blockbuster.rental r ON c.customer_id = r.customer_id
    JOIN blockbuster.rental_detail rd ON r.rental_id = rd.rental_id
    JOIN blockbuster.film f ON rd.film_id = f.film_id
    JOIN blockbuster.film_has_actor fa ON f.film_id = fa.film_id
    JOIN blockbuster.actor a ON fa.actor_id = a.actor_id
    GROUP BY c.customer_id, a.actor_id
) AS Subquery
WHERE actor_rank = 1;
