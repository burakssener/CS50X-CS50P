SELECT AVG(energy)
FROM songs
WHERE artist_id = (SELECT artist_id FROM artists WHERE name = "Drake");