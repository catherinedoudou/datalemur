-- https://datalemur.com/questions/questions/time-spent-snaps
WITH time_spent_by_age_bucket AS (
  SELECT
    ab.age_bucket
    , SUM(a.time_spent) FILTER (WHERE a.activity_type = 'send') AS send_time
    , SUM(a.time_spent) FILTER (WHERE a.activity_type = 'open') AS open_time
  FROM activities a
  INNER JOIN age_breakdown ab
    ON a.user_id = ab.user_id
  GROUP BY 1
)

SELECT
  age_bucket
  , ROUND(100 * SUM(send_time) / SUM(send_time + open_time), 2) AS send_perc
  , ROUND(100 * SUM(open_time) / SUM(send_time + open_time), 2) AS open_perc
FROM time_spent_by_age_bucket
GROUP BY 1
ORDER BY 1
;
