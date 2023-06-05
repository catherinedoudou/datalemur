-- https://datalemur.com/questions/questions/completed-trades
-- assumptions: user_id is FK / PK (aka NOT NULL)
SELECT
  u.city
  , COUNT(*) AS total_orders
FROM trades t
INNER JOIN "users" u
  ON u.user_id = t.user_id
  AND t.status = 'Completed'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3
;
