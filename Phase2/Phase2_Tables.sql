-- Phase2_tables.sql

-- task 1
-- Lazaro Camero
-- store your drop table statements in this block
--

DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS Region;
DROP TABLE IF EXISTS Medical_Check_up;
DROP TABLE IF EXISTS Disease;
DROP TABLE IF EXISTS Treatment;
DROP TABLE IF EXISTS Doctor;

-- task 2 - Create "Patient" table
-- label the columns using the following schema:
--  Patient(Patient_ID,
--              Patient_name,
--              Patient_gender,
--              Patient_age,
--              Patient_ethnicity,
--              Patient_socioeconomic_status)
-- Assign appropriate data types.
-- Assign an appropriate primary key.

DROP TABLE IF EXISTS Patient;
CREATE TABLE Patient(
    Patient_ID INT NOT NULL,
    Patient_name VARCHAR(255) NOT NULL,
    Patient_gender VARCHAR(255) NOT NULL,
    Patient_age VARCHAR(255) NOT NULL,
    Patient_ethnicity VARCHAR(255) NOT NULL,
    Patient_socioeconomic_status VARCHAR(255) NOT NULL,

    primary key(Patient_ID)
);

-- task 3 - Create "Region" table
-- label the columns using the following schema:
--  Region(
--              Region_country,
--              Region_nationality,
--              Region_environment,
-- Assign appropriate data types.
-- Assign an appropriate primary key.

DROP TABLE IF EXISTS Region;
CREATE TABLE Region(
    Region_country VARCHAR(255) NOT NULL,
    Region_nationality VARCHAR(255) NOT NULL,
    Region_environment VARCHAR(255) NOT NULL,

    primary key(Region_country)
);

-- task 4 - Create "Medical_Check_up" table
-- label the columns using the following schema:
--  Medical_Check_up(
--              Medical_Check_up_ID,
--              Medical_Check_up_date,
--              Medical_Check_up_time,
--              Medical_Check_up_reason,
--              Medical_Check_up_documentation)
-- Assign appropriate data types.
-- Assign an appropriate primary key.

DROP TABLE IF EXISTS Medical_Check_up;
CREATE TABLE Medical_Check_up(
    Medical_Check_up_ID INT NOT NULL,
    Medical_Check_up_date VARCHAR(255) NOT NULL,
    Medical_Check_up_time VARCHAR(255) NOT NULL,
    Medical_Check_up_reason VARCHAR(255) NOT NULL,
    Medical_Check_up_documentation VARCHAR(255) NOT NULL,

    primary key(Medical_Check_up_ID)
);

-- task 5 - Create "Disease" table
-- label the columns using the following schema:
--  Disease(
--              Disease_ID,
--              Disease_name,
--              Disease_type,
--              Disease_transmission,
--              Disease_communicable,
--              Disease_fatality)
-- Assign appropriate data types.
-- Assign an appropriate primary key.

DROP TABLE IF EXISTS Disease;
CREATE TABLE Disease(
    Disease_ID INT NOT NULL,
    Disease_name VARCHAR(255) NOT NULL,
    Disease_type VARCHAR(255) NOT NULL,
    Disease_transmission VARCHAR(255) NOT NULL,
    Disease_communicable VARCHAR(255) NOT NULL,
    Disease_fatality VARCHAR(255) NOT NULL,

    primary key(Disease_ID)
);

-- task 6 - Create "Treatment" table
-- label the columns using the following schema:
--  Treatment(
--              Treatment_ID,
--              Treatment_stage,
--              Treatment_cost,
--              Treatment_option)
-- Assign appropriate data types.
-- Assign an appropriate primary key.

DROP TABLE IF EXISTS Treatment;
CREATE TABLE Treatment(
    Treatment_ID INT NOT NULL,
    Treatment_stage VARCHAR(255) NOT NULL,
    Treatment_cost INT NOT NULL,
    Treatment_option VARCHAR(255) NOT NULL,

    primary key(Treatment_ID)
);

-- task 7 - Create "Doctor" table
-- label the columns using the following schema:
--  Doctor(
--              Doctor_ID,
--              Doctor_name)
-- Assign appropriate data types.
-- Assign an appropriate primary key.

DROP TABLE IF EXISTS Doctor;
CREATE TABLE Doctor(
    Doctor_ID INT NOT NULL,
    Doctor_name VARCHAR(255) NOT NULL,

    primary key(Doctor_ID)
);

-- task 8 - Insert records into Patient table using an API
-- DATA PIPELINE TRICK:
--   - create the appropriate INSERT command header
--   - THEN, use a spreadsheet to turn each row of the CSV file into 
--     an appropriately formatted VALUES statement,
--   - THEN, copy and paste the ENTIRE block of values into the DDL file below.
--   - This trick works with just about ANY table!
--   - Watch out for single apostrophes, they need to be manually converted to ''
--     take advantage of the VSCODE colors.


INSERT INTO Patient(Patient_ID, Patient_name, Patient_gender, Patient_age, Patient_ethnicity, Patient_socioeconomic_status) VALUES

  ;

SELECT * FROM Patient;

-- task 9 - Insert records into Region table using an API
-- DATA PIPELINE TRICK:
--   - create the appropriate INSERT command header
--   - THEN, use a spreadsheet to turn each row of the CSV file into 
--     an appropriately formatted VALUES statement,
--   - THEN, copy and paste the ENTIRE block of values into the DDL file below.
--   - This trick works with just about ANY table!
--   - Watch out for single apostrophes, they need to be manually converted to ''
--     take advantage of the VSCODE colors.


INSERT INTO Region(Region_country,Region_nationality, Region_environment) VALUES

  ;

SELECT * FROM Region;

-- task 10 - Insert records into Medical_Check_up table using an API
-- DATA PIPELINE TRICK:
--   - create the appropriate INSERT command header
--   - THEN, use a spreadsheet to turn each row of the CSV file into 
--     an appropriately formatted VALUES statement,
--   - THEN, copy and paste the ENTIRE block of values into the DDL file below.
--   - This trick works with just about ANY table!
--   - Watch out for single apostrophes, they need to be manually converted to ''
--     take advantage of the VSCODE colors.


INSERT INTO Medical_Check_up(Medical_Check_up_ID, Medical_Check_up_date, Medical_Check_up_time, Medical_Check_up_reason, Medical_Check_up_documentation) VALUES

  ;

SELECT * FROM Medical_Check_up;

-- task 11 - Insert records into Disease table using an API
-- DATA PIPELINE TRICK:
--   - create the appropriate INSERT command header
--   - THEN, use a spreadsheet to turn each row of the CSV file into 
--     an appropriately formatted VALUES statement,
--   - THEN, copy and paste the ENTIRE block of values into the DDL file below.
--   - This trick works with just about ANY table!
--   - Watch out for single apostrophes, they need to be manually converted to ''
--     take advantage of the VSCODE colors.


INSERT INTO Disease(Disease_ID, Disease_name, Disease_type, Disease_transmission, Disease_communicable, Disease_fatality) VALUES

  ;

SELECT * FROM Disease;

-- task 12 - Insert records into Patient table using an API
-- DATA PIPELINE TRICK:
--   - create the appropriate INSERT command header
--   - THEN, use a spreadsheet to turn each row of the CSV file into 
--     an appropriately formatted VALUES statement,
--   - THEN, copy and paste the ENTIRE block of values into the DDL file below.
--   - This trick works with just about ANY table!
--   - Watch out for single apostrophes, they need to be manually converted to ''
--     take advantage of the VSCODE colors.


INSERT INTO Treatment(Treatment_ID, Treatment_stage, Treatment_cost, Treatment_option) VALUES

  ;

SELECT * FROM Treatment;

-- task 13 - Insert records into Doctor table using an API
-- DATA PIPELINE TRICK:
--   - create the appropriate INSERT command header
--   - THEN, use a spreadsheet to turn each row of the CSV file into 
--     an appropriately formatted VALUES statement,
--   - THEN, copy and paste the ENTIRE block of values into the DDL file below.
--   - This trick works with just about ANY table!
--   - Watch out for single apostrophes, they need to be manually converted to ''
--     take advantage of the VSCODE colors.


INSERT INTO Doctor(Doctor_ID, Doctor_name) VALUES

  ;

SELECT * FROM Doctor;