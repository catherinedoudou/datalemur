-- https://datalemur.com/questions/alibaba-compressed-mode
SELECT item_count AS "mode"
FROM items_per_order
WHERE order_occurrences IN (
    SELECT MAX(order_occurrences) AS max_order_occurrence
    FROM items_per_order
  )
ORDER BY 1
;
