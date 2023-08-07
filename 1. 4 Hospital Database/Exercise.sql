use hospital;

/*1. From the following table, write a SQL query to find out which nurses have not yet been registered. Return all the fields of nurse table.
Sample table: nurse*/
SELECT *
FROM nurse
WHERE registered='false';

/*2. From the following table, write a SQL query to identify the nurses in charge of each department. Return nursename as “name”, Position as “Position”.
Sample table: nurse*/
SELECT name AS "Name",
       POSITION AS "Position"
FROM nurse
WHERE POSITION='Head Nurse';

/*3. From the following tables, write a SQL query to identify the physicians who are the department heads. 
Return Department name as “Department” and Physician name as “Physician”.
Sample table: physician
Sample table: department*/
SELECT d.name AS "Department",
       p.name AS "Physician"
FROM department d,
     physician p
WHERE d.head=p.employeeid;

/*4. From the following table, write a SQL query to count the number of patients who scheduled an appointment with at least one physician. 
Return count as "Number of patients taken at least one appointment".
Sample table: appointment*/
SELECT count(DISTINCT patient) AS "No. of patients taken at least one appointment"
FROM appointment;

/*5. From the following table, write a SQL query to locate the floor and block where room number 212 is located. Return block floor as "Floor" and block code as "Block".
Sample table: room*/
SELECT blockfloor AS "Floor",
       blockcode AS "Block"
FROM room
WHERE roomnumber=212;

/*6. From the following table, write a SQL query to count the number available rooms. Return count as "Number of available rooms".
Sample table: room*/
SELECT count(*) "Number of available rooms"
FROM room
WHERE unavailable='false';

/*7. From the following table, write a SQL query to count the number of unavailable rooms. Return count as "Number of unavailable rooms".
Sample table: room*/
SELECT count(*) "Number of unavailable rooms"
FROM room
WHERE unavailable='true';

/*8. From the following tables, write a SQL query to identify the physician and the department with which he or she is affiliated. 
Return Physician name as "Physician", and department name as "Department".
Sample table: physician
Sample table: department
Sample table: affiliated_with*/
SELECT p.name AS "Physician",
       d.name AS "Department"
FROM physician p,
     department d,
     affiliated_with a
WHERE p.employeeid=a.physician
  AND a.department=d.departmentid;
  
/*9. From the following tables, write a SQL query to find those physicians who have received special training. 
Return Physician name as “Physician”, treatment procedure name as "Treatment".
Sample table: physician
Sample table: procedure
Sample table: trained_in*/
SELECT p.name AS "Physician",
c.name AS "Treatment"
FROM physician p,
     PROCEDURE c,
trained_in t
WHERE t.physician=p.employeeid
  AND t.treatment=c.code;
  
/*10. From the following tables, write a SQL query to find those physicians who are yet to be affiliated. 
Return Physician name as "Physician", Position, and department as "Department".
Sample table: physician
Sample table: affiliated_with
Sample table: department*/
SELECT p.name AS "Physician",
       p.position,
       d.name AS "Department"
FROM physician p
JOIN affiliated_with a ON a.physician=p.employeeid
JOIN department d ON a.department=d.departmentid
WHERE primaryaffiliation='false';

/*11. From the following tables, write a SQL query to identify physicians who are not specialists. Return Physician name as "Physician", position as "Designation".
Sample table: physician*/
SELECT p.name AS "Physician",
       p.position "Designation"
FROM physician p
LEFT JOIN trained_in t ON p.employeeid=t.physician
WHERE t.treatment IS NULL
ORDER BY employeeid;

/*12. From the following tables, write a SQL query to find the patients with their physicians by whom they received preliminary treatment. 
Return Patient name as "Patient", address as "Address" and Physician name as "Physician".
Sample table: patient
Sample table: physician*/
SELECT t.name AS "Patient",
       t.address AS "Address",
       p.name AS "Physician"
FROM patient t
JOIN physician p ON t.pcp=p.employeeid;

/*13. From the following tables, write a SQL query to identify the patients and the number of physicians with whom they have scheduled appointments. 
Return Patient name as "Patient", number of Physicians as "Appointment for No. of Physicians".
Sample table: appointment
Sample table: patient*/
SELECT p.name "Patient",
       count(t.patient) "Appointment for No. of Physicians"
FROM appointment t
JOIN patient p ON t.patient=p.ssn
GROUP BY p.name
HAVING count(t.patient)>=1;

/*14. From the following tables, write a SQL query to count the number of unique patients who have been scheduled for examination room 'C'. 
Return unique patients as "No. of patients got appointment for room C".
Sample table: appointment*/
SELECT count(DISTINCT patient) AS "No. of patients got appointment for room C"
FROM appointment
WHERE examinationroom='C';

/*15. From the following tables, write a SQL query to find the names of the patients and the room number where they need to be treated. 
Return patient name as "Patient", examination room as "Room No.", and starting date time as Date "Date and Time of appointment".
Sample table: patient
Sample table: appointment*/
SELECT p.name AS "Patient",
       a.examinationroom AS "Room No.",
       a.start_dt_time AS "Date and Time of appointment"
FROM patient p
JOIN appointment a ON p.ssn=a.patient;

/*16. From the following tables, write a SQL query to identify the nurses and the room in which they will assist the physicians. 
Return Nurse Name as "Name of the Nurse" and examination room as "Room No.".
Sample table: nurse
Sample table: appointment*/
SELECT n.name AS "Name of the Nurse",
       a.examinationroom AS "Room No."
FROM nurse n
JOIN appointment a ON a.prepnurse=n.employeeid;

/*17. From the following tables, write a SQL query to locate the patients who attended the appointment on the 25th of April at 10 a.m. 
Return Name of the patient, Name of the Nurse assisting the physician, Physician Name as "Name of the physician", examination room as "Room No.", 
schedule date and approximate time to meet the physician.
Sample table: patient
Sample table: appointment
Sample table: nurse
Sample table: physician*/
SELECT t.name AS "Name of the patient",
       n.name AS "Name of the Nurse assisting the physician",
       p.name AS "Name of the physician",
       a.examinationroom AS "Room No.",
       a.start_dt_time
FROM patient t
JOIN appointment a ON a.patient=t.ssn
JOIN nurse n ON a.prepnurse=n.employeeid
JOIN physician p ON a.physician=p.employeeid
WHERE start_dt_time='2008-04-25 10:00:00';

/*18. From the following tables, write a SQL query to identify those patients and their physicians who do not require any nursing assistance. 
Return Name of the patient as "Name of the patient", Name of the Physician as "Name of the physician" and examination room as "Room No.".
Sample table: patient
Sample table: appointment
Sample table: physician*/
SELECT t.name AS "Name of the patient",
       p.name AS "Name of the physician",
       a.examinationroom AS "Room No."
FROM patient t
JOIN appointment a ON a.patient=t.ssn
JOIN physician p ON a.physician=p.employeeid
WHERE a.prepnurse IS NULL;

/*19. From the following tables, write a SQL query to locate the patients' treating physicians and medications. 
Return Patient name as "Patient", Physician name as "Physician", Medication name as "Medication".
Sample table: patient
Sample table: prescribes
Sample table: physician
Sample table: medication*/
SELECT t.name AS "Patient",
       p.name AS "Physician",
       m.name AS "Medication"
FROM patient t
JOIN prescribes s ON s.patient=t.ssn
JOIN physician p ON s.physician=p.employeeid
JOIN medication m ON s.medication=m.code;

/*20. From the following tables, write a SQL query to identify patients who have made an advanced appointment. 
Return Patient name as "Patient", Physician name as "Physician" and Medication name as "Medication".
Sample table: patient
Sample table: prescribes
Sample table: physician
Sample table: medication*/
SELECT t.name AS "Patient",
       p.name AS "Physician",
       m.name AS "Medication"
FROM patient t
JOIN prescribes s ON s.patient=t.ssn
JOIN physician p ON s.physician=p.employeeid
JOIN medication m ON s.medication=m.code
WHERE s.appointment IS NOT NULL;

/*21. From the following tables, write a SQL query to find those patients who did not schedule an appointment. 
Return Patient name as "Patient", Physician name as "Physician" and Medication name as "Medication".
Sample table: patient
Sample table: prescribes
Sample table: physician
Sample table: medication*/
SELECT t.name AS "Patient",
       p.name AS "Physician",
       m.name AS "Medication"
FROM patient t
JOIN prescribes s ON s.patient=t.ssn
JOIN physician p ON s.physician=p.employeeid
JOIN medication m ON s.medication=m.code
WHERE s.appointment IS NULL;

/*22. From the following table, write a SQL query to count the number of available rooms in each block. Sort the result-set on ID of the block. 
Return ID of the block as "Block", count number of available rooms as "Number of available rooms".
Sample table: room*/
SELECT blockcode AS "Block",
       count(*) "Number of available rooms"
FROM room
WHERE unavailable='false'
GROUP BY blockcode
ORDER BY blockcode;

/*23. From the following table, write a SQL query to count the number of available rooms in each floor. Sort the result-set on block floor. 
Return floor ID as "Floor" and count the number of available rooms as "Number of available rooms".
Sample table: room*/
SELECT blockfloor AS "Floor",
       count(*) "Number of available rooms"
FROM room
WHERE unavailable='false'
GROUP BY blockfloor
ORDER BY blockfloor;

/*24. From the following table, write a SQL query to count the number of available rooms for each floor in each block. Sort the result-set on floor ID, ID of the block. 
Return the floor ID as "Floor", ID of the block as "Block", and number of available rooms as "Number of available rooms".
Sample table: room*/
SELECT blockfloor AS "Floor",
       blockcode AS "Block",
       count(*) "Number of available rooms"
FROM room
WHERE unavailable='false'
GROUP BY blockfloor,
        blockcode
ORDER BY blockfloor,
        blockcode;
        
/*25. From the following tables, write a SQL query to count the number of rooms that are unavailable in each block and on each floor. 
Sort the result-set on block floor, block code. Return the floor ID as "Floor", block ID as "Block", and number of unavailable as “Number of unavailable rooms".
Sample table: room*/
SELECT blockfloor AS "Floor",
blockcode AS "Block",
count(*) "Number of unavailable rooms"
FROM room
WHERE unavailable='true'
GROUP BY blockfloor,
blockcode
ORDER BY blockfloor,
blockcode;

/*26. From the following tables, write a SQL query to find the floor where the maximum number of rooms are available. 
Return floor ID as "Floor", count "Number of available rooms".
Sample table: room*/
SELECT blockfloor as "Floor",
count(*) AS  "Number of available rooms"
FROM room
WHERE unavailable='false'
GROUP BY blockfloor
HAVING count(*) =
  (SELECT max(zz) AS highest_total
   FROM
( SELECTblockfloor ,
count(*) AS zz
      FROM room
      WHERE unavailable='false'
      GROUP BY blockfloor ) AS t );
      
/*27. From the following tables, write a SQL query to locate the floor with the minimum number of available rooms. Return floor ID as "Floor", Number of available rooms.
Sample table: room*/
SELECT blockfloor as "Floor",
       count(*) AS  "No of available rooms"
FROM room
WHERE unavailable='false'
GROUP BY blockfloor
HAVING count(*) =
  (SELECT min(zz) AS highest_total
   FROM
     ( SELECT blockfloor ,
              count(*) AS zz
      FROM room
      WHERE unavailable='false'
      GROUP BY blockfloor ) AS t );
      
/*28. From the following tables, write a SQL query to find the name of the patients, their block, floor, and room number where they admitted.
Sample table: stay
Sample table: patient
Sample table: room*/
SELECT p.name AS "Patient",
       s.room AS "Room",
       r.blockfloor AS "Floor",
       r.blockcode AS "Block"
FROM stay s
JOIN patient p ON s.patient=p.ssn
JOIN room r ON s.room=r.roomnumber;

/*29. From the following tables, write a SQL query to locate the nurses and the block where they are scheduled to attend the on-call patients.
Return Nurse Name as "Nurse", Block code as "Block".
Sample table: nurse
Sample table: on_call*/
SELECT n.name AS "Nurse",
       o.blockcode AS "Block"
FROM nurse n
JOIN on_call o ON o.nurse=n.employeeid;

/*30. From the following tables, write a SQL query to get
a) name of the patient,
b) name of the physician who is treating him or her,
c) name of the nurse who is attending him or her,
d) which treatement is going on to the patient,
e) the date of release,
f) in which room the patient has admitted and which floor and block the room belongs to respectively.
Sample table: undergoes
Sample table: patient
Sample table: physician
Sample table: nurse
Sample table: stay
Sample table: room*/
SELECT p.name AS "Patient",
       y.name AS "Physician",
       n.name AS "Nurse",
       s.end_time AS "Date of release",
       pr.name as "Treatement going on",
       r.roomnumber AS "Room",
       r.blockfloor AS "Floor",
       r.blockcode AS "Block"
FROM undergoes u
JOIN patient p ON u.patient=p.ssn
JOIN physician y ON u.physician=y.employeeid
LEFT JOIN nurse n ON u.assistingnurse=n.employeeid
JOIN stay s ON u.patient=s.patient
JOIN room r ON s.room=r.roomnumber
JOIN `procedure` pr on u.procedure=pr.code;

/*31. From the following tables, write a SQL query to find all physicians who have performed a medical procedure but are not certified to do so. 
Return Physician name as "Physician".
Sample table: physician
Sample table: undergoes
Sample table: trained_in*/
SELECT name AS "Physician"
FROM physician
WHERE employeeid IN
    ( SELECT undergoes.physician
     FROM undergoes
     LEFT JOIN trained_In ON undergoes.physician=trained_in.physician
     AND undergoes.procedure=trained_in.treatment
     WHERE treatment IS NULL );
     
/*32. From the following tables, write a SQL query to find all physicians, their procedures, the date when the procedure was performed, 
and the name of the patient on whom the procedure was performed, but the physicians are not certified to perform that procedure. 
Return Physician Name as "Physician", Procedure Name as "Procedure", date, and Patient. Name as "Patient".
Sample table: physician
Sample table: undergoes
Sample table: patient
Sample table: procedure*/
SELECT p.name AS "Physician",
       pr.name AS "Procedure",
       u.date,
       pt.name AS "Patient"
FROM physician p,
     undergoes u,
     patient pt,
     `PROCEDURE` pr
WHERE u.patient = pt.SSN
  AND u.procedure = pr.Code
  AND u.physician = p.EmployeeID
  AND NOT EXISTS
    ( SELECT *
     FROM trained_in t
     WHERE t.treatment = u.procedure
       AND t.physician = u.physician );

/*33. From the following table, write a SQL query to find all physicians who completed a medical procedure with certification after the 
expiration date of their license. Return Physician Name as "Physician", Position as "Position".
Sample table: physician
Sample table: undergoes
Sample table: trained_in*/
SELECT name AS "Physician",
       position AS "Position"
FROM physician
WHERE employeeid IN
    ( SELECT physician
     FROM undergoes u
     WHERE date >
         ( SELECT certificationexpires
          FROM trained_in t
          WHERE t.physician = u.physician
            AND t.treatment = u.procedure ) );
            
/*34. From the following table, write a SQL query to find all physicians who have completed medical procedures with certification after their certificates expired. 
Return Physician Name as "Physician", Position as" Position", Procedure Name as "Procedure", Date of Procedure as "Date of Procedure", Patient Name as "Patient", and 
expiry date of certification as "Expiry Date of Certificate".
Sample table: physician
Sample table: undergoes
Sample table: patient
Sample table: procedure
Sample table: trained_in*/
SELECT p.name AS "Physician",
       p.position AS "Position",
       pr.name AS "Procedure",
       u.date AS "Date of Procedure",
       pt.name AS "Patient",
       t.certificationexpires AS "Expiry Date of Certificate"
FROM physician p,
     undergoes u,
     patient pt,
     `PROCEDURE` pr,
               trained_in t
WHERE u.patient = pt.ssn
  AND u.procedure = pr.code
  AND u.physician = p.employeeid
  AND Pr.code = t.treatment
  AND P.employeeid = t.physician
  AND u.Date > t.certificationexpires;

/*35. From the following table, write a SQL query to find out, which nurses have been on call for room 122 in the past. Return name of the nurses.
Sample table: nurse
Sample table: on_call
Sample table: room*/
SELECT n.name
FROM nurse n
WHERE employeeid IN
    ( SELECT oc.nurse
     FROM on_call oc,
          room r
     WHERE oc.blockfloor = r.blockfloor
       AND oc.blockcode = r.blockcode
       AND r.roomnumber = 122 );
       
/*36. From the following table, write a SQL query to determine which patients have been prescribed medication by their primary care physician. 
Return Patient name as "Patient", and Physician Name as "Physician".
Sample table: patient
Sample table: prescribes
Sample table: physician*/
SELECT pt.name AS "Ptient",
       p.name AS "Physician"
FROM patient pt
JOIN prescribes pr ON pr.patient=pt.ssn
JOIN physician p ON pt.pcp=p.employeeid
WHERE pt.pcp=pr.physician
  AND pt.pcp=p.employeeid;
  
/*37. From the following table, write a SQL query to find those patients who have undergone a procedure costing more than $5,000, as well as the name of the 
physician who has provided primary care, should be identified. Return name of the patient as "Patient", name of the physician as "Primary Physician", and cost for the 
procedure as "Procedure Cost".
Sample table: patient
Sample table: undergoes
Sample table: physician
Sample table: procedure*/
SELECT pt.name AS " Patient ",
p.name AS "Primary Physician",
pd.cost AS " Procedure Cost"
FROM patient pt
JOIN undergoes u ON u.patient=pt.ssn
JOIN physician p ON pt.pcp=p.employeeid
JOIN `PROCEDURE` pd ON u.procedure=pd.code
WHERE pd.cost>5000;

/*38. From the following table, write a SQL query to find those patients with at least two appointments in which the nurse who prepared the appointment was a 
registered nurse and the physician who provided primary care should be identified. Return Patient name as "Patient", Physician name as "Primary Physician", and
 Nurse Name as "Nurse".
Sample table: appointment
Sample table: patient
Sample table: nurse
Sample table: physician*/
SELECT pt.name AS "Patient",
       p.name AS "Primary Physician",
       n.name AS "Nurse"
FROM appointment a
JOIN patient pt ON a.patient=pt.ssn
JOIN nurse n ON a.prepnurse=n.employeeid
JOIN physician p ON pt.pcp=p.employeeid
WHERE a.patient IN
    (SELECT patient
     FROM appointment a
     GROUP BY a.patient
     HAVING count(*)>=2)
  AND n.registered='true'
ORDER BY pt.name;

/*39. From the following table, write a SQL query to identify those patients whose primary care is provided by a physician who is not the head of any department. 
Return Patient name as "Patient", Physician Name as "Primary care Physician".
Sample table: patient
Sample table: department
Sample table: physician*/
SELECT pt.name AS "Patient",
       p.name AS "Primary care Physician"
FROM patient pt
JOIN physician p ON pt.pcp=p.employeeid
WHERE pt.pcp NOT IN
    (SELECT head
     FROM department);
