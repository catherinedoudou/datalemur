-- https://datalemur.com/questions/sql-average-post-hiatus-1
--  find the number of days between each user’s 
-- first post of the year and last post of the year -2021
SELECT
  user_id
  , EXTRACT('DAY' FROM MAX(post_date) - MIN(post_date)) AS days_between
FROM posts
GROUP BY user_id, EXTRACT('YEAR' FROM post_date)
HAVING EXTRACT('DAY' FROM MAX(post_date) - MIN(post_date)) > 0
  AND EXTRACT('YEAR' FROM post_date) = '2021'
;
