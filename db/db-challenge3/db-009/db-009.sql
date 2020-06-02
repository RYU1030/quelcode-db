SELECT 
  COUNT(p.id) AS 投稿数, cr.room_name AS チャットルーム名
FROM posts AS p 
  LEFT JOIN chat_rooms AS cr ON p.chat_room_id = cr.id
  LEFT JOIN users AS u ON p.created_by = u.id
  WHERE u.delete_flag = 0 AND p.delete_flag = 0
  GROUP BY p.chat_room_id
  ORDER BY COUNT(p.id) DESC;