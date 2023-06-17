-- https://datalemur.com/questions/non-profitable-drugs
-- identify the manufacturers
--  calculate the total amount of losses incurred.
--  the total losses in absolute value
--  sorted in descending order
SELECT
  manufacturer
  , COUNT(drug) AS drug_count
  , ABS(SUM((cogs - total_sales))) AS total_loss
FROM pharmacy_sales
WHERE cogs > total_sales
GROUP BY manufacturer
ORDER BY total_loss DESC
;
