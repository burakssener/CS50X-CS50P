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

-- ordering by date to see if someone came to the city before the event and escape from city after the event

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

+----+--------------+-----------------------------------------+---------------+
| id | abbreviation |                full_name                |     city      |
+----+--------------+-----------------------------------------+---------------+
| 1  | ORD          | O''Hare International Airport            | Chicago       |
| 2  | PEK          | Beijing Capital International Airport   | Beijing       |
| 3  | LAX          | Los Angeles International Airport       | Los Angeles   |
| 4  | LGA          | LaGuardia Airport                       | New York City |
| 5  | DFS          | Dallas/Fort Worth International Airport | Dallas        |
| 6  | BOS          | Logan International Airport             | Boston        |
| 7  | DXB          | Dubai International Airport             | Dubai         |
| 8  | CSF          | Fiftyville Regional Airport             | Fiftyville    |
| 9  | HND          | Tokyo International Airport             | Tokyo         |
| 10 | CDG          | Charles de Gaulle Airport               | Paris         |
| 11 | SFO          | San Francisco International Airport     | San Francisco |
| 12 | DEL          | Indira Gandhi International Airport     | Delhi         |
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

-- After this point I suspected from only Barry who has 56171033 account_number and check all information of him. But there was no evidence the prove this and after looking too much data
--I realized I didn't checked the interviews section, And with these information I started new analysis

SELECT *
FROM interviews
WHERE month = 7 AND day = 28;

| id  |  name   | year | month | day |                                                                                                                                                     transcript                                                                                                                                                      |
+-----+---------+------+-------+-----+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 158 | Jose    | 2021 | 7     | 28  | “Ah,” said he, “I forgot that I had not seen you for some weeks. It is a little souvenir from the King of Bohemia in return for my assistance in the case of the Irene Adler papers.”                                                                                                                               |
| 159 | Eugene  | 2021 | 7     | 28  | “I suppose,” said Holmes, “that when Mr. Windibank came back from France he was very annoyed at your having gone to the ball.”                                                                                                                                                                                      |
| 160 | Barbara | 2021 | 7     | 28  | “You had my note?” he asked with a deep harsh voice and a strongly marked German accent. “I told you that I would call.” He looked from one to the other of us, as if uncertain which to address.                                                                                                                   |
| 161 | Ruth    | 2021 | 7     | 28  | Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away. If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.                                                          |
| 162 | Eugene  | 2021 | 7     | 28  | --I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emma's bakery, I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.                                                                                                 |
| 163 | Raymond | 2021 | 7     | 28  | As the thief was leaving the bakery, they called someone who talked to them for less than a minute. In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket. |
| 191 | Lily    | 2021 | 7     | 28  | Our neighboring courthouse has a very annoying rooster that crows loudly at 6am every day. My sons Robert and Patrick took the rooster to a city far, far away, so it may never bother us again. My sons have successfully arrived in Paris.

-- Firstly I looked at time that matches with the interview below the guilty needs to exit the bakery between 10.15 and 10.25 in the 28 july
-- Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away. If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.

SELECT *
FROM bakery_security_logs
JOIN people
ON bakery_security_logs.license_plate = people.license_plate
WHERE month = 7 AND day = 28 AND (hour BETWEEN 10 AND 11) AND day = 28 AND minute <= 25 AND activity = "exit";

+-----+------+-------+-----+------+--------+----------+---------------+--------+---------+----------------+-----------------+---------------+
| id  | year | month | day | hour | minute | activity | license_plate |   id   |  name   |  phone_number  | passport_number | license_plate |
+-----+------+-------+-----+------+--------+----------+---------------+--------+---------+----------------+-----------------+---------------+
| 260 | 2021 | 7     | 28  | 10   | 16     | exit     | 5P2BI95       | 221103 | Vanessa | (725) 555-4692 | 2963008352      | 5P2BI95       |
| 261 | 2021 | 7     | 28  | 10   | 18     | exit     | 94KL13X       | 686048 | Bruce   | (367) 555-5533 | 5773159633      | 94KL13X       |
| 262 | 2021 | 7     | 28  | 10   | 18     | exit     | 6P58WS2       | 243696 | Barry   | (301) 555-4174 | 7526138472      | 6P58WS2       |
| 263 | 2021 | 7     | 28  | 10   | 19     | exit     | 4328GD8       | 467400 | Luca    | (389) 555-5198 | 8496433585      | 4328GD8       |
| 264 | 2021 | 7     | 28  | 10   | 20     | exit     | G412CB7       | 398010 | Sofia   | (130) 555-0289 | 1695452385      | G412CB7       |
| 265 | 2021 | 7     | 28  | 10   | 21     | exit     | L93JTIZ       | 396669 | Iman    | (829) 555-5269 | 7049073643      | L93JTIZ       |
| 266 | 2021 | 7     | 28  | 10   | 23     | exit     | 322W7JE       | 514354 | Diana   | (770) 555-1861 | 3592750733      | 322W7JE       |
| 267 | 2021 | 7     | 28  | 10   | 23     | exit     | 0NTHK55       | 560886 | Kelsey  | (499) 555-9472 | 8294398571      | 0NTHK55       |
+-----+------+-------+-----+------+--------+----------+---------------+--------+---------+----------------+-----------------+---------------+

-- After that ı looked who withdraw money in the specified times which are before 10.15, leggett street, withdrawing money from the interview below

--I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emma's bakery, I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.

SELECT *
FROM atm_transactions
JOIN bank_accounts
ON bank_accounts.account_number = atm_transactions.account_number
JOIN people
ON people.id =bank_accounts.person_id
WHERE month = 7 AND day = 28 AND atm_location = "Leggett Street" AND transaction_type = "withdraw";

+-----+----------------+------+-------+-----+----------------+------------------+--------+----------------+-----------+---------------+--------+---------+----------------+-----------------+---------------+
| id  | account_number | year | month | day |  atm_location  | transaction_type | amount | account_number | person_id | creation_year |   id   |  name   |  phone_number  | passport_number | license_plate |
+-----+----------------+------+-------+-----+----------------+------------------+--------+----------------+-----------+---------------+--------+---------+----------------+-----------------+---------------+
| 267 | 49610011       | 2021 | 7     | 28  | Leggett Street | withdraw         | 50     | 49610011       | 686048    | 2010          | 686048 | Bruce   | (367) 555-5533 | 5773159633      | 94KL13X       |
| 336 | 26013199       | 2021 | 7     | 28  | Leggett Street | withdraw         | 35     | 26013199       | 514354    | 2012          | 514354 | Diana   | (770) 555-1861 | 3592750733      | 322W7JE       |
| 269 | 16153065       | 2021 | 7     | 28  | Leggett Street | withdraw         | 80     | 16153065       | 458378    | 2012          | 458378 | Brooke  | (122) 555-4581 | 4408372428      | QX4YZN3       |
| 264 | 28296815       | 2021 | 7     | 28  | Leggett Street | withdraw         | 20     | 28296815       | 395717    | 2014          | 395717 | Kenny   | (826) 555-1652 | 9878712108      | 30G67EN       |
| 288 | 25506511       | 2021 | 7     | 28  | Leggett Street | withdraw         | 20     | 25506511       | 396669    | 2014          | 396669 | Iman    | (829) 555-5269 | 7049073643      | L93JTIZ       |
| 246 | 28500762       | 2021 | 7     | 28  | Leggett Street | withdraw         | 48     | 28500762       | 467400    | 2014          | 467400 | Luca    | (389) 555-5198 | 8496433585      | 4328GD8       |
| 266 | 76054385       | 2021 | 7     | 28  | Leggett Street | withdraw         | 60     | 76054385       | 449774    | 2015          | 449774 | Taylor  | (286) 555-6063 | 1988161715      | 1106N58       |
| 313 | 81061156       | 2021 | 7     | 28  | Leggett Street | withdraw         | 30     | 81061156       | 438727    | 2018          | 438727 | Benista | (338) 555-6650 | 9586786673      | 8X428L0       |
+-----+----------------+------+-------+-----+----------------+------------------+--------+----------------+-----------+---------------+--------+---------+----------------+-----------------+---------------+

SELECT *
FROM atm_transactions
JOIN bank_accounts
ON bank_accounts.account_number = atm_transactions.account_number
JOIN people
ON people.id =bank_accounts.person_id
WHERE month = 7 AND day = 28 AND atm_location = "Leggett Street" AND transaction_type = "withdraw" AND license_plate IN (SELECT people.license_plate
FROM bakery_security_logs
JOIN people
ON bakery_security_logs.license_plate = people.license_plate
WHERE month = 7 AND day = 28 AND (hour BETWEEN 10 AND 11) AND day = 28 AND minute <= 25 AND activity = "exit");

-- After that We need to find intersection of these people to find only do both of them

+-----+----------------+------+-------+-----+----------------+------------------+--------+----------------+-----------+---------------+--------+-------+----------------+-----------------+---------------+
| id  | account_number | year | month | day |  atm_location  | transaction_type | amount | account_number | person_id | creation_year |   id   | name  |  phone_number  | passport_number | license_plate |
+-----+----------------+------+-------+-----+----------------+------------------+--------+----------------+-----------+---------------+--------+-------+----------------+-----------------+---------------+
| 267 | 49610011       | 2021 | 7     | 28  | Leggett Street | withdraw         | 50     | 49610011       | 686048    | 2010          | 686048 | Bruce | (367) 555-5533 | 5773159633      | 94KL13X       |
| 336 | 26013199       | 2021 | 7     | 28  | Leggett Street | withdraw         | 35     | 26013199       | 514354    | 2012          | 514354 | Diana | (770) 555-1861 | 3592750733      | 322W7JE       |
| 288 | 25506511       | 2021 | 7     | 28  | Leggett Street | withdraw         | 20     | 25506511       | 396669    | 2014          | 396669 | Iman  | (829) 555-5269 | 7049073643      | L93JTIZ       |
| 246 | 28500762       | 2021 | 7     | 28  | Leggett Street | withdraw         | 48     | 28500762       | 467400    | 2014          | 467400 | Luca  | (389) 555-5198 | 8496433585      | 4328GD8       |
+-----+----------------+------+-------+-----+----------------+------------------+--------+----------------+-----------+---------------+--------+-------+--------------

-- Now all suspected people are Bruce, Diana, Iman and Luca and I create view to write this table again and again.

CREATE VIEW foursuspect AS
SELECT *
FROM atm_transactions
JOIN bank_accounts
ON bank_accounts.account_number = atm_transactions.account_number
JOIN people
ON people.id =bank_accounts.person_id
WHERE month = 7 AND day = 28 AND atm_location = "Leggett Street" AND transaction_type = "withdraw" AND license_plate IN (SELECT people.license_plate
FROM bakery_security_logs
JOIN people
ON bakery_security_logs.license_plate = people.license_plate
WHERE month = 7 AND day = 28 AND (hour BETWEEN 10 AND 11) AND day = 28 AND minute <= 25 AND activity = "exit");


-- We need to look people that around the time of event, who makes phone call less than a minute
--As the thief was leaving the bakery, they called someone who talked to them for less than a minute. In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket.

SELECT phone_calls.caller, phone_calls.receiver, phone_calls.month, phone_calls.day, phone_calls.duration, p1.name as caller_name, p1.passport_number as caller_passport, p2.name as receiver_name, p2.passport_number as receiver_passport
FROM phone_calls
JOIN people as p1
ON p1.phone_number = phone_calls.caller
JOIN people as p2
ON p2.phone_number = phone_calls.receiver
WHERE month = 7 AND day = 28 AND duration < 60 AND (caller IN (SELECT phone_number
FROM foursuspect) OR receiver IN (SELECT phone_number
FROM foursuspect));

+----------------+----------------+-------+-----+----------+-------------+-----------------+---------------+-------------------+
|     caller     |    receiver    | month | day | duration | caller_name | caller_passport | receiver_name | receiver_passport |
+----------------+----------------+-------+-----+----------+-------------+-----------------+---------------+-------------------+
| (367) 555-5533 | (375) 555-8161 | 7     | 28  | 45       | Bruce       | 5773159633      | Robin         | NULL              |
| (770) 555-1861 | (725) 555-3243 | 7     | 28  | 49       | Diana       | 3592750733      | Philip        | 3391710505        |
+----------------+----------------+-------+-----+----------+-------------+-----------------+---------------+-------------------+

--FROM Bruce, Diana, Iman, Luca, Iman and Luca don't have any recorded phone_call, So Our suspucious is now Bruce or Diana.

-- Now I need to look if there is any flight that are taken by these people
-- In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket.
SELECT flights.origin_airport_id, a1.city ,flights.destination_airport_id, a2.city , flights.month, flights.day, flights.hour, flights.minute, passengers.passport_number, people.name
FROM flights
JOIN airports as a1
ON flights.origin_airport_id = a1.id
JOIN airports as a2
ON flights.destination_airport_id = a2.id
JOIN passengers
ON flights.id = passengers.flight_id
JOIN people
ON passengers.passport_number = people.passport_number
WHERE people.passport_number IN (3592750733, 5773159633)
ORDER BY flights.day;

+-------------------+------------+------------------------+---------------+-------+-----+------+--------+-----------------+-------+
| origin_airport_id |    city    | destination_airport_id |     city      | month | day | hour | minute | passport_number | name  |
+-------------------+------------+------------------------+---------------+-------+-----+------+--------+-----------------+-------+
| 8                 | Fiftyville | 6                      | Boston        | 7     | 29  | 16   | 0      | 3592750733      | Diana |
| 8                 | Fiftyville | 4                      | New York City | 7     | 29  | 8    | 20     | 5773159633      | Bruce |
| 7                 | Dubai      | 8                      | Fiftyville    | 7     | 30  | 16   | 27     | 3592750733      | Diana |
| 8                 | Fiftyville | 5                      | Dallas        | 7     | 30  | 10   | 19     | 3592750733      | Diana |
+-------------------+------------+------------------------+---------------+-------+-----+------+--------+-----------------+-------+

-- in the morning of 29th of july there needs to be a flight ticket of the thief. Bruce is the person that takes flight and meets our criteria.
-- So the person who helped to Bruce is Robin from the phone_call and HE is accomplice and as we can see from the table, destination is New York City.



