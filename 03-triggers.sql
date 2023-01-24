-- -- 

-- ON INSERT triggers

DROP TRIGGER IF EXISTS aft_ins_comment_upd_posts;
DELIMITER $
CREATE TRIGGER aft_ins_comment_upd_posts AFTER INSERT ON comments
FOR EACH ROW
BEGIN
  UPDATE posts
  SET posts.nb_comments = posts.nb_comments + 1
  WHERE posts.id = NEW.post_id;
END$
DELIMITER ;

DROP TRIGGER IF EXISTS aft_ins_comment_upd_users;
DELIMITER $
CREATE TRIGGER aft_ins_comment_upd_users AFTER INSERT ON comments
FOR EACH ROW FOLLOWS aft_ins_comment_upd_posts
BEGIN
  UPDATE users
  SET users.nb_comments = users.nb_comments + 1
  WHERE users.id = NEW.user_id;
END$
DELIMITER ;

DROP TRIGGER IF EXISTS aft_ins_post_upd_users;
DELIMITER $
CREATE TRIGGER aft_ins_post_upd_users AFTER INSERT ON posts
FOR EACH ROW
BEGIN
  UPDATE users
  SET users.nb_posts = users.nb_posts + 1
  WHERE users.id = NEW.user_id;
END$
DELIMITER ;

-- ON DELETE triggers

DROP TRIGGER IF EXISTS aft_del_comment_upd_posts;
DELIMITER $
CREATE TRIGGER aft_del_comment_upd_posts AFTER DELETE ON comments
FOR EACH ROW
BEGIN
  UPDATE posts
  SET posts.nb_comments = posts.nb_comments - 1
  WHERE posts.id = OLD.post_id;
END$
DELIMITER ;

DROP TRIGGER IF EXISTS aft_del_comment_upd_users;
DELIMITER $
CREATE TRIGGER aft_del_comment_upd_users AFTER DELETE ON comments
FOR EACH ROW FOLLOWS aft_del_comment_upd_posts
BEGIN
  UPDATE users
  SET users.nb_comments = users.nb_comments - 1
  WHERE users.id = OLD.user_id;
END$
DELIMITER ;

DROP TRIGGER IF EXISTS aft_del_post_upd_users;
DELIMITER $
CREATE TRIGGER aft_del_post_upd_users AFTER DELETE ON posts
FOR EACH ROW
BEGIN
  UPDATE users
  SET users.nb_posts = users.nb_posts - 1
  WHERE users.id = OLD.user_id;
END$
DELIMITER ;

-- advanced trigger

DROP TRIGGER IF EXISTS bef_ins_post;
DELIMITER $
CREATE TRIGGER bef_ins_post BEFORE INSERT ON posts
FOR EACH ROW
BEGIN
  IF getPostsCount(NEW.user_id) >= 5 THEN -- we could imagine another func that fetch the current app max posts settings
    SET @text = CONCAT(
      'Too many posts for user "',
      getUserName(NEW.user_id),
      '" (id:',
      NEW.user_id,
      ')'
    );
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @text;
  END IF;
END$
DELIMITER ;
-- --
