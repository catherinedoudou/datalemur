-- https://datalemur.com/questions/questions/laptop-mobile-viewership
SELECT
  COUNT(*) FILTER (WHERE device_type IN ('laptop')) AS laptop_views
  , COUNT(*) FILTER (WHERE device_type IN ('tablet', 'phone')) AS mobile_views
FROM viewership
;
