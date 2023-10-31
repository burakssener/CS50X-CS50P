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

--BAKERY AND 10.15

SELECT *
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND hour = 10;



--PEOPLE'S LICENCE PLATES THAT ENTER AND EXIT TO THE BAKERY IN THE TIME THAT DUCK IS STOLEN:
SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 9 OR hour = 10) AND  activity = "entrance" AND license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND (hour = 9 OR hour = 10) AND day = 28 AND activity = "exit");

-- looking phone calls TABLE
SELECT *
FROM phone_calls
LIMIT 10

-- learning phone numbers of these people with names and passport_number

SELECT *
FROM people
WHERE license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 9 OR hour = 10) AND  activity = "entrance" AND license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 10 OR hour = 11) AND activity = "exit"));

-- Phone calls from these people and phone numbers as a receiver or caller

SELECT *
FROM phone_calls
WHERE caller IN (SELECT phone_number
FROM people
WHERE license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 9 OR hour = 10) AND  activity = "entrance" AND license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 10 OR hour = 11) AND activity = "exit")))
OR receiver IN (SELECT phone_number
FROM people
WHERE license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 9 OR hour = 10) AND  activity = "entrance" AND license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 10 OR hour = 11) AND activity = "exit")));

--looking for the id of the flights that are happened by these people with their passport_numbers
SELECT flight_id
FROM passengers
WHERE passport_number IN
(SELECT passport_number
FROM people
WHERE license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 9 OR hour = 10) AND  activity = "entrance" AND license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 10 OR hour = 11) AND activity = "exit")));


-- looking flights that match with flight ids that We found

SELECT *
FROM flights
WHERE id IN (SELECT flight_id
FROM passengers
WHERE passport_number IN
(SELECT passport_number
FROM people
WHERE license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 9 OR hour = 10) AND  activity = "entrance" AND license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 10 OR hour = 11) AND activity = "exit"))));

-- we need to determine where they are flying to eleminate candidates

SELECT full_name
FROM airports
WHERE id IN (SELECT origin_airport_id
FROM flights
WHERE id IN (SELECT flight_id
FROM passengers
WHERE passport_number IN
(SELECT passport_number
FROM people
WHERE license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 9 OR hour = 10) AND  activity = "entrance" AND license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 10 OR hour = 11) AND activity = "exit")))));


--THERE IS ONLY ONE PEOPLE THAT FLIED FROM FIFTYVILLE AIRPORT