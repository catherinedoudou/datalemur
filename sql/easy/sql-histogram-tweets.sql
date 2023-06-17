-- https://datalemur.com/questions/sql-histogram-tweets
-- group the users by the number of tweets they posted in 2022 
WITH tweet_hist AS (
  SELECT
    user_id
    , COUNT(*) AS tweet_bucket
  FROM tweets
  WHERE tweet_date BETWEEN '01/01/2022'::DATE AND '12/31/2022'::DATE
  GROUP BY user_id
)

SELECT
  tweet_bucket
  , COUNT(*) AS users_num
FROM tweet_hist
GROUP BY user_id
;
