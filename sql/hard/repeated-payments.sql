-- https://datalemur.com/questions/repeated-payments
WITH prev_transactions AS (
  SELECT transaction_timestamp - LAG(transaction_timestamp) OVER (PARTITION BY merchant_id, credit_card_id, amount ORDER BY transaction_timestamp) AS interval_diff
  FROM "transactions"
)

SELECT COUNT(*) AS payment_count
FROM prev_transactions
WHERE interval_diff <= INTERVAL '10 MINUTES'
;
