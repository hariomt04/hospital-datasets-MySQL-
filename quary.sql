#1. Find all the docotrs who have treated a patient for 'Diabetes'
SELECT 
d.doctor_id,fname,lname,gender,Illness,Patient_ID FROM doctor d
 JOIN worker w ON d.D_Worker_ID = w.Worker_ID
 JOIN diagnosis de ON de.doctor_id = d.doctor_id
 where illness = 'Diabetes';
 
 #2. List the details of all patients who have been prescribed "B205."
SELECT * FROM patient p 
JOIN medication_prescribed mp ON p.patient_id = mp.patient_id
JOIN medication m on mp.Medication_ID = m.Medication_ID
where m.Medication_ID = 'B205'

#3.Find the total number of workers in each department.
SELECT d.Department_ID,count(w.worker_id) FROM department d 
JOIN doctor doc ON d.Department_ID = doc.Department_ID
JOIN worker w ON doc.D_worker_id = w.worker_ID
GROUP BY d.Department_ID;

#4. Retrieve the names and phone numbers of all patients who have been diagnosed with "Diabetes." 
SELECT p.fname,p.lname,p.telephone,d.illness 
FROM patient p
JOIN diagnosis d on p.patient_id = d.patient_id
WHERE d.illness = 'Diabetes';

#5. Get the names and IDs of all doctors who work in the "ER" department.
SELECT d.doctor_id,w.fname as 
Doctor_firstName, w.lname as doctor_lastName 
FROM doctor d 
JOIN worker w on w.Worker_ID = d.D_Worker_ID 
WHERE d.department_id = 'ER';

#6. Find the total salary expenditure for all workers.
SELECT sum(salary) as total_salary_expenditure 
FROM worker;

#7. List all cafeteria staff along with their job position and the food type served in their assigned cafeteria.
SELECT cs.Staff_ID,s.Job_Title,cs.Position,c.Food_Type 
FROM cafeteria_staff cs 
JOIN staff s ON s.Staff_ID = cs.Staff_ID
JOIN cafeteria c ON cs.Cafeteria_ID = c.Cafeteria_ID;

#8.Show details of patients along with the medication they are prescribed, even if no medication has been prescribed.
SELECT * FROM patient p
LEFT join medication_prescribed  mp ON p.patient_id = mp.Patient_ID
LEFT join medication m on mp.Medication_ID = m.Medication_ID;

#10.Find the average age of patients diagnosed with "Flu."
SELECT * FROM patient p
JOIN diagnosis d on p.Patient_ID = d.Patient_ID
WHERE d.Illness = 'Flu';