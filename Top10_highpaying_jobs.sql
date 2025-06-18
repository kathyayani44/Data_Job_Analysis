/* Top 10 High Paying jobs */
SELECT	
	job_id,job_title,job_location,salary_year_avg,job_posted_date,name as company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
	  job_location = 'Anywhere' AND 
    job_title_short = 'Data Analyst' AND 
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
/*
Result : 
Highest job paying role is Data Analyst of avg salary 650000 by Mantys Company 
*/
