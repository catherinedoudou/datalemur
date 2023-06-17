-- https://datalemur.com/questions/alibaba-compressed-mean
--  average number of items per orde
SELECT
  ROUND(
    SUM((item_count * order_occurrences))
    / SUM(order_occurrences), 1
  ) AS mean
FROM items_per_order
;
