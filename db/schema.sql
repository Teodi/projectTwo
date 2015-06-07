DROP TABLE IF EXISTS users, posts;

CREATE TABLE users(
  id         SERIAL    PRIMARY KEY,
  first_name VARCHAR   NOT NULL,
  last_name  VARCHAR   NOT NULL,
  username   VARCHAR   NOT NULL,
  password   VARCHAR   NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE TABLE posts(
  id          SERIAL    PRIMARY   KEY,
  user_id     INTEGER   NOT NULL  REFERENCES users(id),
  title       VARCHAR   NOT NULL,
  content     VARCHAR   NOT NULL,
  created_at  TIMESTAMP NOT NULL,
  updated_at  TIMESTAMP NOT NULL
);
