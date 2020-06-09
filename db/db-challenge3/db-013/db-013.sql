BEGIN;

UPDATE
  users
SET
  updated_at = NOW(), is_deleted = 1
WHERE
  company_tel_number IS NULL AND mobile_number IS NULL;

COMMIT;