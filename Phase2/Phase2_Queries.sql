-- homework5-ddl.sql
-- Members:
--          Lazaro Camero
--          Mir Ali
--          Khoi Tran

-- task 1
-- What stage of cancer is this patient in?
-- (skills: select, aggregate)

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
-- (skills: select, join)

SELECT Disease_name, Treatment_cost
FROM Disease a
LEFT JOIN Treatment b
    ON (Disease_ID = Treatment_Disease_ID)
WHERE Disease_name = "Alzheimer";

-- task 3
-- How many people HAVE Cancer?, that is
-- any type of cancer.
-- Write a query to list all the patients that have cancer
-- (skills: select, where)

SELECT Disease_ID AS People, Disease_name
FROM Disease
WHERE Disease_name LIKE 'Cancer';

-- task 4
-- What is the fatality rate of COVID in Mexico?
-- (skills: select, Join)

SELECT Region_country_short_name, Disease_fatality
FROM Region a
JOIN Disease b
    ON (Region_Disease_ID = Disease_ID)
WHERE Region_country_short_name = 'Mexico';

-- task 5
-- What is the domain of the treatment_option field? That is,
-- what treatment is viable for Ebola?
-- (there are several possible ways to code this in SQL)
-- (skills: select, aggregate, order by)

SELECT Disease_name, Treatment_option
FROM Treatment a
JOIN Disease b
    ON (Disease_ID = Treatment_Disease_ID)
WHERE 1=1
        AND Disease_name = 'Ebola';


-- task 6
-- What date did the patients receive their check-up in the hospital?
-- (skills: select, order by)

SELECT CONCAT(Patient_first_name,' ',Patient_last_name)
        AS 'Patient', 
        Medical_Check_up_date
FROM Patient a
JOIN Medical_Check_up b
    ON (Patient_ID = Medical_Check_up_Patient_ID)
ORDER BY  Medical_Check_up_date;

-- task 7
-- How is the flu transmitted?
-- (skills: select, where)

SELECT *
FROM Disease
WHERE 1=1
        AND Disease_name = 'Flu';

-- task 8
-- How many Asian people have the mad cow disease?
-- (skills: select, where, aggregate)

SELECT count(Patient_ethnicity) AS 'Ethnicity', Disease_name
FROM Patient a
JOIN Disease b
    ON (Patient_ID = Disease_Patient_ID)
WHERE 1=1
        AND Disease_name LIKE 'Mad Cow'
GROUP BY  disease_name;

-- task 9
-- Leukemia is a very serious disease that depending on the stage
-- it is on, a specific treatment needs to be implemented.
-- What is the curability of stage II Leukemia?
-- (skills: select, where, order by)

SELECT disease_name, treatment_option, Disease_stage
FROM Disease a
JOIN Treatment b
    ON (Disease_ID = Treatment_Disease_ID)
WHERE 1=1
        AND disease_name LIKE 'Leukemia';

-- task 10
-- When was the last medical checkup of every patient?
-- (skills: select, aggregate, group by, order by)

SELECT CONCAT(Patient_first_name,' ', Patient_last_name) AS "Name",
        Medical_Check_up_date AS "Last Checkup"
FROM Patient a
JOIN Medical_Check_up b
    ON (Patient_ID = Medical_Check_up_Patient_ID)
ORDER BY  Patient_last_name, Medical_Check_up_date;

-- task 11
-- What is the socioeconomic status of every patient?

SELECT CONCAT(Patient_first_name,' ', Patient_last_name) AS "Name",
        Patient_socioeconomic_status
FROM Patient;

-- task 12
-- List every patient's medical history?

SELECT
CONCAT(Patient_first_name,' ', Patient_last_name) AS "Name",
Medical_Check_up_documentation
FROM Patient a 
JOIN Medical_Check_up b ON (Patient_ID = Medical_Check_up_Patient_ID)
ORDER BY Patient_last_name, Medical_Check_up_documentation;

-- task 13
-- Write a single query that shows the reason for the patients medical checkups 
-- Display first name and last name of the patients and order by medical checkups
-- (skills: select, Left Join, order by)

SELECT CONCAT(Patient_first_name,' ', Patient_last_name)
        AS "Name", Medical_Check_up_reason
FROM Patient a
LEFT JOIN Medical_Check_up b
    ON (Patient_ID = Medical_Check_up_Patient_ID)
ORDER BY  Medical_Check_up_reason;

-- task 14
-- What type of disease is E.Coli?
-- (skills: select, aggregate, group by, nested query)



-- task 15
-- What is the environmental status of Egypt?
-- (skills: select, aggregate, group by, nested query, order by, limit)



-- task 16
-- How many people from the USE got their medical checkups in the year 2020?
-- (skills: select, where, subquery)



-- task 17
-- Are there cases of Ebola in environments below 50 Fahrenheit?
-- (skills: select, where, subqueries, joins)



-- task 18
-- What are this patient’s medical notes?
-- (skills: select, where, subqueries, joins, aggregate functions)


-- task 19 
-- Does Parkinson’s disease affect Asian people more so than European?



-- task 20
-- Does diabetes affect Asian people more than arthritis?


