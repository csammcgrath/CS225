
-- Open log file.
SPOOL truck_inserts.log


INSERT INTO client 
VALUES (client_s1.NEXTVAL, 'Washington Apples Inc', '509-333-1234', 'wa@mail.com', '123 Growers St', null, 'Moses Lake', 'WA', '98837');

INSERT INTO client 
VALUES (client_s1.NEXTVAL, 'Idaho Potatoes Inc', '208-333-4321', 'ip@mail.com', '321 Big Fields Ave', null, 'Kuna', 'ID', '83634');

INSERT INTO client 
VALUES (client_s1.NEXTVAL, 'Oregon Lumber Inc', '971-777-8888', 'ol@mail.com', '555 Big Trees Ave', null, 'Eugene', 'OR', '97402');


INSERT INTO vehicle
VALUES (vehicle_s1.NEXTVAL, '987654321abcdefgh', 'Box', 38000, 110000, 'Mad Max');

INSERT INTO vehicle
VALUES (vehicle_s1.NEXTVAL, '222222222abcdefgh', 'Refrig', 42000, 130000, 'Big Dog');

INSERT INTO vehicle
VALUES (vehicle_s1.NEXTVAL, '333333333abcdefgh', 'Flat', 56000, 90000, 'Classy Cat');


INSERT INTO employee
VALUES (employee_s1.NEXTVAL, 'Brad', 'Duncan', 'Owner', '14-Oct-2016', null, 'bd@truck.com', '208-445-1000');

INSERT INTO employee
VALUES (employee_s1.NEXTVAL, 'Mike', 'Jones', 'Mechanic', '21-Oct-2016', null, 'mj@truck.com', '208-445-2000');

INSERT INTO employee
VALUES (employee_s1.NEXTVAL, 'Judy', 'Shaw', 'Driver', '21-Oct-2016', null, 'js@truck.com', '208-445-3000');

INSERT INTO employee
VALUES (employee_s1.NEXTVAL, 'Troy', 'Taylor', 'Driver', '25-Oct-2016', null, 'tt@truck.com', '208-445-4000');

INSERT INTO employee
VALUES (employee_s1.NEXTVAL, 'Matt', 'Maloney', 'Driver', '28-Oct-2016', null, 'mm@truck.com', '208-445-5000');


INSERT INTO city
VALUES (city_s1.NEXTVAL, 'Boise', 'BOI');

INSERT INTO city
VALUES (city_s1.NEXTVAL, 'Seattle', 'SEA');

INSERT INTO city
VALUES (city_s1.NEXTVAL, 'Salt Lake City', 'SLC');



INSERT INTO mileage
VALUES
( mileage_s1.NEXTVAL
, (SELECT city_id FROM city WHERE code = 'BOI')
, (SELECT city_id FROM city WHERE code = 'SEA')
, 505
);

INSERT INTO mileage
VALUES
( mileage_s1.NEXTVAL
, (SELECT city_id FROM city WHERE code = 'BOI')
, (SELECT city_id FROM city WHERE code = 'SLC')
, 340
);

INSERT INTO mileage
VALUES
( mileage_s1.NEXTVAL
, (SELECT city_id FROM city WHERE code = 'SLC')
, (SELECT city_id FROM city WHERE code = 'SEA')
, 843
);



INSERT INTO rate
VALUES
( rate_s1.NEXTVAL
, 'High'
, 'Box'
, 9.00
);

INSERT INTO rate
VALUES
( rate_s1.NEXTVAL
, 'High'
, 'Refrig'
, 9.50
);

INSERT INTO rate
VALUES
( rate_s1.NEXTVAL
, 'High'
, 'Flat'
, 8.00
);

INSERT INTO rate
VALUES
( rate_s1.NEXTVAL
, 'Low'
, 'Box'
, 5.00
);

INSERT INTO rate
VALUES
( rate_s1.NEXTVAL
, 'Low'
, 'Refrig'
, 5.50
);

INSERT INTO rate
VALUES
( rate_s1.NEXTVAL
, 'Low'
, 'Flat'
, 4.00
);

INSERT INTO season VALUES (season_s1.NEXTVAL, 'Low', 1);
INSERT INTO season VALUES (season_s1.NEXTVAL, 'Low', 2);
INSERT INTO season VALUES (season_s1.NEXTVAL, 'Low', 3);
INSERT INTO season VALUES (season_s1.NEXTVAL, 'High', 4);
INSERT INTO season VALUES (season_s1.NEXTVAL, 'High', 5);
INSERT INTO season VALUES (season_s1.NEXTVAL, 'High', 6);
INSERT INTO season VALUES (season_s1.NEXTVAL, 'High', 7);
INSERT INTO season VALUES (season_s1.NEXTVAL, 'High', 8);
INSERT INTO season VALUES (season_s1.NEXTVAL, 'High', 9);
INSERT INTO season VALUES (season_s1.NEXTVAL, 'High', 10);
INSERT INTO season VALUES (season_s1.NEXTVAL, 'High', 11);
INSERT INTO season VALUES (season_s1.NEXTVAL, 'Low', 12);



INSERT INTO haul
VALUES
( haul_s1.NEXTVAL
, (SELECT employee_id FROM employee WHERE first_name = 'Troy')
, (SELECT city_id FROM city WHERE code = 'BOI')
, (SELECT city_id FROM city WHERE code = 'SEA')
, (SELECT client_id FROM client WHERE name = 'Idaho Potatoes Inc')
, '3-Nov-2016'
, '4-Nov-2016'
, (SELECT vehicle_id FROM vehicle WHERE name = 'Big Dog')
);

INSERT INTO haul
VALUES
( haul_s1.NEXTVAL
, (SELECT employee_id FROM employee WHERE first_name = 'Judy')
, (SELECT city_id FROM city WHERE code = 'SEA')
, (SELECT city_id FROM city WHERE code = 'BOI')
, (SELECT client_id FROM client WHERE name = 'Washington Apples Inc')
, '12-Nov-2016'
, '13-Nov_2016'
, (SELECT vehicle_id FROM vehicle WHERE name = 'Big Dog')
);

INSERT INTO haul
VALUES
( haul_s1.NEXTVAL
, (SELECT employee_id FROM employee WHERE first_name = 'Matt')
, (SELECT city_id FROM city WHERE code = 'BOI')
, (SELECT city_id FROM city WHERE code = 'SLC')
, (SELECT client_id FROM client WHERE name = 'Oregon Lumber Inc')
, '17-Dec-2016'
, '17-Dec-2016'
, (SELECT vehicle_id FROM vehicle WHERE name = 'Classy Cat')
);

INSERT INTO haul
VALUES
( haul_s1.NEXTVAL
, (SELECT employee_id FROM employee WHERE first_name = 'Matt')
, (SELECT city_id FROM city WHERE code = 'SEA')
, (SELECT city_id FROM city WHERE code = 'SLC')
, (SELECT client_id FROM client WHERE name = 'Washington Apples Inc')
, '28-Dec-2016'
, '29-Dec-2016'
, (SELECT vehicle_id FROM vehicle WHERE name = 'Big Dog')
);

INSERT INTO haul
VALUES
( haul_s1.NEXTVAL
, (SELECT employee_id FROM employee WHERE first_name = 'Troy')
, (SELECT city_id FROM city WHERE code = 'BOI')
, (SELECT city_id FROM city WHERE code = 'SLC')
, (SELECT client_id FROM client WHERE name = 'Idaho Potatoes Inc')
, '29-Nov-2016'
, '30-Nov-2016'
, (SELECT vehicle_id FROM vehicle WHERE name = 'Mad Max')
);


-- Close log file.
SPOOL OFF;
