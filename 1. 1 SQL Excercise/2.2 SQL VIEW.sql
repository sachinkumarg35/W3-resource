/*1. From the following table, create a view for those salespeople who belong to the city of New York. 
Sample table: salesman*/
use inventory;
CREATE VIEW newyorkstaff
AS SELECT *
FROM salesman
WHERE city = 'New York';

/*2. From the following table, create a view for all salespersons. Return salesperson ID, name, and city.  
Sample table: salesman*/
CREATE VIEW salesown
 AS SELECT salesman_id, name, city
 FROM salesman;
 
 /*3. From the following table, create a view to locate the salespeople in the city 'New York'.
Sample table: salesman*/
CREATE VIEW newyorkstaff
AS SELECT *
FROM salesman
WHERE city = 'New York';

SELECT *
FROM newyorkstaff
WHERE commission > .13;

/*4. From the following table, create a view that counts the number of customers in each grade.  
Sample table: customer*/
CREATE VIEW gradecount (grade, number)
AS SELECT grade, COUNT(*)
FROM customer
GROUP BY grade;

/*5. From the following table, create a view to count the number of unique customers, compute the average and the total purchase amount of customer orders by each date.
Sample table : orders*/
CREATE VIEW totalforday
 AS SELECT ord_date, COUNT(DISTINCT customer_id),
 AVG(purch_amt), SUM(purch_amt)
 FROM orders
 GROUP BY ord_date;
 
 /*6. From the following tables, create a view to get the salesperson and customer by name. Return order name, purchase amount, salesperson ID, name, customer name.
Sample table: salesman
Sample table: customer
Sample table: orders*/
CREATE VIEW nameorders
AS SELECT ord_no, purch_amt, a.salesman_id, name, cust_name
FROM orders a, customer b, salesman c
WHERE a.customer_id = b.customer_id
AND a.salesman_id = c.salesman_id;

/*7. From the following table, create a view to find the salesperson who handles a customer who makes the highest order of the day. Return order date, salesperson ID, name.
Sample table: salesman
Sample table: orders*/
CREATE VIEW elitsalesman
AS SELECT b.ord_date, a.salesman_id, a.name
FROM salesman a, orders b
WHERE a.salesman_id = b.salesman_id
AND b.purch_amt =
    (SELECT MAX(purch_amt)
       FROM orders c
       WHERE c.ord_date = b.ord_date);

select * from elitsalesman;

/*8. From the following table, create a view to find the salesperson who deals with the customer with the highest order at least three times per day. 
Return salesperson ID and name.
Sample table: customer
Sample table: elitsalesman*/
CREATE VIEW incentive
AS SELECT DISTINCT salesman_id, name
FROM elitsalesman a
WHERE 3 <=
   (SELECT COUNT(*)
    FROM elitsalesman b
    WHERE a.salesman_id = b.salesman_id);

select * from incentive;

/*9. From the following table, create a view to find all the customers who have the highest grade. Return all the fields of customer.
Sample table: customer*/
CREATE VIEW highgrade
  AS SELECT *
  FROM customer
  WHERE grade =
    (SELECT MAX(grade)
     FROM customer);
     
select * from highgrade;

/*10. From the following table, create a view to count the number of salespeople in each city. Return city, number of salespersons.
Sample table: salesman*/
CREATE VIEW citynum
AS SELECT city, COUNT(DISTINCT salesman_id)
FROM salesman
GROUP BY city;

select * from citynum;

/*11. From the following table, create a view to compute the average purchase amount and total purchase amount for each salesperson. 
Return name, average purchase and total purchase amount. (Assume all names are unique.).
Sample table: salesman
Sample table: orders*/
CREATE VIEW norders
AS SELECT name, AVG(purch_amt), SUM(purch_amt)
FROM salesman, orders
WHERE salesman.salesman_id = orders.salesman_id
GROUP BY name;

select * from norders;

/*12. From the following table, create a view to identify salespeople who work with multiple clients. Return all the fields of salesperson.
Sample table: salesman
Sample table: customer*/
CREATE VIEW mcustomer
AS SELECT *
FROM salesman a
WHERE 1 <
   (SELECT COUNT(*)
     FROM customer b
     WHERE a.salesman_id = b.salesman_id);
     
select * from mcustomer;

/*13. From the following table, create a view that shows all matching customers with salespeople, ensuring that at least one customer in the city
of the customer is served by the salesperson in the city of the salesperson.
Sample table: salesman
Sample table: customer*/
CREATE VIEW citymatch(custcity, salescity)
AS SELECT DISTINCT a.city, b.city
FROM customer a, salesman b
WHERE a.salesman_id = b.salesman_id;

select * from citymatch;

/*14. From the following table, create a view to display the number of orders per day. Return order date and number of orders.
Sample table: orders*/
CREATE VIEW dateord(ord_date, odcount)
AS SELECT ord_date, COUNT(*)
FROM orders 
GROUP BY ord_date;

select * from dateord;

/*15. From the following table, create a view to find the salespeople who placed orders on October 10th, 2012. Return all the fields of salesperson.
Sample table: salesman
Sample table: orders*/
CREATE VIEW salesmanonoct
AS SELECT *
FROM salesman
WHERE salesman_id IN
    (SELECT salesman_id
         FROM orders
         WHERE ord_date = '2012-10-10');
         
select * from salesmanonoct;

/*16. From the following table, create a view to find the salespersons who issued orders on either August 17th, 2012 or October 10th, 2012. 
Return salesperson ID, order number and customer ID.
Sample table: orders*/
CREATE VIEW sorder
AS SELECT salesman_id, ord_no, customer_id
FROM orders
WHERE ord_date IN('2012-08-17', '2012-10-10');

select * from sorder;
