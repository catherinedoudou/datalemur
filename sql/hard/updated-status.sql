-- https://datalemur.com/questions/updated-status
SELECT
  COALESCE(a.user_id, dp.user_id) AS user_id
  , CASE
    WHEN a.user_id IS NULL THEN 'NEW'
    WHEN dp.user_id IS NULL THEN 'CHURN'
    WHEN a."status" = 'CHURN' THEN 'RESURRECT'
    ELSE 'EXISTING'
  END AS new_status
FROM advertiser a
FULL OUTER JOIN daily_pay dp
  ON a.user_id = dp.user_id
ORDER BY 1
;
