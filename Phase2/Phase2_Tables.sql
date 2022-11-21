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
    Patient_first_name VARCHAR(255) NOT NULL,
    Patient_last_name VARCHAR(255) NOT NULL,
    Patient_gender VARCHAR(255) NOT NULL,
    Patient_age INT NOT NULL,
    Patient_ethnicity VARCHAR(255) NOT NULL,
    Patient_socioeconomic_status VARCHAR(255) NOT NULL,

    primary key(Patient_ID)
);

-- task 3 - Create "Region" table
-- label the columns using the following schema:
--  Region(
--              Region_country,
--              Region_country_short_name,
--              Region_nationality,
--              Region,
--              Region_environment,
-- Assign appropriate data types.
-- Assign an appropriate primary key.

DROP TABLE IF EXISTS Region;
CREATE TABLE Region(
    Region_country_code VARCHAR(255) NOT NULL,
    Region_country_short_name VARCHAR(255),
    Region_nationality VARCHAR(255),
    Region VARCHAR(255),
    Region_environment VARCHAR(255),

    primary key(Region_country_code)
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
    Treatment_stage INT NOT NULL,
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


INSERT INTO Patient(Patient_ID, Patient_first_name, Patient_last_name, Patient_gender, Patient_age, Patient_ethnicity, Patient_socioeconomic_status) VALUES

  (1,"Alex","Crus","Male",34,"White","High Class"),
  (2,"Luz","Jackson","Female",23,"White","Middle Class"),
  (3,"Alex","Carter","Male",54,"Asian","Low Class"),
  (4,"Kim","Long","Male",44,"African American","High Class"),
  (5,"Praisy","Biguvu","Female"5,"Latinx","High Class"),
  (6,"Maisha","Mahamood","Female",50,"Latinx","Low Class"),
  (7,"Mir","Ali","Male",43,	"Asian","Middle Class"),
  (8,"David","Coleman","Male",56,"African American","High Class"),
  (9,"Lenice","Jackson","Female",26,"Asian","High Class"),
  (10,"Charles","Cooper","Male",28,"White","Middle Class"),
  (11,"Gabby","Dixon","Female",35,"Latinx","Low Class"),
  (12,"Jon","Ortega","Male",54,"Latinx","Middle Class"),
  (13,"Alexander","Nichols","Male",65,"White","High Class"),
  (14,"Melinda","Marshall","Female",34,"White","Low Class"),
  (15,"Darlene","Fox","Female",76,"White","Middle Class"),
  (16,"Ryan","Fox","Male",22,"African American","Middle Class"),
  (17,"Melvin","Chandler","Male",88,"African American","High Class"),
  (18,"Daniel","Bolton","Male",45,"Asian","Low Class"),
  (19,"Joseph","Beasley","Male",66,"African American","High Class"),
  (20,"Stacey","Nichols","Female",35,"White","Middle Class"),
  (21,"Jessica","Graves","Female",55,"Asian","Low Class"),
  (22,"Angela","Hubbard","Female",44,"White","High Class"),
  (23,"Sarah","Howe","Female",66,"African American","Middle Class"),
  (24,"Brett","Schultz","Male",54,"White","High Class"),
  (25,"Nicholas","Salinas","Male",32,"Latinx","Low Class"),
  (26,"Holly","Duran","Female",22,"Latinx","Low Class"),
  (27,"Gwendolyn","Gonzalez","Female",54,"Latinx","Middle Class"),
  (28,"Colleen","Alexander","Male",23,"Latinx","Low Class"),
  (29,"Ashley","Garcia","Female",77,"Latinx","High Class"),
  (30,"Travis","Greene","Male",87,"Asian","High Class"),
  (31,"Deborah","Harris","Female",45,"White","Middle Class"),
  (32,"Tonya","Young","Female",87,"Asian","Low Class"),
  (33,"Jillian","Anderson","Male",99,"White","High Class"),
  (34,"Carlos","Johnson","Male",55,"Asian","Low Class"),
  (35,"Anthony","Williams","Male",20,"Asian","Middle Class"),
  (36,"Jodi","Hughes","Male"8,"Asian","High Class"),
  (37,"Brent","Ross","Male"6,"White","Low Class"),
  (38,"Luke","Turner","Male"9,"African American","High Class"),
  (39,"Frank","Davis","Male"2,"African American","Middle Class"),
  (40,"Karen","Rosales","Female"5,"Latinx","Middle Class");

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


INSERT INTO Region(Region_country_code, Region_country_short_name, Region_nationality, Region, Region_environment) VALUES
  ("ABW","Aruba","Arubans","Latin America & Caribbean","Hot"),
  ("AFG","Afghanistan","Afghans","South Asia","Dry continental climate"),
  ("AGO","Angola","Angolans","Sub-Saharan Africa","Warm & Hot"),
  ("ALB","Albania","Albanians","Europe & Central Asia","Warm & Hot"),
  ("AND","Andorra","Andorrans","Europe & Central Asia","Warm & Cold"),
  ("ARE","United Arab Emirates","The Emiratis","Middle East & North Africa","Hot & Cool"),
  ("ARG","Argentina","Argentinians","Latin America & Caribbean","Mild to Warm && Very Hot "),
  ("ARM","Armenia","Armenians","Europe & Central Asia","Hot & Cold"),
  ("ASM","American Samoa","Samoans","East Asia & Pacific","Warm"),
  ("ATG","Antigua and Barbuda","Antiguans","Latin America & Caribbean","Hot"),
  ("AUS","Australia","Australians","East Asia & Pacific","Warm & Hot"),
  ("AUT","Austria","Austrins","Europe & Central Asia","Warm & Humid"),
  ("AZE","Azerbaijan","Azerbaijani","Europe & Central Asia","Hot & Cold"),
  ("BDI","Burundi","Burundians","Sub-Saharan Africa","Warm or Hot"),
  ("BEL","Belgium","Belgians","Europe & Central Asia","Slightly warm & Cold"),
  ("BEN","Benin","Beninese","Sub-Saharan Africa","Warm"),
  ("BFA","Burkina Faso","Burkinabé","Sub-Saharan Africa","Hot & Humid"),
  ("BGD","Bangladesh","Bangladeshi","South Asia","Hot"),
  ("BGR","Bulgaria","Bulgarians","Europe & Central Asia","Hot & Cold"),
  ("BHR","Bahrain","Bahrainis","Middle East & North Africa","Hot and Slightly Cold"),
  ("BHS","The Bahamas","Bahamians","Latin America & Caribbean","Hot"),
  ("BIH","Bosnia and Herzegovina","Bosanac","Europe & Central Asia","Hot & Cool"),
  ("BLR","Belarus","Belarusians","Europe & Central Asia","Hot & Cold"),
  ("BLZ","Belize","Belizeans","Latin America & Caribbean","Hot & Humid"),
  ("BMU","Bermuda","Bermudians","North America","Hot & Slightly Cold"),
  ("BOL","Bolivia","Bolivian","Latin America & Caribbean","Hot & Humid"),
  ("BRA","Brazil","Brazilian","Latin America & Caribbean","Hot & Cold"),
  ("BRB","Barbados","Barbadians","Latin America & Caribbean","Warm"),
  ("BRN","Brunei","Bruneian","East Asia & Pacific","Hot"),
  ("BTN","Bhutan","Bhutanese","South Asia","Hot,Humid & Cold"),
  ("BWA","Botswana","Batswana","Sub-Saharan Africa","Warm to Hot"),
  ("CAF","Central African Republic","Sangos","Sub-Saharan Africa","Warm"),
  ("CAN","Canada","Canadians","North America","Cold"),
  ("CHE","Switzerland","Swiss","Europe & Central Asia","Warm & Slightly Cold"),
  ("CHI","Channel Islands","Jersey","Europe & Central Asia","Hot & Cool"),
  ("CHL","Chile","Chileans","Latin America & Caribbean","Warm"),
  ("CHN","China","Chinese","East Asia & Pacific","Hot & Cold"),
  ("CIV","Côte d'Ivoire","Ivorians","Sub-Saharan Africa","Hot & Humid"),
  ("CMR","Cameroon","Cameroonian","Sub-Saharan Africa","Hot"),
  ("COD","Dem. Rep. Congo","Congolese","Sub-Saharan Africa","Hot & Humid");

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
  (111,"3/23/19","12:00 PM","High temperature","The patient has high temperature"),
  (745,"2/27/15","4:45 PM","Headaches","The patient has a headache and hasn't been able to sleep well due to this, therefore, more test will be done"),
  (944,"10/23/18","8:30 AM","High temperature","The patient has high temperature"),
  (43,"6/22/15","6:20 AM","Bladder changes	The patient needs further test"),
  (564,"4/13/20","6:55 PM","Cough","The patient is not feeling good, has a really bad cough"),
  (943,"5/16/20","5:50 PM","Eating problems	Patient has not appetite"),
  (200,"12/22/22","11:30 AM","Severe fatigue","The patient has fainted due to fatigue"),
  (223,"6/20/21","7:23 AM","Trouble urinating","The patient hasn't been able to urinate properly and occasional bladder pain is involved"),
  (102,"11/15/22","10:30 AM","Nausea","The patient has been feeling nauseous for the past week"),
  (434,"1/27/18","8:50 AM","Nose bleeding","The patient is suffering form severe dehydration");

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
  (1,"Alzheimer","Early on","","","Low"),
  (2,"Asthma","Moderate","","","Low"),
  (3,"Autoimmune Disease","Moderate","","","Low"),
  (4,"E. Coli","Early on","Raw foods","Easy","Medium"),
  (5,"Eczema","Early on","","","Low"),
  (6,"Gonorrhea","Early on","Sexual contact","Moderate","Low"),
  (7,"Hepatitis","Severe","Blood","Easy","Low"),
  (8,"Lyme Disease","Moderate","Infected tick","Easy","Low"),
  (9,"Malaria","Severe","Mosquitoes","Easy","Medium"),
  (10,"Tuberculosis","Moderate","Air","Hard","Low");

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
  (1,2,300,"Run a second test, then prescribe some antibiotics"),
  (2,3,600,"Do a CT scan to see internally"),
  (3,3,500,"Prescribe stronger medicine"),
  (4,1,150,"Take a urine test to determine further complications"),
  (5,2,250,"Prescribe Tylenol-Codeine Elixir"),
  (6,3,300,"Run a blood test"),
  (7,1,100,"Have an IV bag"),
  (8,2,250,"Get an x-ray to see what is wrong internally"),
  (9,1,150,"Have an IV bag"),
  (10,4,750,"Do a CT scan to see internally");

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
  (1,"Dr.Shepherd"),
  (2,"Dr.McIness"),
  (3,"Dr.Tang"),
  (4,"Dr.Roland"),
  (5,"Dr.Albert"),
  (6,"Dr.Lopez"),
  (7,"Dr.Tran"),
  (8,"Dr.Ramirez"),
  (9,"Dr.Ruiz"),
  (10,"Dr.Camero");

SELECT * FROM Doctor;