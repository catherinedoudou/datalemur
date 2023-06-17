-- https://datalemur.com/questions/teams-power-users
-- top2 users sent most messages
-- august 2022
-- desc order count of message
SELECT
  sender_id
  , COUNT(message_id) AS message_count
FROM messages
WHERE sent_date BETWEEN '08/01/2022' AND '08/31/2022'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2
;
