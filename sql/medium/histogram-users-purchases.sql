-- https://datalemur.com/questions/questions/histogram-users-purchases
WITH user_last_transaction AS (
  SELECT
    user_id
    , MAX(transaction_date) AS transaction_date
  FROM user_transactions
  GROUP BY 1
)

SELECT
  ut.transaction_date
  , ut.user_id
  , COUNT(ut.product_id) AS purchase_count
FROM user_transactions ut
INNER JOIN user_last_transaction filt
  ON filt.user_id = ut.user_id
  AND filt.transaction_date = ut.transaction_date
GROUP BY 1, 2
ORDER BY 1
;
