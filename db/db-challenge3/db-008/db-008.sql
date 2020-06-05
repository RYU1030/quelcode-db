SELECT 
  user_name AS ユーザー名, room_name AS チャットルーム名, 
  SUBSTRING(joined_at, 1, 10) AS 参加日
FROM chat_members AS cm
  LEFT JOIN users AS u ON u.id = cm.user_id
  LEFT JOIN chat_rooms AS cr ON cr.id = cm.chat_room_id
WHERE u.is_deleted = 0 AND cr.is_deleted = 0
ORDER BY joined_at ASC;