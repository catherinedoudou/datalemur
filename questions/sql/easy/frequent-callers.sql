WITH heavy_callers AS (
  SELECT policy_holder_id
  FROM callers
  GROUP BY 1
  HAVING COUNT(DISTINCT case_id) >= 3
)

SELECT COUNT(*) AS member_count FROM heavy_callers
;
