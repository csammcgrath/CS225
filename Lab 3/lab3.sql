--Sam McGrath
--Brother Morring
--CS225
--Lab 

-- Step 1 --
@"C:\Users\Sam\Documents\Database_Labs\Lab 2\lab2.sql";
    
-- Open log file.
SPOOL lab3.log

-- Perform Steps 2 - 7 of lab3 in this region
--#2
SELECT c.name AS "Client", COUNT(*) AS "Haul Count"
FROM haul h
JOIN client c
  ON h.client_id = c.client_id
GROUP BY c.name
ORDER BY c.name ASC;

--#3
SELECT e.first_name || ' ' || e.last_name AS "Driver",
       v.name AS "Truck",
       COUNT(*) AS "Haul Count"
FROM haul h
JOIN employee e 
  ON e.employee_id = h.employee_id
JOIN vehicle v
  ON v.vehicle_id = h.vehicle_id
GROUP BY e.first_name || ' ' || e.last_name, v.name
ORDER BY "Driver", "Haul Count" ASC;

--#4
SELECT e.first_name || ' ' || e.last_name AS "Driver",
       SUM(CASE 
              WHEN v.name = 'Big Dog' 
                THEN 1 
                ELSE 0
           END) AS "Big Dog",
       SUM(CASE 
              WHEN v.name = 'Classy Cat' 
                THEN 1 
                ELSE 0 
           END) AS "Classy Cat",
       SUM(CASE 
              WHEN v.name = 'Mad Max' 
              THEN 1 
              ELSE 0 
           END) AS "Mad Max"
FROM haul h
JOIN employee e 
  ON e.employee_id = h.employee_id
JOIN vehicle v
  ON v.vehicle_id = h.vehicle_id
GROUP BY first_name || ' ' || last_name
ORDER BY "Driver" ASC;

--#5
--#5a
INSERT INTO mileage
SELECT mileage_s1.nextval,
       city2_id,
       city1_id,
       miles
FROM mileage;

--#5b
SELECT e.first_name || ' ' || e.last_name AS "Driver",
       SUM(m.miles) AS "Total Mileage"
FROM haul h
JOIN employee e
  ON e.employee_id = h.employee_id
JOIN mileage m
  ON m.city1_id = h.begin_city_id AND
     m.city2_id = h.end_city_id
GROUP BY e.first_name || ' ' || e.last_name;

--$6
SELECT e.first_name || ' ' || e.last_name AS "Driver",
       TO_CHAR(SUM(CASE
                   WHEN begin_date BETWEEN '01-Nov-16' AND '01-Dec-16'
                   THEN m.miles
                   ELSE 0
               END), '9,999,999') AS "Nov",
       TO_CHAR(SUM(CASE
                   WHEN begin_date BETWEEN '01-Dec-16' AND '01-Jan-17'
                   THEN m.miles
                   ELSE 0
               END), '9,999,999') AS "Dec",
       TO_CHAR(SUM(CASE
                   WHEN begin_date BETWEEN '01-Jan-17' AND '01-Feb-17'
                   THEN m.miles
                   ELSE 0
               END), '9,999,999') AS "Jan",
       TO_CHAR(SUM(CASE
                   WHEN begin_date BETWEEN '01-Feb-17' AND '01-Mar-17'
                   THEN m.miles
                   ELSE 0
               END), '9,999,999') AS "Feb",
       TO_CHAR(SUM(m.miles), '9,999,999') AS "Total Miles"
FROM haul h
JOIN employee e 
  ON e.employee_id = h.employee_id
JOIN mileage m
  ON m.city1_id = h.begin_city_id AND
     m.city2_id = h.end_city_id
JOIN vehicle v
  ON h.vehicle_id = v.vehicle_id
GROUP BY e.first_name || ' ' || e.last_name
ORDER BY "Driver" DESC;

--#7
SELECT e.first_name || ' ' || e.last_name AS "Driver",
       TO_CHAR(SUM(CASE 
                  WHEN begin_date BETWEEN '01-Nov-16' AND '01-Dec-16'
                  THEN m.miles
                  ELSE 0
               END), '9,999,999') AS "Nov",
       TO_CHAR(SUM(CASE
                  WHEN extract(month from h.begin_date) = 11
                  THEN r.rate * m.miles
                  ELSE 0
               END), '$9,999,999.99') AS "Nov Gross Rev",
       TO_CHAR(SUM(CASE 
              WHEN begin_date BETWEEN '01-Dec-16' AND '01-Jan-17'
              THEN m.miles
              ELSE 0
           END), '9,999,999') AS "Dec",
           TO_CHAR(SUM(CASE
                  WHEN extract(month from h.begin_date) = 12
                  THEN r.rate * m.miles
                  ELSE 0
               END), '$9,999,999.99') AS "Dec Gross Rev",
       TO_CHAR(SUM(CASE 
              WHEN begin_date BETWEEN '01-Jan-17' AND '01-Feb-17'
              THEN m.miles
              ELSE 0
           END), '9,999,999') AS "Jan",
       TO_CHAR(SUM(CASE
                  WHEN extract(month from h.begin_date) = 1
                  THEN r.rate * m.miles
                  ELSE 0
               END), '$9,999,999.99') AS "Jan Gross Rev",
       TO_CHAR(SUM(CASE 
              WHEN begin_date BETWEEN '01-Feb-17' AND '01-Mar-17'
              THEN m.miles
              ELSE 0
           END), '9,999,999,999') AS "Feb",
       TO_CHAR(SUM(CASE
                  WHEN extract(month from h.begin_date) = 2
                  THEN r.rate * m.miles
                  ELSE 0
               END), '$9,999,999.99') AS "Feb Gross Rev",
       TO_CHAR(SUM(m.miles), '9,999,999') AS "Total Mileage",
       TO_CHAR(SUM(r.rate * m.miles), '$9,999,999.99') AS "Total Gross Rev"
FROM haul h
JOIN employee e
  ON e.employee_id = h.employee_id
JOIN mileage m
  ON m.city1_id = h.begin_city_id AND
     m.city2_id = h.end_city_id
JOIN vehicle v
  ON h.vehicle_id = v.vehicle_id
JOIN season s
  ON s.month = extract(month from h.begin_date)
JOIN rate r
  ON r.season = s.season AND
     r.vehicle_type = v.type
GROUP BY e.first_name || ' ' || e.last_name;

-- Close log file.
SPOOL OFF;