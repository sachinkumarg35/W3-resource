create database company;
use company;

## Create Employee Table
create table Employee(
empid int not null primary key auto_increment,
first_name varchar(25),
last_name varchar(25),
salary int(15),
joining_date datetime,
department_name varchar(25)
);

## Check the schema
desc Employee;

## Create Bonus Table
create table Bonus (
emp_ref_id int,
bonus_amt int,
bonus_date datetime,
foreign key (emp_ref_id) references Employee(empid)
on Delete Cascade
);

## Create Employee Designation table
create table Designation (
emp_ref_id int,
designation varchar(25),
designation_date datetime,
foreign key (emp_ref_id) references Employee (empid)
on Delete cascade
);

insert into Employee values 
(0001, 'Krish', 'Naik', 50000, '14-12-11 09.00.00', 'Development'),
(0002, 'Sudhanshu', 'Kumar', 60000, '14-12-11 09.00.00', 'Development'),
(0003, 'Sanket', 'Kumar', 70000, '15-12-12 09.00.00', 'HR'),
(0004, 'Darius', 'Bengali', 70000, '15-12-13 09.00.00', 'HR'),
(0005, 'Satish', 'Bansal', 60000, '17-10-21 09.00.00', 'Accoutant'),
(0006, 'Shaktiman', 'Hero', 50000, '17-10-15 09.00.00', 'Accoutant');

select * from Employee;

insert into Bonus values 
(0001, 5000, '16-03-12'),
(0002, 5000, '16-03-13'),
(0003, 5000, '17-03-15'),
(0001, 5000, '18-03-17'),
(0004, 3500, '16-03-19'),
(0005, 7000, '16-03-20'),
(0001, 8000, '20-03-21'),
(0002, 8500, '20-03-21');

select * from  Bonus;

Insert into Designation values 
(0001, 'Manager', '2016-02-05 00:00:00'),
(0002, 'Executive', '2016-06-11 00:00:00'),
(0003, 'Executive', '2016-06-11 00:00:00');

select * from Designation;