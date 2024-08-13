use HealthcareSystemDB;

SHOW TABLES;
SELECT * FROM Patients;

-- COUNT -- 

SELECT COUNT(*) AS NumberOfPatients
FROM Patients;

SELECT COUNT(Status) 
FROM Appointments
WHERE Status LIKE '%Completed%';

SELECT COUNT(Diagnosis)
FROM MedicalRecords
WHERE Diagnosis LIKE '%Asthma%';

-- SUM --

SELECT SUM(TotalAmount)
FROM Billing;

SELECT SUM(PaidAmount)
FROM Billing;

SELECT SUM(BalanceAmount)
FROM Billing
WHERE PaymentStatus LIKE 'Unpaid';

-- AVG --

SELECT AVG(TotalAmount)
FROM Billing;

SELECT AVG(YEAR(CURRENT_DATE) - YEAR(DateOfBirth))
FROM Patients;
-- age = current_date - dob 

SELECT AVG(
	PaidAmount
)
FROM Billing
WHERE PaymentStatus = 'Paid';


SELECT AVG(
	Dosage
)
FROM Prescriptions;

-- MIN MAX --

SELECT MIN(AppointmentDate), MAX(AppointmentDate)
FROM Appointments;

SELECT MIN(TotalAmount), MAX(TotalAmount)
FROM Billing;

SELECT MIN(Dosage), MAX(Dosage)
FROM Prescriptions;

SELECT MIN(DateOfBirth), MAX(DateOfBirth)
FROM Patients;

-- CASE -- 

SELECT 
	TotalAmount,
    CASE
		WHEN TotalAmount > 1000 THEN 'High'
        WHEN TotalAmount < 1000 AND TotalAmount > 500 THEN 'Medium'
        ELSE 'LOW'
	END AS PriceCategories
FROM Billing;

SELECT 
	DateOfBirth,
    CASE
		WHEN YEAR(CURRENT_DATE) - YEAR(DateOfBirth) > 65 THEN 'Senior'
        WHEN YEAR(CURRENT_DATE) - YEAR(DateOfBirth) < 65 AND YEAR(CURRENT_DATE) - YEAR(DateOfBirth) > 18 THEN 'Adult'
        ELSE 'Minor'
	END AS Age_Groups
FROM Patients;


-- IN -- 

SELECT * FROM Appointments
WHERE Status IN ('Completed', 'Scheduled');

SELECT * FROM Doctors
WHERE Specialization IN ('Internal Medicine', 'Cardiology', 'Pediatrics');

SELECT * FROM MedicalRecords
WHERE Diagnosis IN ('Diabetes',  'Hypertension', 'Asthma');

SELECT * FROM Departments
WHERE DepartmentName IN ('Surgery', 'Cardiology', 'Pediatrics');













