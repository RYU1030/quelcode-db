SELECT 
  U.user_name AS ユーザー名, 
  L.created_at AS 投稿日時, 
  CR.room_name AS チャットルーム名
FROM
  users AS U
JOIN (
SELECT
  created_by, created_at, chat_room_id
FROM
  posts
WHERE
  id IN (
    SELECT
      MAX(posts.id) AS post_id
    FROM
      posts
    LEFT JOIN
      users
    ON
      posts.created_by = users.id
    WHERE 
      posts.is_deleted = 0 AND users.is_deleted = 0
    GROUP BY
      chat_room_id
    )
) AS L
ON 
  U.id = L.created_by
LEFT JOIN
  chat_rooms AS CR
ON
  CR.id = L.chat_room_id
ORDER BY CR.id ASC;