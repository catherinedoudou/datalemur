-- https://datalemur.com/questions/patient-call-history
WITH policy_holder_prev_call_info AS (
  SELECT
    policy_holder_id
    , EXTRACT('DAY' FROM call_received - LAG(call_received) OVER w) AS days_since_last_call
  FROM callers
  WINDOW w AS (PARTITION BY policy_holder_id ORDER BY call_received ASC)
)

SELECT COUNT(DISTINCT policy_holder_id) AS patient_count
FROM policy_holder_prev_call_info
WHERE days_since_last_call < 7
;
