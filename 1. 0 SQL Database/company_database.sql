use company;
select * from Employee;
select * from Bonus;
select * from Designation;

## Easy Queries
#1. Write an Sql query to retrieve all details where first name from employee table which starts with 'd'

#Starts with
select * from employee where first_name like 'd%';

#Ends with
select * from employee where first_name like '%h';

#Everywhere
select * from employee where first_name like '%s%';

#2. Write an Sql query to print all details of the employees whose salary between 10000 to 55000
#fetch employee name

select * from employee where salary between 10000 and 55000;

select concat(first_name, '', last_name) as Employee_name, salary
from employee where empid in 
(select empid from employee where salary between 10000 and 55000);

#3. Sql query to retrieve all details of employees who have joined on a date
#feb 2014
select * from employee where year(joining_date)=2014 and month(joining_date)=12;

# 4. Sql query to fetch number of employees in every department.

select count(*) from employee group by department_name;

select * from  employee where department_name="Development";

#Intermediate
# 5. Sql query to print details of the employee who are also Executives
select * from employee;
select * from designation;
select employee.first_name, designation.designation from employee
inner join
designation on
employee.empid = designation.emp_ref_id
and designation.designation = "Executive";

#6. Sql query to clone a  new table from another table.

create table clone_employee like employee;
select * from clone_employee;
desc clone_employee;

#7. Sql query to show top n salary of employees.

select * from employee order by salary desc limit 4;

# Increasing Complexity
#8. Sql query to determine the 6th highest salary
select salary from employee order by salary desc limit 3, 1;

#9. Assignment for you.
## Sql query to determine the 6th highest salary using without limit.