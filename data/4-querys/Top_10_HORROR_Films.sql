SELECT * 
FROM film f
LEFT JOIN category c
ON c.category_id = f.category_id
WHERE c.name= 'Horror'
ORDER BY f.rental_rate desc
LIMIT 10