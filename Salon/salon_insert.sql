CONNECT salon/salon;

-- Open log file.
SPOOL salon_insert.log;

INSERT INTO location VALUES
(
  location_s1.nextval,
  '100 N Main St.',
  'Suite 3',
  'Rexburg',
  'ID',
  '83441'
);

INSERT INTO employee VALUES
(
  employee_s1.nextval,
  'Jenny Jensen',
  'Owner',
  '15-JUN-2013',
  NULL,
  'jensenj@salon.com',
  '2081112222',
  location_s1.currval,
  NULL
);

INSERT INTO employee VALUES
(
  employee_s1.nextval,
  'Haley Lopez',
  'Assistant Manager',
  '23-AUG-13',
  NULL,
  'lopezh@salon.com',
  '2083334444',
  location_s1.currval,
  (SELECT employee_id FROM employee WHERE name = 'Jenny Jensen')
);

INSERT INTO employee VALUES
(
  employee_s1.nextval,
  'Robert Green',
  'Associate',
  '03-JAN-14',
  NULL,
  'greenr@salon.com',
  '2085556666',
  location_s1.currval,
  (SELECT employee_id FROM employee WHERE name = 'Haley Lopez')
);

INSERT INTO location VALUES
(
  location_s1.nextval,
  '200 N Center St.',
  NULL,
  'Rigby',
  'ID',
  '83442'
);

INSERT INTO employee VALUES
(
  employee_s1.nextval,
  'Olive Adams',
  'Manager',
  '12-JUL-15',
  NULL,
  'adamso@salon.com',
  '2087778888',
  location_s1.currval,
  (SELECT employee_id FROM employee WHERE name = 'Jenny Jensen')
);

INSERT INTO employee VALUES
(
  employee_s1.nextval,
  'Julie Davis',
  'Associate',
  '20-OCT-15',
  NULL,
  'davisj@salon.com',
  '2089990000',
  location_s1.currval,
  (SELECT employee_id FROM employee WHERE name = 'Olive Adams')
);

INSERT INTO customer VALUES
(
  customer_s1.nextval,
  'Jeana Bradford',
  'jb@gmail.com',
  '1112223333'
);

INSERT INTO customer VALUES
(
  customer_s1.nextval,
  'Sandra Hobbs',
  'sh@gmail.com',
  '1112223334'
);

INSERT INTO customer VALUES
(
  customer_s1.nextval,
  'Ryan Taylor',
  'rt@gmail.com',
  '1112223335'
);

INSERT INTO customer VALUES
(
  customer_s1.nextval,
  'Michelle Drake',
  'md@gmail.com',
  '1112223336'
);

INSERT INTO customer VALUES
(
  customer_s1.nextval,
  'Heidi Nolan',
  'hn@gmail.com',
  '1112223337'
);

INSERT INTO customer VALUES
(
  customer_s1.nextval,
  'Karen Smith',
  'ks@gmail.com',
  '1112223338'
);

INSERT INTO customer VALUES
(
  customer_s1.nextval,
  'Jose Mendez',
  'jm@gmail.com',
  '1112223339'
);

INSERT INTO product VALUES
(
  product_s1.nextval,
  'Shampoo',
  'Product',
  '8 oz',
  4.95
);

INSERT INTO product VALUES
(
  product_s1.nextval,
  'Shampoo',
  'Product',
  '16 oz',
  8.95
);

INSERT INTO product VALUES
(
  product_s1.nextval,
  'Conditioner',
  'Product',
  '12 oz',
  8.95
);

INSERT INTO product VALUES
(
  product_s1.nextval,
  'Hairspray',
  'Product',
  '8 oz',
  7.95
);

INSERT INTO product VALUES
(
  product_s1.nextval,
  'Shampoo',
  'Service',
  NULL,
  8.00
);

INSERT INTO product VALUES
(
  product_s1.nextval,
  'Men Hair Cut',
  'Service',
  NULL,
  15.00
);

INSERT INTO product VALUES
(
  product_s1.nextval,
  'Women Hair Cut',
  'Service',
  NULL,
  25.00
);

INSERT INTO product VALUES
(
  product_s1.nextval,
  'Color',
  'Service',
  NULL,
  50.00
);

INSERT INTO product VALUES
(
  product_s1.nextval,
  'Perm',
  'Service',
  NULL,
  60.00
);

INSERT INTO tran VALUES
(
  tran_s1.nextval,
  (SELECT employee_id FROM employee WHERE name = 'Jenny Jensen'),
  (SELECT customer_id FROM customer WHERE name = 'Jose Mendez'),
  '25-MAR-16'
);

INSERT INTO tran_detail VALUES
(
  tran_detail_s1.nextval,
  tran_s1.currval,
  (SELECT product_id FROM product WHERE name = 'Shampoo' AND unit_size = '8 oz'),
  (SELECT price FROM product WHERE name = 'Shampoo' AND unit_size = '8 oz')
);

INSERT INTO tran_detail VALUES
(
  tran_detail_s1.nextval,
  tran_s1.currval,
  (SELECT product_id FROM product WHERE name = 'Men Hair Cut' AND type = 'Service'),
  (SELECT price FROM product WHERE name = 'Men Hair Cut' AND type = 'Service')
);

INSERT INTO tran VALUES
(
  tran_s1.nextval,
  (SELECT employee_id FROM employee WHERE name = 'Jenny Jensen'),
  (SELECT customer_id FROM customer WHERE name = 'Karen Smith'),
  '25-MAR-16'
);

INSERT INTO tran_detail VALUES
(
  tran_detail_s1.nextval,
  tran_s1.currval,
  (SELECT product_id FROM product WHERE name = 'Perm' AND type = 'Service'),
  (SELECT price FROM product WHERE name = 'Perm' AND type = 'Service')
);

INSERT INTO tran_detail VALUES
(
  tran_detail_s1.nextval,
  tran_s1.currval,
  (SELECT product_id FROM product WHERE name = 'Conditioner' AND unit_size = '12 oz'),
  (SELECT price FROM product WHERE name = 'Conditioner' AND unit_size = '12 oz')
);

INSERT INTO tran VALUES
(
  tran_s1.nextval,
  (SELECT employee_id FROM employee WHERE name = 'Haley Lopez'),
  (SELECT customer_id FROM customer WHERE name = 'Heidi Nolan'),
  '25-MAR-16'
);

INSERT INTO tran_detail VALUES
(
  tran_detail_s1.nextval,
  tran_s1.currval,
  (SELECT product_id FROM product WHERE name = 'Color' AND type = 'Service'),
  (SELECT price FROM product WHERE name = 'Color' AND type = 'Service')
);

INSERT INTO tran VALUES
(
  tran_s1.nextval,
  (SELECT employee_id FROM employee WHERE name = 'Robert Green'),
  (SELECT customer_id FROM customer WHERE name = 'Michelle Drake'),
  '25-MAR-16'
);

INSERT INTO tran_detail VALUES
(
  tran_detail_s1.nextval,
  tran_s1.currval,
  (SELECT product_id FROM product WHERE name = 'Women Hair Cut' AND type = 'Service'),
  (SELECT price FROM product WHERE name = 'Women Hair Cut' AND type = 'Service')
);

INSERT INTO tran_detail VALUES
(
  tran_detail_s1.nextval,
  tran_s1.currval,
  (SELECT product_id FROM product WHERE name = 'Shampoo' AND unit_size = '16 oz'),
  (SELECT price FROM product WHERE name = 'Shampoo' AND unit_size = '16 oz')
);

INSERT INTO tran VALUES
(
  tran_s1.nextval,
  (SELECT employee_id FROM employee WHERE name = 'Olive Adams'),
  (SELECT customer_id FROM customer WHERE name = 'Ryan Taylor'),
  '25-MAR-16'
);

INSERT INTO tran_detail VALUES
(
  tran_detail_s1.nextval,
  tran_s1.currval,
  (SELECT product_id FROM product WHERE name = 'Men Hair Cut' AND type = 'Service'),
  (SELECT price FROM product WHERE name = 'Men Hair Cut' AND type = 'Service')
);

SPOOL OFF;