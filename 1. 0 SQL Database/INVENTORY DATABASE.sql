/* JOINS ON SALES */
CREATE DATABASE INVENTORY;
USE INVENTORY;

/*TABLE SAKLESMAN*/
CREATE TABLE SALESMAN (
SALESMAN_ID INT(5) PRIMARY KEY,
NAME VARCHAR(30),
CITY VARCHAR(15),
COMMISSION DECIMAL(5, 2)
);

SELECT * FROM SALESMAN;
INSERT INTO SALESMAN VALUES
(5001,         'James Hoog',  'New York',    0.15),
(5002,         'Nail Knite',  'Paris',       0.13),
(5005,         'Pit Alex',    'London',      0.11),
(5006,         'Mc Lyon',     'Paris',       0.14),
(5003,         'Lauson Hen',   NULL,     0.12),
(5007,         'Paul Adam',   'Rome',        0.13);

/* TABLE CUSTOMER */
CREATE TABLE CUSTOMER (
CUSTOMER_ID INT(10) PRIMARY KEY,
CUST_NAME VARCHAR(30),
CITY VARCHAR(15),
GRADE INT(5),
SALESMAN_ID INT(5)
);

SELECT * FROM CUSTOMER;
INSERT INTO CUSTOMER VALUES 
(3002,         'Nick Rimando',  'New York',    100,         5001),
(3005,        'Graham Zusi',   'California',  200,         5002),
(3001,         'Brad Guzan',    'London',         NULL,         5005),
(3004,         'Fabian Johns',  'Paris',       300,         5006),
(3007,         'Brad Davis',    'New York',    200,         5001),
(3009,         'Geoff Camero',  'Berlin',      100,         5003),
(3008,         'Julian Green',  'London',      300,         5002),
(3003,         'Jozy Altidor',  'Moscow',      200,         5007);

/* TABLE ORDERS */
CREATE TABLE ORDERS (
ORD_NO INT(5) PRIMARY KEY,
PURCH_AMT DECIMAL(8, 2),
ORD_DATE DATE,
CUSTOMER_ID INT(10),
SALESMAN_ID INT(10)
);

SELECT * FROM ORDERS;
INSERT INTO ORDERS VALUES
(70001,       150.5,       '2012-10-05',  3005,         5002),
(70009,       270.65,      '2012-09-10',  3001,        5005),
(70002,       65.26,       '2012-10-05',  3002,         5001),
(70004,       110.5,       '2012-08-17',  3009,         5003),
(70007,       948.5,       '2012-09-10',  3005,         5002),
(70005,       2400.6,      '2012-07-27',  3007,         5001),
(70008,       5760,        '2012-09-10',  3002,         5001),
(70010,       1983.43,     '2012-10-10',  3004,         5006),
(70003,       2480.4,      '2012-10-10',  3009,         5003),
(70012,       250.45,      '2012-06-27',  3008,         5002),
(70011,       75.29,      '2012-08-17', 3003,         5007),
(70013,       3045.6,      '2012-04-25',  3002,         5001);

/* TABLE NOBEL_WIN */
CREATE TABLE NOBEL_WIN (
YEAR INT,
SUBJECT VARCHAR(30),
WINNER VARCHAR(30),
COUNTRY VARCHAR(30),
CATEGORY VARCHAR(30)
);

SELECT * FROM NOBEL_WIN;
INSERT INTO NOBEL_WIN VALUES
(1970, 'Physics',                   'Hannes Alfven',                                 'Sweden',                 'Scientist'),
(1970, 'Physics',                   'Louis Neel',                                    'France',                 'Scientist'),
(1970, 'Chemistry',                 'Luis Federico Leloir',                          'France',                 'Scientist'),
(1970, 'Physiology',                'Ulf von Euler',                                 'Sweden',                 'Scientist'),
(1970, 'Physiology',                'Bernard Katz',                                  'Germany',                'Scientist'),
(1970, 'Literature',                'Aleksandr Solzhenitsyn',                        'Russia',                 'Linguist'),
(1970, 'Economics',                 'Paul Samuelson',                                'USA',                    'Economist'),
(1970, 'Physiology',                'Julius Axelrod',                                'USA',                    'Scientist'),
(1971, 'Physics',                   'Dennis GaboR',                                  'Hungary',                'Scientist'),
(1971, 'Chemistry',                 'Gerhard Herzberg',                              'Germany',                'Scientist'),
(1971, 'Peace',                     'Willy Brandt',                                  'Germany',                'Chancellor'),
(1971, 'Literature',                'Pablo Neruda',                                  'Chile',                  'Linguist'),
(1971, 'Economics',                 'Simon Kuznets',                                 'Russia',                 'Economist'),
(1978, 'Peace',                     'Anwar al-Sadat',                                'Egypt',                  'President'),
(1978, 'Peace',                     'Menachem Begin',                                'Israel',                 'Prime Minister'),
(1987, 'Chemistry',                 'Donald J. Cram',                                'USA',                    'Scientist'),
(1987, 'Chemistry',                 'Jean-Marie Lehn',                               'France',                 'Scientist'),
(1987, 'Physiology',                'Susumu Tonegawa',                               'Japan',                  'Scientist'),
(1994, 'Economics',                 'Reinhard Selten',                               'Germany',                'Economist'),
(1994, 'Peace',                     'Yitzhak Rabin',                                 'Israel',                 'Prime Minister'),
(1987, 'Physics',                   'Johannes Georg Bednorz',                        'Germany',                'Scientist'),
(1987, 'Literature',                'Joseph Brodsky',                                'Russia',                 'Linguist'),
(1987, 'Economics',                 'Robert Solow',                                  'USA',                   'Economist'),
(1994, 'Literature',                'Kenzaburo Oe',                                  'Japan',                  'Linguist');

/* TABLE ITEM_MAST */
CREATE TABLE ITEM_MAST (
PRO_ID INT PRIMARY KEY,
PRO_NAME VARCHAR(30),
PRO_PRICE DECIMAL(8, 2),
PRO_COM INT
);

DROP TABLE ITEM_MAST;
SELECT * FROM ITEM_MAST;
INSERT INTO ITEM_MAST VALUES
(101, 'Mother Board',                    3200.00,         15),
(    102, 'Key Board',                        450.00,         16),
(    103, 'ZIP drive',                        250.00,         14),
(    104, 'Speaker',                          550.00,         16),
(    105, 'Monitor',                         5000.00,         11),
(    106, 'DVD drive',                        900.00,         12),
(    107, 'CD drive',                         800.00,         12),
(    108, 'Printer',                         2600.00,         13),
(    109, 'Refill cartridge',                 350.00,         13),
(    110, 'Mouse',                            250.00,         12);

/* COMPANY_MAST */
CREATE TABLE COMPANY_MAST (
COM_ID INT PRIMARY KEY,
COM_NAME VARCHAR(30)
);

SELECT * FROM COMPANY_MAST;
INSERT INTO COMPANY_MAST VALUES
(11, 'Samsung'),
(12, 'iBall'),
(13, 'Epsion'),
(14, 'Zebronics'),
(15, 'Asus'),
(16, 'Frontech');

/* TABLE EMP_DEPARTMENT */
CREATE TABLE EMP_DEPARTMENT (
DPT_CODE INT PRIMARY KEY,
DPT_NAME VARCHAR(20),
DPT_ALLOTMENT int
);

SELECT   * FROM EMP_DEPARTMENT;
INSERT INTO EMP_DEPARTMENT VALUES
(57, 'IT',                      65000),
(63, 'Finance',                 15000),
(47, 'HR',                     240000),
(27, 'RD',                      55000),
(89, 'QC',                      75000);

/* TABLE EMP_DETAILS */
CREATE TABLE EMP_DETAILS (
EMP_IDNO INT PRIMARY KEY,
EMP_FNAME VARCHAR(30),
EMP_LNAME VARCHAR(30),
EMP_DEPT int
);

SELECT * FROM EMP_DETAILS;
INSERT INTO EMP_DETAILS VALUES
(127323, 'Michale',         'Robbin',                  57),
(526689, 'Carlos',         'Snares',                  63),
(843795, 'Enric',           'Dosio',                   57),
(328717, 'Jhon',            'Snares',                  63),
(444527, 'Joseph',          'Dosni',                   47),
(659831, 'Zanifer',         'Emily',                   47),
(847674, 'Kuleswar',        'Sitaraman',               57),
(748681, 'Henrey',          'Gabriel',                 47),
(555935, 'Alex',            'Manuel',                  57),
(539569, 'George',          'Mardy',                   27),
(733843, 'Mario',           'Saule',                   63),
(631548, 'Alan',            'Snappy',                  27),
(839139, 'Maria',           'Foster',                  57);


/* 1. Write a SQL statement to prepare a list with salesman name, customer name and their cities for the salesmen and customer who belongs to the same city. */

SELECT s.name,
       c.cust_name,
       c.city
  FROM salesman s
  INNER JOIN customer c
    ON s.city = c.city;


/* 2. Write a SQL statement to make a list with order no, purchase amount, customer name and their cities for those orders which order amount between 500 and 2000 */

SELECT o.ord_no,
       o.purch_amt,
       c.cust_name, 
       c.city
  FROM orders o
  INNER JOIN customer c
    ON o.customer_id = c.customer_id
  WHERE o.purch_amt BETWEEN 500 AND 2000;


/* 3. Write a SQL statement to know which salesman are working for which customer. */

SELECT c.cust_name AS "Customer Name",
       s.name AS "Salesman"
  FROM customer c
  INNER JOIN salesman s
    ON c.salesman_id = s.salesman_id;


/* 4. Write a SQL statement to find the list of customers who appointed a salesman for their jobs who gets a commission from the company is more than 12%. */

SELECT c.cust_name AS "Customer Name",
       c.city,
       s.name AS "Salesman",
       s.commission
  FROM customer c
  INNER JOIN salesman s
    ON c.salesman_id = s.salesman_id
  WHERE s.commission > 0.12;


/* 5. Write a SQL statement to find the list of customers who appointed a salesman for their jobs who does not live in the same city where their customer lives, and gets a commission is above 12% . */

SELECT c.cust_name AS "Customer Name",
       c.city AS "Customer City",
       s.name AS "Salesman",
       s.city AS "Salesman City",
       s.commission
  FROM customer c
  INNER JOIN salesman s
    ON c.salesman_id = s.salesman_id
  WHERE s.commission > 0.12
    AND c.city != s.city;


/* 6. Write a SQL statement to find the details of an order i.e. order number, order date, amount of order, which customer gives the order and which salesman works for that customer and how much commission he gets for an order. */

SELECT o.ord_no,
       o.ord_date,
       o.purch_amt,
       c.cust_name AS "Customer Name",
       s.name AS "Salesman",
       s.commission 
  FROM orders o
  INNER JOIN customer c
    ON o.customer_id=c.customer_id 
  INNER JOIN salesman s
    ON o.salesman_id=s.salesman_id;


/* 7. Write a SQL statement to make a join on the tables salesman, customer and orders in such a form that the same column of each table will appear once and only the relational rows will come.

SELECT *
  FROM orders
  NATURAL JOIN customer
  NATURAL JOIN salesman;


/* 8. Write a SQL statement to make a list in ascending order for the customer who works either through a salesman or by own. */

SELECT c.cust_name AS "Customer Name"
  FROM customer c
  LEFT JOIN salesman s
    ON c.salesman_id=s.salesman_id
  ORDER BY c.customer_id ASC;


/* 9. Write a SQL statement to make a list in ascending order for the customer who holds a grade less than 300 and works either through a salesman or by own. */

SELECT c.cust_name AS "Customer Name",
       c.grade
  FROM customer c
  LEFT JOIN salesman s
    ON c.salesman_id=s.salesman_id
  WHERE c.grade < 300
  ORDER BY c.customer_id ASC;


/* 10. Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to find that either any of the existing customers have placed no order or placed one or more orders. */

SELECT c.cust_name AS "Customer Name",
       c.city,
       o.ord_no,
       o.ord_date,
       o.purch_amt
  FROM customer c
  LEFT OUTER JOIN orders o
    ON c.customer_id=o.customer_id
  ORDER BY o.ord_date;


/* 11. Write a SQL statement to make a report with customer name, city, order number, order date, order amount, salesman name and commission to find that either any of the existing customers have placed no order or placed one or more orders by their salesman or by own. */

SELECT c.cust_name AS "Customer Name",
       c.city,
       o.ord_no,
       o.ord_date,
       o.purch_amt,
       s.name AS "Salesman",
       s.commission
  FROM customer c
  LEFT OUTER JOIN orders o
    ON c.customer_id=o.customer_id
  LEFT OUTER JOIN salesman s
    ON c.salesman_id=s.salesman_id;


/* 12. Write a SQL statement to make a list in ascending order for the salesmen who works either for one or more customer or not yet join under any of the customers. */

SELECT s.name AS "Salesman"
  FROM salesman s
  LEFT OUTER JOIN customer c
    ON s.salesman_id=c.salesman_id
  ORDER BY c.salesman_id ASC;


/* 13. Write a SQL statement to make a list for the salesmen who works either for one or more customer or not yet join under any of the customers who placed either one or more orders or no order to their supplier. */

SELECT s.name AS "Salesman"
  FROM salesman s
  LEFT OUTER JOIN customer c
    ON s.salesman_id=c.salesman_id
  LEFT OUTER JOIN orders o
    ON c.customer_id=o.customer_id;


/* 14. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier. /*

SELECT s.name AS "Salesman"
  FROM salesman s
  LEFT OUTER JOIN customer c
    ON s.salesman_id=c.salesman_id
  LEFT OUTER JOIN orders o
    ON c.customer_id=o.customer_id
  WHERE o.purch_amt >= 2000
    AND grade IS NOT NULL;


/* 15. Write a SQL statement to make a report with customer name, city, order no, order date, purchase amount for those customers from the existing list who placed one or more orders or which order(s) have been placed by the customer who is not on the list. */

SELECT c.cust_name AS "Customer Name",
       c.city,
       o.ord_no,
       o.ord_date,
       o.purch_amt
  FROM customer c
  RIGHT JOIN orders o
    ON c.customer_id= o.customer_id;


/* 16. Write a SQL statement to make a report with customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who is neither in the list nor have a grade. */

SELECT c.cust_name AS "Customer Name",
       c.city,
       o.ord_no,
       o.ord_date,
       o.purch_amt
  FROM customer c
  FULL OUTER JOIN orders o
    ON c.customer_id= o.customer_id
      AND c.grade IS NOT NULL;


/* 17. Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa. */

SELECT s.name AS "Salesman",
       c.cust_name AS "Customer Name"
  FROM salesman s
  CROSS JOIN customer c;


/* 18. Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for that customer who belongs to a city. */

SELECT s.name AS "Salesman",
       c.cust_name AS "Customer Name"
  FROM salesman s
  CROSS JOIN customer c
  WHERE s.city IS NOT NULL;


/* 19. Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for those salesmen who belongs to a city and the customers who must have a grade. */

SELECT s.name AS "Salesman",
       c.cust_name AS "Customer Name"
  FROM salesman s
  CROSS JOIN customer c
  WHERE s.city IS NOT NULL
    AND c.grade IS NOT NULL;


/* 20. Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for those salesmen who must belong a city which is not the same as his customer and the customers should have an own grade. */

SELECT s.name AS "Salesman",
       c.cust_name AS "Customer Name"
  FROM salesman s
  CROSS JOIN customer c
  WHERE s.city IS NOT NULL
    AND s.city != c.city
    AND c.grade IS NOT NULL;


/* 21. Write a SQL query to display all the data from the item_mast, including all the data for each item's producer company. */

SELECT *
  FROM item_mast i
  INNER JOIN company_mast c
    ON i.pro_com=c.com_id;


/* 22. Write a SQL query to display the item name, price, and company name of all the products. */

SELECT i.pro_name,
       i.pro_price,
       c.com_name
  FROM item_mast i
  INNER JOIN company_mast c
    ON i.pro_com=c.com_id;


/* 23. Write a SQL query to display the average price of items of each company, showing the name of the company. */

SELECT c.com_name,
       AVG(i.pro_price)
  FROM item_mast i
  INNER JOIN company_mast c
    ON i.pro_com=c.com_id
  GROUP BY c.com_name;


/* 24. Write a SQL query to display the names of the company whose products have an average price larger than or equal to Rs. 350. */

SELECT c.com_name,
       AVG(i.pro_price)
  FROM item_mast i
  INNER JOIN company_mast c
    ON i.pro_com=c.com_id
  GROUP BY c.com_name
  HAVING AVG(i.pro_price) >= 350;


/* 25. Write a SQL query to display the name of each company along with the ID and price for their most expensive product. */

SELECT c.com_name,
       i.pro_name,
       i.pro_price
  FROM item_mast i
  INNER JOIN company_mast c
    ON i.pro_com=c.com_id
      AND i.pro_price = (SELECT MAX(i.pro_price)
                           FROM item_mast i
                           WHERE i.pro_com = c.com_id);


/* 26. Write a query in SQL to display all the data of employees including their department. */

SELECT *
  FROM emp_details edet
  INNER JOIN emp_department edep
    ON edet.emp_dept = edep.dpt_code;


/* 27. Write a query in SQL to display the first name and last name of each employee, along with the name and sanction amount for their department. */

SELECT edet.emp_fname AS "First Name",
       edet.emp_lname AS "Last Name",
       edep.dpt_name AS "Department Name",
       edep.dpt_allotment AS "Amount Allotted"
  FROM emp_details edet
  INNER JOIN emp_department edep
    ON edet.emp_dept = edep.dpt_code;


/* 28. Write a query in SQL to find the first name and last name of employees working for departments with a budget more than Rs. 50000. */

SELECT edet.emp_fname AS "First Name",
       edet.emp_lname AS "Last Name"
  FROM emp_details edet
  INNER JOIN emp_department edep
    ON edet.emp_dept = edep.dpt_code
      AND edep.dpt_allotment > 50000;


/* 29. Write a query in SQL to find the names of departments where more than two employees are working. */

SELECT edep.dpt_name,
       COUNT(edet.emp_idno)
  FROM emp_details edet
  INNER JOIN emp_department edep
    ON edet.emp_dept = edep.dpt_code
  GROUP BY edep.dpt_name
  HAVING COUNT(edet.emp_idno) > 2;


/* 30. From the following table, write a SQL query to find the Nobel Prize winner(s) for the year 1970. Return year, subject and winner. */
SELECT year,subject,winner 
FROM nobel_win 
WHERE year=1970;

/* 31. From the following table, write a SQL query to find the Nobel Prize winner in ‘Literature’ for 1971. Return winner. */
SELECT winner
  FROM nobel_win
 WHERE year = 1971
   AND subject = 'Literature';
   
/* 32. From the following table, write a SQL query to locate the Nobel Prize winner ‘Dennis Gabor'. Return year, subject.*/
SELECT year, subject
  FROM nobel_win
 WHERE winner = 'Dennis Gabor';
 
/* 33. From the following table, write a SQL query to find the Nobel Prize winners in the field of ‘Physics’ since 1950. Return winner. */
SELECT winner 
FROM nobel_win
WHERE year>=1950
AND subject='Physics';

/* 34. From the following table, write a SQL query to find the Nobel Prize winners in ‘Chemistry’ between the years 1965 and 1975. Begin and end values are included. Return year, subject, winner, and country.*/
SELECT year, subject, winner, country
  FROM nobel_win
 WHERE subject = 'Chemistry'
   AND year>=1965 AND year<=1975;
   
/* 35. Write a SQL query to display all details of the Prime Ministerial winners after 1972 of Menachem Begin and Yitzhak Rabin. */
SELECT * FROM nobel_win
 WHERE year >1972
  AND winner IN ('Menachem Begin',
                  'Yitzhak Rabin');
                  
/* 36. From the following table, write a SQL query to retrieve the details of the winners whose first names match with the string ‘Louis’. Return year, subject, winner, country, and category. */
SELECT *
 FROM nobel_win 
   WHERE winner LIKE 'Louis %';
   
/* 37. From the following table, write a SQL query that combines the winners in Physics, 1970 and in Economics, 1971. Return year, subject, winner, country, and category. */
SELECT * FROM nobel_win  WHERE (subject ='Physics' AND year=1970) UNION (SELECT * FROM nobel_win  WHERE (subject ='Economics' AND year=1971));

/* 38. From the following table, write a SQL query to find the Nobel Prize winners in 1970 excluding the subjects of Physiology and Economics. Return year, subject, winner, country, and category. */
SELECT *
 FROM nobel_win 
   WHERE year=1970
    AND subject NOT IN('Physiology','Economics');
    
/* 39. From the following table, write a SQL query to combine the winners in 'Physiology' before 1971 and winners in 'Peace' on or after 1974. Return year, subject, winner, country, and category. */
SELECT * FROM nobel_win WHERE (subject ='Physiology' AND year<1971) UNION (SELECT * FROM nobel_win WHERE (subject ='Peace' AND year>=1974));

/* 40. From the following table, write a SQL query to find the details of the Nobel Prize winner 'Johannes Georg Bednorz'. Return year, subject, winner, country, and category.  */
SELECT *
 FROM nobel_win 
   WHERE winner='Johannes Georg Bednorz';
   
/* 41. From the following table, write a SQL query to find Nobel Prize winners for the subject that does not begin with the letter 'P'. Return year, subject, winner, country, and category. Order the result by year, descending and winner in ascending.  */
SELECT * 
 FROM nobel_win 
  WHERE subject NOT LIKE 'P%' 
   ORDER BY year DESC, winner;
   
/* 42. From the following table, write a SQL query to find the details of 1970 Nobel Prize winners. Order the results by subject, ascending except for 'Chemistry' and ‘Economics’ which will come at the end of the result set. Return year, subject, winner, country, and category. */
SELECT *
FROM nobel_win
WHERE year=1970 
ORDER BY
 CASE
    WHEN subject IN ('Economics','Chemistry') THEN 1
    ELSE 0
 END ASC,
 subject,
 winner;