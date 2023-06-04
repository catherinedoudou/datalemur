SELECT
  COUNT(*) FILTER (WHERE device_type IN ('laptop')) AS laptop_views
  , COUNT(*) FILTER (WHERE device_type IN ('tablet', 'phone')) AS mobile_views
FROM viewership
;
