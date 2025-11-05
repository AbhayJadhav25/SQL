USE fymca;

-- DROP FUNCTION IF EXISTS totalTicket_amt;

-- DELIMITER $$

-- CREATE FUNCTION totalTicket_amt(
--     tr_name VARCHAR(50),
--     tr_date DATE
-- )
-- RETURNS DECIMAL(10,2)
-- DETERMINISTIC
-- BEGIN
--     DECLARE amt DECIMAL(10,2);

--     SELECT IFNULL(SUM(t.ticket_amount), 0)
--     INTO amt
--     FROM ticket AS t
--     JOIN train AS tr
--       ON t.tno = tr.tno
--     WHERE tr.tname = tr_name
--       AND t.tdate = tr_date;

--     RETURN amt;
-- END $$

DROP FUNCTION IF EXISTS cal_berths;
DELIMITER $$

CREATE FUNCTION cal_berths()
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN 
    DECLARE total INT;

    SELECT SUM(t.no_of_berths)
    INTO total
    FROM train AS t
    JOIN ticket 
    ON t.tno = ticket.tno
    WHERE t.tname = 'Shatabdi' AND ticket.tdate = '2025-02-17';

    RETURN total;
END $$

DELIMITER ;

