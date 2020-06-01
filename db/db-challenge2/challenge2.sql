CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL,
  self_introduction VARCHAR(100),
  mobile_number CHAR(13),
  company_tel CHAR(12),
  created_at DATETIME NOT NULL,
  created_by INTEGER NOT NULL,
  updated_at DATETIME NOT NULL,
  updated_by INTEGER NOT NULL,
  delete_flag INTEGER DEFAULT 0 NOT NULL
);

CREATE TABLE chat_members (
  user_id INTEGER REFERENCES users (id),
  chat_room_id INTEGER REFERENCES chat_room (id),
  joined_at DATETIME NOT NULL
);

CREATE TABLE chat_room (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  room_name VARCHAR(100) NOT NULL,
  chat_overview VARCHAR(1000),
  file_permission INTEGER DEFAULT 0 NOT NULL,
  private_flag INTEGER DEFAULT 0 NOT NULL,
  created_at DATETIME NOT NULL,
  created_by INTEGER REFERENCES users (id),
  updated_at DATETIME NOT NULL,
  updated_by INTEGER REFERENCES users (id),
  delete_flag INTEGER DEFAULT 0 NOT NULL
);

CREATE TABLE posts (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  chat_room_id INTEGER REFERENCES chat_room (id),
  contents VARCHAR(1000) NOT NULL,
  file_name VARCHAR(100),
  created_at DATETIME NOT NULL,
  created_by INTEGER REFERENCES users (id),
  updated_at DATETIME NOT NULL,
  updated_by INTEGER REFERENCES users (id),
  delete_flag INTEGER DEFAULT 0 NOT NULL
);

CREATE TABLE task (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  chat_room_id INTEGER REFERENCES chat_room (id),
  task_detail VARCHAR(1000) NOT NULL,
  assigned_to INTEGER NOT NULL REFERENCES users (id),
  due_by DATETIME,
  complete_flag INTEGER DEFAULT 0 NOT NULL,
  created_at DATETIME NOT NULL,
  created_by INTEGER REFERENCES users (id),
  updated_at DATETIME NOT NULL,
  updated_by INTEGER REFERENCES users (id),
  delete_flag INTEGER DEFAULT 0 NOT NULL
);