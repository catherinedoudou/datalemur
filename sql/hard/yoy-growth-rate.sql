-- https://datalemur.com/questions/yoy-growth-rate
WITH spend_by_product_and_year AS (
  SELECT
    EXTRACT('YEAR' FROM transaction_date) AS "year"
    , product_id
    , SUM(spend) AS curr_year_spend
  FROM user_transactions
  GROUP BY 1, 2
)

SELECT
  "year"
  , product_id
  , curr_year_spend
  , LAG(curr_year_spend) OVER w AS prev_year_spend
  , ROUND(100 * ((curr_year_spend - LAG(curr_year_spend) OVER w) / LAG(curr_year_spend) OVER w), 2) AS yoy_rate
FROM spend_by_product_and_year
WINDOW w AS (PARTITION BY product_id ORDER BY "year" ASC)
;
;
