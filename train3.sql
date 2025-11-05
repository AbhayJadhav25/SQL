use fymca;
-- DROP PROCEDURE IF EXISTS not_confirm;
-- DELIMITER $$
-- CREATE PROCEDURE not_confirm()
-- BEGIN
-- DECLARE t_no int ;
-- DECLARE t_name VARCHAR(30);
-- DECLARE t_status char(1);
-- DECLARE done int DEFAULT 0;

-- DECLARE train_cursor CURSOR FOR 
-- SELECT t.tno , t.tname , tt.status 
-- FROM ticket as tt
-- JOIN train as t ON t.tno = tt.tno
-- WHERE tt.status = 'w' AND tt.tdate = '2018-05-18';

-- DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
-- OPEN train_cursor;

-- read_loop : LOOP
--   FETCH train_cursor into t_no , t_name ,t_status;

--   IF done THEN 
--     LEAVE read_loop;
--   END IF;

--   SELECT CONCAT(t_no ,"|" ,t_name ,"|", t_status) as "Train info";
-- END LOOP read_loop;
-- CLOSE train_cursor;
-- END $$
-- DELIMITER ;
-- CALL not_confirm();

DROP PROCEDURE IF EXISTS reserve_berths;
DELIMITER $$
CREATE PROCEDURE reserve_berths(IN in_date date)
BEGIN
DECLARE berths int;
DECLARE total_berths Int DEFAULT 0;
DECLARE done INT DEFAULT 0;

DECLARE train_cursor CURSOR FOR
SELECT t.no_of_berths FROM ticket as t
WHERE t.tdate = in_date;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

OPEN train_cursor;
read_loop : LOOP 
  FETCH train_cursor into berths;
  IF done THEN
    LEAVE read_loop;
  END IF;
  set total_berths = total_berths + berths;
  END LOOP read_loop;
CLOSE train_cursor;
SELECT total_berths as 'Total Reserved berths';
END $$
DELIMITER ;
CALL reserve_berths('2018-05-18');