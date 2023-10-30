SELECT sp.special_feature as 'SPECIAL FEATURE', COUNT(f.film_id) as FILMS
FROM film f
INNER JOIN film_has_special_features fs
ON fs.film_id = f.film_id
LEFT JOIN special_features sp
ON sp.sp_id = fs.sp_id
GROUP BY sp.special_feature
