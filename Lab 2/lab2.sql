--Sam McGrath
--Morring
--CS225

-- Step 1 --
@C:\Users\Sam\Documents\Database_Labs\Lab1\lab1.sql;

-- Open log file.
SPOOL lab2.log

-- Perform Steps 2 - 16 of lab2 in this region
--#2-4
SET DEFINE OFF

CREATE TABLE incident_stage ( INCIDENT_DATE VARCHAR2(26),
TYPE VARCHAR2(26),
EMPLOYEE VARCHAR2(26),
VEHICLE VARCHAR2(26),
NOTES VARCHAR2(26));



INSERT INTO incident_stage (INCIDENT_DATE, TYPE, EMPLOYEE, VEHICLE, NOTES) 
VALUES ('06-Dec-2016', 'Speeding', 'Judy', 'Big Dog', 'speed trap');

INSERT INTO incident_stage (INCIDENT_DATE, TYPE, EMPLOYEE, VEHICLE, NOTES) 
VALUES ('22-Dec-2016', 'Speeding', 'Troy', 'Mad Max', 'holiday rush');

--#5
SELECT is1.incident_date, is1.type, e.employee_id, v.vehicle_id, is1.notes
FROM employee e
JOIN incident_stage is1
  ON e.first_name = is1.employee
JOIN vehicle v
  ON is1.vehicle = v.name;

--#7
INSERT INTO incident 
SELECT incident_s1.nextval, 
       is1.incident_date, 
       is1.type, 
       e.employee_id, 
       v.vehicle_id,
       is1.notes
FROM employee e
JOIN incident_stage is1
  ON e.first_name = is1.employee
JOIN vehicle v
  ON is1.vehicle = v.name;

--#8-11
SET DEFINE OFF

CREATE TABLE haul_stage ( EMPLOYEE VARCHAR2(26),
BEGIN_CITY CHAR(3),
END_CITY CHAR(3),
CLIENT VARCHAR2(21),
BEGIN_DATE DATE,
END_DATE DATE,
VEHICLE VARCHAR2(26));



INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Judy', 'SLC', 'SFO', 'Oregon Lumber Inc', to_date('11-Dec-2016', 'DD-MON-RRRR'), to_date('13-Dec-2016', 'DD-MON-RRRR'), 'Classy Cat');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'SLC', 'SFO', 'Oregon Lumber Inc', to_date('20-Jan-2017', 'DD-MON-RRRR'), to_date('23-Jan-2017', 'DD-MON-RRRR'), 'Mad Max');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'SEA', 'SFO', 'Washington Apples Inc', to_date('27-Dec-2016', 'DD-MON-RRRR'), to_date('28-Dec-2016', 'DD-MON-RRRR'), 'Big Dog');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Judy', 'SEA', 'SFO', 'Oregon Lumber Inc', to_date('28-Dec-2016', 'DD-MON-RRRR'), to_date('31-Dec-2016', 'DD-MON-RRRR'), 'Big Dog');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Troy', 'SFO', 'SLC', 'Washington Apples Inc', to_date('14-Jan-2017', 'DD-MON-RRRR'), to_date('16-Jan-2017', 'DD-MON-RRRR'), 'Mad Max');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Judy', 'BOI', 'SEA', 'Oregon Lumber Inc', to_date('22-Nov-2016', 'DD-MON-RRRR'), to_date('23-Nov-2016', 'DD-MON-RRRR'), 'Classy Cat');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Troy', 'SEA', 'SLC', 'Idaho Potatoes Inc', to_date('12-Jan-2017', 'DD-MON-RRRR'), to_date('14-Jan-2017', 'DD-MON-RRRR'), 'Mad Max');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'SEA', 'SFO', 'Oregon Lumber Inc', to_date('27-Dec-2016', 'DD-MON-RRRR'), to_date('30-Dec-2016', 'DD-MON-RRRR'), 'Classy Cat');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Judy', 'SFO', 'SLC', 'Washington Apples Inc', to_date('23-Nov-2016', 'DD-MON-RRRR'), to_date('25-Nov-2016', 'DD-MON-RRRR'), 'Classy Cat');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Judy', 'SLC', 'SEA', 'Oregon Lumber Inc', to_date('19-Jan-2017', 'DD-MON-RRRR'), to_date('20-Jan-2017', 'DD-MON-RRRR'), 'Mad Max');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'SEA', 'BOI', 'Oregon Lumber Inc', to_date('12-Feb-2017', 'DD-MON-RRRR'), to_date('15-Feb-2017', 'DD-MON-RRRR'), 'Mad Max');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Troy', 'SLC', 'SEA', 'Washington Apples Inc', to_date('27-Jan-2017', 'DD-MON-RRRR'), to_date('29-Jan-2017', 'DD-MON-RRRR'), 'Big Dog');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'SEA', 'SLC', 'Washington Apples Inc', to_date('29-Nov-2016', 'DD-MON-RRRR'), to_date('02-Dec-2016', 'DD-MON-RRRR'), 'Big Dog');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Troy', 'SEA', 'SFO', 'Washington Apples Inc', to_date('16-Nov-2016', 'DD-MON-RRRR'), to_date('17-Nov-2016', 'DD-MON-RRRR'), 'Mad Max');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Judy', 'SLC', 'SEA', 'Idaho Potatoes Inc', to_date('15-Feb-2017', 'DD-MON-RRRR'), to_date('16-Feb-2017', 'DD-MON-RRRR'), 'Mad Max');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'SFO', 'BOI', 'Oregon Lumber Inc', to_date('13-Feb-2017', 'DD-MON-RRRR'), to_date('14-Feb-2017', 'DD-MON-RRRR'), 'Mad Max');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Troy', 'SFO', 'BOI', 'Oregon Lumber Inc', to_date('14-Feb-2017', 'DD-MON-RRRR'), to_date('17-Feb-2017', 'DD-MON-RRRR'), 'Big Dog');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'SFO', 'SLC', 'Oregon Lumber Inc', to_date('27-Dec-2016', 'DD-MON-RRRR'), to_date('29-Dec-2016', 'DD-MON-RRRR'), 'Classy Cat');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Troy', 'SLC', 'SEA', 'Washington Apples Inc', to_date('13-Jan-2017', 'DD-MON-RRRR'), to_date('15-Jan-2017', 'DD-MON-RRRR'), 'Mad Max');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'SFO', 'SEA', 'Idaho Potatoes Inc', to_date('05-Jan-2017', 'DD-MON-RRRR'), to_date('06-Jan-2017', 'DD-MON-RRRR'), 'Mad Max');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Troy', 'SLC', 'BOI', 'Oregon Lumber Inc', to_date('29-Jan-2017', 'DD-MON-RRRR'), to_date('30-Jan-2017', 'DD-MON-RRRR'), 'Mad Max');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Troy', 'SEA', 'SFO', 'Idaho Potatoes Inc', to_date('26-Nov-2016', 'DD-MON-RRRR'), to_date('28-Nov-2016', 'DD-MON-RRRR'), 'Classy Cat');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'SEA', 'SLC', 'Oregon Lumber Inc', to_date('20-Dec-2016', 'DD-MON-RRRR'), to_date('22-Dec-2016', 'DD-MON-RRRR'), 'Mad Max');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Judy', 'BOI', 'SFO', 'Idaho Potatoes Inc', to_date('10-Jan-2017', 'DD-MON-RRRR'), to_date('13-Jan-2017', 'DD-MON-RRRR'), 'Big Dog');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'SEA', 'BOI', 'Washington Apples Inc', to_date('30-Nov-2016', 'DD-MON-RRRR'), to_date('03-Dec-2016', 'DD-MON-RRRR'), 'Mad Max');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Troy', 'SFO', 'BOI', 'Idaho Potatoes Inc', to_date('07-Jan-2017', 'DD-MON-RRRR'), to_date('10-Jan-2017', 'DD-MON-RRRR'), 'Classy Cat');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Troy', 'SEA', 'BOI', 'Idaho Potatoes Inc', to_date('12-Dec-2016', 'DD-MON-RRRR'), to_date('14-Dec-2016', 'DD-MON-RRRR'), 'Classy Cat');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'SFO', 'SLC', 'Idaho Potatoes Inc', to_date('08-Dec-2016', 'DD-MON-RRRR'), to_date('10-Dec-2016', 'DD-MON-RRRR'), 'Classy Cat');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Judy', 'SLC', 'SFO', 'Oregon Lumber Inc', to_date('25-Jan-2017', 'DD-MON-RRRR'), to_date('28-Jan-2017', 'DD-MON-RRRR'), 'Mad Max');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'SLC', 'SFO', 'Oregon Lumber Inc', to_date('30-Nov-2016', 'DD-MON-RRRR'), to_date('03-Dec-2016', 'DD-MON-RRRR'), 'Big Dog');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'BOI', 'SEA', 'Washington Apples Inc', to_date('26-Dec-2016', 'DD-MON-RRRR'), to_date('29-Dec-2016', 'DD-MON-RRRR'), 'Big Dog');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'SLC', 'SEA', 'Washington Apples Inc', to_date('10-Jan-2017', 'DD-MON-RRRR'), to_date('11-Jan-2017', 'DD-MON-RRRR'), 'Mad Max');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Troy', 'SLC', 'SFO', 'Idaho Potatoes Inc', to_date('20-Nov-2016', 'DD-MON-RRRR'), to_date('22-Nov-2016', 'DD-MON-RRRR'), 'Big Dog');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Judy', 'SFO', 'SEA', 'Idaho Potatoes Inc', to_date('28-Dec-2016', 'DD-MON-RRRR'), to_date('30-Dec-2016', 'DD-MON-RRRR'), 'Big Dog');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Troy', 'SLC', 'SFO', 'Washington Apples Inc', to_date('11-Dec-2016', 'DD-MON-RRRR'), to_date('12-Dec-2016', 'DD-MON-RRRR'), 'Mad Max');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'SFO', 'BOI', 'Oregon Lumber Inc', to_date('11-Jan-2017', 'DD-MON-RRRR'), to_date('13-Jan-2017', 'DD-MON-RRRR'), 'Mad Max');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'SEA', 'SFO', 'Washington Apples Inc', to_date('24-Nov-2016', 'DD-MON-RRRR'), to_date('26-Nov-2016', 'DD-MON-RRRR'), 'Classy Cat');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'SEA', 'BOI', 'Idaho Potatoes Inc', to_date('08-Jan-2017', 'DD-MON-RRRR'), to_date('10-Jan-2017', 'DD-MON-RRRR'), 'Classy Cat');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Judy', 'BOI', 'SFO', 'Idaho Potatoes Inc', to_date('17-Nov-2016', 'DD-MON-RRRR'), to_date('20-Nov-2016', 'DD-MON-RRRR'), 'Big Dog');

INSERT INTO haul_stage (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Judy', 'SEA', 'SFO', 'Oregon Lumber Inc', to_date('05-Dec-2016', 'DD-MON-RRRR'), to_date('07-Dec-2016', 'DD-MON-RRRR'), 'Classy Cat');

--#12
SELECT e.employee_id,
       c1.city_id,
       c2.city_id,
       c.client_id,
       begin_date,
       end_date,
       v.vehicle_id
FROM haul_stage hs
JOIN employee e 
  ON hs.employee = e.first_name
JOIN city c1 
  ON hs.begin_city = c1.code
JOIN city c2 
  ON hs.end_city = c2.code
JOIN client c 
  ON hs.client = c.name
JOIN vehicle v 
  ON hs.vehicle = v.name;

--#13
INSERT INTO haul
SELECT haul_s1.nextval,
       e.employee_id,
       c1.city_id,
       c2.city_id,
       c.client_id,
       begin_date,
       end_date,
       v.vehicle_id
FROM haul_stage hs
JOIN employee e 
  ON hs.employee = e.first_name
JOIN city c1 
  ON hs.begin_city = c1.code
JOIN city c2 
  ON hs.end_city = c2.code
JOIN client c 
  ON hs.client = c.name
JOIN vehicle v 
  ON hs.vehicle = v.name;

--#14
SET DEFINE OFF

CREATE TABLE haul_stage2 ( EMPLOYEE VARCHAR2(26),
BEGIN_CITY CHAR(3),
END_CITY CHAR(3),
CLIENT VARCHAR2(21),
BEGIN_DATE DATE,
END_DATE DATE,
VEHICLE VARCHAR2(26));



INSERT INTO haul_stage2 (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Judy', 'SLC', 'SFO', 'Oregon Lumber Inc', to_date('11-Dec-2016', 'DD-MON-RRRR'), to_date('13-Dec-2016', 'DD-MON-RRRR'), 'Classy Cat');

INSERT INTO haul_stage2 (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'SLC', 'SFO', 'Oregon Lumber Inc', to_date('20-Jan-2017', 'DD-MON-RRRR'), to_date('23-Jan-2017', 'DD-MON-RRRR'), 'Mad Max');

INSERT INTO haul_stage2 (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'SEA', 'SFO', 'Washington Apples Inc', to_date('27-Dec-2016', 'DD-MON-RRRR'), to_date('28-Dec-2016', 'DD-MON-RRRR'), 'Big Dog');

INSERT INTO haul_stage2 (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Judy', 'SEA', 'SFO', 'Oregon Lumber Inc', to_date('28-Dec-2016', 'DD-MON-RRRR'), to_date('31-Dec-2016', 'DD-MON-RRRR'), 'Big Dog');

INSERT INTO haul_stage2 (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Troy', 'SFO', 'SLC', 'Washington Apples Inc', to_date('14-Jan-2017', 'DD-MON-RRRR'), to_date('16-Jan-2017', 'DD-MON-RRRR'), 'Mad Max');

INSERT INTO haul_stage2 (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'BOI', 'SLC', 'Oregon Lumber Inc', to_date('22-Nov-2016', 'DD-MON-RRRR'), to_date('24-Nov-2016', 'DD-MON-RRRR'), 'Classy Cat');

INSERT INTO haul_stage2 (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Judy', 'SFO', 'SLC', 'Idaho Potatoes Inc', to_date('12-Jan-2017', 'DD-MON-RRRR'), to_date('13-Jan-2017', 'DD-MON-RRRR'), 'Mad Max');

INSERT INTO haul_stage2 (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Judy', 'BOI', 'SFO', 'Oregon Lumber Inc', to_date('28-Dec-2016', 'DD-MON-RRRR'), to_date('30-Dec-2016', 'DD-MON-RRRR'), 'Classy Cat');

INSERT INTO haul_stage2 (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Matt', 'BOI', 'SLC', 'Washington Apples Inc', to_date('24-Nov-2016', 'DD-MON-RRRR'), to_date('25-Nov-2016', 'DD-MON-RRRR'), 'Classy Cat');

INSERT INTO haul_stage2 (EMPLOYEE, BEGIN_CITY, END_CITY, CLIENT, BEGIN_DATE, END_DATE, VEHICLE) 
VALUES ('Troy', 'SLC', 'SEA', 'Oregon Lumber Inc', to_date('09-Jan-2017', 'DD-MON-RRRR'), to_date('11-Jan-2017', 'DD-MON-RRRR'), 'Mad Max');

--#15
MERGE INTO haul t
USING (
SELECT e.employee_id AS employee_id,
       c1.city_id AS start_city,
       c2.city_id AS end_city,
       c.client_id AS client_id,
       begin_date,
       end_date,
       v.vehicle_id as v_id
FROM haul_stage2 hs2
JOIN employee e 
  ON employee = e.first_name
JOIN city c1
  ON hs2.begin_city = c1.code
JOIN city c2
  ON hs2.end_city = c2.code
JOIN client c
  ON hs2.client = c.name
JOIN vehicle v
  ON hs2.vehicle = v.name
) s
ON (
    t.employee_id = s.employee_id AND
    t.begin_city_id = s.start_city AND
    t.end_city_id = s.end_city AND
    t.begin_date = s.begin_date AND
    t.end_date = s.end_date
)
WHEN NOT MATCHED THEN INSERT (
  t.haul_id,
  t.employee_id,
  t.begin_city_id,
  t.end_city_id,
  t.client_id,
  t.begin_date,
  t.end_date,
  t.vehicle_id
)
VALUES
(
  haul_s1.nextval,
  s.employee_id,
  s.start_city,
  s.end_city,
  s.client_id,
  s.begin_date,
  s.end_date,
  s.v_id
);

-- VERIFICATION CODE -> provided by instructor
SELECT COUNT(*)
FROM haul;

SELECT e.first_name, COUNT(*) AS Cnt
FROM haul h
JOIN employee e
  ON h.employee_id = e.employee_id
GROUP BY e.first_name
ORDER BY first_name;

SELECT v.name, COUNT(*) AS Cnt
FROM haul h
JOIN vehicle v
  ON h.vehicle_id = v.vehicle_id
GROUP BY v.name
ORDER BY v.name;

SELECT bc.code, COUNT(*) AS Cnt
FROM haul h
JOIN city bc
  ON h.begin_city_id = bc.city_id
GROUP BY bc.code
ORDER BY bc.code;

SELECT c.name, COUNT(*) AS Cnt
FROM haul h
JOIN client c
  ON h.client_id = c.client_id
GROUP BY c.name
ORDER BY c.name;

-- Close log file.
SPOOL OFF;

