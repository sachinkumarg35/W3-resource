CREATE DATABASE HOSPITAL;
USE HOSPITAL;

/* TABLE NURSE */
CREATE TABLE NURSE (
employeeid int primary key,
name text,
position text,
registered BOOLEAN,
ssn int
);

SELECT * FROM NURSE;
INSERT INTO NURSE VALUES 
(101 , 'Carla Espinosa'  , 'Head Nurse' , true          , 111111110),
(102 , 'Laverne Roberts' , 'Nurse'      , true          , 222222220),
(103 , 'Paul Flowers'    , 'Nurse'      , false          , 333333330);

/* TABLE PHYSIAN */
CREATE TABLE PHYSICIAN (
employeeid int primary key,
name text,
position text,
ssn int
);

SELECT * FROM PHYSICIAN;
INSERT INTO PHYSICIAN VALUES 
(1 , 'John Dorian'       , 'Staff Internist'              , 111111111),
(2 , 'Elliot Reid'       , 'Attending Physician'          , 222222222),
(3 , 'Christopher Turk'  , 'Surgical Attending Physician' , 333333333),
(4 , 'Percival Cox'      , 'Senior Attending Physician'   , 444444444),
(5 , 'Bob Kelso'         , 'Head Chief of Medicine'       , 555555555),
(6 , 'Todd Quinlan'      , 'Surgical Attending Physician' , 666666666),
(7 , 'John Wen'          , 'Surgical Attending Physician' , 777777777),
(8 , 'Keith Dudemeister' , 'MD Resident'                  , 888888888),
(9 , 'Molly Clock'       , 'Attending Psychiatrist'       , 999999999);

/*TABLE DEPARTMENT */
CREATE TABLE DEPARTMENT (
departmentid int primary key,
name text, 
head int
);

SELECT * FROM DEPARTMENT;
INSERT INTO DEPARTMENT VALUES 
(1 , 'General Medicine' ,    4),
(2 , 'Surgery'          ,    7),
(3 , 'Psychiatry'       ,    9);

/*TABLE APPOINTMENT */
CREATE TABLE APPOINTMENT (
appointmentid int primary key,
patient int,
prepnurse int,
physician int,
start_dt_time timestamp,
end_dt_time timestamp,
examinationroom text
);

SELECT * FROM APPOINTMENT;
INSERT INTO APPOINTMENT VALUES 
(13216584 , 100000001 ,       101 ,         1 , '2008-04-24 10:00:00' , '2008-04-24 11:00:00' , 'A'),
(26548913 , 100000002 ,       101 ,         2 , '2008-04-24 10:00:00' , '2008-04-24 11:00:00' , 'B'),
(36549879 , 100000001 ,       102 ,         1 , '2008-04-25 10:00:00' , '2008-04-25 11:00:00' , 'A'),
(46846589 , 100000004 ,       103 ,         4 , '2008-04-25 10:00:00' , '2008-04-25 11:00:00' , 'B'),
(59871321 , 100000004 ,        NULL   ,         4 , '2008-04-26 10:00:00' , '2008-04-26 11:00:00' , 'C'),
(69879231 , 100000003 ,       103 ,         2 , '2008-04-26 11:00:00' , '2008-04-26 12:00:00' , 'C'),
(76983231 , 100000001 ,       NULL  ,         3 , '2008-04-26 12:00:00' , '2008-04-26 13:00:00' , 'C'),
(86213939 , 100000004 ,       102 ,         9 , '2008-04-27 10:00:00' , '2008-04-21 11:00:00' , 'A'),
(93216548 , 100000002 ,       101 ,         2 , '2008-04-27 10:00:00' , '2008-04-27 11:00:00' , 'B');

/*TABLE ROOM */
CREATE TABLE ROOM (
roomnumber int primary key,
roomtype text,
blockfloor int,
blockcode int,
unavailable boolean
);

SELECT * FROM ROOM;
INSERT INTO ROOM VALUES 
(101 , 'Single'   ,          1 ,         1 , false),
(102 , 'Single'   ,          1 ,         1 , false),
(103 , 'Single'   ,          1 ,         1 , false),
(111 , 'Single'   ,          1 ,         2 , false),
(112 , 'Single'   ,          1 ,         2 , true),
(113 , 'Single'   ,          1 ,         2 , false),
(121 , 'Single'   ,          1 ,         3 , false),
(122 , 'Single'   ,          1 ,         3 , false),
(123 , 'Single'   ,          1 ,         3 , false),
(201 , 'Single'   ,          2 ,         1 , true),
(202 , 'Single'   ,          2 ,         1 , false),
(203 , 'Single'   ,          2 ,         1 , false),
(211 , 'Single'   ,          2 ,         2 , false),
(212 , 'Single'   ,          2 ,         2 , false),
(213 , 'Single'   ,          2 ,         2 , true),
(221 , 'Single'   ,          2 ,         3 , false),
(222 , 'Single'   ,          2 ,         3 , false),
(223 , 'Single'   ,          2 ,         3 , false),
(301 , 'Single'   ,          3 ,         1 , false),
(302 , 'Single'   ,          3 ,         1 , true),
(303 , 'Single'   ,          3 ,         1 , false),
(311 , 'Single'   ,          3 ,         2 , false),
(312 , 'Single'   ,          3 ,         2 , false),
(313 , 'Single'   ,          3 ,         2 , false),
(321 , 'Single'   ,          3 ,         3 , true),
(322 , 'Single'   ,          3 ,         3 , false),
(323 , 'Single'   ,          3 ,         3 , false),
(401 , 'Single'   ,          4 ,         1 , false),
(402 , 'Single'   ,          4 ,         1 , true),
(403 , 'Single'   ,          4 ,         1 , false),
(411 , 'Single'   ,          4 ,         2 , false),
(412 , 'Single'   ,          4 ,         2 , false),
(413 , 'Single'   ,          4 ,         2 , false),
(421 , 'Single'   ,          4 ,         3 , true),
(422 , 'Single'   ,          4 ,         3 , false),
(423 , 'Single'   ,          4 ,         3 , false);


/*TABLE AFFILIATED_WITH */
CREATE TABLE AFFILIATED_WITH (
physician int,
department int,
primaryaffiliation boolean
);

SELECT * FROM AFFILIATED_WITH;
INSERT INTO AFFILIATED_WITH VALUES 
(1 ,          1 , true),
(2 ,          1 , true),
(3 ,          1 , false),
(3 ,          2 , true),
(4 ,          1 , true),
(5 ,          1 , true),
(6 ,          2 , true),
(7 ,          1 , false),
(7 ,          2 , true),
(8 ,          1 , true),
(9 ,          3 , true);


/*TABLE PROCEDURE */
CREATE TABLE `procedure` (
code int primary key,
name text,
cost real
);

SELECT * FROM `PROCEDURE`;
INSERT INTO `PROCEDURE` VALUES
(1 , 'Reverse Rhinopodoplasty'        ,  1500),
(2 , 'Obtuse Pyloric Recombobulation' ,  3750),
(3 , 'Folded Demiophtalmectomy'       ,  4500),
(4 , 'Complete Walletectomy'          , 10000),
(5 , 'Obfuscated Dermogastrotomy'     ,  4899),
(6 , 'Reversible Pancreomyoplasty'    ,  5600),
(7 , 'Follicular Demiectomy'          ,    25);

/* TABLE TRAINED_IN */
CREATE TABLE TRAINED_IN (
physician int,
treatment int,
certificationdate date,
certificationexpires date
);

SELECT * FROM TRAINED_IN;
INSERT INTO TRAINED_IN VALUES 
(3 ,         1 , '2008-01-01'        , '2008-12-31'),
(3 ,         2 , '2008-01-01'        , '2008-12-31'),
(3 ,         5 , '2008-01-01'        , '2008-12-31'),
(3 ,         6 , '2008-01-01'        , '2008-12-31'),
(3 ,         7 , '2008-01-01'        , '2008-12-31'),
(6 ,         2 , '2008-01-01'        , '2008-12-31'),
(6 ,         5 , '2007-01-01'        , '2007-12-31'),
(6 ,         6 , '2008-01-01'        , '2008-12-31'),
(7 ,         1 , '2008-01-01'        , '2008-12-31'),
(7 ,         2 , '2008-01-01'        , '2008-12-31'),
(7 ,         3 , '2008-01-01'        , '2008-12-31'),
(7 ,         4 , '2008-01-01'        , '2008-12-31'),
(7 ,         5 , '2008-01-01'        , '2008-12-31'),
(7 ,         6 , '2008-01-01'        , '2008-12-31'),
(7 ,         7 , '2008-01-01'        , '2008-12-31');


/*TABLE PATIENT */
CREATE TABLE PATIENT (
ssn int primary key,
name text,
address text,
phone text,
insuranceid int,
pcp int
);

SELECT * FROM PATIENT;
INSERT INTO PATIENT VALUES 
(100000001 , 'John Smith'        , '42 Foobar Lane'     , 555-0256 ,    68476213 ,   1),
(100000002 , 'Grace Ritchie'     , '37 Snafu Drive'     , 555-0512 ,    36546321 ,   2),
(100000003 , 'Random J. Patient' , '101 Omgbbq Street'  , 555-1204 ,    65465421 ,   2),
(100000004 , 'Dennis Doe'        , '1100 Foobaz Avenue' , 555-2048 ,    68421879 ,   3);


/*TABLE PRESCRIBES */
CREATE TABLE PRESCRIBES (
physician int,
patient int,
medication int,
date timestamp,
appointment int,
close text
);

SELECT * FROM PRESCRIBES;
INSERT INTO PRESCRIBES VALUES
(1 , 100000001 ,         1 , '2008-04-24 10:47:00' ,    13216584 , 5),
(9 , 100000004 ,          2 , '2008-04-27 10:53:00' ,    86213939 , 10),
(9 , 100000004 ,          2 , '2008-04-30 16:53:00' ,     NULL        , 5);


/*TABLE MEDICATION */
CREATE TABLE MEDICATION (
code int primary key,
name text,
brand text,
description text
);

SELECT * FROM MEDICATION;
INSERT INTO MEDICATION VALUES 
(1 , 'Procrastin-X' , 'X'                     , 'N/A'),
(2 , 'Thesisin'     , 'Foo Labs'              , 'N/A'),
(3 , 'Awakin'       , 'Bar Laboratories'      , 'N/A'),
(4 , 'Crescavitin'  , 'Baz Industries'        , 'N/A'),
(5 , 'Melioraurin'  , 'Snafu Pharmaceuticals' , 'N/A');


/*TABLE STAY */
CREATE TABLE STAY (
stayid int primary key,
patient int,
room int,
start_time timestamp,
end_time timestamp
);

SELECT * FROM STAY;
INSERT INTO STAY VALUES 
(3215 , 100000001 ,  111 , '2008-05-01 00:00:00' , '2008-05-04 00:00:00'),
(3216 , 100000003 ,  123 , '2008-05-03 00:00:00' , '2008-05-14 00:00:00'),
(3217 , 100000004 ,  112 , '2008-05-02 00:00:00' , '2008-05-03 00:00:00');

/* TABLE ON_CALL */
CREATE TABLE ON_CALL (
nurse int,
blockfloor int,
blockcode int,
oncallstart timestamp,
oncallend timestamp
);

SELECT * FROM ON_CALL;
INSERT INTO ON_CALL VALUES 
(101 ,          1 ,        1 , '2008-11-04 11:00:00' , '2008-11-04 19:00:00'),
(101 ,          1 ,         2 , '2008-11-04 11:00:00' , '2008-11-04 19:00:00'),
(102 ,          1 ,         3 , '2008-11-04 11:00:00' , '2008-11-04 19:00:00'),
(103 ,          1 ,         1 , '2008-11-04 19:00:00' , '2008-11-05 03:00:00'),
(103 ,          1 ,         2 , '2008-11-04 19:00:00' , '2008-11-05 03:00:00'),
(103 ,          1 ,         3 , '2008-11-04 19:00:00' , '2008-11-05 03:00:00');


/* TABLE UNDERGOES */
CREATE TABLE UNDERGOES (
patient int,
`procedure` int PRIMARY KEY,
stay int,
date timestamp,
physician int,
assistingnurse int
);

SELECT * FROM UNDERGOES;
INSERT INTO UNDERGOES VALUES
(100000001 ,         6 , 3215 , '2008-05-02 00:00:00' ,         3 ,            101),
(100000001 ,         2 , 3215 , '2008-05-03 00:00:00' ,         7 ,            101),
(100000004 ,         1 , 3217 , '2008-05-07 00:00:00' ,         3 ,            102),
(100000004 ,         5 , 3217 , '2008-05-09 00:00:00' ,         6 ,           NULL),
(100000001 ,         7 , 3217 , '2008-05-10 00:00:00' ,         7 ,            101),
(100000004 ,         4 , 3217 , '2008-05-13 00:00:00' ,         3 ,            103);

SELECT * FROM NURSE; 
SELECT * FROM PHYSICIAN;
SELECT * FROM DEPARTMENT;
SELECT * FROM APPOINTMENT;
SELECT * FROM ROOM;
SELECT * FROM AFFILIATED_WITH;
SELECT * FROM `PROCEDURE`;
SELECT * FROM TRAINED_IN;
SELECT * FROM PATIENT;
SELECT * FROM PRESCRIBES;
SELECT * FROM MEDICATION;
SELECT * FROM STAY;
SELECT * FROM ON_CALL;
SELECT * FROM UNDERGOES;