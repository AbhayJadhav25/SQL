use fymca;
drop table account;
drop table loan_appl;
drop table customer;
drop table branch;
create table branch(
  bid int primary key , 
  brname varchar(15) , 
  brcity varchar(10)
  );

create table customer(
  cno int primary key , 
  bid int , foreign key (bid) references branch(bid),
  cname varchar(30) , 
  caddar varchar(35) , 
  city char(20)
  );

create table loan_appl(
  lno int primary key ,
  cno int , foreign key (cno) references customer(cno),
  bid int , foreign key (bid) references branch(bid), 
  lamtrequired double, 
  lamtapproved double , 
  l_date date
  );

create table account(
  acc_no int primary key , 
  cno int , foreign key (cno) references customer(cno),
  bid int ,foreign key (bid) references branch(bid),
  acc_type char(10) , 
  acc_balance float(8,2)
  );


  insert into branch values(101 ,'chas' , 'Nagar') , (102 , 'kamargaon' , 'Supa') ,
                            (103 , 'Akolner' , 'Kedgav') , (104 , 'karvenagar' , 'Pune'),
                            (105 , 'Kothrud' , 'PCMC');

  insert into customer values(201 , 101 , 'Om' , 'Gavkhare wadi' , 'Chas'),
                              (202 ,101 , 'Sai', 'Gondal wadi' , 'Nagar'),
                              (203 , 102 , 'Aditya' , 'Jadhav wadi' , 'Sonewadi'),
                              (204 , 102 , 'Harshal','Kumbhar wada' , 'Nimagaon'),
                              (205, 103 , 'Mayur' , 'Ghodake wadi' , 'Ghospuri'),
                              (206 , 103 , 'Kartik' , 'Ambekar wadi','Bhingar'),
                              (207,104,'vaibhav','Karle wadi' , 'Akolner'),
                              (208,104 , 'Abhay' ,'Bhosale wadi','Satare'),
                              (209 ,105,'Gaurav' , 'Misal Wadi' , 'Nepti'),
                              (210 , 105 ,'Ganesh' , 'Rajapure wadi' , 'Dhawalpuri');

  insert into loan_appl values(301,201,101,70000,60000,'2023-01-12'),
                              (302,202,102 , 80000,70000 ,'202-02-15'),
                              (303 , 203 , 103 , 50000 , 45000 ,'2021-03-20'),
                              (304 , 204 , 104 , 90000,80000 , '2022-12-28') , 
                              (305 , 205 , 105 , 110000 , 100000 , '2024-10-23') , 
                              (306,206,101,55000,50000,'2025-05-21'),
                              (307,207,102,40000,35000,'2020-12-30'),
                              (308,208,103,195000,190000,'2024-11-07'),
                              (309 , 209 , 104 , 75000,60000,'2021-08-08'),
                              (310 , 210 , 105 ,65000 , 60000 , '2023-07-18');

  insert into account values(401 , 201 , 101 , 'current', 70000) ,
                            (402,202,102,'saving',80000),
                            (403,203,103,'current',90000),
                            (404,204,104,'saving',100000) , 
                            (405,205,105,'current',55000) , 
                            (406 , 206 , 101 , 'saving' , 65000) , 
                            (407 , 207 , 102 , 'current' ,75000) , 
                            (408 , 208 , 103 , 'saving  ' , 85000) , 
                            (409 , 209 , 104 , 'current' , 95000) , 
                            (410 , 210 , 105 , 'saving' , 105000);
select * from branch;
select* from customer;
select*from loan_appl;
select * from account; 