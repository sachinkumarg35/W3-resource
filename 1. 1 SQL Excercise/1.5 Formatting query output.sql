use inventory;
/*1. From the following table, write a SQL query to select all the salespeople. Return salesman_id, name, city, commission with the percent sign (%).
Sample table: salesman*/
SELECT salesman_id,name,city,'%',commission*100 
FROM salesman;

/*2. From the following table, write a SQL query to find the number of orders booked for each day. Return the result in a format like "For 2001-10-10 there are 15 orders".". 
Sample table: orders*/
SELECT ' For',ord_date,',there are', 
COUNT(ord_no),'orders.' 
FROM orders 
GROUP BY ord_date;

/*3. From the following table, write a SQL query to find all the orders. Sort the result-set in ascending order by ord_no. Return all fields.  
Sample table: orders*/
SELECT * 
FROM orders 
ORDER BY ord_no;

/*4. From the following table, write a SQL query to find all the orders. Sort the result-set in descending order by ord_date. Return all fields. 
Sample table: orders*/
SELECT * 
FROM orders 
ORDER BY ord_date DESC;

/*5. From the following table, write a SQL query to find all the orders. Sort the result-set in descending order by ord_date and purch_amt. Return all fields.  
Sample table: orders*/
SELECT * 
FROM orders 
ORDER BY ord_date, purch_amt DESC;

/*6. From the following table, write a SQL query to find all the customers. Sort the result-set by customer_id. Return cust_name, city, grade. 
Sample table: customer*/
SELECT cust_name,city,grade 
FROM customer 
ORDER BY customer_id;

/*7. From the following table, write a SQL query that calculates the maximum purchase amount generated by each salesperson for each order date.
Sort the result-set by salesperson id and order date in ascending order. Return salesperson id, order date and maximum purchase amount. 
Sample table: orders*/
SELECT salesman_id,ord_date,MAX(purch_amt) 
FROM orders 
GROUP BY salesman_id,ord_date 
ORDER BY salesman_id,ord_date;

/*8. From the following table, write a SQL query to find all the customers. Sort the result-set in descending order on 3rd field. Return customer name, city and grade.  
Sample table: customer*/
SELECT cust_name,city,grade 
FROM customer 
ORDER BY 3 DESC;

/*9. From the following table, write a SQL query that counts the unique orders and the highest purchase amount for each customer. 
Sort the result-set in descending order on 2nd field. Return customer ID, number of distinct orders and highest purchase amount by each customer. 
Sample table: orders*/
SELECT customer_id, COUNT(DISTINCT ord_no), 
MAX(purch_amt) 
FROM orders 
GROUP BY customer_id 
ORDER BY 2 DESC;

/*10. From the following table, write a SQL query to calculate the summation of purchase amount, total commission (15% for all salespeople) by each order date.
Sort the result-set on order date. Return order date, summation of purchase amount and commission.
Sample table : orders*/
SELECT ord_date, SUM(purch_amt), 
SUM(purch_amt)*.15 
FROM orders 
GROUP BY ord_date 
ORDER BY ord_date;
