SELECT COUNT(*) as 'TOTAL_SALES', CONCAT(s.first_name, ' ' , s.last_name) as NAME, SUM(r.price) as 'PROFIT'
FROM rental r
JOIN staff s
ON s.staff_id= r.staff_id
GROUP BY s.first_name, s.last_name
ORDER BY SUM(r.price) desc