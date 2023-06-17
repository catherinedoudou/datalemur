-- https://datalemur.com/questions/second-day-confirmation
-- did not confirm their sign-up on the first day,
-- but confirmed on the second day.
SELECT em.user_id
FROM emails AS em
LEFT JOIN texts AS t
  ON em.email_id = t.email_id
WHERE t.action_date = em.signup_date + INTERVAL '1 day'
;
