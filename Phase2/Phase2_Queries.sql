-- homework5-ddl.sql

-- task 1
-- What stage of cancer is this patient in?
-- (skills: select, aggregate)

SELECT
    CONCAT(Patient_first_name, ' ', Patient_last_name) AS "Name",
    Disease_stage,
    Disease_name
FROM
    Patient a 
LEFT JOIN Disease b ON (Patient_ID = Disease_Patient_ID)
WHERE 
    1=1
    AND Disease_name LIKE 'Cancer'
ORDER BY Disease_stage, Disease_name;

-- task 2
-- Write a query to display the cost of the Alzheimer’s treatment?
-- (skills: select, limit)

SELECT 
    Disease_name,
    Treatment_cost
FROM Disease a 
LEFT JOIN Treatment b ON (Disease_ID = Treatment_Disease_ID)
WHERE Disease_name = "Alzheimer";

-- task 3
-- How many people HAVE Cancer?, that is
-- any type of cancer.
-- Write a query to list all the patients that have cancer
-- (skills: select, where)

SELECT 
    Disease_ID as People,
    Disease_name
FROM Disease
WHERE
    Disease_name LIKE 'Cancer';

-- task 4
-- What is the fatality rate of COVID in Mexico?
-- (skills: select, aggregate)

SELECT 
    Region_country_short_name,
    Disease_fatality
FROM Region a 
LEFT JOIN Disease b ON (Disease_ID = Region_Disease_ID)
WHERE Region_country_short_name = 'Mexico';

-- task 5
-- Let's investigate the country_region field.
-- What is the domain of the country_region field? That is,
-- what are the unique values found there?
-- (there are several possible ways to code this in SQL)
-- (skills: select, aggregate, order by)

SELECT  
country_region
FROM COUNTRY
GROUP BY country_region;


-- task 6
-- How many countries are in each region?
-- (skills: select, aggregate, group by, order by)

SELECT 
country_region,
COUNT(country_short_name)
FROM COUNTRY
GROUP BY country_region
ORDER BY 2 DESC;

-- task 7
-- List the country full names and regions for all countries in north america
-- (skills: select, where, order by)

SELECT 
country_full_name,
country_region
FROM COUNTRY
WHERE
1=1
AND country_region = 'North America'
ORDER BY country_region;

-- task 8
-- The World Cup soccer tournament starts November 20.  The host country is Qatar.
-- What region contains Qatar?  List the region, country short name and full name
-- (skills: select, where)

SELECT 
country_region,
country_short_name,
country_full_name
FROM COUNTRY
WHERE
1=1
AND country_short_name = 'Qatar';

-- task 9
-- There are two abbreviation fields in the data country_abbr and country_wb_abbr.
-- List the country code, short name, abbr, wb_abbr and region for all the countries
-- where the abbr and wb_abbr are different.
-- (skills: select, where, order by)

SELECT 
country_code,
country_short_name,
country_abbr,
country_wb_abbr,
country_region
FROM COUNTRY
WHERE
1=1
AND country_abbr != country_wb_abbr
ORDER BY country_abbr, country_wb_abbr;

-- task 10
-- Now, let's investigate the "income category" field.
-- List the income categories and the number of countries in each in 
-- descending order of most countries to least.
-- (skills: select, aggregate, group by, order by)

SELECT 
country_income_category,
COUNT(*) AS Countries
FROM COUNTRY
GROUP BY country_income_category
ORDER BY 2 DESC;

-- task 11
-- mystery task.  Looking at the table from Task 10, write the
-- next obvious query based on the results in the table.
-- At a minimum, your query should put country short name in the first column.
-- you will be scored on the number of records returned and the value(s) 
-- in the first column.

SELECT 
country_short_name,
country_income_category,
country_region
FROM COUNTRY
WHERE
1=1
AND country_income_category = '';

-- task 12
-- OK, this HAS to be an error. Let's make a assumption that the country 
-- in question, because they are oil-rich, are "high income".  
-- Write an update comment to correct the issue.
-- NOTE - if you get this wrong, all subsequent tables will be wrong!

UPDATE COUNTRY
SET country_income_category = 'High income'  
WHERE country_income_category = '';

-- task 13
-- Write a single query that shows the reason for the patients medical checkups 
-- Display first name and last name of the patients and order by medical checkups
-- (skills: select, Left Join, order by)

SELECT 
    CONCAT(Patient_first_name, ' ', Patient_last_name) AS "Name",
    Medical_Check_up_reason
FROM Patient a
LEFT JOIN Medical_Check_up b ON (Patient_ID = Medical_Check_up_Patient_ID)
ORDER BY Medical_Check_up_reason;


-- task 14
-- Examine the result from task 13. It would be really cool to
-- present the results of this table in a 2-D form, with 
-- columns for each income category (high, upper middle, lower middle, low, other)
-- regions down the side, and the pair-wise count inside each cell.
-- Using CASE statements, DO IT!  BE SURE to include the countries without
-- an income category.
-- HINT - your query should return 6 columns: the region name, one
-- column for each of the income categories (e.g., High, Upper middle, etc.)
-- and a column for the row totals.
-- (skills: select, aggregate, group by, nested query)

SELECT
country_region,
SUM(CASE WHEN country_income_category = "High income" THEN country_count ELSE 0 END) AS High,
SUM(CASE WHEN country_income_category = "Upper middle income" THEN country_count ELSE 0 END) AS Upper_Middle,
SUM(CASE WHEN country_income_category = "Lower middle income" THEN country_count ELSE 0 END) AS Lower_Middle,
SUM(CASE WHEN country_income_category = "Low income" THEN country_count ELSE 0 END) AS Low,
SUM(country_count) AS "Row_Total"
FROM COUNTRY
GROUP BY 
country_region
ORDER BY 1,2,3 DESC;


-- task 15
-- Wow! what a cool table!  It is very interesting to see where the money
-- sits around the world.  Using the general approach from Task 14 above
-- and write a query to return the single region with the most lower-income countries.
-- Your query should return 2 columns, the region name and the number of low-income countries
-- PUT THE NUMBER FIRST!
-- (skills: select, aggregate, group by, nested query, order by, limit)

SELECT
count(country_income_category),
country_region
FROM COUNTRY
WHERE
1=1
AND country_income_category = 'Low income'
GROUP BY country_region, country_income_category
ORDER BY country_region DESC 
LIMIT 1;

-- task 16
-- Are you getting the hand of this? Good! We need to take a look at all
-- the countries in the same region and with the same income category as the Marshall Islands.
-- For each country that matches, print their country code, short name, region and 
-- income category, by order of their short name.  As a hint, the
-- country code for the Marshall Islands is MHL
-- (skills: select, where, subquery)

WITH micte AS(
SELECT 
    country_region,
    country_income_category
FROM 
    COUNTRY
WHERE 
    country_short_name = 'Marshall Islands'
)
SELECT 
    country_region,
    country_income_category,
    country_short_name,
    country_code
FROM COUNTRY
WHERE
1=1
AND country_region in (SELECT country_region FROM micte)
AND country_income_category in (SELECT country_income_category FROM micte);


-- task 17
-- OK - let's raise the heat in the kitchen! Review the output from task 13.  You'll see
-- that some of the regions do not contain all of the income levels.  For example,
-- the Europe & Central Asia region does not have any low income countries.
--
-- If I need to compute the average number of countries in each region-income pair,
-- I need to make sure that I include the missing pairs, otherwise my denominator will 
-- be wrong and my average won't be accurate.
--
-- CHALLENGE - using a SINGLE SQL statement, write a table that contains every
-- combination of region and income category (including the missing '') value!
--
-- THEN add a WHERE clause to only show the values that were missing from the original pairings!
--
-- HINT - there should be AT MOST [# of regions]x[# of income cats] = 28 rows in your final table!
-- Review that Task 13 found all the non-zero pairs, and the answer is 22.  SO - this table result should have 6 rows!
-- (skills: select, where, subqueries, joins)

WITH Region_cte AS (
SELECT DISTINCT country_region AS cte_region 
FROM COUNTRY),
Income_cte AS ( SELECT DISTINCT country_income_category AS cte_income_category FROM COUNTRY),
Data_cte AS(
    SELECT
    country_region,
    country_income_category,
    SUM(country_count) AS cte_count 
    FROM COUNTRY
    GROUP BY country_region, country_income_category)

SELECT
    cte_region,
    cte_income_category,
    cte_count
FROM (Region_cte, Income_cte)
    LEFT JOIN Data_cte ON (cte_region = country_region AND cte_income_category = country_income_category)
    WHERE cte_count IS NULL
ORDER BY 1,2;



-- task 18
-- Hot enough, yet?  Let's go for ghost-pepper HOT!  Now let's build some
-- percentage tables.  For example, across the entire sample, what
-- is the percentage of total countries in each income category?
-- As a first step, build off the result from task 17 and create a table with
-- six columns (region, income cat, country count, sum of countries in region, sum of countries by income and total sum countries)
-- actually calculating percentages and print out a table will be a slam dunk after this!
-- (skills: select, where, subqueries, joins, aggregate functions)


WITH Percentage_cte AS (SELECT DISTINCT country_region AS cte_region FROM COUNTRY),
Income_cte AS ( SELECT DISTINCT country_income_category AS cte_income_category FROM COUNTRY),
Data_cte AS(
    SELECT
    country_region,
    country_income_category,
    SUM(country_count) AS cte_count 
    FROM COUNTRY
    GROUP BY country_region, country_income_category),
Country_sum AS (SELECT country_region, COUNT(country_count) AS sum_region FROM COUNTRY
GROUP BY country_region),
Income_sum AS (SELECT country_region, COUNT(country_income_category) AS sum_income 
FROM COUNTRY GROUP BY country_region),
Total_sum_country AS (SELECT country_region, SUM(country_count)  AS total_sum 
FROM COUNTRY GROUP BY country_region)

SELECT
    cte_region,
    cte_income_category,
    CASE WHEN cte_count IS NOT NULL THEN cte_count ELSE 0 END AS cte_count,
    sum_region,
    sum_income,
    total_sum
FROM (Percentage_cte, Income_cte)
    LEFT JOIN Data_cte ON (cte_region = country_region AND cte_income_category = country_income_category)
    LEFT JOIN Country_sum a ON (cte_region = a.country_region)
    LEFT JOIN Income_sum b ON (cte_region = b.country_region)
    LEFT JOIN Total_sum_country c ON (cte_region = c.country_region)
ORDER BY 1,2,3,4,5,6;

-- task 19 
-- SLAM DUNK TIME!  Using the resulting table CTEs from Task 18, print out a table listing
-- the number, totals and percentage of countries by region.


WITH SLAM_DUNK_TIME AS (SELECT DISTINCT country_region AS cte_region FROM COUNTRY),
Number_cte AS ( SELECT country_region, SUM(country_count) AS country_number 
FROM COUNTRY GROUP BY country_region),
Percentage_country AS(
    SELECT
    country_region,
    country_income_category,
    SUM(country_count) / COUNT(country_short_name) AS cte_percentage
    FROM COUNTRY
    GROUP BY country_region, country_income_category),
Total_country_region AS (SELECT country_region, SUM(country_count)  AS total_sum 
FROM COUNTRY GROUP BY country_region)

SELECT
    cte_region,
    country_number,
    cte_percentage,
    total_sum
FROM (SLAM_DUNK_TIME)
    LEFT JOIN Percentage_country ON (cte_region = country_region)
    LEFT JOIN Number_cte a ON (cte_region = a.country_region) 
    LEFT JOIN Total_country_region c ON (cte_region = c.country_region)
GROUP BY cte_region,country_number,cte_percentage,total_sum
ORDER BY 1,2,3,4;

-- task 20
-- SLAM DUNK TIME!  Using the resulting table CTEs from Task 18, print out a table listing
-- the number, totals and percentage of countries by income category

WITH ANOTHER_SLAM_DUNK_TIME AS (SELECT DISTINCT country_income_category AS cte_region FROM COUNTRY),
Number_cte AS ( SELECT country_income_category, SUM(country_count) AS country_number 
FROM COUNTRY GROUP BY country_income_category),
Percentage_country AS(
    SELECT
    country_region,
    country_income_category,
    SUM(country_count) / COUNT(country_short_name) AS cte_percentage
    FROM COUNTRY
    GROUP BY country_region, country_income_category),
Total_country_region AS (SELECT country_income_category, SUM(country_count)  AS total_sum 
FROM COUNTRY GROUP BY country_income_category)

SELECT
    cte_region,
    country_number,
    cte_percentage,
    total_sum
FROM (ANOTHER_SLAM_DUNK_TIME)
    LEFT JOIN Percentage_country ON (cte_region = country_income_category)
    LEFT JOIN Number_cte a ON (cte_region = a.country_income_category) 
    LEFT JOIN Total_country_region c ON (cte_region = c.country_income_category)
GROUP BY cte_region,country_number,cte_percentage,total_sum
ORDER BY 1,2,3,4;