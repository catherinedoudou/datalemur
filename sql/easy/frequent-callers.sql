-- https://datalemur.com/questions/frequent-callers
-- how many UHG members made 3 or more calls
WITH member_c AS (
  SELECT
    policy_holder_id
    , COUNT(policy_holder_id) AS call_count
  FROM callers
  GROUP BY policy_holder_id
)

SELECT COUNT(policy_holder_id) AS member_count
FROM member_c
WHERE call_count >= 3
;
