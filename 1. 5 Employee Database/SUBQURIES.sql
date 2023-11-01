USE EMPLOYEE;

/*1. From the following table, write a SQL query to find the managers. Return complete information about the managers.
Sample table: employees*/
SELECT *
FROM employees
WHERE emp_id IN
    (SELECT manager_id
     FROM employees);
     
/*2. From the following table, write a SQL query to compute the experience of all the managers. Return employee ID, employee name, job name, joining date, and experience.
Sample table: employees*/
SELECT e.emp_id,
       e.emp_name,
       e.job_name,
       e.hire_date,
       CONCAT(
           FLOOR(DATEDIFF(CURRENT_DATE, e.hire_date) / 365), ' years ',
           FLOOR((DATEDIFF(CURRENT_DATE, e.hire_date) % 365) / 30), ' months ',
           (DATEDIFF(CURRENT_DATE, e.hire_date) % 365) % 30, ' days'
       ) AS "Experience"
FROM employees e
JOIN employees m ON e.emp_id = m.manager_id;

select e.emp_id, e.emp_name, e.job_name, e.hire_date, concat(floor(datediff(
current_Date, e.hire_Date) / 365), ' years ',
floor((datedifF(current_Date, e.hire_date) % 365) / 30), ' months ',
(datediff(current_Date, e.hire_date) % 365) % 30, ' days ') as 'Experience ' 
from employees e
join employees m on e.emp_id = m.manager_id; 

/*3. From the following table, write a SQL query to find those employees who work as 'MANAGERS' and 'ANALYST' and working in ‘SYDNEY’ or ‘PERTH’ with an 
experience more than 5 years without receiving the commission. Sort the result-set in ascending order by department location. 
Return employee ID, employee name, salary, and department name.
Sample table: employees*/
SELECT e.emp_id,
       e.emp_name,
       e.salary,
       d.dep_name
FROM employees e
JOIN department d ON e.dep_id = d.dep_id
WHERE d.dep_location IN ('SYDNEY', 'PERTH')
  AND e.job_name IN ('MANAGER', 'ANALYST')
  AND TIMESTAMPDIFF(YEAR, e.hire_date, CURRENT_DATE) > 5
  AND e.commission IS NULL
ORDER BY d.dep_location ASC;

/*4. From the following tables, write a SQL query to find those employees work at SYDNEY or working in the FINANCE department with an annual salary above 28000, 
but the monthly salary should not be 3000 or 2800 and who do not work as a MANAGER and whose ID contain a digit of '3' or '7' in 3rd position. 
Sort the result-set in ascending order by department ID and descending order by job name. 
Return employee ID, employee name, salary, department name, department location, department ID, and job name.
Sample table: employees
Sample table: department*/
SELECT E.emp_id,
       E.emp_name,
       E.salary,
       D.dep_name,
       D.dep_location,
       E.dep_id,
       E.job_name
FROM employees E
JOIN department D ON E.dep_id = D.dep_id
WHERE (D.dep_location = 'SYDNEY' OR D.dep_name = 'FINANCE')
  AND (12 * E.salary) > 28000
  AND E.salary NOT IN (3000, 2800)
  AND E.job_name != 'MANAGER'
  AND (SUBSTRING(CAST(E.emp_id AS CHAR(5)), 3, 1) IN ('3', '7'))
ORDER BY E.dep_id ASC,
         E.job_name DESC;
         
/*5. From the following table, write a SQL query to find the employees of grade 2 and 3.Return all the information of employees and salary details.
Sample table: employees
Sample table: salary_grade*/
SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary 
  AND s.grade IN (2, 3);
  
/*6. From the following table, write a SQL query to find those employees of grade 4 or 5 and who work as ANALYST or MANAGER. 
Return complete information about the employees.
Sample table: employees
Sample table: salary_grade*/
SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary 
  AND s.grade IN (4,
                  5)
  AND e.emp_id IN
    (SELECT e.emp_id
     FROM employees e
     WHERE e.job_name IN ('MANAGER',
                          'ANALYST'));
					
/*7. From the following table, write a SQL query to find those employees whose salary is more than the salary of JONAS. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE salary >
    (SELECT salary
     FROM employees
     WHERE emp_name = 'JONAS');
     
/*8. From the following table, write a SQL query to find those employees who work as same designation of FRANK. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE job_name =
    (SELECT job_name
     FROM employees
     WHERE emp_name = 'FRANK');
     
/*9. From the following table, write a SQL query to find those employees who are senior to ADELYN. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE hire_date <
    (SELECT hire_date
     FROM employees
     WHERE emp_name = 'ADELYN');
     
/*10. From the following table, write a SQL query to find those employees of department ID 2001 and whose designation is same as of the designation of department ID 1001. 
Return complete information about the employees.
Sample table: employees
Sample table: department*/
SELECT *
FROM employees e,
     department d
WHERE d.dep_id = 2001
  AND e.dep_id = d.dep_id
  AND e.job_name IN
    (SELECT e.job_name
     FROM employees e,
          department d
     WHERE e.dep_id = d.dep_id
       AND d.dep_id =1001);
       
/*11. From the following table, write a SQL query to find those employees whose salary is the same as the salary of FRANK or SANDRINE. 
Sort the result-set in descending order by salary. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE salary IN
    (SELECT salary
     FROM employees e
     WHERE e.emp_name IN ('FRANK',
                          'BLAZE')
       AND employees.emp_id <> e.emp_id);
       
SELECT *
FROM employees 
WHERE salary IN
    (SELECT salary
     FROM employees e
     WHERE (emp_name = 'FRANK'
            OR emp_name = 'BLAZE')
AND employees.emp_id <> e.emp_id)
ORDER BY salary DESC;

/*12. From the following table, write a SQL query to find those employees whose designation are the same as the designation of MARKER or salary is 
more than the salary of ADELYN. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE job_name =
    (SELECT job_name
     FROM employees
     WHERE emp_name = 'MARKER' )
  OR salary>
    (SELECT salary
     FROM employees
     WHERE emp_name = 'ADELYN');
     
/*13. From the following table, write a SQL query to find those employees whose salary is more than the total remuneration (salary + commission) of the designation SALESMAN. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE salary >
    (SELECT max(salary+commission)
     FROM employees
     WHERE job_name = 'SALESMAN');
     
/*14. From the following table, write a SQL query to find those employees who are senior to BLAZE and working at PERTH or BRISBANE. 
Return complete information about the employees.
Sample table: employees
Sample table: department*/
SELECT *
FROM employees e,
     department d
WHERE d.dep_location IN ('PERTH',
                         'BRISBANE')
  AND e.dep_id = d.dep_id
  AND e.hire_date <
    (SELECT e.hire_date
     FROM employees e
     WHERE e.emp_name = 'BLAZE') ;

/*15. From the following tables, write a SQL query to find those employees of grade 3 and 4 and work in the department of FINANCE or AUDIT and whose salary is
more than the salary of ADELYN and experience is more than FRANK. Return complete information about the employees.
Sample table: employees
Sample table: department
Sample table: salary_grade*/
SELECT *
FROM employees e
WHERE e.dep_id IN
    (SELECT d.dep_id
     FROM department d
     WHERE d.dep_name IN ('FINANCE',
                          'AUDIT') )
  AND e.salary >
    (SELECT salary
     FROM employees
     WHERE emp_name = 'ADELYN')
  AND e.hire_date <
    (SELECT hire_date
     FROM employees
     WHERE emp_name = 'FRANK')
  AND e.emp_id IN
    (SELECT e.emp_id
     FROM employees e,
          salary_grade s
     WHERE e.salary BETWEEN s.min_salary AND s.max_salary 
       AND s.grade IN (3,
                       4) )
ORDER BY e.hire_date ASC;

/*16. From the following table, write a SQL query to find those employees whose designation is same as the designation of SANDRINE or ADELYN. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE job_name IN
    (SELECT job_name
     FROM employees
     WHERE emp_name = 'SANDRINE'
       OR emp_name = 'ADELYN');
       
SELECT *
FROM employees
WHERE job_name IN
    (SELECT job_name
     FROM employees
     WHERE emp_name IN('SANDRINE',
					'ADELYN'));
				
/*17. From the following table, write a SQL query to list any job of department ID 1001 which are not found in department ID 2001. Return job name.
Sample table: employees*/
SELECT e.job_name
FROM employees e
WHERE e.dep_id = 1001
  AND e.job_name NOT IN
    (SELECT job_name
     FROM employees
     WHERE dep_id =2001);
     
/*18. From the following table, write a SQL query to find the highest paid employee. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE salary IN
    (SELECT max(salary)
     FROM employees);
  
/*19. From the following table, write a SQL query to find the highest paid employees in the department MARKETING. Return complete information about the employees.
Sample table: employees
Sample table: department*/
SELECT *
FROM employees
WHERE salary IN
    (SELECT max(salary)
     FROM employees
     WHERE dep_id IN
         (SELECT d.dep_id
          FROM department d
          WHERE d.dep_name = 'MARKETING'));
          
/*20. From the following tables, write a SQL query to find the employees of grade 3 who joined recently and location at PERTH. 
Return employee ID, employee name, job name, hire date, and salary.
Sample table: employees
Sample table: department
Sample table: salary_grade*/
SELECT e.emp_id, e.emp_name, e.job_name, e.hire_date,e.salary
FROM employees e
WHERE e.dep_id IN
    (SELECT d.dep_id
     FROM department d
     WHERE d.dep_location = 'PERTH')
  AND e.hire_date IN
    (SELECT max(hire_date)
     FROM employees
     WHERE emp_id IN
         (SELECT emp_id
          FROM employees e,
               salary_grade s
          WHERE e.salary BETWEEN s.min_salary AND s.max_salary 
            AND s.grade = 3)) ;
            
SELECT e.emp_id, e.emp_name, e.job_name, e.hire_date,e.salary
FROM employees e,
     department d
WHERE d.dep_location='PERTH'
  AND hire_date IN
    (SELECT max(hire_date)
     FROM employees e,
          salary_grade s
     WHERE salary BETWEEN min_salary AND max_salary 
       AND grade=3);
       
/*21. From the following table, write a SQL query to find those employees who are senior to recently hired employee and work under KAYLING. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE hire_date <
    (SELECT max(hire_date)
     FROM employees
     WHERE manager_id IN
         (SELECT emp_id
          FROM employees
          WHERE emp_name = 'KAYLING'));
          
/*22. From the following tables, write a SQL query to find those employees of grade 3 to 5 and location at SYDNEY. 
The employees are not in PRESIDENT designated and salary is more than the highest paid employee of PERTH where no MANAGER and SALESMAN are working under KAYLING. 
Return complete information about the employees.
Sample table: employees
Sample table: department
Sample table: salary_grade*/
SELECT *
FROM employees
WHERE dep_id IN
    (SELECT dep_id
     FROM department
     WHERE department.dep_location ='SYDNEY')
  AND emp_id IN
    (SELECT emp_id
     FROM employees e,
          salary_grade s
     WHERE e.salary BETWEEN min_salary AND s.max_salary 
       AND s.grade IN (3,
                       4,
                       5) )
  AND job_name != 'PRESIDENT'
  AND salary >
    (SELECT max(salary)
     FROM employees
     WHERE dep_id IN
         (SELECT dep_id
          FROM department
          WHERE department.dep_location = 'PERTH')
       AND job_name IN ('MANAGER',
                        'SALESMAN')
       AND manager_id NOT IN
         (SELECT emp_id
          FROM employees
          WHERE emp_name = 'KAYLING'));
          
/*23. From the following table, write a SQL query to find those employees who are senior employees as of year 1991. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE YEAR(hire_date) = 1991;

/*24. From the following table, write a SQL query to find those employees who joined in 1991 in a designation same as the most senior person of the year 1991. 
Return complete information about the employees.
Sample table: employees*/
SELECT e.*
FROM employees e
JOIN (
  SELECT job_name, MIN(hire_date) AS min_hire_date
  FROM employees
  WHERE YEAR(hire_date) = 1991
  GROUP BY job_name
) AS most_senior_1991
ON e.job_name = most_senior_1991.job_name AND YEAR(e.hire_date) = 1991 AND e.hire_date = most_senior_1991.min_hire_date;

/*25. From the following table, write a SQL query to find the most senior employee of grade 4 or 5, work under KAYLING. Return complete information about the employees.
Sample table: employees
Sample table: salary_grade*/
SELECT *
FROM employees
WHERE hire_date IN
    (SELECT min(hire_date)
     FROM employees
     WHERE emp_id IN
         (SELECT emp_id
          FROM employees e,
               salary_grade s
          WHERE e.salary BETWEEN s.min_salary AND s.max_salary 
            AND s.grade IN (4,
                            5)))
  AND manager_id IN
    (SELECT emp_id
     FROM employees
     WHERE emp_name = 'KAYLING');
     
/*26. From the following table, write a SQL query to compute the total salary of the designation MANAGER. Return total salary.
Sample table: employees*/
SELECT SUM(salary)
FROM employees
WHERE job_name = 'MANAGER';

/*27. From the following table, write a SQL query to compute the total salary of employees of grade 3. Return total salary.
Sample table: employees
Sample table: salary_grade*/
SELECT sum(salary)
FROM employees
WHERE emp_id IN
    (SELECT emp_id
     FROM employees e,
          salary_grade s
     WHERE e.salary BETWEEN s.min_salary AND s.max_salary 
       AND s.grade = 3);
       
/*28. From the following table, write a SQL query to find those employees of department 1001 and whose salary is more than the average salary of employees in department 2001. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE dep_id =1001
  AND salary >
    (SELECT AVG (salary)
     FROM employees
     WHERE dep_id = 2001);
     
/*29. From the following table, write a SQL query to find those departments where maximum number of employees work. 
Return department ID, department name, location and number of employees.
Sample table: employees
Sample table: department*/
SELECT d.dep_id,
       d.dep_name,
       d.dep_location,
       count(*)
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
GROUP BY d.dep_id
HAVING count(*) =
  (SELECT MAX(mycount)
   FROM
     (SELECT COUNT(*) mycount
      FROM employees
      GROUP BY dep_id) a);

SELECT *
FROM department
WHERE dep_id IN
    (SELECT dep_id
     FROM employees
     GROUP BY dep_id
     HAVING count(*) IN
       (SELECT MAX(mycount)
        FROM
          (SELECT COUNT(*) mycount
           FROM employees
           GROUP BY dep_id) a));

/*30. From the following table, write a SQL query to find those employees whose manager is JONAS. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE manager_id IN
    (SELECT emp_id
     FROM employees
     WHERE emp_name = 'JONAS');
     
SELECT *
FROM employees
WHERE manager_id =
    (SELECT emp_id
     FROM employees
     WHERE emp_name = 'JONAS');

/*31. From the following table, write a SQL query to find those employees who are not working in the department MARKETING. Return complete information about the employees.
Sample table: employees
Sample table: department*/
SELECT *
FROM employees
WHERE dep_id NOT IN
    (SELECT dep_id
     FROM department
     WHERE dep_name = 'MARKETING');
     
/*32. From the following table, write a SQL query to find those employees who are working as a manager. Return employee name, job name, department name, and location.
Sample table: employees
Sample table: department*/
SELECT e.emp_name,
       e.job_name,
       d.dep_name,
       d.dep_location
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
  AND e.emp_id IN
    (SELECT manager_id
     FROM employees) ;
     
/*33. From the following table, write a SQL query to find those employees who receive the highest salary of each department. Return employee name and department ID.
Sample table: employees*/
SELECT e.emp_name,
       e.dep_id
FROM employees e
WHERE e.salary IN
    (SELECT max(salary)
     FROM employees
     GROUP BY dep_id) ;
     
/*34. From the following table, write a SQL query to find those employees whose salary is equal or more to the average of maximum and minimum salary. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE salary >=
    (SELECT (max(salary)+min(salary))/2
     FROM employees);

/*35. From the following table, write a SQL query to find those managers whose salary is more than the average salary of his employees. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees m
WHERE m.emp_id IN
    (SELECT manager_id
     FROM employees)
  AND m.salary >
    (SELECT avg(e.salary)
     FROM employees e
     WHERE e.manager_id = m.emp_id );
     
/*36. From the following table, write a SQL query to find those employees whose salary is less than the salary of his manager but more than the salary of any other manager. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.salary < m.salary
  AND w.salary > ANY
    (SELECT salary
     FROM employees
     WHERE emp_id IN
         (SELECT manager_id
          FROM employees));
          
SELECT DISTINCT W.emp_id,
                W.emp_name,
                W.salary
FROM
  (SELECT w.emp_id,
          w.emp_name,
          w.salary
   FROM employees w,
        employees m
   WHERE w.manager_id = m.emp_id
     AND w.salary<m.salary) W,

  (SELECT *
   FROM employees
   WHERE emp_id IN
       (SELECT manager_id
        FROM employees)) A
WHERE W.salary > A.salary;

/*37. From the following table, write a SQL query to compute department wise average salary of employees. 
Return employee name, average salary, department ID as "Current Salary".
Sample table: employees*/
SELECT e.emp_name,
       d.avgsal,
       e.dep_id AS "Current Salary"
FROM employees e,

  (SELECT avg(salary) avgsal,
          dep_id
   FROM employees
   GROUP BY dep_id) d
WHERE e.dep_id=d.dep_id;

/*38. From the following table, write a SQL query to find five lowest paid workers. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees e
WHERE 5>
    (SELECT count(*)
     FROM employees
     WHERE e.salary >salary);
     
/*39. From the following table, write a SQL query to find those managers who are not working under the PRESIDENT. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE emp_id IN
    (SELECT manager_id
     FROM employees)
  AND manager_id NOT IN
    (SELECT emp_id
     FROM employees
     WHERE job_name = 'PRESIDENT');
     
/*40. From the following table, write a SQL query to find those departments where the number of employees is equal to the number of characters in the department name. 
Return complete information about the employees.
Sample table: employees
Sample table: department*/
SELECT *
FROM department d
WHERE length(dep_name) IN
    (SELECT count(*)
     FROM employees e
     WHERE e.dep_id = d.dep_id );
     
SELECT d.dep_name,
       count(*)
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
GROUP BY d.dep_name
HAVING count(*) = LENGTH (d.dep_name);

/*42. From the following table, write a SQL query to find those employees who joined in the company on the same date. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees e
WHERE hire_date IN
    (SELECT hire_date
     FROM employees
     WHERE e.emp_id <> emp_id);
     
/*43. From the following table, write a SQL query to find those departments where more than average number of employees works. Return department name.
Sample table: employees
Sample table: department*/
SELECT d.dep_name
FROM department d,
     employees e
WHERE e.dep_id = d.dep_id
GROUP BY d.dep_name
HAVING count(*) >
  (SELECT AVG (mycount)
   FROM
     (SELECT COUNT(*) mycount
      FROM employees
      GROUP BY dep_id) a);
      
/*44. From the following table, write a SQL query to find those managers who handle maximum number of employees. Return managers name, number of employees.
Sample table: employees*/
SELECT m.emp_name,
       count(*)
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
GROUP BY m.emp_name
HAVING count(*) =
  (SELECT MAX(mycount)
   FROM
     (SELECT COUNT(*) mycount
      FROM employees
      GROUP BY manager_id) a);
      
/*45. From the following table, write a SQL query to find those managers who receive less salary then the employees work under them. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees w
WHERE salary < ANY
    (SELECT salary
     FROM employees
     WHERE w.emp_id=manager_id);
     
SELECT DISTINCT m.emp_name,
                m.salary
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.salary>m.salary;
  
SELECT *
FROM employees w
WHERE emp_id IN
    (SELECT manager_id
     FROM employees
     WHERE w.salary<salary);
     
/*46. From the following table, write a SQL query to find those employees who are sub-ordinates of BLAZE. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE manager_id IN
    (SELECT emp_id
     FROM employees
     WHERE emp_name = 'BLAZE');
     
/*47. From the following table, write a SQL query to find those employees who work as managers. Return complete information about the employees. Use co-related subquery.
Sample table: employees*/
SELECT *
FROM employees
WHERE emp_id IN
    (SELECT manager_id
     FROM employees);
     
/*48. From the following table, write a SQL query to list the name of the employees for their manager JONAS and the name of the manager of JONAS.
Sample table: employees*/
SELECT w.emp_name,
       m.emp_name,

  (SELECT emp_name
   FROM employees
   WHERE m.manager_id = emp_id) "his MANAGER"
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND m.emp_name = 'JONAS';
  
SELECT e.emp_name ,
       w.emp_name as "manager for employees" ,
       m.emp_name as "manager for JONAS"
FROM employees e,
     employees w,
     employees m
WHERE e.manager_id = w.emp_id
  AND w.emp_name = 'JONAS'
  AND w.manager_id = m.emp_id;

/*49. From the following table, write a SQL query to find those employees who receive minimum salary for a designation. Sort the result-set in ascending order by salary. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE salary IN
    (SELECT min(salary)
     FROM employees
     GROUP BY job_name)
ORDER BY salary ASC;

/*50. From the following table, write a SQL query to find those employees who receive maximum salary for a designation. 
Sort the result-set in descending order by salary. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE salary IN
    (SELECT max(salary)
     FROM employees
     GROUP BY job_name)
ORDER BY salary DESC;

/*51. From the following table, write a SQL query to find recently hired employees of every department. Sort the result-set in descending order by hire date. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees e
WHERE hire_date IN
    (SELECT max(hire_date)
     FROM employees
     WHERE e.dep_id = dep_id )
ORDER BY hire_date DESC;

/*52. From the following table, write a SQL query to find those employees who receive a salary higher than the average salary of their department. 
Sort the result-set in ascending order by department ID. Return employee name, salary, and department ID.
Sample table: employees*/
SELECT e.emp_name,
       e.salary,
       e.dep_id
FROM employees e
WHERE salary >
    (SELECT avg(salary)
     FROM employees
     WHERE e.dep_id = dep_id )
ORDER BY dep_id;

SELECT e.emp_name,
       e.salary,
       e.dep_id
FROM employees e,

  (SELECT avg(salary) A,
          dep_id D
   FROM employees
   GROUP BY dep_id) D1
WHERE D1.D = e.dep_id
  AND e.salary > D1.A;
  
/*53. From the following table, write a SQL query to find those employees who earn a commission and receive maximum salary. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE salary =
    (SELECT max(salary)
     FROM employees
     WHERE commission IS NOT NULL);
     
/*54. From the following table, write a SQL query to find those employees who do not work in the department 1001 but work in the same designation and 
salary as the employees in department 3001. Return employee name, job name and salary.
Sample table: employees*/
SELECT emp_name,
       job_name,
       salary
FROM employees
WHERE dep_id != 1001
  AND job_name IN
    (SELECT job_name
     FROM employees
     WHERE dep_id = 3001)
  AND salary IN
    (SELECT salary
     FROM employees
     WHERE dep_id = 3001);
     
/*55. From the following table, write a SQL query to find those employees who get a commission percent and works as a SALESMAN and earn maximum net salary. 
Return department ID, name, designation, salary, and net salary (salary+ commission).
Sample table: employees*/
SELECT dep_id,
       emp_name,
       job_name,
       salary,
       salary+commission "Net Salary"
FROM employees
WHERE job_name = 'SALESMAN'
  AND salary+commission IN
    (SELECT max(salary+commission) 
     FROM employees
     WHERE commission IS NOT NULL);

     
/*56. From the following table, write a SQL query to find those employees who gets a commission and earn the second highest net salary (salary + commission). 
Return department id, employee name, designation, salary, and net salary.
Sample table: employees*/
SELECT dep_id,
       emp_name,
       salary,
       job_name,
       salary+commission "Net Salary"
FROM employees e
WHERE 2-1 = (
  SELECT count(DISTINCT emp.salary+emp.commission)
  FROM employees emp WHERE emp.salary+emp.commission>e.salary+e.commission);
  
/*57. From the following table, write a SQL query to find those departments where the average salary is less than the averages for all departments. 
Return department ID, average salary.
Sample table: employees*/
SELECT dep_id,
       avg(salary)
FROM employees
GROUP BY dep_id
HAVING avg(salary) <
  (SELECT avg(salary)
   FROM employees);
   
/*58. From the following tables, write a SQL query to find the unique department of the employees. Return complete information about the employees.
Sample table: employees
Sample table: department*/
SELECT *
FROM department
WHERE dep_id IN
    (SELECT DISTINCT dep_id
     FROM employees);
     
/*59. From the following tables, write a SQL query to list the details of the employees working at PERTH.
Sample table: employees
Sample table: department*/
SELECT *
FROM employees
WHERE dep_id IN
    (SELECT dep_id
     FROM department
     WHERE department.dep_location = 'PERTH');
     
/*60. From the following tables, write a SQL query to list the employees of grade 2 or 3 and the department where he or she works, is located in the city PERTH. 
Return complete information about the employees.
Sample table: employees
Sample table: department
Sample table: salary_grade*/
SELECT *
FROM employees
WHERE emp_id IN
    (SELECT emp_id
     FROM employees e,
          salary_grade s
     WHERE e.salary BETWEEN s.min_salary AND s.max_salary 
       AND s.grade IN (2,
                       3))
  AND dep_id IN
    (SELECT dep_id
     FROM department
     WHERE dep_LOCATION='PERTH');
     
/*61. From the following table, write a SQL query to find those employees whose designation is same as the designation of ADELYN or 
the salary is more than the salary of WADE. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE job_name =
    (SELECT job_name
     FROM employees
     WHERE emp_name = 'ADELYN')
  OR salary >
    (SELECT salary
     FROM employees
     WHERE emp_name = 'WADE');
     
/*62. From the following table, write a SQL query to find those employees of department 1001 whose salary is more than the salary of ADELYN. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE dep_id = 1001
  AND salary >
    (SELECT salary
     FROM employees
     WHERE emp_name = 'ADELYN');
     
/*63. From the following table, write a SQL query to find those managers who are senior to KAYLING and who are junior to SANDRINE. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE emp_id IN
    (SELECT manager_id
     FROM employees
     WHERE hire_date<
         (SELECT hire_date
          FROM employees
          WHERE emp_name = 'KAYLING' )
       AND hire_date >
         (SELECT hire_date
          FROM employees
          WHERE emp_name = 'SANDRINE'))
  AND manager_id IS NOT NULL;
  
/*64. From the following tables, write a SQL query to find those employees who work in the department where KAYLING works. 
Return employee ID, employee name, department location, salary, department name.
Sample table: employees
Sample table: department*/
SELECT e.emp_id,
       e.emp_name,
       d.dep_location,
       e.salary,
       d.dep_name
FROM employees e,
     department d
WHERE e.dep_id=d.dep_id
  AND e.dep_id IN
    (SELECT dep_id
     FROM employees
     WHERE emp_name = 'KAYLING'
       AND employees.emp_id <> e.emp_id);
       
/*65. From the following tables, write a SQL query to find those employees whose salary grade is greater than the grade of MARKER. 
Return complete information about the employees.
Sample table: employees
Sample table: salary_grade*/
SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary 
  AND s.grade >
    (SELECT s.grade
     FROM employees e,
          salary_grade s
     WHERE e.salary BETWEEN s.min_salary AND s.max_salary 
       AND e.emp_name = 'MARKER');
       
/*66. From the following tables, write a SQL query to find those employees whose grade same as the grade of TUCKER or experience is more than 
SANDRINE and who are belonging to SYDNEY or PERTH. Return complete information about the employees.
Sample table: employees
Sample table: department
Sample table: salary_grade*/
SELECT e.*
FROM employees e
JOIN department d ON e.dep_id = d.dep_id
JOIN salary_grade s ON e.salary BETWEEN s.min_salary AND s.max_salary
WHERE d.dep_location IN ('SYDNEY', 'PERTH')
  AND (s.grade = (
      SELECT s.grade
      FROM employees e
      JOIN salary_grade s ON e.salary BETWEEN s.min_salary AND s.max_salary
      WHERE e.emp_name = 'TUCKER'
      LIMIT 1
    )
    OR TIMESTAMPDIFF(YEAR, e.hire_date, CURDATE()) >
    (SELECT TIMESTAMPDIFF(YEAR, hire_date, CURDATE())
     FROM employees
     WHERE emp_name = 'SANDRINE'
     LIMIT 1)
  );
          
/*67. From the following tables, write a SQL query to find those employees whose salary is same as any one of the employee. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE salary IN
    (SELECT salary
     FROM employees e
     WHERE employees.emp_id <> e.emp_id);
     
/*68. From the following tables, write a SQL query to find compute the total remuneration (salary + commission) of all sales person of MARKETING department. 
Return complete information about the employees.
Sample table: employees
Sample table: department*/
SELECT *
FROM employees e
WHERE salary+commission IN
    (SELECT salary+commission
     FROM employees e,
          department d
     WHERE e.dep_id=d.dep_id
       AND d.dep_name = 'MARKETING'
       AND e.job_name = 'SALESMAN');
       
/*69. From the following table, write a SQL query to find the recently hired employees of department 3001. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE hire_date IN
    (SELECT max(hire_date)
     FROM employees
     WHERE dep_id = 3001) AND dep_id=3001;
     
/*70. From the following tables, write a SQL query to find the highest paid employees of PERTH who joined before recently hired employee of grade 2. 
Return complete information about the employees.
Sample table: employees
Sample table: department
Sample table: salary_grade*/
SELECT *
FROM employees
WHERE salary =
    (SELECT max(salary)
     FROM employees e,
          department d
     WHERE e.dep_id = d.dep_id
       AND d.dep_location = 'PERTH'
       AND hire_date <
         (SELECT max(hire_date)
          FROM employees e,
               salary_grade s
          WHERE e.salary BETWEEN s.min_salary AND s.max_salary 
            AND s.grade = 2));
            
/*71. From the following table, write a SQL query to find the highest paid employees work under KAYLING. Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees
WHERE salary IN
    (SELECT max(salary)
     FROM employees
     WHERE manager_id IN
         (SELECT emp_id
          FROM employees
          WHERE emp_name = 'KAYLING'));
          
/*72. From the following table, write a SQL query to find those employees whose net pay are higher than or equal to the salary of any other employee in the company. 
Return employee name, salary, and commission.
Sample table: employees*/
SELECT e.emp_name,
       e.salary,
       e.commission
FROM employees e
WHERE
    (SELECT max(salary+commission)
     FROM employees) > ANY
    (SELECT salary
     FROM employees);
     
/*73. From the following table, write a SQL query to find those employees whose salaries are greater than the salaries of their managers. 
Return complete information about the employees.
Sample table: employees*/
SELECT *
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.salary> m.salary;
  
SELECT *
FROM employees e,
  (SELECT *
   FROM employees
   WHERE emp_id IN
       (SELECT manager_id
        FROM employees)) a
WHERE e.salary >a.salary
  AND e.manager_id = a.emp_id;
  
/*74. From the following table, write a SQL query to find the maximum average salary drawn for each job except for PRESIDENT.
Sample table: employees*/
SELECT max(myavg)
FROM
  (SELECT avg(salary) myavg
   FROM employees
   WHERE job_name != 'PRESIDENT'
   GROUP BY job_name) a;
   
/*75. From the following table, write a SQL query to count the number of employees who work as a manager. Return number of employees.
Sample table: employees*/
SELECT count(*)
FROM employees
WHERE emp_id IN
    (SELECT manager_id
     FROM employees);
     
SELECT count(DISTINCT m.emp_id)
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id ;

/*76. From the following table, write a SQL query to find those departments where no employee works. Return department ID.
Sample table: employees
Sample table: department*/
SELECT b.dep_id,
       count(a.dep_id)
FROM department b
LEFT OUTER JOIN employees a ON a.dep_id=b.dep_id
GROUP BY b.dep_id
HAVING count(a.dep_id) = 0;