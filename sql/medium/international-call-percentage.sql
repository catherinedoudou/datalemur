-- https://datalemur.com/questions/international-call-percentage
SELECT
  ROUND(
    100.0
    * COUNT(*) FILTER (WHERE ci.country_id != ri.country_id)
    / COUNT(*)
    , 1
  ) AS international_calls_pct
FROM phone_calls c
INNER JOIN phone_info ci
  ON ci.caller_id = c.caller_id
INNER JOIN phone_info ri
  ON ri.caller_id = c.receiver_id
;
