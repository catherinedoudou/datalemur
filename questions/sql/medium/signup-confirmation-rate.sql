-- https://datalemur.com/questions/questions/signup-confirmation-rate
SELECT ROUND(COUNT(t . *)::DECIMAL / COUNT(e . *), 2)
FROM emails e
LEFT JOIN texts t
  ON t.email_id = e.email_id
  AND t.signup_action = 'Confirmed'
;
