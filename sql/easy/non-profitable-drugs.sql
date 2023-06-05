-- https://datalemur.com/questions/non-profitable-drugs
SELECT
  manufacturer
  , COUNT(*) AS drug_count
  , SUM(ABS(total_sales - cogs)) AS total_loss
FROM pharmacy_sales
WHERE cogs > total_sales
GROUP BY 1
ORDER BY 3 DESC
;
