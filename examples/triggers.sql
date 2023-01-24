SET @totalComments = 0;

DROP TRIGGER IF EXISTS aft_ins_comment;
CREATE TRIGGER aft_ins_comment AFTER INSERT ON comments
FOR EACH ROW
SET @totalComments = @totalComments + 1;

DROP TRIGGER IF EXISTS aft_del_comment;
CREATE TRIGGER aft_del_comment AFTER DELETE ON comments
FOR EACH ROW
SET @totalComments = @totalComments - 1;

-- --

-- bugged trigger that calls itself

DROP TRIGGER IF EXISTS aft_upd_comment;
CREATE TRIGGER aft_upd_comment AFTER UPDATE ON comments
FOR EACH ROW
UPDATE comments
SET body = 'This comment has been updated'
WHERE id = NEW.id;

-- --