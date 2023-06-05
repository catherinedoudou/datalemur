-- https://datalemur.com/questions/questions/uncategorized-calls-percentage
SELECT
  ROUND(
    100.0
    * COUNT(*) FILTER (WHERE call_category IN ('', 'n/a') OR call_category IS NULL)
    / COUNT(*)
    , 1
  ) AS call_percentage
FROM callers
;
