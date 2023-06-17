-- https://datalemur.com/questions/completed-trades
--  top three cities 
-- highest number of completed trade orders
-- descending order.
-- 
SELECT
  u.city
  , COUNT(t.order_id) AS total_orders
FROM trades t
LEFT JOIN users u
  ON t.user_id = u.user_id
WHERE t.status = 'Completed'
GROUP BY u.city
ORDER BY total_orders DESC
LIMIT 3
;
