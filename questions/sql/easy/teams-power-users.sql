SELECT
  sender_id
  , COUNT(*) AS messages_count
FROM messages
WHERE sent_date BETWEEN '2022-08-01' AND '2022-08-31'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 2
;
