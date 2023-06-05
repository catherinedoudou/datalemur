-- https://datalemur.com/questions/questions/alibaba-compressed-mean
SELECT
  ROUND(
    SUM(item_count * order_occurrences)::DECIMAL
    / SUM(order_occurrences)::DECIMAL
    , 1
  ) AS mean
FROM items_per_order
;
