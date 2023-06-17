-- https://datalemur.com/questions/uncategorized-calls-percentage
--find the percentage of calls that cannot be categorised
--Round your answer to 1 decimal
SELECT
  ROUND(100.0 * COUNT(case_id) FILTER (
    WHERE call_category IS NULL OR call_category = 'n/a'
  ) / COUNT(case_id), 1) AS call_percentage
FROM callers
;
