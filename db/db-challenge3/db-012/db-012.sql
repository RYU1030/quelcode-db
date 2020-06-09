BEGIN;

UPDATE 
  chat_rooms 
SET
  is_file_sendable = 0, updated_by = 1, updated_at = NOW()
WHERE
  id IN (
    SELECT
      chat_room_id
    FROM
      chat_members
    WHERE
      chat_room_id
    NOT IN (
      SELECT
        chat_room_id
      FROM
        chat_members
      WHERE 
        user_id = 1
    )
  )
AND
  is_deleted = 0;

COMMIT;