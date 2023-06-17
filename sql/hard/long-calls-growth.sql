-- https://datalemur.com/questions/long-calls-growth
WITH long_calls_by_year_month AS (
  SELECT
    EXTRACT('YEAR' FROM call_received) AS yr
    , EXTRACT('MONTH' FROM call_received) AS mth
    , COUNT(*) FILTER (WHERE call_duration_secs > 300) AS calls
  FROM callers
  GROUP BY 1, 2
)

SELECT
  yr
  , mth
  , ROUND(
    100.0 * (calls - LAG(calls) OVER w) / LAG(calls) OVER w
    , 1
  ) AS growth_pct
FROM long_calls_by_year_month
WINDOW w AS (ORDER BY yr, mth)
;
