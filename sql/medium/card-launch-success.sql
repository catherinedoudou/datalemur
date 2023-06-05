-- https://datalemur.com/questions/questions/card-launch-success
WITH card_launch_date AS (
  SELECT
    card_name
    , MIN(MAKE_DATE(issue_year, issue_month, 1)) AS launch_date
  FROM monthly_cards_issued
  GROUP BY 1

)

SELECT
  c.card_name
  , c.issued_amount
FROM monthly_cards_issued c
INNER JOIN card_launch_date filt
  ON filt.card_name = c.card_name
  AND filt.launch_date = MAKE_DATE(c.issue_year, c.issue_month, 1)
ORDER BY 2 DESC
;
