-- https://datalemur.com/questions/questions/matching-skills
SELECT candidate_id
FROM candidates
GROUP BY 1
HAVING COUNT(skill) FILTER (WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')) = 3
ORDER BY 1
;
