SELECT 
  id, email AS メールアドレス, password AS パスワード, user_name AS ユーザ名,
  self_introduction AS 自己紹介文, mobile_number AS 個人携帯電話番号,
  company_tel_number AS 勤務先電話番号, created_at AS 作成日時,
  updated_at AS 更新日時, is_deleted AS 削除フラグ
FROM 
  users
ORDER BY
  id ASC;