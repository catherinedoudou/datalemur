-- https://datalemur.com/questions/second-day-confirmation
SELECT e.user_id
FROM emails e
INNER JOIN texts t
  ON t.email_id = e.email_id
  AND t.action_date::DATE = e.signup_date::DATE + INTERVAL '1 day'
;
