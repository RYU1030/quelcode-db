SELECT id, room_name AS ルーム名, chat_overview AS 概要, 
  CASE is_file_sendable
  WHEN 0 THEN '禁止'
  WHEN 1 THEN '許可' END AS ファイル送信許可フラグ, 
  is_private AS ダイレクトチャットフラグ,
  created_at AS 作成日時, created_by AS 作成者ID, updated_at AS 更新日時,
  updated_by AS 更新者ID, is_deleted AS 削除フラグ
FROM chat_rooms
WHERE is_deleted = 0 AND chat_overview LIKE '%ダイレクトチャット'
ORDER BY id;