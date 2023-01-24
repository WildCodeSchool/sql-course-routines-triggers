-- --

DROP FUNCTION IF EXISTS getPostsCount;
DELIMITER $
CREATE FUNCTION getPostsCount(user_id INT)
RETURNS INT
READS SQL DATA
BEGIN
  DECLARE postCount INT;
  SELECT u.nb_posts INTO postCount
  FROM users u
  WHERE u.id = user_id;
  RETURN postCount;
END$
DELIMITER ;

DROP FUNCTION IF EXISTS getUserName;
DELIMITER $
CREATE FUNCTION getUserName(user_id INT)
RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
  DECLARE username VARCHAR(255);
  SELECT u.name INTO username
  FROM users u
  WHERE u.id = user_id;
  RETURN username;
END$
DELIMITER ;

-- --
