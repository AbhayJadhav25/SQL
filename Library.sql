-- Database: Library Management System/
DROP TABLE IF EXISTS borrow;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS books;

-- BOOKS TABLE
CREATE TABLE books (
  book_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(50),
  author VARCHAR(50),
  category VARCHAR(30),
  price DECIMAL(8,2),
  available_copies INT
);

-- MEMBERS TABLE
CREATE TABLE members (
  member_id INT PRIMARY KEY,
  name VARCHAR(30),
  member_addr VARCHAR(50),
  phone VARCHAR(10),
  membership_date DATE
);

-- BORROW TABLE
CREATE TABLE borrow (
  borrow_id INT PRIMARY KEY,
  member_id INT,
  FOREIGN KEY (member_id) REFERENCES members(member_id),
  book_id INT,
  FOREIGN KEY (book_id) REFERENCES books(book_id),
  borrow_date DATE,
  return_date DATE,
  fine DECIMAL(8,2)
);

-- SAMPLE DATA
INSERT INTO books VALUES
(1,'Vede Man', 'Mr. Om', 'Love', 1480, 20),
(2,'RA&W', 'R.K. Narayan', 'Real Story', 1800, 25),
(3,'Marathi Poem', 'R.K. Narayan', 'Poems', 1200, 30),
(4,'Hindi Stories', 'A. Shastri', 'Funny', 1500, 4),
(5,'English Horror', 'R. Jadhav', 'Horror', 2500, 12);

INSERT INTO members VALUES
(11, 'Aditya', 'Pune', '91827179', '2023-10-11'),
(12, 'Mayur', 'Ahilyanagar', '098768', '2025-08-12'),
(13, 'Harshal', 'Ravet', '098767', '2024-05-16'),
(14, 'Kartik', 'Bhingar', '5654345', '2022-10-26'),
(15, 'Abhishek', 'Wagholi', '1627291', '2024-10-12');

INSERT INTO borrow VALUES
(21, 11, 1, '2023-08-12', '2023-09-12', 120),
(22, 12, 2, '2025-04-21', '2025-06-22', 240),
(23, 13, 2, '2024-02-18', '2024-04-19', 150),
(24, 14, 4, '2022-08-23', '2022-09-21', 1000),
(25, 14, 5, '2022-06-16', '2022-08-13', 127);


-- Queries
/*SELECT * 
FROM books 
WHERE author = 'R.K. Narayan'
ORDER BY price DESC;

SELECT *
FROM members 
WHERE  member_id IN(
  SELECT member_id
  FROM borrow 
  WHERE borrow_date > '2024-01-01' 
);

-- SUBQUERIES
SELECT m.name  
FROM members as m
JOIN borrow as b
ON m.member_id = b.member_id
JOIN books AS bk 
ON bk.book_id = b.book_id
WHERE bk.price = (SELECT MAX(price) FROM books); 

SELECT name 
from members
WHERE member_id 
IN(
  SELECT member_id 
  FROM borrow 
  WHERE book_id
  IN(
  SELECT book_id 
  FROM books 
  WHERE price = (SELECT MAX(price) from books)
  )
);

SELECT B.title 
FROM books AS b 
JOIN borrow AS bo 
ON B.book_id = BO.book_id 
JOIN members AS m
ON bo.member_id = M.member_id 
WHERE m.member_addr = lower('Pune');

SELECT title 
FROM books
WHERE book_id 
IN(
  SELECT book_id 
  FROM borrow
  WHERE member_id 
  IN(
    SELECT member_id 
    FROM members
    WHERE member_addr = LOWER('PUNE')
  )
);
-- JOINS
SELECT m.name ,bK.title
FROM members AS m
JOIN borrow as b 
on m.member_id = b.member_id
JOIN books as bk 
ON b.book_id = bk.book_id;

SELECT *
FROM books
WHERE book_id NOT IN(select book_id FROM  borrow);

-- Stored Procedure
DROP PROCEDURE IF EXISTS displayMembers;
DELIMITER $$
CREATE PROCEDURE displayMembers(IN id INT)
BEGIN
SELECT COUNT(member_id) AS TOTAL_BOOKS
FROM borrow 
WHERE member_id = id;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS update_fine;
DELIMITER $$
CREATE PROCEDURE update_fine()
BEGIN
UPDATE borrow
SET FINE = 450 
WHERE DATEDIFF(return_date , borrow_date) > 15;
END $$
DELIMITER ;



-- STORE FUNCTION

DROP FUNCTION IF EXISTS calculate_fine;
DELIMITER $$

CREATE FUNCTION calculate_fine(delay_days INT)
RETURNS DECIMAL(8,2)
DETERMINISTIC
BEGIN
  DECLARE delay_fine DECIMAL(8,2);
  SET delay_fine = delay_days * 5;
  RETURN delay_fine;
END $$

DELIMITER ;

DROP FUNCTION IF EXISTS display_copies;
DELIMITER $$
CREATE FUNCTION display_copies(id int)
RETURNS int
DETERMINISTIC
BEGIN
DECLARE total_copies int ;
DECLARE borrowd_cnt int;
DECLARE avilable int;

SELECT avilable_copies 
INTO total_copies
FROM books
WHERE book_id = id;

SELECT COUNT(*) INTO borrowd_cnt
FROM borrow
WHERE book_id = id;

SET avilable = total_copies - borrowd_cnt;
RETURN avilable;
END $$
DELIMITER ;*/

DROP TRIGGER IF EXISTS  after_borrow;
DELIMITER $$
CREATE TRIGGER after_borrow 
AFTER INSERT ON borrow
FOR EACH ROW
BEGIN
UPDATE books 
SET available_copies = available_copies  - 1
WHERE book_id = NEW.book_id;
END $$
DELIMITER ;
INSERT INTO borrow (borrow_id, member_id ,book_id, borrow_date, return_date)
VALUES (26, 12, 5, '2025-11-09', NULL);

DROP TRIGGER IF EXISTS  after_return;
DELIMITER $$
CREATE TRIGGER after_return
AFTER UPDATE ON borrow
FOR EACH ROW
BEGIN
IF NEW.return_date IS NOT NULL AND OLD.return_date IS NULL THEN
UPDATE books
SET  available_copies = available_copies + 1
WHERE book_id = NEW.book_id ;
END IF;
END $$
DELIMITER ;

UPDATE borrow
SET return_date = '2025-11-15'
WHERE borrow_id = 26;
