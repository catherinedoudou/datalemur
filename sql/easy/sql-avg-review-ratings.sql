-- https://datalemur.com/questions/sql-avg-review-ratings
-- the average star rating for each product
-- grouped by month.
-- two decimal places
-- Sort the output first by month and then by product ID.
SELECT
  EXTRACT('MONTH' FROM submit_date) AS mth
  , product_id AS product
  , ROUND(AVG(stars), 2) AS avg_stars
FROM reviews
GROUP BY product, mth
ORDER BY mth, product
;
