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
WHERE month = 7 AND (hour = 10 OR hour = 11) AND day = 28 AND activity = "exit");
-- +---------------+
| license_plate |
+---------------+
| 4328GD8       |
| 5P2BI95       |
| 6P58WS2       |
| G412CB7       |
+---------------+

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

+--------+---------+----------------+-----------------+---------------+
|   id   |  name   |  phone_number  | passport_number | license_plate |
+--------+---------+----------------+-----------------+---------------+
| 221103 | Vanessa | (725) 555-4692 | 2963008352      | 5P2BI95       |
| 243696 | Barry   | (301) 555-4174 | 7526138472      | 6P58WS2       |
| 398010 | Sofia   | (130) 555-0289 | 1695452385      | G412CB7       |
| 467400 | Luca    | (389) 555-5198 | 8496433585      | 4328GD8       |
+--------+---------+----------------+-----------------+---------------+

--looking for the id of the flights that are happened by these people with their passport_numbers
SELECT *
FROM passengers
JOIN flights
ON passengers.flight_id = flights.id
WHERE passport_number IN
(SELECT passport_number
FROM people
WHERE license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 9 OR hour = 10) AND  activity = "entrance" AND license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 10 OR hour = 11) AND activity = "exit")));

+-----------+-----------------+------+----+-------------------+------------------------+------+-------+-----+------+--------+
| flight_id | passport_number | seat | id | origin_airport_id | destination_airport_id | year | month | day | hour | minute |
+-----------+-----------------+------+----+-------------------+------------------------+------+-------+-----+------+--------+
| 2         | 2963008352      | 6C   | 2  | 2                 | 8                      | 2021 | 7     | 30  | 12   | 44     |
| 11        | 8496433585      | 5D   | 11 | 8                 | 12                     | 2021 | 7     | 30  | 13   | 7      |
| 20        | 2963008352      | 6B   | 20 | 6                 | 8                      | 2021 | 7     | 28  | 15   | 22     |
| 36        | 1695452385      | 3B   | 36 | 8                 | 4                      | 2021 | 7     | 29  | 8    | 20     |
| 36        | 8496433585      | 7B   | 36 | 8                 | 4                      | 2021 | 7     | 29  | 8    | 20     |
| 39        | 2963008352      | 8C   | 39 | 5                 | 8                      | 2021 | 7     | 27  | 22   | 37     |
| 48        | 8496433585      | 7C   | 48 | 5                 | 8                      | 2021 | 7     | 30  | 18   | 28     |
+-----------+-----------------+------+----+-------------------+------------------------+------+-------+-----+------+--------+

-- ordering by passport_number to see if someone came to the city before the event and escape from city after the event

SELECT *
FROM passengers
JOIN flights
ON passengers.flight_id = flights.id
WHERE passport_number IN
(SELECT passport_number
FROM people
WHERE license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 9 OR hour = 10) AND  activity = "entrance" AND license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 10 OR hour = 11) AND activity = "exit")))
ORDER BY day;


+-----------+-----------------+------+----+-------------------+------------------------+------+-------+-----+------+--------+
| flight_id | passport_number | seat | id | origin_airport_id | destination_airport_id | year | month | day | hour | minute |
+-----------+-----------------+------+----+-------------------+------------------------+------+-------+-----+------+--------+
| 39        | 2963008352      | 8C   | 39 | 5                 | 8                      | 2021 | 7     | 27  | 22   | 37     |
| 20        | 2963008352      | 6B   | 20 | 6                 | 8                      | 2021 | 7     | 28  | 15   | 22     |
| 36        | 1695452385      | 3B   | 36 | 8                 | 4                      | 2021 | 7     | 29  | 8    | 20     |
| 36        | 8496433585      | 7B   | 36 | 8                 | 4                      | 2021 | 7     | 29  | 8    | 20     |
| 2         | 2963008352      | 6C   | 2  | 2                 | 8                      | 2021 | 7     | 30  | 12   | 44     |
| 11        | 8496433585      | 5D   | 11 | 8                 | 12                     | 2021 | 7     | 30  | 13   | 7      |
| 48        | 8496433585      | 7C   | 48 | 5                 | 8                      | 2021 | 7     | 30  | 18   | 28     |
+-----------+-----------------+------+----+-------------------+------------------------+------+-------+-----+------+--------+
--looking airport_ids to understand where they are flying and when
SELECT *
FROM airports
LIMIT 10;

+----+--------------+-----------------------------------------+---------------+
| id | abbreviation |                full_name                |     city      |
+----+--------------+-----------------------------------------+---------------+
--| 1  | ORD          | O'Hare International Airport            | Chicago       |
--| 2  | PEK          | Beijing Capital International Airport   | Beijing       |
--| 3  | LAX          | Los Angeles International Airport       | Los Angeles   |
--| 4  | LGA          | LaGuardia Airport                       | New York City |
--| 5  | DFS          | Dallas/Fort Worth International Airport | Dallas        |
--| 6  | BOS          | Logan International Airport             | Boston        |
| 7  | DXB          | Dubai International Airport             | Dubai         |
| 8  | CSF          | Fiftyville Regional Airport             | Fiftyville    |
| 9  | HND          | Tokyo International Airport             | Tokyo         |
| 10 | CDG          | Charles de Gaulle Airport               | Paris         |
+----+--------------+-----------------------------------------+---------------+

-- bank accounts of these people

SELECT *
FROM bank_accounts
JOIN people
ON bank_accounts.person_id = people.id
WHERE person_id IN (SELECT id
FROM people
WHERE license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 9 OR hour = 10) AND  activity = "entrance" AND license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 10 OR hour = 11) AND activity = "exit")));

+----------------+-----------+---------------+--------+-------+----------------+-----------------+---------------+
| account_number | person_id | creation_year |   id   | name  |  phone_number  | passport_number | license_plate |
+----------------+-----------+---------------+--------+-------+----------------+-----------------+---------------+
| 28500762       | 467400    | 2014          | 467400 | Luca  | (389) 555-5198 | 8496433585      | 4328GD8       |
| 56171033       | 243696    | 2018          | 243696 | Barry | (301) 555-4174 | 7526138472      | 6P58WS2       |
+----------------+-----------+---------------+--------+-------+----------------+-----------------+--



-- TRANSACTIONS of these people 2 people that have bank account

SELECT *
FROM atm_transactions
WHERE account_number IN (SELECT account_number
FROM bank_accounts
JOIN people
ON bank_accounts.person_id = people.id
WHERE person_id IN (SELECT id
FROM people
WHERE license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 9 OR hour = 10) AND  activity = "entrance" AND license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 10 OR hour = 11) AND activity = "exit"))))
ORDER BY day;

+------+----------------+------+-------+-----+----------------------+------------------+--------+
   ...> |  id  | account_number | year | month | day |     atm_location     | transaction_type | amount |
   ...> +------+----------------+------+-------+-----+----------------------+------------------+--------+
   ...> | 7    | 28500762       | 2021 | 7     | 26  | Leggett Street       | deposit          | 75     |
   ...> | 246  | 28500762       | 2021 | 7     | 28  | Leggett Street       | withdraw         | 48     |
   ...> | 48   | 56171033       | 2021 | 7     | 26  | Leggett Street       | deposit          | 50     |
   ...> | 183  | 56171033       | 2021 | 7     | 27  | Blumberg Boulevard   | deposit          | 20     |
   ...> | 292  | 56171033       | 2021 | 7     | 28  | Daboin Sanchez Drive | deposit          | 70     |
   ...> | 386  | 56171033       | 2021 | 7     | 29  | Blumberg Boulevard   | withdraw         | 85     |
   ...> | 391  | 56171033       | 2021 | 7     | 29  | Daboin Sanchez Drive | withdraw         | 20     |
   ...> | 441  | 56171033       | 2021 | 7     | 29  | Humphrey Lane        | withdraw         | 90     |
   ...> | 759  | 56171033       | 2021 | 7     | 30  | Humphrey Lane        | withdraw         | 55     |
   ...> | 778  | 56171033       | 2021 | 7     | 30  | Blumberg Boulevard   | withdraw         | 40     |
   ...> | 844  | 56171033       | 2021 | 7     | 31  | Daboin Sanchez Drive | deposit          | 80     |
   ...> | 909  | 56171033       | 2021 | 7     | 31  | Carvalho Road        | withdraw         | 75     |
   ...> | 1295 | 56171033       | 2021 | 8     | 1   | Carvalho Road        | withdraw         | 55     |
   ...> +------+----------------+------+-------+-----+----------------------+------------------+--------+


-- transaction amoun ordering
SELECT account_number, SUM(CASE WHEN  transaction_type = "deposit" THEN amount ELSE 0 END) AS total_deposit, SUM(CASE WHEN  transaction_type = "withdraw" THEN amount ELSE 0 END) AS total_withdraw
FROM atm_transactions
WHERE account_number IN (SELECT account_number
FROM bank_accounts
JOIN people
ON bank_accounts.person_id = people.id
WHERE person_id IN (SELECT id
FROM people
WHERE license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 9 OR hour = 10) AND  activity = "entrance" AND license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 10 OR hour = 11) AND activity = "exit"))))
GROUP BY account_number;

+----------------+---------------+----------------+
| account_number | total_deposit | total_withdraw |
+----------------+---------------+----------------+
| 28500762       | 75            | 48             |
| 56171033       | 220           | 420            |
+----------------+---------------+----------------+

-- Phone calls from these people and phone numbers as a receiver or caller

SELECT *
FROM phone_calls
JOIN people
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

SELECT full_name, id
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


--THERE IS ONLY ONE PEOPLE THAT FLIED FROM FIFTYVILLE AIRPORT which is id = 8. We need to look the people that flied from airport 8


airports
flights
passengers
ON flights.origin_airport_id = airports.id


-- THIS TABLE SHOWS ALL SUSPECTED PEOPLES ORIGIN  AIRPORT IDS

SELECT *
FROM flights
JOIN passengers
ON passengers.flight_id = flights.id
JOIN airports
ON flights.origin_airport_id = airports.id
WHERE passport_number IN
(SELECT passport_number
FROM people
WHERE license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 9 OR hour = 10) AND  activity = "entrance" AND license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 10 OR hour = 11) AND activity = "exit")));


