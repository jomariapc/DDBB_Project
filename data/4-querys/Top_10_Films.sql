SELECT rd.film_id as ID, 
f.title as TITLE, 
SUM(r.total_quantity) as QUANTITY, 
SUM(r.total_quantity*r.price) as REVENUE
FROM film f
INNER JOIN rental_detail rd
ON rd.film_id = f.film_id
LEFT JOIN rental r
ON r.rental_id= rd.rental_id
group by rd.film_id, f.title
order by SUM(r.total_quantity*r.price) desc
LIMIT 10