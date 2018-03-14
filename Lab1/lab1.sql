@C:\Users\Sam\Documents\Database_Labs\Lab1\cleanup_oracle.sql
@C:\Users\Sam\Documents\Database_Labs\Lab1\create_truck_tables.sql
@C:\Users\Sam\Documents\Database_Labs\Lab1\truck_inserts.sql

-- Open log file.
SPOOL lab1.log

-- Perform Steps 6 - 16 of lab1 in this region
CREATE TABLE maintenance 
(
  maintenance_id      NUMBER,
  maintenance_date    DATE                                      CONSTRAINT nn_m1 NOT NULL,
  type                VARCHAR2(45)                              CONSTRAINT nn_m2 NOT NULL,
  notes               VARCHAR(45),
  vehicle_id          NUMBER                                    CONSTRAINT nn_m3 NOT NULL,
  employee_id         NUMBER                                    CONSTRAINT nn_m4 NOT NULL,
  CONSTRAINT pk_mid   PRIMARY KEY(maintenance_id),
  CONSTRAINT fk_vi1   FOREIGN KEY(vehicle_id)                   REFERENCES vehicle(vehicle_id),
  CONSTRAINT fk_emp2  FOREIGN KEY(employee_id)                  REFERENCES employee(employee_id),
  CONSTRAINT chk_n    CHECK(type = 'Brake Inspection' OR type = 'LOF')
);

CREATE SEQUENCE maintenance_s1 START WITH 1;

CREATE UNIQUE INDEX maintenance_idx1 ON maintenance(maintenance_date, type);

INSERT INTO maintenance VALUES
(
  maintenance_s1.nextval,
  '19-Nov-2016',
  'LOF',
  null,
  (SELECT vehicle_id FROM vehicle WHERE name = 'Mad Max'),
  (SELECT employee_id FROM employee WHERE first_name = 'Mike')  
);

INSERT INTO maintenance VALUES
(
  maintenance_s1.nextval,
  '24-Nov-2016',
  'Brake Inspection',
  null,
  (SELECT vehicle_id FROM vehicle WHERE name = 'Classy Cat'),
  (SELECT employee_id FROM employee WHERE first_name = 'Mike')  
);

CREATE TABLE incident
(
  incident_id        NUMBER,
  incident_date      DATE                                       CONSTRAINT nn_i1 NOT NULL,
  type               VARCHAR2(45)                               CONSTRAINT nn_i2 NOT NULL,
  employee_id        NUMBER                                     CONSTRAINT nn_i3 NOT NULL,
  vehicle_id         NUMBER                                     CONSTRAINT nn_i4 NOT NULL,
  notes              VARCHAR2(45),
  CONSTRAINT pk_ii   PRIMARY KEY(incident_id),
  CONSTRAINT fk_ei2  FOREIGN KEY(employee_id)                   REFERENCES employee(employee_id),
  CONSTRAINT fk_vi2  FOREIGN KEY(vehicle_id)                    REFERENCES vehicle(vehicle_id),
  CONSTRAINT chk_t   CHECK(type = 'Overweight' OR type = 'Speeding' OR type = 'Accident')
);
  
CREATE SEQUENCE incident_s1 START WITH 1;

CREATE UNIQUE INDEX incident_idx1 ON incident(incident_date, type);

INSERT INTO incident VALUES
(
  incident_s1.nextval,
  '28-Dec-2016',
  'Overweight',
  (SELECT employee_id FROM employee WHERE first_name = 'Matt'),
  (SELECT vehicle_id FROM vehicle WHERE name = 'Classy Cat'),
  null
);

CREATE TABLE drugtest
(
  drugtest_id       NUMBER,
  drugtest_date     DATE                                        CONSTRAINT nn_d1 NOT NULL,
  employee_id       NUMBER                                      CONSTRAINT nn_d2 NOT NULL,
  results           VARCHAR2(45)                                CONSTRAINT nn_d3 NOT NULL,
  CONSTRAINT pk_dt  PRIMARY KEY(drugtest_id),
  CONSTRAINT fk_dt  FOREIGN KEY(employee_id)                    REFERENCES employee(employee_id),
  CONSTRAINT chk_dt CHECK(results = 'Pending' OR results = 'Pass' OR results = 'Fail')
);

CREATE SEQUENCE drugtest_s1 START WITH 1;

CREATE UNIQUE INDEX drugtest_idx1 ON drugtest(drugtest_date, results);

INSERT INTO city VALUES
(
  city_s1.nextval,
  'San Francisco',
  'SFO'
);

INSERT INTO mileage VALUES
(
  mileage_s1.nextval,
  (SELECT city_id FROM city WHERE code = 'BOI'),
  city_s1.currval,
  800
);

INSERT INTO mileage VALUES
(
  mileage_s1.nextval,
  (SELECT city_id FROM city WHERE code = 'SLC'),
  city_s1.currval,
  737
);

INSERT INTO mileage VALUES
(
  mileage_s1.nextval,
  (SELECT city_id FROM city WHERE code = 'SEA'),
  city_s1.currval,
  809
);

ALTER TABLE maintenance
DROP CONSTRAINT chk_n;

ALTER TABLE maintenance
ADD CONSTRAINT chk_n CHECK(type = 'Brake Inspection' OR type = 'LOF' OR type = 'Tire Inspection')
ENABLE NOVALIDATE;

ALTER TABLE incident
DROP CONSTRAINT chk_t;

ALTER TABLE incident
ADD CONSTRAINT chk_t CHECK(type = 'Overweight' OR type = 'Speeding' OR type = 'Accident' OR type = 'Sleep Log')
ENABLE NOVALIDATE;

ALTER TABLE client 
MODIFY phone CONSTRAINT nn_client_7 NOT NULL;

ALTER TABLE employee
RENAME COLUMN fire_date TO termination_date;

-- Close log file.
SPOOL OFF;
