SELECT id, room_name AS ルーム名, chat_overview AS 概要, 
  CASE file_permission 
  WHEN 0 THEN '許可'
  WHEN 0 THEN '禁止' END AS ファイル送信許可フラグ, 
  private_flag AS ダイレクトチャットフラグ,
  created_at AS 作成日時, created_by AS 作成者ID, updated_at AS 更新日時,
  updated_by AS 更新者ID, delete_flag AS 削除フラグ
FROM chat_rooms
WHERE delete_flag = 0 AND chat_overview LIKE '%ダイレクトチャット'
ORDER BY id;