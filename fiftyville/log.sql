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
| 1  | ORD          | --O'Hare International Airport            | Chicago       |
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

-- After this point I suspected from only Barry who has 56171033 account_number and check all information of him
--But I realized I didn't checked the internviews section

SELECT *
FROM interviews
WHERE month = 7 AND day BETWEEN 27 AND 29;

| id  |   name    | year | month | day |
| 157 | Charlotte | 2021 | 7     | 27  | “He was in the house about half an hour, and I could catch glimpses of him in the windows of the sitting-room, pacing up and down, talking excitedly, and waving his arms.
Of her I could see nothing. Presently he emerged, looking even more flurried than before. As he stepped up to the cab, he pulled a gold watch from his pocket and looked at it earnestly,
‘Drive like the devil,’ he shouted, ‘first to Gross & Hankey’s in Regent Street, and then to the Church of St. Monica in the Edgeware Road. Half a guinea if you do it in twenty minutes!’ |
| 158 | Jose      | 2021 | 7     | 28  | “Ah,” said he, “I forgot that I had not seen you for some weeks. It is a little souvenir from the King of Bohemia in return for my assistance in the case of the Irene Adler papers.”
| 159 | Eugene    | 2021 | 7     | 28  | “I suppose,” said Holmes, “that when Mr. Windibank came back from France he was very annoyed at your having gone to the ball.”
| 160 | Barbara   | 2021 | 7     | 28  | “You had my note?” he asked with a deep harsh voice and a strongly marked German accent. “I told you that I would call.”
He looked from one to the other of us, as if uncertain which to address.
| 161 | Ruth      | 2021 | 7     | 28  | Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away.
If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.
| 162 | Eugene    | 2021 | 7     | 28  | I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emmas bakery,
I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.
| 163 | Raymond   | 2021 | 7     | 28  | As the thief was leaving the bakery, they called someone who talked to them for less than a minute. In the call,
I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket.
My sons Robert and Patrick took the rooster to a city far, far away, so it may never bother us again. My sons have successfully arrived in Paris.



-- THE IMPORTANT ONES IS
I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emmas bakery,
I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.

...> | 246  | 28500762       | 2021 | 7     | 28  | Leggett Street       | withdraw         | 48     |  -- THIS IS LUCA



As the thief was leaving the bakery, they called someone who talked to them for less than a minute.
-- IF LUCA called someone around less than a minute, she is more and more suspected

| 28500762       | 467400    | 2014          | 467400 | Luca  | (389) 555-5198 | 8496433585      | 4328GD8       |



SELECT *
FROM phone_calls
WHERE (caller = "(389) 555-5198" OR receiver = "(389) 555-5198") AND month = 7 AND day = 28;

+-----+----------------+----------------+------+-------+-----+----------+
| id  |     caller     |    receiver    | year | month | day | duration |
+-----+----------------+----------------+------+-------+-----+----------+
| 234 | (609) 555-5876 | (389) 555-5198 | 2021 | 7     | 28  | 60       |
+-----+----------------+----------------+------+-------+-----+----------+

In the call,
I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket.

--AS WE QUERY ABOVE, MORNING IN THE 29TH OF JUNE THR HELPER BOUGHT A PLANE TICKET FROM FIFTYVILLE WHICH IS ID = 8

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

+----+--------------+-----------------------------------------+---------------+
| id | abbreviation |                full_name                |     city      |
+----+--------------+-----------------------------------------+---------------+
| 1  | ORD          |-- O'Hare International Airport            | Chicago       |
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

--passport_number which is 1695452385 and 8496433585 are the only persont that are match our time and other criterias and lucia is 8496433585, it means the guilty is
-- lucia and the helper is with him which is 1695452385, she entered bakery before the event exitted after the event, before entering withdraw money, and take a morning
-- ticket from her friend for the next day as these information match with the interviews, Lucia is the guilty. Now  the problem is who helped to Lucia:


SELECT *
From people
WHERE passport_number = "1695452385" OR passport_number = "8496433585";





--the receiver of the phone the person who got the ticket for lucia so we can check his number to find who is he

SELECT *
FROM people
WHERE phone_number = "(609) 555-5876";

+--------+---------+----------------+-----------------+---------------+
|   id   |  name   |  phone_number  | passport_number | license_plate |
+--------+---------+----------------+-----------------+---------------+
| 561160 | Kathryn | (609) 555-5876 | 6121106406      | 4ZY7I8T       |
+--------+---------+----------------+-----------------+---------------+

--before understand who is kathryn, I need to check all airports that Lucia visited to understand his last place

SELECT *
FROM passengers
JOIN flights
ON passengers.flight_id = flights.id
WHERE passport_number = "8496433585"
ORDER BY day;

+-----------+-----------------+------+----+-------------------+------------------------+------+-------+-----+------+--------+
| flight_id | passport_number | seat | id | origin_airport_id | destination_airport_id | year | month | day | hour | minute |
+-----------+-----------------+------+----+-------------------+------------------------+------+-------+-----+------+--------+
| 36        | 8496433585      | 7B   | 36 | 8                 | 4                      | 2021 | 7     | 29  | 8    | 20     |
| 11        | 8496433585      | 5D   | 11 | 8                 | 12                     | 2021 | 7     | 30  | 13   | 7      |
| 48        | 8496433585      | 7C   | 48 | 5                 | 8                      | 2021 | 7     | 30  | 18   | 28     |
+-----------+-----------------+------+----+-------------------+------------------------+------+-------+-----+------+--------+

-- There is a conflict because lucia is buying ticket for 7.29 mornıng from fiftyville to  New York but it seems she also bought a ticket for 7.30 and the destination is DELHI.
-- I will solve the issue later but lets focus on kathryrn. In the interviews he tells the story as a "they"
In the call,
I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket.

--It means kathryrn should escape too, so we can confirm that she is a helper.
SELECT *
FROM passengers
JOIN flights
ON passengers.flight_id = flights.id
WHERE passport_number = (SELECT passport_number
FROM people
WHERE phone_number = "(609) 555-5876");

+-----------+-----------------+------+----+-------------------+------------------------+------+-------+-----+------+--------+
| flight_id | passport_number | seat | id | origin_airport_id | destination_airport_id | year | month | day | hour | minute |
+-----------+-----------------+------+----+-------------------+------------------------+------+-------+-----+------+--------+
| 34        | 6121106406      | 2A   | 34 | 8                 | 5                      | 2021 | 7     | 28  | 17   | 20     |
+-----------+-----------------+------+----+-------------------+------------------------+------+-------+-----+------+--------+

--She flight to somewhere else at this point

--checking all cals and transactions between these two people

SELECT *
FROM phone_calls
WHERE (caller = "(609) 555-5876" AND receiver = "(389) 555-5198") OR (caller = "(389) 555-5198)" AND receiver = "(609) 555-5876");

+-----+----------------+----------------+------+-------+-----+----------+
| id  |     caller     |    receiver    | year | month | day | duration |
+-----+----------------+----------------+------+-------+-----+----------+
| 234 | (609) 555-5876 | (389) 555-5198 | 2021 | 7     | 28  | 60       |
| 408 | (609) 555-5876 | (389) 555-5198 | 2021 | 7     | 30  | 255      |
+-----+----------------+----------------+------+-------+-----+----------+


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
WHERE month = 7 AND day = 28 AND (hour = 10 OR hour = 11) AND activity = "exit")))





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


