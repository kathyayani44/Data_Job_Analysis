/*  Skills required for High paying roles  */

WITH high_paying_jobs AS (
    SELECT	
        job_id,job_title,name AS company_name,salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
	    job_location = 'Anywhere' AND 
        job_title_short = 'Data Analyst' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
)
SELECT 
    high_paying_jobs.*, skills
FROM high_paying_jobs
INNER JOIN skills_job_dim ON high_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
LIMIT 10 ;
/* 
Result : Most demanding skills are sql , python , Tableau ....
*/
