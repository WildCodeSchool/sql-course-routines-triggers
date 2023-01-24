-- --

INSERT INTO users (id, name, email, password)
VALUES (
    1,
    'John Doe',
    'john.doe@example.com',
    'password'
  ),
  (
    2,
    'Jane Doe',
    'jane.doe@example.com',
    'password'
  ),
  (
    3,
    'John Smith',
    'john.smith@example.com',
    'password'
  ),
  (
    4,
    'Jane Smith',
    'jane.smith@example.com',
    'password'
  );
--
INSERT INTO posts (id, title, body, user_id)
VALUES (
    1,
    'First Post',
    'This is the first post.',
    1
  ),
  (
    2,
    'Second Post',
    'This is the second post.',
    2
  );
--
INSERT INTO comments (id, body, user_id, post_id)
VALUES (
    1,
    'This is the first comment.',
    3,
    1
  ),
  (
    2,
    'This is the second comment.',
    4,
    1
  ),
  (
    3,
    'This is the third comment.',
    1,
    2
  ),
  (
    4,
    'This is the fourth comment.',
    2,
    2
  );

-- --
