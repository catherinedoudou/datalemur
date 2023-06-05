-- https://datalemur.com/questions/questions/sql-page-with-no-likes
-- not exists
SELECT page_id
FROM pages p
WHERE NOT EXISTS (
    SELECT pl.page_id FROM page_likes pl WHERE pl.page_id = p.page_id
  )
;

-- left anti join
SELECT p.page_id
FROM pages p
LEFT JOIN page_likes pl
  ON p.page_id = pl.page_id
WHERE pl.page_id IS NULL
ORDER BY p.page_id ASC
;

-- except
SELECT page_id FROM pages
EXCEPT
SELECT page_id FROM page_likes
ORDER BY page_id
;
