-- Simple queries
-- Find out customer name having loan amount > 100000
use fymca;
-- select cname from customer where cno IN(select cno from loan_appl where lamtrequired > 100000);

-- List the name of the customer who have loan at ______ branch
select cname from customer where bid In (select bid from loan_appl where bid in(select bid from branch where brname = 'Kothrud' ));

-- find out the total amount sanctioned by ____ branch;
select sum(lamtapproved) as 'Approved ammount '  from loan_appl where bid in(select bid from branch where brname = "Kothrud");

-- -- Using JOINS
-- select c.cname as 'Customer name'
-- from customer as c 
-- LEFT JOIN loan_appl as l
-- ON c.cno = l.cno
-- where l.lamtrequired >= 100000;

SELECT c.cname as 'Customer name'
FROM customer as c
JOIN loan_appl as l 
ON c.cno = l.cno 
JOIN branch as b 
ON l.bid = b.bid
where b.brname = 'Kothrud';

SELECT SUM(lamtapproved) as 'Total Loan Amount Approved'
FROM loan_appl as l
JOIN branch as b
ON l.bid = b.bid
where b.brname = 'Kothrud';