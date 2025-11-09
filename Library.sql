-- Database: Library Management System/
drop table borrow;
drop table members;
drop table books;

create table books(
  book_id int primary key NOT NULL auto_increment, 
  title varchar(50),
  author varchar(50) ,
  catrgory varchar(30) ,
  price decimal(8,2),
  avilable_copies int
  );

create table members(
  member_id int primary key NOT NULL,
  name varchar(30),
  member_addr varchar(50) , 
  phone varchar(10) ,
  membership_date date
);

create table borrow(
  borrow_id int primary key not null ,
  member_id int ,
  foreign key (member_id) references members(member_id),
  book_id int ,
  foreign key (book_id) references books(book_id) ,
  borrow_date date ,
  return_date date ,
  fine decimal(8,2)
);
  
insert into books Values
(1,'Vede man' , 'Mr.om' , 'Love' , 1480 ,20),
(2,'RA&W' , 'R.K. Narayan' , 'Real Story' , 1800 , 25),
(3,'Marathi Poem','R.K. Narayan','Poems',1200 , 30) ,
(4,'Hindi Stories' , 'A Shastri' , 'Funny' , 1500 , 4),
(5,'English Horror' , 'R jadhav','Horror',2500,12);


insert into members Values
(11 , 'Aditya' , 'Pune' , '91827179','2023-10-11'),
(12 , 'Mayur' , 'Ahilyanagr' , '098768','2025-08-12'),
(13,"Harshal" , 'Ravet','098767','2024-05-16'),
(14,"kartik","Bhingar",'5654345','2022-10-26'),
(15,"Abhishek",'Wagholi','1627291','2024-10-12');

insert into borrow Values
(21, 11 , 1 , '2023-08-12' , '2023-09-12',120),
(22 , 12 , 2 ,'2025-04-21','2025-06-22',240),
(23 , 13 , 2 , '2024-02-18','2024-04-19',150),
(24 , 14 , 4 ,'2022-08-23','2022-09-21',1000),
(25 , 14 , 5 , '2022-06-16','2022-08-13',127);
select * from books;
select * from members;
select * from borrow;
