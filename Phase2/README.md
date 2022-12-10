# Problem Statement
## Authors: Lazaro Camero, Khoi Tran, Mir Ali


Table of content
------------------

* [Introduction](#Introduction)
* [Database Description](#Database Description)
* [ER Diagram](#ER Diagram)
* [Relational Schemas](#Relational Schemas)
* [Functional Dependencies](#Functional Dependencies)
* [Query Examples](#Query Examples)
* [What we took from the class?](#What we took from the class?)
* [Improvements to the semester project](#Improvements to the semester project)



## Introduction

&nbsp; &nbsp; &nbsp; &nbsp;In light of today’s modern society, scientists around the world are innovating new ways to combat illnesses and prolong the human lifespan. One approach to this is identifying what influences population health - in other words, recognizing predictors of health, such as race and gender. Studies around the globe show that racial and ethnic minority groups experience higher rates of illnesses and deaths across a wide range of health conditions, such as diabetes, hypertension, obesity, and heart-related diseases, when compared to their White counterparts. In addition, the role of gender can impact the health outcomes of an individual as it often is associated with health behaviors such as physical activity.<br />
&nbsp; &nbsp; &nbsp; &nbsp;The main focus of this project will investigate how particular diseases spread among different racial and gender groups. It’s important to remember that people of different races mix in today’s culture, so illnesses that affect, for instance, a group of Africans particularly may also affect, to some extent, a group of people who have some African in them. Studies have revealed that some diseases can develop over the course of a person’s life, while some diseases are more likely to affect particular ethnic groups.<br />
&nbsp; &nbsp; &nbsp; &nbsp;The biology department at Virginia Commonwealth University is in need of a database that allows for a quick and easy retrieval of data associated with certain key concepts or names and attributes. It seems like they have too much data everywhere in their system, making it difficult for them to group their patients into their corresponding type of disease and treatments for them. Data is to be stored about patients, diseases, ages, and doctor’s appointment. This data includes the disease name, complications, activity habits, and family history, Data to be stored about the patients include location in between doctor’s appointments, patient’s ID, date when they weren’t visiting the doctor. Data stored about the doctor’s visit include the date the patients visited the doctors, and time.

## Database Description

&nbsp; &nbsp; &nbsp; &nbsp;We will use various data sets for this project’s entities, such as diseases, people, gender, ages, and doctor’s appointments, to create linkages between them. We want to be able to retrieve certain information based on specified attributes, hence the goal of our project is to build a database to find the linkages between the entities. For instance, if we need to obtain information about a primary key, we can just type its ID into the data set and receive all of the pertinent details.

&nbsp; &nbsp; &nbsp; &nbsp;There are five entities in our system, each with unique properties and primary keys that define data sets. We are able to establish relationships between the entities using these entities, such as Person to Doctor. We will be able to use queries to discover specific information thanks to the development of this database.

## ER Diagram

![Phase2](https://user-images.githubusercontent.com/69920518/206824105-bdaa3ac5-9245-4653-ae6e-9e42fc2c01a5.jpg)

A database is in Boyce-Codd Normal Form if every non-prime attribute depends on every other prime attribute and there is no functional redundancy. You can see that this is how our diagram is constructed based on the concept of a BCNF as each non-prime attribute exclusively depends on the prime attribute that distinguishes each schema. A database is in 4NF if there are no multi-value dependencies and based on this diagram, we don't have any multi-value dependencies. A database is 4NF if there are no multi-value dependencies, and according to this diagram, there aren't any.

## Relational Schemas

Patient (<ins>Patient_ID</ins>, Patient_first_name, Patient_last_name, Patient_gender, Patient_age, Patient_ethnicity, Patient_socioeconomic_status)<br />
Medical CheckUp(<ins>Medical_check_up_ID</ins>, (fk)Medical_check_up_patient_ID, Medical_Check_up_date, Medical_Check_up_time, Medical_Check_up_reason, Medical_Check_up_documentation)<br />
Doctor(<ins>Doctor_ID</ins>, (fk)Doctor_Patient_ID, Doctor_name, Doctor_start_date)<br />
Disease (<ins>Disease_ID</ins>, (fk)Disease_patient_ID, Disease_name, Disease_type, Disease_stage, Disease_transmission, Disease_communicable, Disease_fatality)<br />
Region (<ins>Region_country_code</ins>, (fk)Region_Disease_ID, (fk)Region_Patient_ID, Region_country_short_name, Region_nationality, Region, Region_environment)<br />
Treatment (<ins>Treatment ID</ins>, (fk)Treatment_Disease_ID, Treatment_stage, Treatment_cost, Treatment_option)<br />
Patient_Checkups(<ins>Patient ID</ins>, <ins>Medical_check_up_ID</ins>)<br />
Diagnose(<ins>Medical_check_up_ID</ins>, <ins>Disease_ID</ins>)<br />
Doctor_Checkup(<ins>Doctor_ID</ins>, <ins>Medical_check_up_ID</ins>)<br />
Location(<ins>Patient ID</ins>, <ins>Region_country_code</ins>)<br />
Region_Disease(<ins>Region_country_code</ins>, <ins>Disease_ID</ins>)<br />
Administer(<ins>Disease_ID</ins>, <ins>Treatment ID</ins>)<br />

## Functional Dependencies

Patient_ID -> Patient_first_name, Patient_last_name, Patient_gender, Patient_age, Patient_ethnicity, Patient_socioeconomic_status<br />
Patient_ID, Medical_check_up_ID -> <br />
Patient_ID -> Medical_Check_up_date, Medical_Check_up_time, Medical_Check_up_reason, Medical_Check_up_documentation<br />
Patient_ID, Disease_ID -> <br />
Disease_ID -> Disease_name, Disease_type, Disease_stage, Disease_transmission, Disease_communicable, Disease_fatality<br />
Medical_check_up_ID, Doctor_ID -> <br />
Doctor_ID -> Doctor_name, Doctor_start_date <br />
Region_country_code -> Region_country_short_name, Region_nationality, Region, Region_environment<br />
Region_country_code, Disease_ID -> <br />
Treatment_ID -> Treatment_stage, Treatment_cost, Treatment_option<br />
Medical_Check_up_date, Disease_ID ->
Patient_ID, Region_country_code -> <br />
Medical_check_up_ID, Doctor_ID -><br />


## Query Examples

# Query 1: How many people have Cancer?

![query1](https://user-images.githubusercontent.com/69920518/206793967-0f9e515d-2ad1-40c3-b7f9-31bc819e31b7.svg)

# Query 2: What date did the patients receive their check-up in the hospital?

![query2](https://user-images.githubusercontent.com/69920518/206794141-17532ede-3bfd-4030-816f-1a907998b488.svg)


# Query 3: What was the reason for the patient medical check up?

![query3](https://user-images.githubusercontent.com/69920518/206794152-7358930e-11d1-4431-b746-ef3155f68413.svg)

# Query 4: When was the last medical checkup of every patient?

![query4](https://user-images.githubusercontent.com/69920518/206794312-ec694394-a2d9-4ab6-9462-c915f2d2495d.svg)

# Query 5: What is the environmental status of Canada?

![query5](https://user-images.githubusercontent.com/69920518/206813875-61b4ec1b-b12c-4144-a356-d607ac9e88fa.svg)


## What we took from the class?

&nbsp; &nbsp; &nbsp; &nbsp;We cover SQL fundamentals such as how to manage large datasets and analyze real-world data. The course was designed such that we could progress from fundamentals to more advanced SQL topics during the semester. We learned how to use relational databases, which divide data into columns and rows, to store, generate, and retrieve information. We were required to learn some PHP foundations for our final project because it was utilized for website creation. Working on this final project helped us to become more acquainted with both SQL and PHP in order to better comprehend how a website and its data function interact. We would spend more time to better comprehend certain topics next time. For example, because we were all new to PHP, we met a lot of difficulties when learning it. As a result, I believe that having more time to focus on a certain topic will be quite beneficial to us.

## Improvements to the semester project

The project could have been considerably better. I believe the deadline was not on our side; yet, we believe we did an excellent job with the task we completed. Things can only get better from here, or so the hope goes. We believe that the project can be enhanced by making it more dynamic and adding more features to improve how it appears when users visit the website and data.
