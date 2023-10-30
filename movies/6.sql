SELECT AVG(rating)
FROM ratings
JOIN movies ON movie_id
WHERE YEAR = "2012";