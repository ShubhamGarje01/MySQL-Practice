-- Que - 01

create database assignment;
use assignment;

-- Que - 03

create table authors(
authorid int, 
name varchar(25)
);

insert into authors values
(1,"J K Rowling"),
(2, "Thomas Hardy"),
(3, "Oscar Wilde"),
(4, "Sidney Sheldon"),
(5, "Alistair Maclean"),
(6, "Jane Autsen");
 

insert into authors values
(11, "William Shakespeare"),
(12, "Agatha Christie");


set sql_safe_updates = 0;
update authors
set name = "Alastair McNeal"
where authorid = 5;


-- Que - 4 (A)

create table Books(
bookid int,
title varchar(50),
authorid int
);

insert into Books values
(1, "Harry Potter and the Philosopher's Stone", 1),
(2, "Harry Potter and the Chamber of Secrets", 1),
(3, "Harry Potter and the Half-Blood Prince", 1),
(4, "Harry Potter and the Goblet of Fire", 1),
(5, "Night Without End", 5),
(6, "Fear is the Key", 5),
(7, "Where Eagles Dare", 5),
(8, "Sense and Sensibility", 6),
(9, "Pride and Prejudice", 6),
(10, "Emma", 6),
(11, "Random Book", 22);

-- Q4 (B)
set sql_safe_updates = 0;
delete from Books
where bookid = 11;


-- Que - 5

alter table Books
rename to Favbooks;

alter table authors
rename to Favauthors;

-- Que - 6

create table Products(
    product_id int not null,
    product_name varchar(10) unique,
    description varchar(100),
    supplier_id int,
    primary key (product_id),
    foreign key (supplier_id) references products(product_id)
    );
    
create table Suppliers(
    supplier_id int,
    supplier_name varchar(10),
    location varchar(10),
    primary key (supplier_id)
    );

create table Stock(
    id int,
    product_id int,
    balance_stock int,
    primary key(id),
    foreign key (product_id) references products(product_id)
    );
    
-- Que - 7

insert into Suppliers values
(1001, "HULK", "NYC"),
(1002, "IRON_MAN", "NYC"),
(1003, "THOR", "ASSGAURD"),
(1004, "LOKI", "ASSGAURD");


insert into products values
(9991, "Dettol", "Liquid Anticeptic", 1001),
(9992, "Pen", "Blue ink ball pen", 1002),
(9993, "Mobile", "Electronic Instrument", 1003),
(9994, "Laptop", "Electronic Instrument", 1004);


insert into stock values
(0001, 9991, 56789),
(0002, 9992, 1234),
(0003, 9993, 45674),
(0004, 9994, 90809);



-- Que - 8

alter table suppliers
modify supplier_name varchar(50) unique not null;

		


-- Que - 9 (A)

alter table emp
add column deptno int;


-- Que - 9 (B)

 update emp
     set deptno = (case
     when mod(emp.emp_no, 2) = 0 then 20
     when mod(emp.emp_no, 3) = 0 then 30
     when mod(emp.emp_no, 4) = 0 then 40
     when mod(emp.emp_no, 5) = 0 then 50
 else 10
 end
 );

 