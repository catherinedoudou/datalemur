-- https://datalemur.com/questions/tesla-unfinished-parts
-- find out the part and assembly_step for unfinished part
SELECT
  part
  , assembly_step
FROM parts_assembly
WHERE finish_date IS NULL
;
