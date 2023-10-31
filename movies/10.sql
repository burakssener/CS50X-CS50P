SELECT DISTINCT(name)
FROM people
JOIN directors ON directors.person_id = people.id
WHERE = (SELECT id)
WHERE rating >= 9.0;