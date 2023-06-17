-- https://datalemur.com/questions/duplicate-job-listings
-- get the number of companies that have posted duplicate job listings
WITH duplicates AS (
  SELECT
    company_id
    , title
    , description
    , COUNT(job_id) AS job_count
  FROM job_listings
  GROUP BY company_id, title, description
)

SELECT COUNT(job_count) AS co_w_duplicate_jobs
FROM duplicates
WHERE job_count >= 2
;
