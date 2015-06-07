INSERT INTO users
  (first_name, last_name, username, password, created_at, updated_at)
VALUES
  ('Orlando', 'Arana', 'teo', 'password', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('Jaden', 'Carver', 'jade', 'password', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('Dennis', 'Liaw', 'den',   'password', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
  ;

INSERT INTO posts
  (user_id, title, content, created_at, updated_at)
VALUES
  (1, 'Hello!','stuff in hello', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (2, 'POST 2','post 2 contents', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (3, 'VIERNES','post 3 words', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
