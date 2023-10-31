SELECT title
FROM movies
JOIN ratings ON ratings.movie_id = movies.id
WHERE id IN (SELECT movie_id FROM ratings WHERE movie_id IN (SELECT movie_id FROM stars WHERE person_id = (SELECT id FROM people WHERE name = "Chadwick Boseman" )))
ORDER BY rating
LIMIT 5;
SELECT title
FROM movies;
