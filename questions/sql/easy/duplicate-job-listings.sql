WITH dupes AS (
  SELECT
    company_id
    , title
    , description
  FROM job_listings
  GROUP BY 1, 2, 3
  HAVING COUNT(*) > 1
)

SELECT COUNT(*) AS co_w_duplicate_jobs
FROM dupes
;
