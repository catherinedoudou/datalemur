WITH cat_prod_by_spend_cat_rank AS (
  SELECT
    category
    , product
    , SUM(spend) AS total_spend
    , DENSE_RANK() OVER (PARTITION BY category ORDER BY SUM(spend) DESC) AS cat_spend_rank
  FROM product_spend
  WHERE EXTRACT('YEAR' FROM transaction_date) = 2022
  GROUP BY 1, 2
)

SELECT
  category
  , product
  , total_spend
FROM cat_prod_by_spend_cat_rank
WHERE cat_spend_rank <= 2
;
