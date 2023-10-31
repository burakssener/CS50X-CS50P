SELECT title
FROM movies
WHERE id = SELECT movie_id FROM stars WHERE person_id IN (SELECT id FROM people WHERE name = "Jennifer Lawrence" or name = "Bradley Cooper")
