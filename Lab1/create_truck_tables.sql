CONNECT truck/truck;

-- Open log file.
SPOOL create_truck.log

-- Set SQL*Plus environmnet variables.
SET ECHO ON
SET FEEDBACK ON
SET NULL '<Null>'
SET PAGESIZE 999
SET SERVEROUTPUT ON

-- Use an anonymous PL/SQL script to
-- drop all tables and sequences in the current schema and
-- suppress any error messages that may displayed 
-- if these objects don't exist
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE client_s1';
  EXECUTE IMMEDIATE 'DROP SEQUENCE vehicle_s1';
  EXECUTE IMMEDIATE 'DROP SEQUENCE employee_s1';
  EXECUTE IMMEDIATE 'DROP SEQUENCE city_s1';
  EXECUTE IMMEDIATE 'DROP SEQUENCE rate_s1';
  EXECUTE IMMEDIATE 'DROP SEQUENCE haul_s1';
  EXECUTE IMMEDIATE 'DROP SEQUENCE mileage_s1';
  EXECUTE IMMEDIATE 'DROP SEQUENCE drugtest_s1';
  EXECUTE IMMEDIATE 'DROP SEQUENCE incident_s1';
  EXECUTE IMMEDIATE 'DROP SEQUENCE maintenance_s1';

  EXECUTE IMMEDIATE 'DROP TABLE client';
  EXECUTE IMMEDIATE 'DROP TABLE vehicle';
  EXECUTE IMMEDIATE 'DROP TABLE employee';
  EXECUTE IMMEDIATE 'DROP TABLE city';
  EXECUTE IMMEDIATE 'DROP TABLE rate';
  EXECUTE IMMEDIATE 'DROP TABLE haul';
  EXECUTE IMMEDIATE 'DROP TABLE mileage';
  EXECUTE IMMEDIATE 'DROP TABLE drugtest';
  EXECUTE IMMEDIATE 'DROP TABLE incident';
  EXECUTE IMMEDIATE 'DROP TABLE maintenance';
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('');
END;
/


-- Create table.
CREATE TABLE client
(
  client_id                     NUMBER
, name                          VARCHAR2(45)    CONSTRAINT nn_client_1 NOT NULL
, phone                         CHAR(12)
, email                         VARCHAR2(45)    CONSTRAINT nn_client_2 NOT NULL
, address1                      VARCHAR2(45)    CONSTRAINT nn_client_3 NOT NULL
, address2                      VARCHAR2(45)    
, city                          VARCHAR2(45)    CONSTRAINT nn_client_4 NOT NULL
, state                         CHAR(2)         CONSTRAINT nn_client_5 NOT NULL
, zip                           CHAR(9)         CONSTRAINT nn_client_6 NOT NULL
, CONSTRAINT pk_client PRIMARY KEY(client_id)
);

-- Create sequence.
CREATE SEQUENCE client_s1 START WITH 1001;

-- Create unique index for natural key.
CREATE UNIQUE INDEX client_idx1 ON client(name, phone);



-- Create table.
CREATE TABLE city
(
  city_id                   NUMBER
, name                      VARCHAR2(45)    CONSTRAINT nn_city_1 NOT NULL
, code                      CHAR(3)         CONSTRAINT nn_city_2 NOT NULL
, CONSTRAINT pk_city PRIMARY KEY(city_id)
);

-- Create sequence.
CREATE SEQUENCE city_s1 START WITH 1001;

-- Create unique index for natural key.
CREATE UNIQUE INDEX city_idx1 ON city(code);



-- Create table.
CREATE TABLE vehicle
( vehicle_id                    NUMBER
, VIN                           CHAR(17)        CONSTRAINT nn_vehicle_1 NOT NULL
, type                          VARCHAR2(45)    CONSTRAINT nn_vehicle_2 NOT NULL
, capacity                      NUMBER          CONSTRAINT nn_vehicle_3 NOT NULL
, purchase_price                NUMBER(9,2)     CONSTRAINT nn_vehicle_4 NOT NULL
, name                          VARCHAR2(45)
, CONSTRAINT pk_vehicle PRIMARY KEY(vehicle_id));

-- Create sequence.
CREATE SEQUENCE vehicle_s1 START WITH 1001;

-- Create unique index for natural key.
CREATE UNIQUE INDEX vehicle_idx1 ON vehicle(VIN);



-- Create table.
CREATE TABLE employee
( employee_id                   NUMBER
, first_name                    VARCHAR2(45)    CONSTRAINT nn_employee_1 NOT NULL
, last_name                     VARCHAR2(45)    CONSTRAINT nn_employee_2 NOT NULL
, title                         VARCHAR2(45)    CONSTRAINT nn_employee_3 NOT NULL
, hire_date                     DATE            CONSTRAINT nn_employee_4 NOT NULL
, fire_date                     DATE
, email                         VARCHAR2(45)    CONSTRAINT nn_employee_5 NOT NULL
, phone                         CHAR(12)        CONSTRAINT nn_employee_6 NOT NULL
, CONSTRAINT pk_employee PRIMARY KEY(employee_id)
);

-- Create sequence.
CREATE SEQUENCE employee_s1 START WITH 1001;

-- Create unique index for natural key.
CREATE UNIQUE INDEX employee_idx1 ON employee(email);



-- Create table.
CREATE TABLE haul
( haul_id                       NUMBER
, employee_id                   NUMBER          CONSTRAINT nn_haul_1 NOT NULL
, begin_city_id                 NUMBER          CONSTRAINT nn_haul_2 NOT NULL
, end_city_id                   NUMBER          CONSTRAINT nn_haul_3 NOT NULL
, client_id                     NUMBER          CONSTRAINT nn_haul_4 NOT NULL
, begin_date                    DATE            CONSTRAINT nn_haul_5 NOT NULL
, end_date                      DATE            CONSTRAINT nn_haul_6 NOT NULL
, vehicle_id                    NUMBER          CONSTRAINT nn_haul_7 NOT NULL
, CONSTRAINT pk_haul PRIMARY KEY(haul_id)
, CONSTRAINT fk_haul_employee FOREIGN KEY(employee_id) REFERENCES employee(employee_id)
, CONSTRAINT fk_haul_begin_city FOREIGN KEY(begin_city_id) REFERENCES city(city_id)
, CONSTRAINT fk_haul_end_city FOREIGN KEY(end_city_id) REFERENCES city(city_id)
, CONSTRAINT fk_haul_client FOREIGN KEY(client_id) REFERENCES client(client_id));

-- Create sequence.
CREATE SEQUENCE haul_s1 START WITH 1001;

-- Create unique index for natural key.
CREATE UNIQUE INDEX haul_idx1 ON haul(begin_city_id, end_city_id, begin_date, vehicle_id, client_id);



-- Create table.
CREATE TABLE mileage
( mileage_id                     NUMBER
, city1_id                       NUMBER          CONSTRAINT nn_mileage_1 NOT NULL
, city2_id                       NUMBER          CONSTRAINT nn_mileage_2 NOT NULL
, miles                          NUMBER          CONSTRAINT nn_mileage_3 NOT NULL
, CONSTRAINT pk_mileage PRIMARY KEY(mileage_id)
, CONSTRAINT fk_mileage_city1 FOREIGN KEY(city1_id) REFERENCES city(city_id)
, CONSTRAINT fk_mileage_city2 FOREIGN KEY(city2_id) REFERENCES city(city_id)
);

-- Create sequence.
CREATE SEQUENCE mileage_s1 START WITH 1001;

-- Create unique index for natural key.
CREATE UNIQUE INDEX mileage_idx1 ON mileage(city1_id, city2_id);



-- Create table.
CREATE TABLE rate
( rate_id                        NUMBER
, season                         VARCHAR2(45)    CONSTRAINT nn_rate_1 NOT NULL
, vehicle_type                   VARCHAR2(45)    CONSTRAINT nn_rate_2 NOT NULL
, rate                           NUMBER(6,2)     CONSTRAINT nn_rate_3 NOT NULL
, CONSTRAINT pk_rate PRIMARY KEY(rate_id)
);

-- Create sequence.
CREATE SEQUENCE rate_s1 START WITH 1001;

-- Create unique index for natural key.
CREATE UNIQUE INDEX rate_idx1 ON rate(season, vehicle_type);


-- Create table.
CREATE TABLE season
( season_id                      NUMBER
, season                         VARCHAR2(25)      CONSTRAINT nn_season_1 NOT NULL
, month                          NUMBER            CONSTRAINT nn_season_2 NOT NULL
, CONSTRAINT pk_season PRIMARY KEY(season_id)
);

-- Create sequence.
CREATE SEQUENCE season_s1 START WITH 1001;

-- Create unique index for natural key.
CREATE UNIQUE INDEX season_idx1 ON season(season, month);

-- Close log file.
SPOOL OFF;
