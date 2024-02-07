SELECT *
FROM data_analyst_jobs


--Q1.) How many row are in the data_analyst_jobs table?

SELECT count(*)
FROM data_analyst_jobs

--answer: 1793 rows 


--Q2.) Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs
LIMIT 10

--answer: ExxonMobil


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

--answer 4.) 3 postins in TN above 4 star rating


--Q5.) How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count
BETWEEN 500 AND 1000

--answer 5.) 151 postings have review count between 500 and 1000


--Q6.)Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?

SELECT company, AVG(star_rating) AS avg_rating, location AS state
FROM data_analyst_jobs
GROUP BY company, state
ORDER BY avg_rating DESC

--answer 6.) TN