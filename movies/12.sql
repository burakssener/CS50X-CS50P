SELECT title
FROM movies
WHERE id IN (SELECT movie_id FROM stars WHERE name = "Bradley Cooper" and IN (SELECT movie_id FROM stars WHERE person_id = (SELECT id FROM people WHERE name = "Jennifer Lawrence" )));
