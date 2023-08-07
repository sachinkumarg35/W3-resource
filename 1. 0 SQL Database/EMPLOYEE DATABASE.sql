CREATE DATABASE EMPLOYEE;
USE EMPLOYEE;

/* TABLE DEPARTMENT */
CREATE TABLE EMPLOYEES (
emp_id int primary key,
emp_name varchar(15),
job_name varchar(10),
manager_id int,
hire_date date,
salary decimal(10, 2),
commission decimal(7, 2),
dep_id int
);

SELECT * FROM EMPLOYEES;
INSERT INTO EMPLOYEES VALUES
(68319 , 'KAYLING'  , 'PRESIDENT' ,      NULL      , '1991-11-18' , 6000.00 ,   NULL         ,   1001),
(66928 , 'BLAZE'   , 'MANAGER'   ,      68319 , '1991-05-01' , 2750.00 ,   NULL         ,   3001),
(67832 , 'CLARE'    , 'MANAGER'   ,      68319 , '1991-06-09' , 2550.00 ,   NULL      ,   1001),
(65646 , 'JONAS'    , 'MANAGER'   ,      68319 , '1991-04-02' , 2957.00 ,   NULL         ,   2001),
(67858 , 'SCARLET'  , 'ANALYST'   ,      65646 , '1997-04-19' , 3100.00 ,   NULL         ,   2001),
(69062 , 'FRANK'    , 'ANALYST'   ,      65646 , '1991-12-03' , 3100.00 ,   NULL         ,   2001),
(63679 , 'SANDRINE' , 'CLERK'     ,      69062 , '1990-12-18' ,  900.00 ,   NULL         ,   2001),
(64989 , 'ADELYN'   , 'SALESMAN'  ,      66928 , '1991-02-20' , 1700.00 ,     400.00 ,   3001),
(65271 , 'WADE'     , 'SALESMAN'  ,      66928 , '1991-02-22' , 1350.00 ,     600.00 ,   3001),
(66564 , 'MADDEN'   , 'SALESMAN'  ,      66928 , '1991-09-28' , 1350.00 ,    1500.00 ,   3001),
(68454 , 'TUCKER'   , 'SALESMAN'  ,      66928 , '1991-09-08' , 1600.00 ,       0.00 ,   3001),
(68736 , 'ADNRES'   , 'CLERK'     ,      67858 , '1997-05-23' , 1200.00 ,   NULL     ,   2001),
(69000 , 'JULIUS'   , 'CLERK'     ,      66928 , '1991-12-03' , 1050.00 ,   NULL         ,   3001),
(69324 , 'MARKER'   , 'CLERK'     ,      67832 , '1992-01-23' , 1400.00 ,   NULL         ,   1001);

/* TABLE DEPARTMENT */
CREATE TABLE DEPARTMENT (
dep_id int primary key,
dep_name varchar(35),
dep_location varchar(35)
);

SELECT * FROM DEPARTMENT;
INSERT INTO DEPARTMENT VALUES
(1001 , 'FINANCE'    , 'SYDNEY'),
(2001 , 'AUDIT'      , 'MELBOURNE'),
(3001 , 'MARKETING'  , 'PERTH'),
(4001 , 'PRODUCTION' , 'BRISBANE');


/* TABLE SALARY_GRADE */
CREATE TABLE SALARY_GRADE (
grade int primary key,
min_salary int,
max_salary int
);


SELECT * FROM SALARY_GRADE;
INSERT INTO SALARY_GRADE VALUES
(1 ,    800 ,   1300),
(2 ,    1301 ,    1500),
(3 ,    1501 ,    2100),
(4 ,    2101 ,    3100),
(5 ,    3101 ,    9999);

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENT;
SELECT * FROM SALARY_GRADE;