-- https://datalemur.com/questions/prime-warehouse-storage
WITH capacity_by_item_type AS (
  SELECT
    item_type
    , COUNT(*) AS cnt_items
    , SUM(square_footage) AS sum_area
    , 500000 AS max_area
    , FLOOR(500000 / SUM(square_footage) FILTER (WHERE item_type = 'prime_eligible'))
    * SUM(square_footage) FILTER (WHERE item_type = 'prime_eligible') AS prime_filled_area
  FROM inventory
  GROUP BY 1
)

SELECT
  item_type
  , FLOOR(
    CASE
      WHEN item_type = 'not_prime' THEN max_area - MAX(prime_filled_area) OVER ()
      ELSE max_area
    END
    / sum_area
  ) * cnt_items AS item_count
FROM capacity_by_item_type
ORDER BY 1 DESC
;
