SELECT *
FROM data_analyst_jobs


--Q1.) How many row are in the data_analyst_jobs table?

SELECT count(*)
FROM data_analyst_jobs

--answer 1: 1793 rows 


--Q2.) Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs
LIMIT 10

--answer 2: ExxonMobil


--Q3A.) How many postings are in Tennessee? Q3B.) How many are there in either Tennessee or Kentucky?

SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location='TN'

--answer 3A: 21 postings in TN

SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location='TN'
OR location='KY'

--answer 3B: 27 postings in either TN or KY


--Q4.) How many postings in Tennessee have a star rating above 4?

SELECT location, star_rating
FROM data_analyst_jobs
WHERE location IN ('TN')
AND star_rating > 4

--answer 4.) 3 postings in TN above 4 star rating


--Q5.) How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count
BETWEEN 500 AND 1000

--answer 5.) 151 postings have review count between 500 and 1000


--Q6.)Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?

SELECT AVG(star_rating) AS avg_rating, location AS state
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC

--answer 6.) NE


--Q7.)Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs

--answer 7: 881 unique job titles


--Q8.) How many unique job titles are there for California companies?

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE location = 'CA'

--answer 8: 230 unieuq job titles for CA




SELECT *
FROM data_analyst_jobs





--Q9.) Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000 
AND company IS NOT NULL
GROUP BY company

--answer 9: 40 companies 


--Q10.) Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000
AND company IS NOT NULL
GROUP BY company
ORDER BY AVG(star_rating) DESC;

--answer 10: six-way tie


--Q11.) Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?

SELECT DISTINCT(title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%'

--answer: 774 job titles containing analyst


--Q12.) How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%'
AND title NOT ILIKE '%Analytics%'

--answer12: 4 jobs without Analyst or Analytics. All the 4 wordsd have Tableau in common.


SELECT *
FROM data_analyst_jobs

--BONUS.) You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.

--Disregard any postings where the domain is NULL.
--Order your results so that the domain with the greatest number of hard to fill jobs is at the top.
--Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?

SELECT COUNT(title),domain
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%'
AND domain IS NOT NULL
AND days_since_posting > 21
GROUP BY domain
ORDER BY COUNT(title) DESC
LIMIT 4;

--answer bonus: Top 4 - Internt and Software, Banks and Financial Services, Consulting and Business Services, and Health Care. 
--answer bonus: 232 jobs been posted for more than 3 weeks of the top 4 domains. 