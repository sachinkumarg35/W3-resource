use inventory;
/*1. From the following tables, write a SQL query to find the salespeople and customers who live in the same city. Return customer name, salesperson name and salesperson city.
Sample table: salesman
Sample table: customer*/
SELECT customer.cust_name,
salesman.name, salesman.city
FROM salesman, customer
WHERE salesman.city = customer.city;

select * from salesman;
select*from customer;

/*2. From the following tables, write a SQL query to locate all the customers and the salesperson who works for them. Return customer name, and salesperson name.  
Sample table: salesman
Sample table: customer */
SELECT customer.cust_name, salesman.name
FROM customer,salesman
WHERE salesman.salesman_id = customer.salesman_id;

/*3. From the following tables, write a SQL query to find those salespeople who generated orders for their customers but are not located in the same city. Return ord_no, 
cust_name, customer_id (orders table), salesman_id (orders table).  
Sample table: customer
Sample table: salesman
Sample table: orders */
SELECT ord_no, cust_name, orders.customer_id, orders.salesman_id
FROM salesman, customer, orders
WHERE customer.city <> salesman.city
AND orders.customer_id = customer.customer_id
AND orders.salesman_id = salesman.salesman_id;

select * from customer;
select * from salesman;
select * from orders;

/*4. From the following tables, write a SQL query to locate the orders made by customers. Return order number, customer name.  
Sample table: customer
Sample table: orders*/
SELECT orders.ord_no, customer.cust_name
FROM orders, customer
WHERE orders.customer_id = customer.customer_id;

/*5. From the following tables, write a SQL query to find those customers where each customer has a grade and is served by a salesperson who belongs to a city.
Return cust_name as "Customer", grade as "Grade".   
Sample table: customer
Sample table: orders
Sample table: salesman*/
SELECT customer.cust_name AS "Customer",
customer.grade AS "Grade",orders.ord_no AS "Order No."
FROM orders, salesman, customer
WHERE orders.customer_id = customer.customer_id
AND orders.salesman_id = salesman.salesman_id
AND salesman.city IS NOT NULL
AND customer.grade IS NOT NULL;

/*6. From the following table, write a SQL query to find those customers who are served by a salesperson and the salesperson earns commission in the range of
12% to 14% (Begin and end values are included.). Return cust_name AS "Customer", city AS "City". 
Sample table: salesman
Sample table: customer*/
SELECT customer.cust_name AS "Customer",
customer.city AS "City",
salesman.name AS "Salesman",
salesman.commission
FROM customer,salesman
WHERE customer.salesman_id = salesman.salesman_id
AND salesman.commission
BETWEEN .12 AND .14;

select * from salesman;
select * from customer;

/*7. From the following tables, write a SQL query to find all orders executed by the salesperson and ordered by the customer whose grade is greater than or equal to 200. 
Compute purch_amt*commission as “Commission”. Return customer name, commission as “Commission%” and Commission.
Sample table: salesman
Sample table: customer
Sample table: orders*/
SELECT ord_no, cust_name, commission AS "Commission%",
purch_amt*commission AS "Commission"
FROM salesman,orders,customer
WHERE orders.customer_id = customer.customer_id
AND orders.salesman_id = salesman.salesman_id
AND customer.grade>=200;

/*8. From the following table, write a SQL query to find those customers who placed orders on October 5, 2012. 
Return customer_id, cust_name, city, grade, salesman_id, ord_no, purch_amt, ord_date, customer_id and salesman_id.
Sample table: customer
Sample table: salesman
Sample table: orders*/
SELECT *
FROM customer a,orders  b 
WHERE a.customer_id=b.customer_id 
AND b.ord_date='2012-10-05';

select * from customer;
select * from salesman;
select * from orders;