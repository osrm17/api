CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS posts (
  id SERIAL PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  content TEXT NOT NULL,
  published BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  user_id INTEGER NOT NULL,
  CONSTRAINT posts_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id)

);

CREATE TABLE IF NOT EXISTS votes (
  post_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  CONSTRAINT votes_pkey PRIMARY KEY (post_id, user_id),

  CONSTRAINT votes_post_id_fkey
    FOREIGN KEY (post_id)
    REFERENCES posts(id)
    ON DELETE CASCADE,

  CONSTRAINT votes_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE
);


