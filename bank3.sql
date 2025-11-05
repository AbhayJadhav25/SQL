USE fymca;

-- DROP PROCEDURE IF EXISTS display_cust;
-- DELIMITER $$

-- CREATE PROCEDURE display_cust(IN bname VARCHAR(30))
-- BEGIN
--     DECLARE c_name VARCHAR(30);
--     DECLARE amount DECIMAL(10,2);
--     DECLARE done INT DEFAULT 0;

--     -- Declare cursor
--     DECLARE bank_cursor CURSOR FOR
--         SELECT c.cname, l.lamtapproved
--         FROM customer AS c
--         JOIN loan_appl AS l ON c.cno = l.cno
--         JOIN branch AS b ON l.bid = b.bid
--         WHERE b.brname = bname
--           AND l.lamtapproved BETWEEN 45000 AND 60000;

--     -- Declare handler for end of data
--     DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

--     OPEN bank_cursor;

--     read_loop: LOOP
--         FETCH bank_cursor INTO c_name, amount;
--         IF done THEN
--             LEAVE read_loop;
--         END IF;
--         SELECT CONCAT(c_name, ' has a loan of Rs. ', amount) AS customer_info;
--     END LOOP;

--     CLOSE bank_cursor;
-- END $$

-- DELIMITER ;
-- CALL display_cust("Kothrud");

DROP PROCEDURE IF EXISTS add_interest;
DELIMITER $$

CREATE PROCEDURE add_interest()
BEGIN
    DECLARE amount DECIMAL(10,2);
    DECLARE accno INT;
    DECLARE c_name VARCHAR(30);
    DECLARE done INT DEFAULT 0;

    DECLARE interest_cursor CURSOR FOR
        SELECT a.acc_no, a.acc_balance, c.cname
        FROM account AS a
        JOIN customer AS c ON a.cno = c.cno
        WHERE a.acc_balance > 70000;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN interest_cursor;

    read_loop: LOOP
        FETCH interest_cursor INTO accno, amount, c_name;
        IF done THEN
            LEAVE read_loop;
        END IF;

        UPDATE account
        SET acc_balance = acc_balance + (acc_balance * 0.04)
        WHERE acc_no = accno;

        SELECT CONCAT(c_name, ' new balance: ', acc_balance) AS Updated_Info
        FROM account
        WHERE acc_no = accno;
    END LOOP;

    CLOSE interest_cursor;
END $$

DELIMITER ;

-- Execute
CALL add_interest();
