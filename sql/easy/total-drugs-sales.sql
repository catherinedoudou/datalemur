-- https://datalemur.com/questions/total-drugs-sales
-- total drug sales for each manufacturer
-- Round your answer to the closest million
-- descending order
SELECT
  manufacturer
  , CONCAT('$', ROUND(SUM(total_sales) / 1000000, 0), ' million') AS sales
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC
;
