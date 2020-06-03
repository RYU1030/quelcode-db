CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  user_name VARCHAR(100) NOT NULL,
  self_introduction VARCHAR(1000),
  mobile_number VARCHAR(13),
  company_tel_number VARCHAR(13),
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  is_deleted TINYINT(1) DEFAULT 0 NOT NULL
);

CREATE TABLE chat_members (
  user_id INTEGER REFERENCES users (id),
  chat_room_id INTEGER REFERENCES chat_rooms (id),
  joined_at DATETIME NOT NULL,
  PRIMARY KEY (user_id, chat_room_id)
);

CREATE TABLE chat_rooms (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  room_name VARCHAR(100) NOT NULL,
  chat_overview VARCHAR(1000),
  is_file_sendable TINYINT(1) DEFAULT 1 NOT NULL,
  is_private TINYINT(1) DEFAULT 0 NOT NULL,
  created_at DATETIME NOT NULL,
  created_by INTEGER NOT NULL REFERENCES users (id),
  updated_at DATETIME NOT NULL,
  updated_by INTEGER NOT NULL REFERENCES users (id),
  is_deleted TINYINT(1) DEFAULT 0 NOT NULL
);

CREATE TABLE posts (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  chat_room_id INTEGER NOT NULL REFERENCES chat_rooms (id),
  contents VARCHAR(1000) NOT NULL,
  file_name VARCHAR(100),
  created_at DATETIME NOT NULL,
  created_by INTEGER NOT NULL REFERENCES users (id),
  updated_at DATETIME NOT NULL,
  updated_by INTEGER NOT NULL REFERENCES users (id),
  is_deleted TINYINT(1) DEFAULT 0 NOT NULL
);

CREATE TABLE tasks (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  chat_room_id INTEGER NOT NULL REFERENCES chat_rooms (id),
  task_detail VARCHAR(1000) NOT NULL,
  assigned_to INTEGER NOT NULL REFERENCES users (id),
  due_by DATETIME,
  is_complete TINYINT(1) DEFAULT 0 NOT NULL,
  created_at DATETIME NOT NULL,
  created_by INTEGER NOT NULL REFERENCES users (id),
  updated_at DATETIME NOT NULL,
  updated_by INTEGER NOT NULL REFERENCES users (id),
  is_deleted TINYINT(1) DEFAULT 0 NOT NULL
);