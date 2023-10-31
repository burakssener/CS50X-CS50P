-- Keep a log of any SQL queries you execute as you solve the mystery.

JULY 28, Humphrey Street
The THIEF is:
The city the thief ESCAPED TO:
The ACCOMPLICE is:

SELECT *
FROM crime_scene_reports
LIMIT 10

SELECT description
FROM crime_scene_reports
WHERE month = 7 AND day = 28 AND street = "Humphrey Street";

-- DESCRIPTION : | Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery.
-- Interviews were conducted today with three witnesses who were present at the time
--– each of their interview transcripts mentions the bakery. |
-- | Littering took place at 16:36. No known witnesses.

--BAKERY AND 16.36

SELECT *
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND hour = 10;



SELECT *
FROM (SELECT *
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND hour = 9 AND activity = "entrance")
WHERE month = 7 AND day = 28 AND hour = 11 AND activity = "exit";

