-- DROP PROCEDURE IF EXISTS total_lamt;

-- DELIMITER $$

-- CREATE PROCEDURE total_lamt(
--     IN bname VARCHAR(30),
--     OUT amount DECIMAL(10,2)
-- )
-- BEGIN
--     SELECT IFNULL(SUM(l.lamtapproved), 0)
--     INTO amount
--     FROM loan_appl AS l
--     JOIN branch AS b ON l.bid = b.bid
--     WHERE LOWER(b.brname) = LOWER(bname);
-- END $$

-- DELIMITER ;


DROP PROCEDURE IF EXISTS total_count;
DELIMITER $$
CREATE PROCEDURE total_count(IN bname varchar(30) , OUT count int)
BEGIN
SELECT COUNT(cno) 
INTO count
FROM Customer AS c
JOIN branch AS b
ON c.bid = b.bid
WHERE b.brname = bname;
END $$

DELIMITER ;