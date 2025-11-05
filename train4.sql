use fymca;
-- DELIMITER $$
-- DROP TRIGGER IF EXISTS check_train_time;
-- CREATE TRIGGER check_train_time
-- BEFORE INSERT ON  train
-- FOR EACH ROW
-- BEGIN
-- IF NEW.arrival_time > NEW.depart_time THEN
--   SIGNAL SQLSTATE'45000'
--   SET MESSAGE_TEXT = "ERROR : Arrival tIme must be less than train departure time";
-- END IF;
-- END $$
-- DELIMITER ;
-- -- DESC train;
-- INSERT INTO train VALUES(116,'Rajdhani','05:00:00','06:00:00','Delhi','Mumbai',10,72);

USE fymca;

DELIMITER $$

DROP TRIGGER IF EXISTS before_update_status;

CREATE TRIGGER before_update_status
BEFORE UPDATE ON ticket
FOR EACH ROW
BEGIN
    IF OLD.status = 'c' AND NEW.status = 'w' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERROR: Cannot change status from confirmed to waiting';
    END IF;
END $$

DELIMITER ;

UPDATE ticket
SET status = 'w'
WHERE ticket_no = 1001;