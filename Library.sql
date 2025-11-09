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
  bname varchar(30)  ,
  member_id int ,
  foreign key (member_id) references members(member_id),
  book_id int ,
  foreign key (book_id) references books(book_id) ,
  borrow_date date ,
  return_date date ,
  fine decimal(8,2)
);
  desc books;
  DESC members;
  desc borrow;