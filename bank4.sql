use fymca;
-- DELIMITER $$
-- DROP TRIGGER IF EXISTS bank1;
-- CREATE TRIGGER check_acc_no
-- BEFORE INSERT ON account
-- FOR EACH ROW
-- BEGIN
-- IF NEW.acc_no <=0 THEN
--   SIGNAL SQLSTATE'45000'
--   SET MESSAGE_TEXT = "ERROR : Account no can't be 0 or less than zero";
-- END IF;
-- END $$
-- DELIMITER ;

-- INSERT INTO account VALUES(0, 201 , 101 , "SAVING",45000);

DELIMITER $$
DROP TRIGGER IF EXISTS check_lamt;
CREATE TRIGGER check_lamt 
BEFORE INSERT ON loan_appl
FOR EACH ROW
BEGIN
IF NEW.lamtapproved > NEW.lamtrequired THEN
  SIGNAL SQLSTATE'45000'
  SET MESSAGE_TEXT = "ERROR : Aprroved loan amount can't be greater than required loan amount.";
END IF;
END $$
DELIMITER ;

INSERT INTO loan_appl VALUES(311, 201, 101, 70000, 80000, '2023-01-12');