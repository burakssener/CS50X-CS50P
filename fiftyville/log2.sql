SELECT description
FROM crime_scene_reports
WHERE month = 7 AND day = 28 AND street = "Humphrey Street";
--| Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery. Interviews were conducted today with three witnesses who were present at the time – each of their interview transcripts mentions the bakery. |
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

-
SELECT hour as exit_hour, minute as exit_minute
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 9 OR hour = 10) AND  activity = "exit";

SELECT *
FROM bakery_security_logs
JOIN
WHERE month = 7 AND (hour = 10 OR hour = 11) AND day = 28 AND activity = "entrance"



license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND (hour = 10 OR hour = 11) AND day = 28 AND activity = "exit");

SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND (hour = 9 OR hour = 10) AND  activity = "entrance" AND license_plate IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND (hour = 10 OR hour = 11) AND day = 28 AND activity = "exit");