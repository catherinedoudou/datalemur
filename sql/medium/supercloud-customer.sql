-- https://datalemur.com/questions/questions/supercloud-customer
SELECT cc.customer_id
FROM customer_contracts cc
LEFT JOIN products p
  ON p.product_id = cc.product_id
GROUP BY 1
HAVING COUNT(DISTINCT p.product_category) = (SELECT COUNT(DISTINCT product_category) AS cnt FROM products)
;
