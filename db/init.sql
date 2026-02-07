CREATE TABLE IF NOT EXISTS posts (
  id SERIAL PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  content TEXT NOT NULL,
  published BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

INSERT INTO posts (title, content, published)
VALUES
  ('First post', 'Welcome to the blog', TRUE),
  ('Second post', 'Another example post', TRUE),
  ('Draft post', 'Work in progress', FALSE);
