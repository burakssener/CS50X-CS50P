SELECT DISTINCT(name)
FROM people
JOIN stars on stars.person_id = people.id
WHERE movie_id IN (SELECT id FROM movies WHERE year = 2004)
ORDER BY birth;