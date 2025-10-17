drop table ticket;
drop table passenger;
drop table train;

create table train(
  tno int primary key , 
  tname varchar(20),
  depart_time time , 
  arrival_time time , 
  source_stn varchar(20)  ,
  dest_stn varchar(20) , 
  no_of_res_bogies int ,
  bogie_capacity int
);

create table passenger(
  pid int primary key , 
  pname varchar(20) , 
  address varchar(20) ,
  age int ,
  gender char(1) check(gender in('M','W','O'))
);

create table ticket (
  tno int  , foreign key (tno) references train(tno) ,  
  pid int , foreign key (pid) references passenger(pid),
  ticket_no int , primary key(tno , pid , ticket_no) ,
  bogie_no int ,
  no_of_berths int , 
  tdate date ,
  ticket_amount decimal(7,2) , 
  status char(1) check(status in ('w','c'))
  );

insert into train values(101,'Rajdhani','06:00:00','14:00:00','Delhi','Mumbai',10,72),
                        (102,'Shatabdi','07:00:00','15:00:00','Delhi','Chennai',8,70),
                        (103,'Duronto','08:00:00','16:30:00','Ahilyanagar','pune',12,80),
                        (104,'Gatiman','09:00:00','17:45:00','Mumabi','Kolkatta',7,65),
                        (105,'Garib path','10:30:00','19:30:00','Pune','Goa',6,60),
                        (106,'Indian Express','12:30:00','22:00:00','Jammu','Hariyana',9,75),
                        (107,'Super Fast','13:00:00','23:15:00','Nagpur','Delhi',11,78),
                        (108,'Express','18:20:00','3:10:00','kashmir','Kanyakumari',10,72),
                        (109,'Intercity','09:00:00','11:00:00','shirur','Pune',5,55),
                        (110,'Jehlum','20:00:00','17:00:00','Beed','Mumabi',12,70);

insert into passenger values(1,'om','Ahilyanaggar',20,'M'),
                            (2,'Riya','Pune',21,'W'),
                            (3,'Raj','Kolkatta',22,'M'),
                            (4,'Amol','Mumbai',23,'O'),
                            (5,'Harshal','Delhi',27,'M'),
                            (6,'Aditya','Punjab',24,'M'),
                            (7,'Pooja','Satara',25,'W'),
                            (8,'Abhay','Satara',19,'M'),
                            (9,'Kartik','Pune',26,'M'),
                            (10,'Shruti','Nagar',22,'W');

insert into ticket values(101,1,1001,1,1,'2025-01-17',1200.00,'c'),
                          (102,2,1002,2,1,'2025-02-17',1500.00,'c'),
                          (103,3,1003,3,1,'2025-03-19',1700.00,'w'),
                          (104,4,1004,4,1,'2025-04-20',900.00,'c'),
                          (105,5,1005,1,1,'2025-05-21',1300.00,'w'),
                          (106,6,1006,2,1,'2025-06-22',1700.00,'w'),
                          (107,7,1007,3,1,'2025-07-30',1880.00,'c'),
                          (108,8,1008,4,1,'2025-08-23',2000.00,'w'),
                          (109,9,1009,1,1,'2025-09-25',2300.00,'c'),
                          (110,10,1010,2,1,'2026-10-27',1500.00,'w');

select * from train;
select * from passenger;
select * from ticket;