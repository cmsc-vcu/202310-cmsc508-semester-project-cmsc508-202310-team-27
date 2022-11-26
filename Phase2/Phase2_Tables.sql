-- Phase2_tables.sql
-- Members:
--          Lazaro Camero
--          Mir Ali
--          Khoi Tran

-- task 1
-- store your drop table statements in this block
--

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS Region;
DROP TABLE IF EXISTS Medical_Check_up;
DROP TABLE IF EXISTS Disease;
DROP TABLE IF EXISTS Treatment;
DROP TABLE IF EXISTS Doctor;
SET FOREIGN_KEY_CHECKS = 1;

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
    Region_Disease_ID INT NOT NULL,
    Region_country_code VARCHAR(255) NOT NULL,
    Region_country_short_name VARCHAR(255),
    Region_nationality VARCHAR(255),
    Region VARCHAR(255),
    Region_environment VARCHAR(255),

    primary key(Region_country_code),
    foreign key(Region_Disease_ID) REFERENCES Disease (Disease_ID));

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
    Medical_Check_up_Patient_ID INT NOT NULL,
    Medical_Check_up_ID INT NOT NULL,
    Medical_Check_up_date VARCHAR(255) NOT NULL,
    Medical_Check_up_time VARCHAR(255) NOT NULL,
    Medical_Check_up_reason VARCHAR(255) NOT NULL,
    Medical_Check_up_documentation VARCHAR(255) NOT NULL,

    primary key(Medical_Check_up_ID),
    foreign key(Medical_Check_up_Patient_ID) REFERENCES Patient (Patient_ID));

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
    Disease_Patient_ID INT NOT NULL,
    Disease_ID INT NOT NULL,
    Disease_name VARCHAR(255) NOT NULL,
    Disease_type VARCHAR(255) NOT NULL,
    Disease_stage INT NOT NULL,
    Disease_transmission VARCHAR(255) NOT NULL,
    Disease_communicable VARCHAR(255) NOT NULL,
    Disease_fatality VARCHAR(255) NOT NULL,

    primary key(Disease_ID),
    foreign key(Disease_Patient_ID) REFERENCES Patient (Patient_ID));

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
    Treatment_Disease_ID INT NOT NULL,
    Treatment_ID INT NOT NULL,
    Treatment_stage INT NOT NULL,
    Treatment_cost INT NOT NULL,
    Treatment_option VARCHAR(255) NOT NULL,

    primary key(Treatment_ID),
    foreign key(Treatment_Disease_ID) REFERENCES Disease (Disease_ID));

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
  (5,"Praisy","Biguvu","Female",15,"Latinx","High Class"),
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
  (36,"Jodi","Hughes","Male",18,"Asian","High Class"),
  (37,"Brent","Ross","Male",60,"White","Low Class"),
  (38,"Luke","Turner","Male",19,"African American","High Class"),
  (39,"Frank","Davis","Male",22,"African American","Middle Class"),
  (40,"Karen","Rosales","Female",35,"Latinx","Middle Class");

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


INSERT INTO Region(Region_Disease_ID, Region_country_code, Region_country_short_name, Region_nationality, Region, Region_environment) VALUES
  (1,"ABW","Aruba","Arubans","Latin America & Caribbean","Hot"),
  (2,"AFG","Afghanistan","Afghans","South Asia","Hot"),
  (3,"AGO","Angola","Angolans","Sub-Saharan Africa","Warm & Hot"),
  (4,"ALB","Albania","Albanians","Europe & Central Asia","Warm & Hot"),
  (5,"AND","Andorra","Andorrans","Europe & Central Asia","Warm & Cold"),
  (6,"ARE","United Arab Emirates","The Emiratis","Middle East & North Africa","Hot & Cool"),
  (7,"ARG","Argentina","Argentinians","Latin America & Caribbean","Mild to Warm && Very Hot "),
  (8,"ARM","Armenia","Armenians","Europe & Central Asia","Hot & Cold"),
  (9,"ASM","American Samoa","Samoans","East Asia & Pacific","Warm"),
  (10,"ATG","Antigua and Barbuda","Antiguans","Latin America & Caribbean","Hot"),
  (11,"AUS","Australia","Australians","East Asia & Pacific","Warm & Hot"),
  (12,"AUT","Austria","Austrins","Europe & Central Asia","Warm & Humid"),
  (13,"AZE","Azerbaijan","Azerbaijani","Europe & Central Asia","Hot & Cold"),
  (14,"BDI","Burundi","Burundians","Sub-Saharan Africa","Warm or Hot"),
  (15,"BEL","Belgium","Belgians","Europe & Central Asia","Slightly warm & Cold"),
  (16,"BEN","Benin","Beninese","Sub-Saharan Africa","Warm"),
  (17,"BFA","Burkina Faso","Burkinabé","Sub-Saharan Africa","Hot & Humid"),
  (18,"BGD","Bangladesh","Bangladeshi","South Asia","Hot"),
  (19,"BGR","Bulgaria","Bulgarians","Europe & Central Asia","Hot & Cold"),
  (20,"BHR","Bahrain","Bahrainis","Middle East & North Africa","Hot and Slightly Cold"),
  (21,"BHS","The Bahamas","Bahamians","Latin America & Caribbean","Hot"),
  (22,"BIH","Bosnia and Herzegovina","Bosanac","Europe & Central Asia","Hot & Cool"),
  (23,"BLR","Belarus","Belarusians","Europe & Central Asia","Hot & Cold"),
  (24,"BLZ","Belize","Belizeans","Latin America & Caribbean","Hot & Humid"),
  (25,"BMU","Bermuda","Bermudians","North America","Hot & Slightly Cold"),
  (26,"BOL","Bolivia","Bolivian","Latin America & Caribbean","Hot & Humid"),
  (27,"BRA","Brazil","Brazilian","Latin America & Caribbean","Hot & Cold"),
  (28,"BRB","Barbados","Barbadians","Latin America & Caribbean","Warm"),
  (29,"BRN","Brunei","Bruneian","East Asia & Pacific","Hot"),
  (30,"BTN","Bhutan","Bhutanese","South Asia","Hot,Humid & Cold"),
  (31,"BWA","Botswana","Batswana","Sub-Saharan Africa","Warm to Hot"),
  (32,"CAF","Central African Republic","Sangos","Sub-Saharan Africa","Warm"),
  (33,"CAN","Canada","Canadians","North America","Cold"),
  (34,"CHE","Switzerland","Swiss","Europe & Central Asia","Warm & Slightly Cold"),
  (35,"CHI","Channel Islands","Jersey","Europe & Central Asia","Hot & Cool"),
  (36,"CHL","Chile","Chileans","Latin America & Caribbean","Warm"),
  (37,"MEX","Mexico","Mexicans","North America","Hot & Cold"),
  (38,"CMR","Cameroon","Cameroonian","Sub-Saharan Africa","Hot"),
  (39,"COD","Dem. Rep. Congo","Congolese","Sub-Saharan Africa","Hot & Humid"),
  (40,"GTM","Guatemala","Guatemalans","Central America","Hot & Humid");

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


INSERT INTO Medical_Check_up(Medical_Check_up_Patient_ID, Medical_Check_up_ID, Medical_Check_up_date, Medical_Check_up_time, Medical_Check_up_reason, Medical_Check_up_documentation) VALUES
  (1,110,"03/23/2019","12:00 PM","High temperature","The patient has high temperature"),
  (2,111,"02/27/2015","4:45 PM","Headaches","The patient has a headache and hasn't been able to sleep well due to this, therefore, more test will be done"),
  (3,112,"10/23/2018","8:30 AM","High temperature","The patient has high temperature"),
  (4,113,"06/22/2015","6:20 AM","Bladder changes","The patient needs further test"),
  (5,114,"04/13/2020","6:55 PM","Cough","The patient is not feeling good, has a really bad cough"),
  (6,115,"05/16/2020","5:50 PM","Eating problems","Patient has not appetite"),
  (7,116,"12/22/2022","11:30 AM","Severe fatigue","The patient has fainted due to fatigue"),
  (8,117,"06/20/2021","7:23 AM","Trouble urinating","The patient hasn't been able to urinate properly and occasional bladder pain is involved"),
  (9,118,"11/15/2022","10:30 AM","Nausea","The patient has been feeling nauseous for the past week"),
  (10,119,"01/27/2018","8:50 AM","Nose bleeding","The patient is suffering form severe dehydration"),
  (11,120,"12/12/2020","4:25 PM","Severe rash"," The patient has a severe rash accompanied with a fever"),
  (12,121,"07/21/2018","5:30 PM","Skin infection","The patent has redness of skin and scrashes the skin constantly"),
  (13,122,"10/12/2021","5:20 PM","Persisting cough & headache","The patient has a fever of 102° F or greater (which may indicate a more serious infection)"),
  (14,123,"03/12/2020","8:59 AM","Unclear vision and red eyes","The patient has had redness, itching, tearing, burning sensation, pus-like discharge and/or crusting of the eyelids for several weeks"),
  (15,124,"04/04/2020","4:50 PM","Watery, loose stools","The patient has cramping or pain in the abdomen, nausea, bloating"),
  (16,125,"04/07/2021","10:32 AM","Extreme fatigue, and frequent naps","The patient has extreme fatigue accompanied by other symptoms, such as swollen lymph glands and spleen, sore throat, fever, loss of appetite"),
  (17,126,"05/12/2020","6:35 PM","Insomnia, restlessness, slurred speech, or unresponsiveness","The patient seems to have a mental deterioration."),
  (18,127,"05/21/2020","8:57 PM","Random fevers","The patient is pregnant and seems to have a self-limiting influenza-like illness"),
  (19,128,"06/12/2020","6:20 PM","Cold, cough and a mild fever","The patient seems to have a cold with a runny nose and a mild fever"),
  (20,129,"06/11/2022","10:35 PM","Fever and sore throat","The patient seems to have a mild fever, sore throat and a rash that starts on the face and spreads to the rest of the body"),
  (21,130,"07/06/2020","8:57 AM","Painful muscle spasms"," The patient has painful muscle spasms and stiff, immovable muscles in the jaw & difficulty swallowing"),
  (22,131,"07/19/2020","5:46 PM","Painful urination","The patient has pain while urinating as well as testicular pain"),
  (23,132,"07/22/2022","10:40 PM","Memory loss & poor judgment","The patient's family is concern becasue the patient has had cases of memory loss, poor judgment, etc"),
  (24,133,"08/12/2019","4:15 PM","Painful urination","The patient finds it painful to urinate. Abdominal or pelvic pain is also involved"),
  (25,134,"08/23/2020","6:10 PM","Fever, fatigue","The patient has a variety of symptoms such as loss of appetite, nausea, vomiting, but the most concerning ones are fever and fatigue."),
  (26,135,"08/25/2021","10:46 AM","pain, swelling","The patient has continuous joint pain and swelling of the area as well"),
  (27,136,"08/28/2022","8:52 PM","Dry, cracked skin","The patient shows very dry and cracked skin with rashes"),
  (28,137,"09/18/2019","11:20 AM","Nausea and vomiting","The patient seems to be vomiting often, diarrhea is also involved"),
  (29,138,"09/20/2022","8:53 AM","Fever, headache and muscle pain","The patient shows a veriety of symptoms such as Severe headache, stiff neck, confusion, seizures. The patient's life may be in danger. Intensive care is needed"),
  (30,139,"09/09/2022","4:30 PM","Fever, chills, and malaise","The patient seems to be developing his fever, and chills from multiple lesions and inguinal adenopathy"),
  (31,140,"10/03/2020","6:15 PM","Shortness of breath and chest tightness or pain","The patient seems to be having wheezing when exhaling, shortness of breat and tightness of the chest"),
  (32,141,"10/08/2021","11:10 AM","characteristic skin rash called erythema migrans","The patient has a characteristic skin rash called erythema migrans, as well as fever, headache and fatigue"),
  (33,142,"10/09/2018","10:50 AM","Skin problems.Abdominal pain or digestive issues","The patient has Skin problems and abdominal pain"),
  (34,143,"11/11/2019","4:35 PM","Drowsiness, fever","The patient seems to be feeling unwell lately. Fever has developed as well as muscle soreness or trembling"),
  (35,144,"11/12/2020","6:50 PM","Ocasional confusion, and seizures","Patient has been having cases wehre he seems very confused. Seizures have also been present three times a week"),
  (36,145,"11/27/2021","11:40 AM","Head usually hurts on both sides","The patient seems to be having serious headaches"),
  (37,146,"11/23/2022","8:51 PM","New loss of taste or smell","The patient has lost the sense of smell and taste"),
  (38,147,"01/01/2020","10:45 AM","Watery diarrhea","The patient has had Watery diarrhea for a weeks now and seems very dehydrated"),
  (39,148,"01/02/2021","8:52 AM","fever and flu-like illness","The patient has a fever and flu-like illness"),
  (40,149,"01/03/2022","4:15 PM","Aches and pains","The patient seems to be having aches and pains (eye pain, typically behind the eyes, muscle, joint, or bone pain)");

SELECT * FROM Medical_Check_up;

-- task 11 - Insert records into Disease table
-- DATA PIPELINE TRICK:
--   - create the appropriate INSERT command header
--   - THEN, use a spreadsheet to turn each row of the CSV file into 
--     an appropriately formatted VALUES statement,
--   - THEN, copy and paste the ENTIRE block of values into the DDL file below.
--   - This trick works with just about ANY table!
--   - Watch out for single apostrophes, they need to be manually converted to ''
--     take advantage of the VSCODE colors.


INSERT INTO Disease(Disease_Patient_ID, Disease_ID, Disease_name, Disease_type, Disease_stage, Disease_transmission, Disease_communicable, Disease_fatality) VALUES
  (1,1,"Alzheimer","Early on","1","","","Low"),
  (2,2,"Asthma","Moderate","1","","","Low"),
  (3,3,"Autoimmune Disease","Moderate","2","","","Low"),
  (4,4,"E. Coli","Early on","1","Raw foods","Easy","Medium"),
  (5,5,"Eczema","Early on","2","","","Low"),
  (6,6,"Gonorrhea","Early on","2","Sexual contact","Moderate","Low"),
  (7,7,"Hepatitis","Severe","2","Blood","Easy","Low"),
  (8,8,"Lyme Disease","Moderate","1","Infected tick","Easy","Low"),
  (9,9,"Malaria","Severe","2","Mosquitoes","Easy","Medium"),
  (10,10,"Tuberculosis","Moderate","3","Air","High","Low"),
  (11,11,"Celiac Disease","Early on","2","","","High"),
  (12,12,"Cryptosporidiosis","Moderate","3","Parasite","Easy","Low"),
  (13,13,"Cyclospora","Moderate","1","Ingestion","Moderate","Low"),
  (14,14,"Arboviral Encephalitis","Early on","3","Infected tick or mosquitoes","Easy","Medium"),
  (15,15,"Chlamydia","Early on","2","Sexual contact","Moderate","Low"),
  (16,16,"Diphtheria","Early on","3","Poisonous bacteria","Moderate","Moderate"),
  (17,17,"Chancroid","Severe","3","Sexual contact","Easy","Low"),
  (18,18,"Chickenpox","Moderate","3","Varicella zoster vacteria","Easy","Low"),
  (19,19,"Alphaviruses","Severe","2","Mosquitoes bites","Easy","Medium"),
  (20,20,"Arthritis","Moderate","2","Genetics","","Low"),
  (21,21,"Cancer","Severe","1","Genetics","","Medium"),
  (22,22,"COVID","Moderate","2","Direct contact & Air","","High"),
  (23,23,"Lung Cancer","Severe","3","Genetics","","Medium"),
  (24,24,"Monkeypox","Severe","2","Direct contact","Easy","Medium"),
  (25,25,"Tuberculosis","Severe","1","Direct contact & Air","Easy","High"),
  (26,26,"Skin Cancer","Severe","3","Genetics","","Medium"),
  (27,27,"Heart disease","Severe","2","Genetics","","Low"),
  (28,28,"Dengue","Moderate","1","People & Mosquitoes","Easy","Medium"),
  (29,29,"Malaria","Moderate","3","Infected mosquitoes","","Low"),
  (30,30,"Diarrheal Diseases","Severe","1","Uncleanliness","Easy","High"),
  (31,31,"Respiratory Cancer","Severe","1","Genetics","","High"),
  (32,32,"Conjunctivitis (pink eye)","Severe","3","People","Easy","High"),
  (33,33,"Cold and Flu","Low","1","Direct contact","Easy","Low"),
  (34,34,"Headaches","Low","2","Emotional and physical stress","","Low"),
  (35,35,"Mononucleosis","Moderate","3","Saliva","Moderate","Medium"),
  (36,36,"Mad Cow (BSE)","Moderate","2","Through ingestion of BSE-tainted beef and beef products","High","Low"),
  (37,37,"Listeriosis","Moderate","3","Food & Mother to fetus","Moderate","Medium"),
  (38,38,"Measles","High","2","Mucus particle in the Air","High","Low"),
  (39,39,"Rubella","Low","1","Direct contact","Easy","High"),
  (40,40,"Tetanus","Low","2","","","Medium");

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


INSERT INTO Treatment(Treatment_Disease_ID, Treatment_ID, Treatment_stage, Treatment_cost, Treatment_option) VALUES
  (1,1,2,300,"Run a second test, then prescribe some antibiotics"),
  (2,2,3,600,"Do a CT scan to see internally"),
  (3,3,3,500,"Prescribe stronger medicine"),
  (4,4,1,150,"Take a urine test to determine further complications"),
  (5,5,2,250,"Prescribe Tylenol-Codeine Elixir"),
  (6,6,3,300,"Run a blood test"),
  (7,7,1,100,"Have an IV bag"),
  (8,8,2,250,"Get an x-ray to see what is wrong internally"),
  (9,9,1,150,"Have an IV bag"),
  (10,10,4,750,"Do a CT scan to see internally"),
  (11,11,2,350,"Prescribe some laxatives"),
  (12,12,1,440,"Do a CT scan to see internally, and prescribe cough syrup"),
  (13,13,2,500,"Get a x-ray and run blood tests"),
  (14,14,1,250,"Do some basic metabolic panel to determine further complications"),
  (15,15,2,400,"Execute vital sign tests to determine right treatments"),
  (16,16,3,300,"Execute a hemorrhoidectomy to remove hemorrhoids"),
  (17,17,2,190,"Based on previous medical history and patient's pain scale, a low back pain surgery is needed"),
  (18,18,2,290,"A partial coloctomy to remove part of the large intestine to treat cancer of the colon is needed"),
  (19,19,3,350,"Take trimethoprim-sulfamethoxazole or Cotrim"),
  (20,20,4,850,"Take paracetamol to relieve fever, and calamine lotion and cooling gels to ease itching"),
  (21,21,2,550,"Drink lots of clear fluids (e.g., water, tea) & Stay away from cigarette smoke"),
  (22,22,3,330,"Use a cool wet washcloth to soak off any crusting. Wash hands regularly and avoid touching your eyes"),
  (23,23,2,119,"Avoid foods that are milk-based, greasy, high-fiber, or very sweet. Do not eat solid food if you have signs of dehydration (thirst, light-headed, dark urine)"),
  (24,24,3,290,"Take some over-the-counter medicines such as acetaminophen, ibuprofen, or aspirin to relieve both migraine and tension headaches"),
  (25,25,3,180,"Make sure you get plenty of rest, eat healthy foods, avoid alcohol, drink plenty of fluids, take aspirin or an aspirin substitute to reduce pain and fever, and gargle salt water to relieve sore throat"),
  (26,26,2,210,"There is no concrete treatment that can eradicate the disease. However, some medicine can help the patient feel better"),
  (27,27,1,310,"Take antibiotic gentamicin in combination with ampicillin"),
  (28,28,1,110,"Take antibiotic, Vitamin A and rest well for a week"),
  (29,29,3,390,"Take some medicine for the fever such as acetaminophen"),
  (30,30,1,980,"The patient needs to be taken to intensive care to treat wounds. Medications to ease symptoms need to also be given to the patient"),
  (31,31,2,750,"Take some antiboitic"),
  (32,32,1,600,"Take Cognition-enhancing medication such as memantine to temporarily improve symptoms"),
  (33,33,1,500,"Take a single dose of 500 mg of intramuscular ceftriaxone"),
  (34,34,3,350,"Take pegylated interferon-alpha weekly for 6 weeks, and then come back for a checkup"),
  (35,35,2,750,"Take some pain relievers such as acetaminophen, aspirin, or ibuprofen, and do heat and cold therapy"),
  (36,36,1,650,"Apply creams and ointments at night before bed to control inflammation or treat any infectious causes"),
  (37,37,1,200,"There is no concrete treatment, however, you should rest as much as possible, drink plenty of fluids to help prevent dehydration and fatigue"),
  (38,38,3,500,"Supportive care (intravenous fluids, medicine to control fever and pain)"),
  (39,39,3,550,"There are different treatments but I would like you to start with yaking Azithromycin 1 gm orally in a single dose, and Ceftriaxone 250 mg IM in a single dose. Come back in two weeks"),
  (40,40,1,250,"Prescribed a rescue inhalers to treat symptoms and controller inhalers to prevent the symptom from developing farther");

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
  (10,"Dr.Camero"),
  (11,"Dr.Rodriguez"),
  (12,"Dr.Dihn"),
  (13,"Dr.Cao"),
  (14,"Dr.Try"),
  (15,"Dr.Jackson"),
  (16,"Dr.Gutierrez"),
  (17,"Dr.Cabrera"),
  (18,"Dr.Smith"),
  (19,"Dr.Lee"),
  (20,"Dr.Nguyen"),
  (21,"Dr.Shah"),
  (22,"Dr.Kim"),
  (23,"Dr.Patel"),
  (24,"Dr.Miller"),
  (25,"Dr.Brown"),
  (26,"Dr.Palmer"),
  (27,"Dr.Goblin"),
  (28,"Dr.Dollak"),
  (29,"Dr.Goff"),
  (30,"Dr.Guftaffson"),
  (31,"Dr.Rossa"),
  (32,"Dr.Glossner"),
  (33,"Dr.Mehok"),
  (34,"Dr.Mangieri"),
  (35,"Dr.Mount"),
  (36,"Dr.Navarrete"),
  (37,"Dr.Bowman"),
  (38,"Dr.Praska"),
  (39,"Dr.Banes"),
  (40,"Dr.Cermeno");

SELECT * FROM Doctor;