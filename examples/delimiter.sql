DELIMITER $
CREATE PROCEDURE justForTheSnippet()
BEGIN
  SELECT *
  FROM posts;
  SELECT *
  FROM comments;
END$
DELIMITER ;

SELECT * FROM posts;
CALL justForTheSnippet();


-- error:
CREATE PROCEDURE justForTheSnippet()
BEGIN
  SELECT *
  FROM posts;
  SELECT *
  FROM comments;
END;

SELECT * FROM posts;
CALL justForTheSnippet();