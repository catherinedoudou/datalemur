-- https://datalemur.com/questions/sql-third-transaction
-- CTE with row_number (no QUALIFY in PostgreSQL)
WITH transaction_rns AS (
  SELECT
    user_id
    , spend
    , transaction_date
    , ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date) AS transaction_rn
  FROM "transactions"
)

SELECT
  user_id
  , spend
  , transaction_date
FROM transaction_rns
WHERE transaction_rn = 3
;

-- explode and group by
SELECT
  t.user_id
  , t.spend
  , t.transaction_date
FROM "transactions" t
INNER JOIN "transactions" ex
  ON ex.user_id = t.user_id
  AND ex.transaction_date <= t.transaction_date -- explode
GROUP BY 1, 2, 3
HAVING COUNT(*) = 3
;
