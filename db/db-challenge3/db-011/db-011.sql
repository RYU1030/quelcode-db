BEGIN;

UPDATE
  tasks
SET 
  is_complete = 1, updated_at = NOW(), created_by = 1
WHERE
  created_at BETWEEN '2020/4/26 09:00' AND '2020/4/26 11:30'
AND
  is_deleted = 0;

COMMIT;