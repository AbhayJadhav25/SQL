use fymca;
-- simple queries using Railway reservation Database

-- 1)List the information about the avilability of trains between Mumbai and pune

SELECT *
FROM train 
where(lower(source_stn) = 'Mumbai' AND lower(dest_stn) = 'Pune')
OR(lower(source_stn) = 'Pune' and lower(dest_stn) = 'Mumbai');

-- 2)Gives the name of all trains which start from Pune
SELECT tname as 'Train Name'
FROM train 
Where lower(source_stn) = 'pune' ;

-- 3)count number of passenger for 'Duronoto Express'
SELECT count(*) as 'Total Passenger'
FROM ticket
where tno IN(SELECT tno from train where tname = 'Duronto');