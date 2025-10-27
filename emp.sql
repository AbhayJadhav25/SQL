use emp;
DROP TABLE salary;
DROP TABLE empolyee;
DROP TABLE  departments;
CREATE TABLE departments(
  dept_id INT UNSIGNED NOT NULL AUTO_INCREMENT , 
  dept_name VARCHAR(100) NOT NULL ,
  dept_location VARCHAR(100) , 
  PRIMARY KEY(dept_id) , 
  UNIQUE KEY(dept_name)
);

CREATE TABLE empolyee(
  emp_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL , 
  last_name VARCHAR(50) NOT NULL ,
  birth_date DATE NOT NULL,
  email VARCHAR(150) UNIQUE , 
  dept_id INT UNSIGNED , 
  PRIMARY KEY(emp_id) , 
  FOREIGN  KEY(dept_id) REFERENCES departments(dept_id) 
  ON DELETE SET NULL
  ON UPDATE CASCADE
);

CREATE TABLE salary(
  salary_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  emp_id INT UNSIGNED NOT NULL ,
  valid_from DATE NOT NULL ,
  valid_to DATE ,
  amount DECIMAL(10,2) NOT NULL ,
  PRIMARY KEY(salary_id) , 
  FOREIGN KEY (emp_id) REFERENCES empolyee(emp_id)
  ON DELETE CASCADE 
  ON UPDATE CASCADE
);

INSERT INTO departments(dept_name , dept_location) VALUES('Finace' , 'Delhi') ,('HR','Mumbai') , ('Engineering','Nagar');

INSERT INTO empolyee VALUES(11,'Abhay','Jadhav','2005-12-03','abhay123@gmail.com',1),
                            (12,'Om','GAvkhare','2007-03-12','omgakhare123@gmail.com',2) ,
                            (13,'Mayur','Ghodake','1998-04-10','mayur234@gmail.com',3);

INSERT INTO salary VALUES  (101 , 11 , '2025-10-11' , '2025-10-21' , 50000.50) , (102 ,12 , '2025-09-10' , '2025-09-20' , 80000.75) , (103 , 13 , '2025-11-01','2025-11-11',90000.12);

-- SELECT  * FROM departments;
-- SELECT * from empolyee;
-- SELECT * from salary;

-- SELECT emp_id , first_name , lower(last_name) FROM empolyee;

-- SELECT * FROM empolyee 
-- WHERE dept_id = 2 AND first_name = 'om'; 

-- SELECT emp_id , first_name FROM empolyee
-- ORDER BY birth_date DESC LIMIT 2 OFFSET 2;

-- UPDATE empolyee
-- SET dept_id = 3 
-- WHERE emp_id = 11; 

-- DELETE FROM salary 
-- WHERE salary_id = 101;

-- DELETE FROM empolyee 
-- WHERE birth_date = '2007-03-12' ;  --here salary table automatically effected bcoz of ON DELETE CASCADE

-- SELECT emp_id , last_name , first_name , birth_date 
-- FROM empolyee 
-- ORDER BY last_name ASC , birth_date desc;

-- SELECT * FROM empolyee;
-- SELECT * from salary;


-- #DAYTIME OPERATION
-- select CURDATE();
-- SELECT CURTIME();
-- SELECT DATE(NOW());

-- SELECT emp_id , DATEDIFF(CURDATE() , birth_date) as Total_age FROM empolyee;
-- SELECT DAYNAME(birth_date) FROM empolyee;

--  SELECT emp_id , DAYOFWEEK(birth_date) as weekday_index ,DAYNAME(birth_date) as weekday_name from empolyee;
  -- SELECT emp_id , MONTH(birth_date) as birth_month , MONTHNAME(birth_date) as birth_month from empolyee;

  -- SELECT emp_id , EXTRACT(YEAR FROM birth_date) as Birthday_date from empolyee;
  -- SELECT TIMESTAMPDIFF(YEAR,'2005-01-25',CURDATE()) AS total_age;

  -- String Operation

  SELECT TRIM('   HELLO   ') AS T1;
  SELECT TRIM(LEADING 'X' FROM 'XXXABCD') AS T2;
  SELECT TRIM( TRAILING 'Z' FROM 'ABCDZZZ') AS T3;
  SELECT TRIM(BOTH 'X' FROM 'XXABCDXX') AS T4;
  SELECT TRIM(BOTH 'XY' FROM 'XYXYABCDXYXY') AS T5;
  -- SELECT emp_id , 
  -- CONCAT(first_name, ' ', last_name) 
  -- FROM empolyee;

  -- SELECT emp_id , 
  -- SUBSTRING(first_name , 1 , 3) 
  -- FROM empolyee;

  -- SELECT emp_id ,
  -- LOWER(first_name) as lowerCase , UPPER(first_name) as UpperCase
  -- FROM empolyee;

  -- SELECT emp_id , 
  -- LENGTH(first_name) as total_length , CHAR_LENGTH(first_name) as total_length 
  -- FROM empolyee;

  -- SELECT EXTRACT(YEAR_MONTH FROM valid_from) AS YYYYMM , SUM(amount) FROM salary 
  -- GROUP BY YYYYMM;

  -- GROUP BY EXAMPLE
  SELECT emp_id , 
  SUM(amount) as AMOUNT
  FROM salary 
  GROUP BY emp_id;

  SELECT emp_id ,
  SUM(amount) AS AMOUNT
  FROM salary 
  WHERE amount>75000
  GROUP BY emp_id;

  SELECT emp_id ,
  sum(amount) as total_salary
  FROM salary
  GROUP BY emp_id
  HAVING total_salary > 82000;