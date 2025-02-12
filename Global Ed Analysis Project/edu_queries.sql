#Education of countries excluding regions (regions except for "world" don't have a country code)
SELECT * 
FROM education
WHERE  code <> "" AND entity <> 'world';

#Salary of countries
SELECT * 
FROM salary;

SELECT * 
FROM education JOIN salary ON education.entity = salary.country_name;

#Education for all countries and corresponding salaries (for any countries that don't have salary data) (Ivory Coast, Czechia, DRC, and Eswatini may be listed under a different name in the salary table; checking with next query)
SELECT *
FROM education LEFT JOIN salary ON education.entity = salary.country_name
WHERE country_name IS NULL
AND code <> "" AND entity <> 'world';

#Salary for all countries and corresponding salaries (for any countries that have salary data)
## Visually confirmed the following name discrepancies between the two tables:
## education.entity > Cote d'Ivoire , Czechia , Democratic Republic of Congo , Eswatini , North Macedonia , South Korea
## salary.country_name > Cote Divoire , Czech Republic , Congo Democratic Republic , Swaziland , Macedonia , Korea (South)
SELECT *
FROM salary LEFT JOIN education ON education.entity = salary.country_name
WHERE entity IS NULL;

#Updating to the country names that are more widely accepted now (and/or just formatted better)
UPDATE salary
SET country_name = CASE
	WHEN country_name = 'Cote Divoire' THEN 'Cote d\'Ivoire'
    WHEN country_name = 'Czech Republic' THEN 'Czechia'
    WHEN country_name = 'Congo Democratic Republic' THEN 'Democratic Republic of Congo'
    WHEN country_name = 'Swaziland' THEN 'Eswatini'
    WHEN country_name = 'Macedonia' THEN 'North Macedonia'
    WHEN country_name = 'Korea (South)' THEN 'South Korea'
    ELSE country_name
END;

#After running the above query, the only countries in the education table missing salary data are Israel and Kuwait
SELECT *
FROM education LEFT JOIN salary ON education.entity = salary.country_name
WHERE country_name IS NULL
AND code <> "" AND entity <> 'world';

#Now this query gives all data from any countries with both education and salary data
SELECT * 
FROM education JOIN salary ON education.entity = salary.country_name;

#This query returns no results, making it exceedingly likely that every country has data for both 2015 and 2020
#SELECT SUM(year) AS year_check
#FROM education JOIN salary ON education.entity = salary.country_name
#GROUP BY entity
#HAVING year_check <> 4035;

#The following two queries tell us that there are in fact 164 countries (each listed twice)
SELECT `year`, COUNT(entity)
FROM education JOIN salary ON education.entity = salary.country_name
GROUP BY `year`;

SELECT COUNT(*)
FROM education JOIN salary ON education.entity = salary.country_name;

#Column names are becoming a problem... changing
ALTER TABLE education
RENAME COLUMN `Share of population with no formal education, 1820-2020` TO no_formal_ed;

ALTER TABLE education
RENAME COLUMN `Share of population with some formal education, 1820-2020` TO some_formal_ed;

# Cleaning North America
UPDATE salary
SET continent_name = 'North America'
WHERE continent_name = 'Northern America';

# Exporting this to EXCEL as cleaned_edu_sal_correlation.csv
SELECT country_name, continent_name, no_formal_ed, some_formal_ed, median_salary, average_salary, lowest_salary, highest_salary, ROUND(median_salary/some_formal_ed, 5) AS med_sal_over_some_formal
FROM education JOIN salary ON education.entity = salary.country_name
WHERE education.year = 2020
ORDER BY continent_name ASC, country_name ASC;




