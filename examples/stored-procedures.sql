DROP PROCEDURE IF EXISTS getPosts;
DELIMITER $
CREATE PROCEDURE getPosts()
BEGIN
  SELECT
    p.title AS postTitle,
    p.body AS postBody,
  FROM posts p;
END$
DELIMITER ;

CALL getPosts();

DROP PROCEDURE IF EXISTS getPostById;
DELIMITER $
CREATE PROCEDURE getPostById(IN pId INT)
BEGIN
  SELECT *
  FROM posts p
  WHERE p.id = pId;
END$
DELIMITER ;

CALL getPostById(1); -- -> 1 row
CALL getPostById(2); -- -> 1 row

DROP PROCEDURE IF EXISTS getPostsCount;
DELIMITER $
CREATE PROCEDURE getPostsCount(OUT pCount INT)
BEGIN
  SELECT count(p.id) INTO pCount
  FROM posts p;
END$
DELIMITER ;

SET @count = 0; -- -> 0
CALL getPostsCount(@count);
SELECT @count; -- -> 2

DROP PROCEDURE IF EXISTS incrementTotal;
DELIMITER $
CREATE PROCEDURE incrementTotal(
  INOUT valueToIncrement INT,
  IN increment INT
)
BEGIN
  SET valueToIncrement = valueToIncrement + increment;
END$
DELIMITER ;

SET @total = 0; -- -> 0
CALL incrementTotal(@total, 1);
SELECT @total; -- -> 1
CALL incrementTotal(@total, 1);
SELECT @total; -- -> 2
CALL incrementTotal(@total, 10);
SELECT @total; -- -> 12
