-- https://datalemur.com/questions/user-retention
-- This answer works for the specified data, but is not a general solution.
SELECT
  EXTRACT('MONTH' FROM event_date) + 1 AS "month"
  , COUNT(DISTINCT user_id) AS monthly_active_users
FROM user_actions
WHERE DATE_TRUNC('MONTH', event_date) = '2022-06-01'::TIMESTAMP
GROUP BY 1
;
