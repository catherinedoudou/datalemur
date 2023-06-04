WITH user_tweet_cnt AS (
  SELECT
    user_id
    , COUNT(*) AS tweet_bucket
  FROM tweets
  WHERE EXTRACT('YEAR' FROM tweet_date) = 2022
  GROUP BY 1
)

SELECT
  tweet_bucket
  , COUNT(*) AS users_num
FROM user_tweet_cnt
GROUP BY 1
ORDER BY 1
;
