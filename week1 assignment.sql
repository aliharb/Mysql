-- Ali Harb
-- week 1 assignment
-- Mysql worshop
-- 07/17/2016



-- Question 1.
-- Which destination in the flights database is the furthest distance away, based on information in the flights table.
-- Show the SQL query(s) that support your conclusion.

SELECT max(distance), dest FROM flights where distance=(SELECT max(distance) FROM flights);

-- Question 2. 
-- What are the different numbers of engines in the planes table? For each number of engines, which aircraft have
-- the most number of seats? Show the SQL statement(s) that support your result.

SELECT engines,manufacturer, max(seats) FROM planes group by engines;

-- Question 3
-- Show the total number of flights.

SELECT count(*) FROM flights;

-- Question 4
-- Show the total number of flights by airline (carrier).

SELECT carrier, count(*) FROM  flights group by carrier;

-- Question 5
-- Show all of the airlines, ordered by number of flights in descending order.

SELECT carrier, count(*) FROM  flights group by carrier order by count(*) DESC;

-- Question 6
-- Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.

SELECT carrier, count(*) FROM  flights group by carrier order by count(*) DESC limit 5;

-- Question 7
-- Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
-- flights in descending order

SELECT carrier, count(*) FROM  flights where distance >= 1000 group by carrier order by count(*) DESC limit 5;

-- Question 8
-- What was the overall minutes arrival delay of by destination  


SELECT sum(arr_delay),dest FROM flights where arr_delay > 0 or arr_delay < 0  group by dest;

