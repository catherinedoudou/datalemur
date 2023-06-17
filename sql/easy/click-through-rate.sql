-- https://datalemur.com/questions/click-through-rate
--  click-through rate (CTR) for the app in 2022
-- 2 decimal places
-- 100.0 * Number of clicks / Number of impressions
-- multiply the CTR by 100.0, not 100.
SELECT
  app_id
  , ROUND(
    100.0
    * COUNT(*) FILTER (WHERE event_type = 'click')
    / COUNT(*) FILTER (WHERE event_type = 'impression')
    , 2
  ) AS ctr
FROM events
WHERE EXTRACT('YEAR' FROM timestamp) = 2022
GROUP BY app_id
;
