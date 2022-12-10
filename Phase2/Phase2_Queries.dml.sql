-- Phase2_queries.dml.sql
-- Members:
--          Lazaro Camero
--          Mir Ali
--          Khoi Tran

-- REFERENCE
-- Easy access to the table containing 
-- doctor's and patient's information
-- Show VIEW

SELECT * FROM Doctor_Patients;


-- Show Trigger audit
SELECT * FROM Trigger_Patient;
SELECT * FROM Trigger_Disease;
SELECT * FROM Trigger_Doctor;
SELECT * FROM Trigger_Treatment;

-- task 1
-- What stage of cancer is this patient in?

SELECT CONCAT(Patient_first_name,' ', Patient_last_name)
        AS "Name",Disease_name, Disease_stage
FROM Patient a
LEFT JOIN Disease b
    ON (Patient_ID = Disease_Patient_ID)
WHERE 1=1
        AND Disease_name LIKE 'Cancer'
ORDER BY  Disease_stage, Disease_name;

-- task 2
-- Write a query to display the cost of the Alzheimer’s treatment?

SELECT Disease_name, CONCAT('$',Treatment_cost)
FROM Disease a
LEFT JOIN Treatment b
    ON (Disease_ID = Treatment_Disease_ID)
WHERE Disease_name = "Alzheimer";

-- task 3
-- How many people HAVE Cancer?, that is
-- any type of cancer.
-- Write a query to list all the patients that have cancer

SELECT Disease_ID AS People, Disease_name
FROM Disease
WHERE Disease_name LIKE 'Cancer';

-- task 4
-- What is the fatality rate of COVID in Mexico?

SELECT Region_country_short_name, Disease_fatality
FROM Region_Disease a
    JOIN Region b ON (a.Region_country_code = b.Region_country_code)
    JOIN Disease c ON (a.Disease_ID = c.Disease_ID)
WHERE Region_country_short_name = 'Mexico';

-- task 5
-- What is the domain of the treatment_option field? That is,
-- what treatment is viable for Ebola?
-- (there are several possible ways to code this in SQL)

SELECT Disease_name, Treatment_option
FROM Treatment a
JOIN Disease b
    ON (Disease_ID = Treatment_Disease_ID)
WHERE 1=1
        AND Disease_name = 'E. Coli';


-- task 6
-- What date did the patients receive their check-up in the hospital?

SELECT CONCAT(Patient_first_name,' ',Patient_last_name) AS 'Patients', 
        Medical_Check_up_date
FROM Patients_Checkups a
JOIN Medical_Check_up b ON (b.Medical_Check_up_ID = a.Medical_Check_up_ID)
JOIN Patient c ON (c.Patient_ID = a.Patient_ID)
ORDER BY  Medical_Check_up_date;

-- task 7
-- How is the flu transmitted?

SELECT *
FROM Disease
WHERE 1=1
        AND Disease_name = 'Diphtheria';

-- task 8
-- How many Asian people have the mad cow disease?

SELECT COUNT(Patient_ethnicity) AS 'Asians', Disease_name
FROM Patient a
JOIN Disease b
    ON (Patient_ID = Disease_ID)
WHERE 1=1
        AND Disease_name LIKE 'COVID'
GROUP BY  disease_name;

-- task 9
-- Leukemia is a very serious disease that depending on the stage
-- it is on, a specific treatment needs to be implemented.
-- What is the curability of stage II Leukemia?

SELECT disease_name, treatment_option, Disease_stage
FROM Disease a
JOIN Treatment b
    ON (Disease_ID = Treatment_Disease_ID)
WHERE 1=1
        AND disease_name LIKE 'Leukemia';

-- task 10
-- When was the last medical checkup of every patient?

SELECT CONCAT(Patient_first_name,' ', Patient_last_name) AS "Name",
        Medical_Check_up_date AS "Last Checkup"
FROM Patients_Checkups a
JOIN Patient b ON (a.Patient_ID = b.Patient_ID)
JOIN Medical_Check_up c ON (a.Medical_Check_up_ID = c.Medical_Check_up_ID)
ORDER BY  Patient_last_name, Medical_Check_up_date;


-- task 11
-- What is the socioeconomic status of every patient?

SELECT CONCAT(Patient_first_name,' ', Patient_last_name) AS "Name",
        Patient_socioeconomic_status
FROM Patient;

-- task 12
-- List every patient's medical history?

SELECT
CONCAT(Patient_first_name,' ', Patient_last_name) AS "Name", Medical_Check_up_documentation
FROM Patients_Checkups a 
JOIN Medical_Check_up b ON (a.Medical_Check_up_ID = b.Medical_Check_up_ID)
JOIN Patient c ON (a.Patient_ID = c.Patient_ID)
ORDER BY Patient_last_name, Medical_Check_up_documentation;

-- task 13
-- A patient has changed her last name. She just got married
-- Update an entry in the Patient's table
-- What changes have been made to the patient's table?

UPDATE Patient 
SET Patient_last_name = "Poff"
WHERE Patient_gender = 'Female' AND Patient_age = 23;

SELECT * FROM Trigger_Patient;

-- task 14
-- Display a list with of all the doctors' informations

SELECT * FROM Doctor;


-- task 15
-- What is the environmental status of Canada?

SELECT Region_country_short_name,
         Region_environment
FROM Region
WHERE 1=1
        AND Region_country_short_name = "Canada"
ORDER BY Region_country_short_name, Region_environment;

-- task 
-- How many people got their medical checkups in the year 2020?

SELECT COUNT(Patient_first_name) AS "People",
         Medical_Check_up_date AS "MC_Date"
FROM Patient a
JOIN Medical_Check_up b
    ON (Patient_ID = Medical_Check_up_Patient_ID)
WHERE Medical_Check_up_date LIKE "2020"
GROUP BY  Medical_Check_up_date
ORDER BY  2;

-- task 17
-- Many of the patients that are seen here come from everywhere.
-- Their origins come from places outside of the United States, therefore
-- how many patients from Latin America & Caribbean have a disease?

SELECT CONCAT(Patient_first_name, ' ', Patient_last_name) AS "Patient",
         Region,
         Disease_name
FROM Patient a
JOIN Region b
    ON (Patient_ID = Region_Patient_ID)
JOIN Disease c
    ON (c.Disease_ID = b.Region_Disease_ID)
WHERE Region = 'Latin America & Caribbean'
GROUP BY  Region, Disease_name,Patient_first_name, Patient_last_name;

-- task 18
-- List the reasons where patients might have to go to get a medical checkup and the symptoms

SELECT CONCAT(Patient_first_name, ' ', Patient_last_name) AS "Patients", Medical_Check_up_reason
FROM Patients_Checkups a
JOIN Patient b
    ON (a.Patient_ID = b.Patient_ID)
JOIN Medical_Check_up c
    ON (a.Medical_Check_up_ID = c.Medical_Check_up_ID)
WHERE Medical_Check_up_reason LIKE '%fever%';

-- task 19 
-- Certain diseases affect one ethnic group more than others. Therefore, 
-- list the ethnic group with the highest number of Alzheimer’s disease cases. Do Asians have a higher  
-- prevalence of this illness than Europeans?

SELECT CONCAT(Patient_first_name,' ', Patient_last_name) AS "Name", Region
FROM Patient 
LEFT JOIN Region  ON (Patient_ID = Region_Patient_ID)
WHERE Region LIKE "%Asia%";

-- task 20
-- What ethnic group does Tuberculosis affect?

SELECT CONCAT(Patient_first_name,' ', Patient_last_name) AS "Name",
         COUNT(Patient_ethnicity) AS "Ethnicity count", Patient_ethnicity, Disease_name
FROM Patient a
LEFT JOIN Disease b
    ON (Patient_ID = Disease_ID)
WHERE Disease_name = 'Tuberculosis'
GROUP BY  Patient_first_name, Patient_last_name ,Patient_ethnicity, Disease_name;
