-- https://datalemur.com/questions/total-drugs-sales
SELECT
  manufacturer
  , '$' || ROUND(SUM(total_sales) / 1000000, 0) || ' million' AS sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC
;
