use inventory;
/*1. From the following tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
Sample table: salesman
Sample table: customer*/
SELECT salesman.name AS "Salesman",
customer.cust_name, customer.city 
FROM salesman,customer 
WHERE salesman.city=customer.city;

select * from salesman;
select * from customer;

/*2. From the following tables write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
Sample table: orders
Sample table: customer*/
SELECT  a.ord_no,a.purch_amt,
b.cust_name,b.city 
FROM orders a,customer b 
WHERE a.customer_id=b.customer_id 
AND a.purch_amt BETWEEN 500 AND 2000;

/*3. From the following tables write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.
Sample table: customer
Sample table: salesman*/
SELECT a.cust_name AS "Customer Name", 
a.city, b.name AS "Salesman", b.commission 
FROM customer a 
INNER JOIN salesman b 
ON a.salesman_id=b.salesman_id;

/*4. From the following tables write a SQL query to find salespeople who received commissions of more than 12 percent from the company. 
Return Customer Name, customer city, Salesman, commission.  
Sample table: customer
Sample table: salesman*/
SELECT a.cust_name AS "Customer Name", 
a.city, b.name AS "Salesman", b.commission 
FROM customer a 
INNER JOIN salesman b 
ON a.salesman_id=b.salesman_id 
WHERE b.commission>.12;

/*5. From the following tables write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of
more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.  
Sample table: customer
Sample table: salesman*/
SELECT a.cust_name AS "Customer Name", 
a.city, b.name AS "Salesman", b.city,b.commission  
FROM customer a  
INNER JOIN salesman b  
ON a.salesman_id=b.salesman_id 
WHERE b.commission>.12 
AND a.city<>b.city;

/*6. From the following tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.
Sample table: orders
Sample table: customer
Sample table: salesman*/
SELECT a.ord_no,a.ord_date,a.purch_amt,
b.cust_name AS "Customer Name", b.grade, 
c.name AS "Salesman", c.commission 
FROM orders a 
INNER JOIN customer b 
ON a.customer_id=b.customer_id 
INNER JOIN salesman c 
ON a.salesman_id=c.salesman_id;

/*7. Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned. 
Sample table: orders
Sample table: customer
Sample table: salesman*/
SELECT * 
FROM orders 
NATURAL JOIN customer  
NATURAL JOIN salesman;

/*8. From the following tables write a SQL query to display the customer name, customer city, grade, salesman, salesman city. 
The results should be sorted by ascending customer_id. 
Sample table: customer
Sample table: salesman*/
SELECT a.cust_name,a.city,a.grade, 
b.name AS "Salesman",b.city 
FROM customer a 
LEFT JOIN salesman b 
ON a.salesman_id=b.salesman_id 
order by a.customer_id;

/*9. From the following tables write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. 
The result should be ordered by ascending customer_id. 
Sample table: customer
Sample table: salesman*/
SELECT a.cust_name,a.city,a.grade, 
b.name AS "Salesman", b.city 
FROM customer a 
LEFT OUTER JOIN salesman b 
ON a.salesman_id=b.salesman_id 
WHERE a.grade<300 
ORDER BY a.customer_id;

/*10. Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to
determine whether any of the existing customers have placed an order or not.
Sample table: customer
Sample table: orders */
SELECT a.cust_name,a.city, b.ord_no,
b.ord_date,b.purch_amt AS "Order Amount" 
FROM customer a 
LEFT OUTER JOIN orders b 
ON a.customer_id=b.customer_id 
order by b.ord_date;

/*11. SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine 
if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.
Sample table: orders
Sample table: salesman
Sample table: customer*/
SELECT a.cust_name,a.city, b.ord_no,
b.ord_date,b.purch_amt AS "Order Amount", 
c.name,c.commission 
FROM customer a 
LEFT OUTER JOIN orders b 
ON a.customer_id=b.customer_id 
LEFT OUTER JOIN salesman c 
ON c.salesman_id=b.salesman_id;

/*12. Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers.
Sample table: salesman
Sample table: customer*/
SELECT a.cust_name,a.city,a.grade, 
b.name AS "Salesman", b.city 
FROM customer a 
RIGHT OUTER JOIN salesman b 
ON b.salesman_id=a.salesman_id 
ORDER BY b.salesman_id;

/*13. From the following tables write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount.
Sample table: orders
Sample table: salesman
Sample table: customer*/
SELECT a.cust_name,a.city,a.grade, 
b.name AS "Salesman", 
c.ord_no, c.ord_date, c.purch_amt 
FROM customer a 
RIGHT OUTER JOIN salesman b 
ON b.salesman_id=a.salesman_id 
RIGHT OUTER JOIN orders c 
ON c.customer_id=a.customer_id;

/*14. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. 
The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, 
or he may not have placed any order to the associated supplier.
Sample table: orders
Sample table: salesman
Sample table: customer*/
SELECT a.cust_name,a.city,a.grade, 
b.name AS "Salesman", 
c.ord_no, c.ord_date, c.purch_amt 
FROM customer a 
RIGHT OUTER JOIN salesman b 
ON b.salesman_id=a.salesman_id 
LEFT OUTER JOIN orders c 
ON c.customer_id=a.customer_id 
WHERE c.purch_amt>=2000 
AND a.grade IS NOT NULL;

/*15.For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not on the list, 
create a report containing the customer name, city, order number, order date, and purchase amount
Sample table: customer
Sample table: orders*/
SELECT a.cust_name,a.city, b.ord_no,
b.ord_date,b.purch_amt AS "Order Amount" 
FROM customer a 
LEFT OUTER JOIN orders b 
ON a.customer_id=b.customer_id;

/*16. Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) 
have been placed by the customer who neither is on the list nor has a grade.
Sample table: customer
Sample table: orders*/
SELECT a.cust_name,a.city, b.ord_no,
b.ord_date,b.purch_amt AS "Order Amount" 
FROM customer a 
full outer join  orders b 
ON a.customer_id=b.customer_id 
WHERE a.grade IS NOT NULL;

/*17. Write a SQL query to combine each row of the salesman table with each row of the customer table.
Sample table: salesman
Sample table: customer*/
SELECT * 
FROM salesman a 
CROSS JOIN customer b;

/*18. Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for all customers and 
vice versa for that salesperson who belongs to that city.
Sample table: salesman
Sample table: customer*/
SELECT * 
FROM salesman a 
CROSS JOIN customer b 
WHERE a.city IS NOT NULL;

/*19. Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for every customer and vice versa for 
those salesmen who belong to a city and customers who require a grade.
Sample table: salesman
Sample table: customer*/
SELECT * 
FROM salesman a 
CROSS JOIN  customer b 
WHERE a.city IS NOT NULL 
AND b.grade IS NOT NULL;

/*20. Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all customers and vice versa for those salesmen 
who must belong to a city which is not the same as his customer and the customers should have their own grade.
Sample table: salesman
Sample table: customer*/
SELECT * 
FROM salesman a 
CROSS JOIN customer b 
WHERE a.city IS NOT NULL 
AND b.grade IS NOT NULL 
AND  a.city<>b.city;

/*21. From the following tables write a SQL query to select all rows from both participating tables as long as there is a match between pro_com and com_id.
Sample table: company_mast
Sample table: item_mast*/
SELECT *
   FROM item_mast 
   INNER JOIN company_mast
   ON item_mast.pro_com= company_mast.com_id;

select * from company_mast;
select * from item_mast;

/*22. Write a SQL query to display the item name, price, and company name of all the products.
Sample table: company_mast
Sample table: item_mast*/
SELECT item_mast.pro_name, pro_price, company_mast.com_name
   FROM item_mast 
     INNER JOIN company_mast
        ON item_mast.pro_com = company_mast.com_id;

/*23. From the following tables write a SQL query to calculate the average price of items of each company. Return average value and company name.
Sample table: company_mast
Sample table: item_mast*/
SELECT AVG(pro_price), company_mast.com_name
   FROM item_mast INNER 
     JOIN company_mast
        ON item_mast.pro_com= company_mast.com_id
           GROUP BY company_mast.com_name;  

/*24. From the following tables write a SQL query to calculate and find the average price of items of each company higher than or equal to Rs. 350. 
Return average value and company name.
Sample table: company_mast
Sample table: item_mast*/
SELECT AVG(pro_price), company_mast.com_name
   FROM item_mast INNER JOIN company_mast
   ON item_mast.pro_com= company_mast.com_id
   GROUP BY company_mast.com_name
   HAVING AVG(pro_price) >= 350;

/*25. From the following tables write a SQL query to find the most expensive product of each company. Return pro_name, pro_price and com_name.
Sample table: company_mast
Sample table: item_mast*/
SELECT A.pro_name, A.pro_price, F.com_name
   FROM item_mast A INNER JOIN company_mast F
   ON A.pro_com = F.com_id
     AND A.pro_price =
     (
       SELECT MAX(A.pro_price)
         FROM item_mast A
         WHERE A.pro_com = F.com_id
     );

/*26. From the following tables write a SQL query to display all the data of employees including their department.
Sample table: emp_department
Sample table: emp_details*/
SELECT emp_idno, A.emp_fname AS "First Name", emp_lname AS "Last Name",
    B.dpt_name AS "Department", emp_dept, dpt_code,  dpt_allotment
     FROM emp_details A 
      INNER JOIN emp_department B
        ON A.emp_dept = B.dpt_code;
        
select * from emp_department;
select * from emp_details;

/*27. From the following tables write a SQL query to display the first and last names of each employee, as well as the department name and sanction amount.
Sample table: emp_department
Sample table: emp_details*/
SELECT emp_details.emp_fname AS "First Name", emp_lname AS "Last Name", 
    emp_department.dpt_name AS "Department", 
     dpt_allotment AS "Amount Allotted"
       FROM emp_details 
         INNER JOIN emp_department
           ON emp_details.emp_dept = emp_department.dpt_code;

/*28. From the following tables write a SQL query to find the departments with budgets more than Rs. 50000 and display the first name and last name of employees.
Sample table: emp_department
Sample table: emp_details*/
SELECT emp_details.emp_fname AS "First Name", emp_lname AS "Last Name"
  FROM emp_details 
    INNER JOIN emp_department
        ON emp_details.emp_dept = emp_department.dpt_code
    AND emp_department.dpt_allotment > 50000;

/*29. From the following tables write a SQL query to find the names of departments where more than two employees are employed. Return dpt_name.
Sample table: emp_department
Sample table: emp_details*/
SELECT emp_department.dpt_name
  FROM emp_details 
     INNER JOIN emp_department
       ON emp_dept =dpt_code
        GROUP BY emp_department.dpt_name
          HAVING COUNT(*) > 2;
