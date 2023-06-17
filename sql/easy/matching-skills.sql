-- https://datalemur.com/questions/matching-skills
-- Python, Tableau, and PostgreSQL.
-- sort Id by ascd
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(candidate_id) = 3
ORDER BY candidate_id
;
