CONNECT salon/salon;

-- Open log file --
SPOOL create_salon.log

-- Set SQL*Plus environment variables --
SET ECHO ON
SET FEEDBACK ON
SET NULL '<Null>'
SET PAGESIZE 999
SET SERVEROUTPUT ON


DROP SEQUENCE tran_detail_s1;
DROP SEQUENCE tran_s1;
DROP SEQUENCE employee_s1;
DROP SEQUENCE location_s1;
DROP SEQUENCE customer_s1;
DROP SEQUENCE product_s1;

DROP TABLE tran_detail;
DROP TABLE tran;
DROP TABLE employee;
DROP TABLE location;
DROP TABLE customer;
DROP TABLE product;

-- Your code goes here --

-- customer table --
CREATE TABLE customer
(
  customer_id             NUMBER,
  name                    VARCHAR2(45)             CONSTRAINT nn_customer_1  NOT NULL,
  email                   VARCHAR2(45),
  phone                   CHAR(10)                 CONSTRAINT nn_customer_2  NOT NULL,
  CONSTRAINT pk_customer  PRIMARY KEY(customer_id)
);

-- customer sequence
CREATE SEQUENCE customer_s1 START WITH 1;

-- customer index
CREATE UNIQUE INDEX customer_idx1 ON customer(name, phone);

-- location table -- 
CREATE TABLE location 
(
  location_id            NUMBER,
  address1               VARCHAR(45)              CONSTRAINT nn_location1    NOT NULL,
  address2               VARCHAR(45),
  city                   VARCHAR(45)              CONSTRAINT nn_location2    NOT NULL,
  state                  CHAR(2)                  CONSTRAINT nn_location3    NOT NULL,
  zip                    CHAR(5)                  CONSTRAINT nn_location4    NOT NULL,
  CONSTRAINT pk_location PRIMARY KEY(location_id)
);

-- location sequence
CREATE SEQUENCE location_s1 START WITH 1;

-- location index
CREATE UNIQUE INDEX location_idx1 ON location(address1, zip);

-- product table --
CREATE TABLE product
(
  product_id              NUMBER,
  name                    VARCHAR2(45)              CONSTRAINT nn_product1   NOT NULL,
  type                    VARCHAR2(45)              CONSTRAINT nn_product2   NOT NULL,               
  unit_size               VARCHAR2(45),
  price                   NUMBER(6,2)               CONSTRAINT nn_product3   NOT NULL,
  CONSTRAINT pk_product   PRIMARY KEY (product_id)
);

-- product sequence 
CREATE SEQUENCE product_s1 START WITH 1;

-- product sequence
CREATE UNIQUE INDEX product_idx1 ON product(name, type, unit_size);

-- employee table --
CREATE TABLE employee
(
  employee_id             NUMBER,
  name                    VARCHAR2(45)              CONSTRAINT nn_employee1  NOT NULL,
  title                   VARCHAR2(45)              CONSTRAINT nn_employee2  NOT NULL,
  hire_date               DATE                      CONSTRAINT nn_employee3  NOT NULL,
  termination_date        DATE, 
  email                   VARCHAR2(45)              CONSTRAINT nn_employee4  NOT NULL,
  phone                   CHAR(10)                  CONSTRAINT nn_employee5  NOT NULL,
  location_id             NUMBER                    CONSTRAINT nn_employee6  NOT NULL,
  manager_id              NUMBER,
  CONSTRAINT pk_employee  PRIMARY KEY (employee_id),
  CONSTRAINT fk_location  FOREIGN KEY (location_id) REFERENCES location (location_id),
  CONSTRAINT fk_manager   FOREIGN KEY (manager_id)  REFERENCES employee (employee_id) 
);

-- employee sequence
CREATE SEQUENCE employee_s1 START WITH 1;

-- employee sequene
CREATE UNIQUE INDEX employee_idx1 ON employee(email);

-- transaction table --
CREATE TABLE tran
(
  tran_id                 NUMBER,
  employee_id             NUMBER                    CONSTRAINT nn_tran1      NOT NULL,
  customer_id             NUMBER                    CONSTRAINT nn_tran2      NOT NULL,
  tran_date               DATE                      CONSTRAINT nn_tran3      NOT NULL,
  CONSTRAINT pk_tran      PRIMARY KEY (tran_id),
  CONSTRAINT fk_tran_emp  FOREIGN KEY (employee_id) REFERENCES employee (employee_id),
  CONSTRAINT fk_tran_cust FOREIGN KEY (customer_id) REFERENCES customer (customer_id)  
);

-- tran sequence
CREATE SEQUENCE tran_s1 START WITH 1;

-- tran index
CREATE UNIQUE INDEX tran_idx1 ON tran(customer_id, employee_id, tran_date);

-- transaction details -- 
CREATE TABLE tran_detail
(
  tran_detail_id          NUMBER,
  tran_id                 NUMBER                    CONSTRAINT nn_tran_d1    NOT NULL,
  product_id              NUMBER                    CONSTRAINT nn_tran_d2    NOT NULL,
  amount_charged          NUMBER(6,2)               CONSTRAINT nn_tran_d3    NOT NULL,
  CONSTRAINT pk_tran_det  PRIMARY KEY (tran_detail_id),
  CONSTRAINT fk_tran_id   FOREIGN KEY (tran_id)     REFERENCES tran (tran_id),
  CONSTRAINT fk_product   FOREIGN KEY (product_id)  REFERENCES product (product_id)
);

-- tran detail sequence
CREATE SEQUENCE tran_detail_s1 START WITH 1;

-- tran detail index
CREATE UNIQUE INDEX tran_detail_idx1 ON tran_detail(tran_id, product_id, amount_charged);

-- Close log file --
SPOOL OFF;