-- https://datalemur.com/questions/median-search-freq

WITH
-- extra_test_cases AS (
--   SELECT 
--       searches
--       , num_users
--   FROM (VALUES 
--     -- Median = 1.0
--     -- (1, 5)

--     -- Median = 2.0    
--     -- (1, 3)
--     -- , (2, 7)

--     -- Median = 3.0    
--     (1, 2)
--     , (3, 5)
--     , (6, 6)
--   ) AS t(searches, num_users)
-- ),
calculate_median AS (
  SELECT
    searches
    , num_users
    , SUM(num_users) OVER (ORDER BY searches) AS cumulative_num
    , SUM(num_users) OVER () AS total_num
  FROM search_frequencyx
)

SELECT ROUND(AVG(searches), 1) AS "median"
FROM calculate_median
WHERE total_num / 2.0 BETWEEN cumulative_num - num_users AND cumulative_num
;
