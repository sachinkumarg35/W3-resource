USE INVENTORY;
/*1. From the following tables, write a SQL query to find all salespeople and customers located in the city of London.
Sample table: Salesman
Sample table: Customer*/
SELECT salesman_id "ID", name, 'Salesman'
FROM salesman
WHERE city='London'
UNION
(SELECT customer_id "ID", cust_name, 'Customer'
FROM customer
WHERE city='London');

/*2. From the following tables, write a SQL query to find distinct salespeople and their cities. Return salesperson ID and city.
Sample table: Salesman
Sample table: Customer*/
SELECT salesman_id, city
FROM customer
UNION
(SELECT salesman_id, city
FROM salesman);

/*3. From the following tables, write a SQL query to find all those salespeople and customers who are involved in the inventory management system. 
Return salesperson ID, customer ID.
Sample table: orders
Sample table: customer*/
SELECT salesman_id, customer_id
FROM customer
UNION 
(SELECT salesman_id, customer_id
FROM orders);

/*4. From the following table, write a SQL query to find the salespersons who generated the largest and smallest orders on each date. 
Return salesperson ID, name, order no., highest on/lowest on, order date.
Sample table: Salesman
Sample table: Orders*/
SELECT a.salesman_id, name, ord_no, 'highest on', ord_date
FROM salesman a, orders b
WHERE a.salesman_id =b.salesman_id
AND b.purch_amt=
	(SELECT MAX(purch_amt)
	FROM orders c
	WHERE c.ord_date = b.ord_date)
UNION
(SELECT a.salesman_id, name, ord_no, 'lowest on', ord_date
FROM salesman a, orders b
WHERE a.salesman_id =b.salesman_id
AND b.purch_amt=
	(SELECT MIN(purch_amt)
	FROM orders c
	WHERE c.ord_date = b.ord_date));
    
select * from salesman;
select * from orders;
    
/*5. From the following tables, write a SQL query to find the salespeople who generated the largest and smallest orders on each date. 
Sort the result-set on third field. Return salesperson ID, name, order no., highest on/lowest on, order date.
Sample table: Salesman
Sample table: Orders*/
SELECT a.salesman_id, name, ord_no, 'highest on', ord_date
FROM salesman a, orders b
WHERE a.salesman_id =b.salesman_id
AND b.purch_amt=
	(SELECT MAX(purch_amt)
	FROM orders c
	WHERE c.ord_date = b.ord_date)
UNION
(SELECT a.salesman_id, name, ord_no, 'lowest on', ord_date
FROM salesman a, orders b
WHERE a.salesman_id =b.salesman_id
AND b.purch_amt=
	(SELECT MIN(purch_amt)
	FROM orders c
	WHERE c.ord_date = b.ord_date))
ORDER BY 3;

/*6. From the following tables, write a SQL query to find those salespeople who live in the same city where the customer lives as well as those 
who do not have customers in their cities by indicating 'NO MATCH'. Sort the result set on 2nd column (i.e. name) in descending order. 
Return salesperson ID, name, customer name, commission.
Sample table: Salesman
Sample table: Customer*/
SELECT salesman.salesman_id, name, cust_name, commission
FROM salesman, customer
WHERE salesman.city = customer.city
UNION
(SELECT salesman_id, name, 'NO MATCH', commission
FROM salesman
WHERE NOT city = ANY
	(SELECT city
        FROM customer))
ORDER BY 2 DESC;

/*7. From the following tables, write a SQL query that appends strings to the selected fields, indicating whether the city of any salesperson is matched 
with the city of any customer. Return salesperson ID, name, city, MATCHED/NO MATCH.
Sample table: Salesman
Sample table: Customer*/
SELECT a.salesman_id, name, a.city, 'MATCHED'
FROM salesman a, customer b
WHERE a.city = b.city
UNION
(SELECT salesman_id, name, city, 'NO MATCH'
FROM salesman
WHERE NOT city = ANY
	(SELECT city
        FROM customer))
ORDER BY 2 DESC;

/*8. From the following table, write a SQL query to create a union of two queries that shows the customer id, cities, and ratings of all customers. 
Those with a rating of 300 or greater will have the words 'High Rating', while the others will have the words 'Low Rating'.
Sample table: Customer*/
SELECT customer_id, city, grade, 'High Rating'
FROM customer
WHERE grade >= 300
UNION
(SELECT customer_id, city, grade, 'Low Rating'
FROM customer
WHERE grade < 300);

/*9. From the following table, write a SQL query to find those salespersons and customers who have placed more than one order. Return ID, name.
Sample table: Customer
Sample table: salesman
Sample table: orders*/
SELECT customer_id as “ID”,  cust_name as “NAME”
	FROM customer a
	WHERE 1<
		(SELECT COUNT(*)
		   FROM orders b
		   WHERE a.customer_id = b.customer_id)
UNION
(SELECT salesman_id as “ID”,   name as “NAME”
	FROM salesman a
	WHERE 1 <
		(SELECT COUNT(*)
		 FROM orders b
		WHERE  a.salesman_id = b.salesman_id))
ORDER BY 2;