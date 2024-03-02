--How many universities in each country? Display the country name and number of universities in a column named "Number of Universities". Display results in descending order based on the number of universities.
SELECT c.country_name, COUNT(u.id) AS `Number of Universities`
FROM universities.country c, universities.university u 
WHERE u.country_id = c.id 
GROUP BY c.id
ORDER BY `Number of Universities` DESC;

--List all of the current universities in the database. List the university name and country
SELECT u.university_name, c.country_name
FROM universities.university u, universities.country c
WHERE c.id = u.country_id;


--Show the average university student enrollment for each country in the database in 2015. Display the country and average enrollment in a column named "Average enrollment". Round to 0 decimal places and order by the average number of students.
SELECT c.country_name, ROUND(AVG(uy.num_students), 0) AS `Average enrollment`
FROM universities.country c, universities.university_year uy, universities.university u
WHERE u.country_id = c.id AND uy.university_id = u.id AND uy.year = 2015
GROUP BY c.id
ORDER BY `Average enrollment` DESC;

--How many ranking criteria does each ranking system have? Display the ranking system name and number of criteria in a column named "Total Criteria". Display in descending order by total criteria.
--This one I am pretty sure is from a previous year, because we do not have a database with this info I do not believe

--Show the average score for each ranking criteria in the year 2014. Display the system name, criteria name and average score in a column named average score. Round the average scores to 2 decimal places. Display results in aescending order by ranking system name. 
SELECT ranking_criteria_id, ROUND(AVG(score), 2) AS `Average score`
FROM universities.university_ranking_year
WHERE year = 2014 
GROUP BY ranking_criteria_id
ORDER BY ranking_criteria_id ASC;

--Show the top 25 universities with the highest alumni employment rank in 2015. Display in Descending order
--This one I am pretty sure is from a previous year, because we do not have a database with this info I do not believe

--Show the number of international students at each United States universities in 2013. Show the University name and the number of students in a column called "Total Internalional Students". Display in descending order by total students.
SELECT u.university_name, ROUND(uy.num_students * (uy.pct_international_students * 0.01), 0) AS `Total International Students`
FROM universities.university u, universities.university_year uy 
WHERE u.country_id = "73" AND uy.university_id = u.id AND uy.year = 2013
ORDER BY `Total International Students` DESC;

--Show the number of students in each country in 2016. Display the contry name and number of students in a column called "Total Students" ordered by the number of students in descending order.
SELECT c.country_name, SUM(uy.num_students) AS `Total Students`
FROM universities.country c, universities.university_year uy, universities.university u
WHERE uy.year = "2016" AND uy.university_id = u.id AND u.country_id = c.id
GROUP BY c.id
ORDER BY `Total Students` DESC;
