-- https://datalemur.com/questions/questions/sql-average-post-hiatus-1
SELECT
  user_id
  , EXTRACT('DAY' FROM MAX(post_date) - MIN(post_date)) AS days_between
FROM posts
WHERE EXTRACT('YEAR' FROM post_date) = 2021
GROUP BY 1
HAVING COUNT(*) > 1
;
