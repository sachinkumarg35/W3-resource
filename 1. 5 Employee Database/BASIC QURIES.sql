USE EMPLOYEE;

/*1. From the following table return complete information about the employees.
Sample table: employees*/
SELECT * FROM employees;

/*2. From the following table, write a SQL query to find the salaries of all employees. Return salary.
Sample table: employees*/
SELECT salary
FROM employees;

/*3. From the following table, write a SQL query to find the unique designations of the employees. Return job name.
Sample table: employees*/
SELECT DISTINCT job_name 
FROM employees;

/*4. From the following table, write a SQL query to list the employees’ name, increased their salary by 15%, and expressed as number of Dollars.
Sample table: employees*/
SELECT emp_name,
       CONCAT('$', FORMAT(salary * 1.15, 2)) AS Salary
FROM employees;

/*5. From the following table, write a SQL query to list the employee's name and job name as a format of "Employee & Job".
Sample table: employees*/
SELECT CONCAT(emp_name, '   ', job_name) AS "Employee & Job"
FROM employees;

/*6. Write a query in SQL to produce the output of employees as follows.
Employee
JONAS(manager).
Sample table: employees*/
SELECT CONCAT(emp_name, '(', LOWER(job_name), ')') AS "Employee"
FROM employees;

/*7. From the following table, write a SQL query to find those employees with hire date in the format like February 22, 1991. 
Return employee ID, employee name, salary, hire date.
Sample table: employees*/
SELECT emp_id,
       emp_name,
       salary,
       DATE_FORMAT(hire_date, '%M %d, %Y') AS formatted_hire_date
FROM employees;

/*8. From the following table, write a SQL query to count the number of characters except the spaces for each employee name. Return employee name length.
Sample table: employees*/
SELECT length(trim(emp_name))
FROM employees;

/*9. From the following table, write a SQL query to find the employee ID, salary, and commission of all the employees.
Sample table: employees*/
SELECT emp_id,
       salary,
       commission
FROM employees;

/*10. From the following table, write a SQL query to find the unique department with jobs. Return department ID, Job name.
Sample table: employees*/
SELECT DISTINCT dep_id,
                job_name
FROM employees ;

/*11. From the following table, write a SQL query to find those employees who do not belong to the department 2001. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE dep_id NOT IN (2001);

/*12. From the following table, write a SQL query to find those employees who joined before 1991. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE hire_date<('1991-1-1');

/*13. From the following table, write a SQL query to calculate the average salary of employees who work as analysts. Return average salary.
Sample table: employees*/
SELECT avg(salary)
FROM employees
WHERE job_name = 'ANALYST';

/*14. From the following table, write a SQL query to find the details of the employee ‘BLAZE’.
Sample table: employees*/
SELECT *
FROM employees
WHERE emp_name = 'BLAZE';

/*15. From the following table, write a SQL query to identify employees whose commissions exceed their salaries. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE commission>salary;

/*16. From the following table, write a SQL query to identify those employees whose salaries exceed 3000 after receiving a 25% salary increase. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE (1.25*salary) > 3000;

/*17. From the following table, write a SQL query to find the names of the employees whose length is six. Return employee name.
Sample table: employees*/
SELECT emp_name
FROM employees
WHERE length(emp_name)=6;

/*18. From the following table, write a SQL query to find out which employees joined in the month of January. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE MONTH(hire_date) = 1;

/*19. From the following table, write a SQL query to separate the names of employees and their managers by the string 'works for'.
Sample table: employees*/
SELECT CONCAT(e.emp_name, ' works for ', m.emp_name) AS "Employee & Manager"
FROM employees e
JOIN employees m ON e.manager_id = m.emp_id;

/*20. From the following table, write a SQL query to find those employees whose designation is ‘CLERK’. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE job_name = 'CLERK';

/*21. From the following table, write a SQL query to identify employees with more than 27 years of experience. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) > 27;
              
/*22. From the following table, write a SQL query to find those employees whose salaries are less than 3500. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE salary <3500;

/*23. From the following table, write a SQL query to find the employee whose designation is ‘ANALYST’. Return employee name, job name and salary.
Sample table: employees*/
SELECT emp_name,
       job_name,
       salary
FROM employees
WHERE job_name = 'ANALYST';

/*24.From the following table, write a SQL query to identify those employees who joined the company in 1991. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE YEAR(hire_date) = 1991;

/*25. From the following table, write a SQL query to find those employees who joined before 1st April 1991. Return employee ID, employee name, hire date and salary.
Sample table: employees*/
SELECT e.emp_id,
       e.emp_name,
       e.hire_date,
       e.salary
FROM employees e
WHERE hire_date <'1991-04-01';

/*26. From the following table, write a SQL query identify the employees who do not report to a manager. Return employee name, job name.
Sample table: employees*/
SELECT e.emp_name,
       e.job_name
FROM employees e
WHERE manager_id IS NULL;

/*27. From the following table, write a SQL query to find the employees who joined on the 1st of May 1991. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE hire_date = '1991-05-01';

/*28. From the following table, write a SQL query to identify the experience of the employees who work under the manager whose ID number is 68319. 
Return employee ID, employee name, salary, experience.
Sample table: employees*/
SELECT e.emp_id,
       e.emp_name,
       e.salary,
       YEAR(CURDATE()) - YEAR(e.hire_date) AS Experience
FROM employees e
JOIN employees m ON e.manager_id = m.emp_id
WHERE m.emp_id = 68319;

/*29. From the following table, write a SQL query to find out which employees earn more than 100 per day as a salary. 
Return employee ID, employee name, salary, and experience.
Sample table: employees*/
SELECT emp_id,
       emp_name,
       salary,
       DATEDIFF(CURRENT_DATE, hire_date) AS "Experience"
FROM employees
WHERE (salary/30)>100;

/*30. From the following table, write a SQL query to identify those employees who retired after 31-Dec-99, completing eight years of service. Return employee name.
Sample table: employees*/


/*31. From the following table, write a SQL query to identify the employees whose salaries are odd. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE mod(salary,2) = 1;

/*32. From the following table, write a SQL query to identify employees whose salaries contain only three digits. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE salary >= 100 AND salary <= 999;

/*33. From the following table, write a SQL query to find those employees who joined in the month of APRIL. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE MONTH(hire_date) = 4;

/* OR */

/*34. From the following table, write a SQL query to find out which employees joined the company before the 19th of the month. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE DAY(hire_date) < 19;

/*35. From the following table, write a SQL query to identify those employees who have been working as a SALESMAN and month portion of the experience is more than 10. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE job_name = 'SALESMAN'
  AND DATEDIFF(CURRENT_DATE, hire_date) > 10;
  
/*36. From the following table, write a SQL query to find those employees of department id 3001 or 1001 and joined in the year 1991. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE YEAR(hire_date) = 1991
  AND (dep_id = 3001 OR dep_id = 1001);
       
       /* OR */
       
/*37. From the following table, write a SQL query to find the employees who are working for the department ID 1001 or 2001. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE dep_id=1001
  OR dep_id=2001;
  
/*38. From the following table, write a SQL query to find those employees whose designation is ‘CLERK’ and work in the department ID 2001. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE job_name ='CLERK'
  AND dep_id = 2001;
  
/*39. From the following table, write a query in SQL to find those employees where -
1. the employees receive some commission which should not be more than the salary and annual salary including commission is below 34000.
2. Designation is ‘SALESMAN’ and working in the department ‘3001’. Return employee ID, employee name, salary and job name.
Sample table: employees*/
SELECT emp_id,
       emp_name,
       salary,
       job_name
FROM employees
WHERE 12*(salary+commission) < 34000
  AND commission IS NOT NULL
  AND commission < salary
  AND job_name = 'SALESMAN'
  AND dep_id = 3001;
  
/*40. From the following table, write a SQL query to find those employees who are either CLERK or MANAGER. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE job_name IN ('CLERK','MANAGER');

/*41. From the following table, write a SQL query to identify those employees who joined in any month other than February. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE MONTH(hire_date) <> 2;

/*42. From the following table, write a SQL query to find those employees who joined in the year 1991. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE hire_date BETWEEN '1991-01-01' AND '1991-12-31';

/*43. From the following table, write a SQL query to identify the employees who joined the company in June 1991. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE hire_date BETWEEN '1991-06-01' AND '1991-06-30';

/* 44. From the following table, write a SQL query to search for all employees with an annual salary between 24000 and 50000 (Begin and end values are included.). 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE 12*salary BETWEEN 24000 AND 50000;

/*45. From the following table, write a SQL query to identify all employees who joined the company on 1st May, 20th February, and 3rd December 1991. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE YEAR(hire_date) = 1991
  AND MONTH(hire_date) IN (5, 2, 12)
  AND DAY(hire_date) IN (1, 20, 3);
                    
/*46. From the following table, write a SQL query to find out which employees are working under the managers 63679, 68319, 66564, or 69000. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE manager_id IN (63679,
                     68319,
                     66564,
                     69000);
                     
/*47. From the following table, write a SQL query to find which employees joined the company after the month of June in 1991 and within this year. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE YEAR(hire_date) = 1991
  AND MONTH(hire_date) > 6;

/*48. From the following table, write a SQL query to find those employees who joined in 90's. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 1999;

/*49. From the following table, write a SQL query to find those managers who are in the department 1001 or 2001. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE job_name = 'MANAGER'
  AND (dep_id = 1001
       OR dep_id =2001);
       
/*50. From the following table, write a SQL query to identify employees who joined in the month of FEBRUARY with a salary range of 1001 to 2000 
(Begin and end values are included.). Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE MONTH(hire_date) = 2
  AND salary >= 1001
  AND salary <= 2000;

/*51. From the following table, write a SQL query to find those employees who joined before or after the year 1991. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE YEAR(hire_date) <> 1991;

/*52. From the following table, write a SQL query to find employees along with their department details. Return employee ID, employee name, job name, manager ID, 
hire date, salary, commission, department ID, and department name.
Sample table: employees
Sample table: department*/
SELECT e.emp_id,
       e.emp_name,
       e.job_name,
       e.manager_id,
       e.hire_date,
       e.salary,
       e.commission,
       e.dep_id,
       d.dep_name
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id;

/*53. From the following table, write a SQL query to identify those employees who earn 60000 or more per year or do not work as ANALYST. Return employee name, job name, 
(12*salary) as Annual Salary, department ID, and grade.
Sample table: employees
Sample table: department
Sample table: salary_grade*/
SELECT e.emp_name,
       e.job_name,
       (12*e.salary)"Annual Salary",
       e.dep_id,
       d.dep_name,
       s.grade
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND e.salary BETWEEN s.min_salary AND s.max_salary 
  AND (((12*e.salary)>= 60000)
       OR (e.job_name != 'ANALYST'));

/*54. From the following table, write a SQL query to identify employees whose salaries are higher than their managers' salaries. Return employee name, job name,
 manager ID, salary, manager name, manager's salary.
Sample table: employees*/
SELECT w.emp_name,
       w.job_name,
       w.manager_id,
       w.salary,
       m.emp_name "Manager",
       m.emp_id,
       m.salary "Manager_Salary"
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.salary > m.salary;
  
/*55. From the following table, write a SQL query to find those employees whose salary is between 2000 and 5000 (Begin and end values are included.) 
and location is PERTH. Return employee name, department ID, salary, and commission.
Sample table: employees
Sample table: department*/
SELECT e.emp_name,
       e.dep_id,
       e.salary,
       e.commission
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
  AND d.dep_location = 'PERTH'
  AND e.salary BETWEEN 2000 AND 5000;
  
/*56. From the following table, write a SQL query to find the employees whose department ID is 1001 or 3001 and whose salary grade is not 4. 
They joined the company before 1992-12-31. 
Return grade, employee name.
Sample table: employees
Sample table: salary_grade*/
SELECT s.grade,
       e.emp_name
FROM employees e,
     salary_grade s
WHERE e.dep_id IN (1001,
                   3001)
  AND hire_date < ('1992-12-31')
  AND (e.salary BETWEEN s.min_salary  AND s.max_salary
       AND s.grade NOT IN (4));
       
/*57. From the following table, write a SQL query to find those employees whose manager name is JONAS.
Return employee id, employee name, job name, manager ID, hire date, salary, department ID, employee name.
Sample table: employees*/
SELECT w.emp_id,
       w.emp_name,
       w.job_name,
       w.manager_id,
       w.hire_date,
       w.salary,
       w.dep_id,
       m.emp_name
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND m.emp_name = 'JONAS';
  
/*58. From the following table, write a SQL query to find the name and salary of the employee FRANK. Salary should be equal to the maximum salary 
within his or her salary group.
Sample table: employees
Sample table: salary_grade*/
SELECT e.emp_name,
       e.salary
FROM employees e,
     salary_grade s
WHERE e.emp_name = 'FRANK'
  AND e.salary BETWEEN s.min_salary AND s.max_salary 
  AND e.salary = s.max_salary;

/*59. From the following table, write a SQL query to search for employees who are working either as a MANAGER or an ANALYST with a 
salary between 2000 and 5000 (Begin and end values are included.) without commissions. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE job_name IN ('MANAGER',
                   'ANALYST')
  AND salary BETWEEN 2000 AND 5000
  AND commission IS NULL;
  
/*60. From the following table, write a SQL query to search for employees working in PERTH or MELBOURNE and month part of their achieved experience is more than 10. 
Return employee ID, employee name, department ID, salary, and department location.
Sample table: employees*/
SELECT e.emp_id,
       e.emp_name,
       e.dep_id,
       e.salary,
       d.dep_location
FROM employees e
JOIN department d ON e.dep_id = d.dep_id
WHERE d.dep_location IN ('PERTH', 'MELBOURNE')
  AND TIMESTAMPDIFF(MONTH, e.hire_Date, CURRENT_DATE) > 10;
              
/*61. From the following table, write a SQL query to find the employees who joined in 1991 and whose department location is SYDNEY or MELBOURNE with a salary range of 
2000 to 5000 (Begin and end values are included.). Return employee ID, employee name, department ID, salary, and department location.
Sample table: employees
Sample table: department*/
SELECT e.emp_id,
       e.emp_name,
       e.dep_id,
       e.salary,
       d.dep_location
FROM employees e
JOIN department d ON e.dep_id = d.dep_id
WHERE d.dep_location IN ('SYDNEY', 'MELBOURNE')
  AND YEAR(e.hire_date) = 1991
  AND e.salary BETWEEN 2000 AND 5000;
  
/*62. From the following table, write a SQL query to find the employees of MARKETING department come from MELBOURNE or PERTH, are in grades 3 ,4, and 5 and have at
 least 25 years of experience. Return department ID, employee ID, employee name, salary, department name, department location and grade.
Sample table: employees
Sample table: salary_grade
Sample table: department*/
SELECT e.dep_id,
       e.emp_id,
       e.emp_name,
       e.salary,
       d.dep_name,
       d.dep_location,
       s.grade
FROM employees e
JOIN salary_grade s ON e.salary BETWEEN s.min_salary AND s.max_salary
JOIN department d ON e.dep_id = d.dep_id
WHERE s.grade IN (3, 4, 5)
  AND TIMESTAMPDIFF(YEAR, e.hire_date, CURRENT_DATE) >= 25
  AND d.dep_name = 'MARKETING'
  AND d.dep_location IN ('MELBOURNE', 'PERTH');
                              
/*63. From the following table, write a SQL query to find those employees who are senior to their manager. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.hire_date < m.hire_date;
  
/*64. From the following tables, write a SQL query to determine which employees have a grade of 4 and a salary between the minimum and maximum. 
Return all information of each employees and their grade and salary related details.
Sample table: employees
Sample table: salary_grade*/
SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary 
  AND s.grade = 4;

/*65. From the following table, write a SQL query to find those employees who joined after 1991, excluding MARKER or ADELYN in the departments PRODUCTION or AUDIT. 
Return employee name.
Sample table: employees
Sample table: department
Sample table: salary_grade*/
SELECT e.emp_name
FROM employees e
JOIN department d ON e.dep_id = d.dep_id
JOIN salary_grade s ON e.salary BETWEEN s.min_salary AND s.max_salary
WHERE d.dep_name IN ('PRODUCTION', 'AUDIT')
  AND e.emp_name NOT IN ('MARKER', 'ADELYN')
  AND YEAR(e.hire_date) > 1991;
  
/*66. From the following table, write a SQL query to find the employees and their salaries. Sort the result-set in ascending order by salaries. 
Return complete information about the employees.
Sample table: employees*/
SELECT * 
FROM employees 
ORDER BY salary ASC;

/*67. From the following table, write a SQL query to list employees in ascending order on department ID and descending order on jobs.
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
ORDER BY dep_id ASC,
         job_name DESC;
         
/*68. From the following table, write a SQL query to sort the unique jobs in descending order. Return job name.
Sample table: employees*/
SELECT DISTINCT job_name
FROM employees
ORDER BY job_name DESC;

/*69. From the following table, write a SQL query to rank the employees according to their annual salary in ascending order. 
Return employee ID, employee name, monthly salary, salary/30 as Daily_Salary, and 12*salary as Anual_Salary.
Sample table: employees*/
SELECT emp_id,
       emp_name,
       salary Monthly_Salary,
       salary/30 Daily_Salary,
       12*salary Anual_Salary
FROM employees
ORDER BY Anual_Salary ASC;

/*70. From the following table, write a SQL query to find those employees who are either 'CLERK' or 'ANALYST’. Sort the result set in descending order on job_name. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE job_name='CLERK'
  OR job_name='ANALYST'
ORDER BY job_name DESC;

/*71. From the following table, write a SQL query to find the department location of employee ‘CLARE’. Return department location.
Sample table: employees
Sample table: department*/
SELECT dep_location
FROM department d,
     employees e
WHERE e.emp_name = 'CLARE'
  AND e.dep_id = d.dep_id ;
  
/*72. From the following table, write a SQL query to find those employees who joined on 1-MAY-91, or 3-DEC-91, or 19-JAN-90. 
Sort the result-set in ascending order by hire date. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE hire_date IN ('1991-5-01',
                    '1991-12-03',
                    '1990-01-19')
ORDER BY hire_date ASC;

/*73. From the following table, write a SQL query to find those employees who earn less than 1000. Sort the result-set in ascending order by salary.
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE salary < 1000
ORDER BY salary;

/*74. From the following table, write a SQL query to list the employees in ascending order based on salary. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
ORDER BY salary ASC;

/*75. From the following table, write a SQL query to list the employees in the ascending order by job title and in descending order by employee ID. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees e
ORDER BY e.job_name ASC,
         e.emp_id DESC ;
         
/*76. From the following table, write a SQL query to list the unique jobs of department 2001 and 3001 in descending order. Return job name.
Sample table: employees*/
SELECT DISTINCT job_name
FROM employees
WHERE dep_id IN (2001,
                 3001)
ORDER BY job_name DESC;

/*77. From the following table, write a SQL query to list all the employees except the PRESIDENT and the MANAGER in ascending order of salaries. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE job_name NOT IN ('PRESIDENT',
                       'MANAGER')
ORDER BY salary ASC;

/*78. From the following table, write a SQL query to find the employees whose annual salary is less than $25,000 per year. 
Sort the result set in ascending order of the salary. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE (12*salary) < 25000
ORDER BY salary ASC;

/*79. From the following table, write a SQL query to list the employees who works as a SALESMAN. Sort the result set in ascending order of annual salary. 
Return employee id, name, annual salary, daily salary of all the employees.
Sample table: employees*/
SELECT e.emp_id,
       e.emp_name,
       12*salary "Annual Salary",
       (12*salary)/365 "Daily Salary"
FROM employees e
WHERE e.job_name = 'SALESMAN'
ORDER BY "Annual Salary" ASC;

/*80. From the following table, write a SQL query to list the employee ID, name, hire date, current date and experience of the employees in ascending order on
their experiences.
Sample table: employees*/
SELECT emp_id,
       emp_name,
       hire_date,
       CURRENT_DATE,
       TIMESTAMPDIFF(MONTH, hire_date, CURRENT_DATE) AS experience_in_months
FROM employees
ORDER BY experience_in_months ASC;

/*81. From the following table, write a SQL query to list the employees in ascending order of designations of those joined after the second half of 1991.
Sample table: employees*/
SELECT *
FROM employees
WHERE YEAR(hire_date) = 1991
  AND MONTH(hire_date) > 6
ORDER BY job_name ASC;

/*82. From the following table, write a SQL query to find the location of all the employees working in the FINANCE or AUDIT department. 
Sort the result-set in ascending order by department ID. Return complete information about the employees.
Sample table: employees
Sample table: department*/
SELECT *
FROM employees e,
     department d
WHERE (dep_name = 'FINANCE'
       OR dep_name ='AUDIT')
  AND e.dep_id = d.dep_id
ORDER BY e.dep_id ASC;

/*83. From the following tables, write a SQL query to find the employees along with grades in ascending order. Return complete information about the employees.
Sample table: employees
Sample table: salary_grade*/
SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary 
ORDER BY grade ASC;

SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary >= s.min_salary
  AND e.salary <= s.max_salary 
ORDER BY s.grade ASC;

/*84. From the following table, write a SQL query to find the employees according to the department in ascending order. 
Return name, job name, department, salary, and grade.
Sample table: employees
Sample table: department
Sample table: salary_grade*/
SELECT e.emp_name,
       e.job_name,
       d.dep_name,
       e.salary,
       s.grade
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND e.salary BETWEEN s.min_salary AND s.max_salary 
ORDER BY e.dep_id ;

/*85. From the following table, write a SQL query to select all employees except CLERK and sort the results in descending order by salary. 
Return employee name, job name, salary, grade and department name.
Sample table: employees
Sample table: department
Sample table: salary_grade*/
SELECT e.emp_name,
       e.job_name,
       e.salary,
       s.grade,
       d.dep_name
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND e.salary BETWEEN s.min_salary AND s.max_salary 
  AND e.job_name NOT IN('CLERK');

/*86. From the following table, write a SQL query to find those employees who work in the department 1001 or 2001. 
Return employee ID, name, salary, department, grade, experience, and annual salary.
Sample table: employees
Sample table: department
Sample table: salary_grade*/
SELECT e.emp_id,
       e.emp_name,
       e.salary,
       s.grade,
       d.dep_name,
       TIMESTAMPDIFF(YEAR, e.hire_date, CURRENT_DATE) AS "Experience",
       12 * e.salary AS "Annual Salary"
FROM employees e
JOIN department d ON e.dep_id = d.dep_id
JOIN salary_grade s ON e.salary BETWEEN s.min_salary AND s.max_salary
WHERE e.dep_id IN (1001, 2001);
  
/*87. From the following table, write a SQL query to list the details of the employees along with the details of their departments.
Sample table: employees
Sample table: department*/
SELECT *
FROM employees e,
     department d
WHERE e.dep_id= d.dep_id;

/*88. From the following table, write a SQL query to list the employees who are senior to their MANAGERS. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.hire_date < m.hire_date;
  
select * from employees w, employees m where w.manager_id = m.emp_id 
and w.hire_date < m.hire_Date;
  
SELECT *
FROM employees w,
     employees m
WHERE w.emp_id= m.manager_id
  AND w.hire_date> m.hire_date;
  
/*89. From the following table, write a SQL query to find those employees who work in the department 1001. Sort the result-set in ascending order by salary. 
Return employee ID, employee name, salary and department ID.
Sample table: employees*/
SELECT e.emp_id,
       e.emp_name,
       e.salary,
       e.dep_id
FROM employees E
WHERE e.dep_id = 1001
ORDER BY e.salary ASC;

/*90. From the following table, write a SQL query to find the highest salary. Return highest salary.
Sample table: employees*/
SELECT max(salary)
FROM employees;

/*91. From the following table, write a SQL query to calculate the average salary and average total remuneration (salary and commission) for each type of job. 
Return name, average salary and average total remuneration.
Sample table: employees*/
SELECT job_name,
       avg(salary),
       avg(salary+commission)
FROM employees
GROUP BY job_name;

/*92. From the following table, write a SQL query to calculate the total annual salary distributed across each job in 1991. Return job name, total annual salary.
Sample table: employees*/
SELECT job_name,
       SUM(12 * salary) AS "Total Annual Salary"
FROM employees
WHERE YEAR(hire_date) = 1991
GROUP BY job_name;

/*93. From the following table, write a SQL query to list the employee id, name, department id, location of all the employees.
Sample table: employees
Sample table: department*/
SELECT e.emp_id,
       e.emp_name,
       e.dep_id,
       d.dep_location
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id ;

/*94. From the following table, write a SQL query to find those employees who work in the department ID 1001 or 2001. 
Return employee ID, employee name, department ID, department location, and department name.
Sample table: employees
Sample table: department*/
SELECT e.emp_id,
       e.emp_name,
       e.dep_id,
       d.dep_location,
       d.dep_name
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
  AND e.dep_id IN (1001,
                   2001);
                   
/*95. From the following table, write a SQL query to find those employees whose salary is in the range of minimum and maximum salary (Begin and end values are included.). 
Return employee ID, name, salary and grade.
Sample table: employees
Sample table: salary_grade*/
SELECT e.emp_id,
       e.emp_name,
       e.salary,
       s.grade
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary ;

/*96. From the following table, write a SQL query to create a list of the managers and the number of employees they supervise. 
Sort the result set in ascending order on manager. Return manager ID and number of employees under them.
Sample table: employees*/
SELECT w.manager_id,
       count(*)
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
GROUP BY w.manager_id
ORDER BY w.manager_id ASC;

/*97. From the following table, write a SQL query to count the number of employees in each designation of a department. 
Return department id, job name and number of employees.
Sample table: employees*/
SELECT dep_id,
       job_name,
       count(*)
FROM employees
GROUP BY dep_id,
         job_name;
         
/*98. From the following table, write a SQL query to identify the departments in which at least two employees are employed. Return department id, number of employees.
Sample table: employees*/
SELECT dep_id,
       count(*)
FROM employees
GROUP BY dep_id
HAVING count(*) >= 2;

/*99. From the following table, write a SQL query to list the grade, number of employees, and maximum salary of each grade.
Sample table: employees
Sample table: salary_grade*/
SELECT s.grade,
       count(*),
       max(salary)
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary
GROUP BY s.grade;

/*100. From the following table, write a SQL query to identify departments with at least two SALESMEN in each grade. Return department name, grade and number of employees.
Sample table: employees
Sample table: department
Sample table: salary_grade*/
SELECT d.dep_name,
       s.grade,
       count(*)
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND e.job_name = 'SALESMAN'
  AND e.salary BETWEEN s.min_salary AND s.max_salary 
GROUP BY d.dep_name,
         s.grade
HAVING count(*) >= 2;

/*101. From the following table, write a SQL query to identify departments with fewer than four employees. Return department ID, number of employees.
Sample table: employees*/
SELECT dep_id,
       count(*)
FROM employees
GROUP BY dep_id
HAVING count(*)<4;

/*102. From the following table, write a SQL query to find which departments have at least two employees. Return department name, number of employees.
Sample table: employees
Sample table: department*/
SELECT d.dep_name,
       count(*)
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
GROUP BY d.dep_name
HAVING count(*) >= 2;

/*103. From the following table, write a SQL query to check whether the employees ID are unique or not. Return employee id, number of employees.
Sample table: employees*/
SELECT emp_id,
       count(*)
FROM employees
GROUP BY emp_id;

/*104. From the following table, write a SQL query to find number of employees and average salary. Group the result set on department id and job name. 
Return number of employees, average salary, department ID, and job name.
Sample table: employees*/
SELECT count(*),
       avg(salary),
       dep_id,
       job_name
FROM employees
GROUP BY dep_id,
         job_name;
         
/*105. From the following table, write a SQL query to identify those employees whose names begin with 'A' and are six characters long. Return employee name.
Sample table: employees*/
SELECT emp_name
FROM employees
WHERE emp_name LIKE 'A%'
  AND length(emp_name)=6;
  
/*106. From the following table, write a SQL query to find those employees whose name is six characters in length and the third character must be 'R'. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE length(emp_name)=6
  AND emp_name LIKE '__R%';
  
/*107. From the following table, write a SQL query to find those employees whose name is six characters in length, starting with 'A' and ending with 'N'. 
Return number of employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE length(emp_name)=6
  AND emp_name LIKE 'A%N';
  
/*108. From the following table, write a SQL query to find those employees who joined in the month of where the second letter is 'a'. Return number of employees.
Sample table: employees*/
SELECT COUNT(*)
FROM employees
WHERE SUBSTRING(UPPER(DATE_FORMAT(hire_date, '%b')), 2, 1) = 'A';

/*109. From the following table, write a SQL query to find those employees whose names contain the character set 'AR' together. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE emp_name LIKE '%AR%';

/*110. From the following table, write a SQL query to find those employees who joined in 90's. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 1999;

/*111. From the following table, write a SQL query to find those employees whose ID not start with the digit 68. Return employee ID, employee ID using trim function.
Sample table: employees*/
SELECT emp_id,
       TRIM(CAST(emp_id AS CHAR(5)))
FROM employees
WHERE LEFT(TRIM(CAST(emp_id AS CHAR(5))), 2) != '68';

select emp_id, trim(cast(emp_id as char(5))) from employees 
where left(trim(cast(emp_id as char(5))), 2) != '68';

/*112. From the following table, write a SQL query to find those employees whose names contain the letter 'A’. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE emp_name LIKE '%A%';

/*113. From the following table, write a SQL query to find those employees whose name ends with 'S' and six characters long. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE emp_name LIKE '%S'
  AND LENGTH (emp_name) = 6;
  
/*114. From the following table, write a SQL query to find those employees who joined in any month, but the month name contain the character ‘A’. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE MONTHNAME(hire_date) LIKE '%A%';

/*115. From the following table, write a SQL query to find those employees who joined in any month, but the name of the month contain the character ‘A’ in second position. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE SUBSTRING(MONTHNAME(hire_date), 2, 1) = 'A';