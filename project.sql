create database stocks;

show Tables;

use stocks;

create table Customers
(
Customer_ID  varchar(25) primary key,
Title        char(20),
First_Name   char(30),
Last_Name    char(20),
Company      Varchar(30),
Address      varchar(50),
City         char(15),
State        char(15),
Postal_code  int,
Phone_number double,
Rating       numeric(5,2));

desc customers;
select*From Customers;


insert into customers values("A101","Mr.","Subham","Pathania","Infosis","Kothi","Mandi","H.P.",175037,8278879797,4.9);

insert into customers values("A102","Mr.","Ashish","Saklani","Google","Sihan","Mandi","H.P.",175040,8626892737,4),
							("A103","Mr.","Rohan","Rawat","Spacex","barot","hoshiarpur","Punjab",146080,8865432737,3),
                            ("A104","Mr.","Manjit","Singh","Krafton","Jahan","Hoshiapur","punjab",133340,8624689737,5),
                            ("A105","Miss.","Sneha","Goyal","Microsoft","bajwara","Ishar","Haryana",332274,862826384,1.5),
                            ("A106","Miss.","Harshita","Bhardwaj","Telegram","Zirakpur","Chandigarh","Punjab",172270,8622246737,2.5),
                            ("A107","Mrs.","Poonam","Dhalaria","Snapchat","Kamlah","Mandi","H.P.",175080,8626343737,4.1),
                            ("A108","Miss.","Gursimran","Pandey","Twitter","Mohali","Chandigarh","Punjab",173737,8622337737,4.3),
                            ("A109","Mr.","Rajan","Rawat","Supercell","Agra","Sahai","Uttar Pradesh",173460,8624575767,3.9),
                            ("A110","Mr.","Rohan","Rajput","Instagram","Kumharda","Mandi","H.P.",175543,845892737,5);
Select*from customers;

create table stocks 
(
Product_no    varchar(25) primary key,
Description_  varchar(30),
Catalog       varchar(30),
Quantity      int,
Cost_Price    numeric(10,2),
Selling_Price numeric(10,2));

desc stocks;

select*from stocks;

insert into stocks values("B101","Laptop","A1",1,40000.50,50000.50);

insert into stocks values("B102","Phone","A1",1,15000.12,25000.50),
						("B103","Speaker","B1",2,15000.12,25000.50),
                        ("B104","Earphones","C1",1,1500.30,2500.40),
						("B105","Drive","D1",1,150.12,250.60),
						("B106","Mouse","C1",5,1000.20,5000.50),
						("B107","Keyboard","B1",5,3000.50,4000.30),
                        ("B108","Display","E1",4,150.25,500.60),
                        ("B109","CPU","B1",5,300.25,500.50),
                        ("B110","GPU","B1",7,1500.12,2500.50);
 
 create table orders
(
order_no    varchar(20) Primary key,
Customer_id varchar(30) not null,
Order_Date  date,
Total       numeric(10,2),
foreign key(Customer_id) references Customers(Customer_ID)
) ;

desc orders;

select*from customers;
-- select commands,from,as,where
select first_name,company from customers;
select first_name,customer_id from customers;
select first_name,company,state,rating from customers;
select first_name as Name,company as comp,postal_code as post from customers;
 
select*from customers;
select*from customers where city="mandi";
select first_name,state,rating from customers where customer_id="a101"; 
select*from customers where rating>2.5;
select first_name,rating from customers where rating >=3;
select*from customers where state != "h.p.";
select*from customers where first_name="rohan" or state = "hoshiarpur";
select first_name,company,rating from customers where rating>=1 and rating<=4;
select first_name,company,rating from customers where rating between 1 and 3;
select*from customers limit 2;
select*from customers limit 5,5;
select*from customers where city="chandigarh" or city="sahai" or city="Mandi";
select*from customers where city in ("chandigarh","sahai","mandi");
select*from customers where customer_id not in ("a101","a105","a110");
select *from customers where first_name like "a%h";
select first_name,city from customers where city like "m%";
select*from customers where first_name like "%a";
select*from customers where first_name like "%h%";
SELECT*FROM customers where phone_number like "%626892737";

select*from customers order by company;
select first_name,city from customers order by rating;
select *from customers where first_name like "%h%" order by city;
select*from student order by company asc;
select*from customers order by rating desc;
select customer_id from customers where first_name in ("manjit","ashishcustomers","rohan") order by first_name desc;
select*from customers order by first_name limit 2,5;

select *from customers;

delete from customers  where rating=5 ;

update customers set company="dell",postal_code=175037 where customer_id="a101";
update customers set company="asus" where customer_id="a101" or customer_id="a110";
update customers set company="lenovo" where customer_id in ("a102","a105","a107");

select*from customers;
select*from orders;
select*from stocks;
select*from order_details;
desc customers;
desc stocks;
desc orders;
desc order_details;


-- joins
-- inner join, left join, right join, cross join, equi join
-- fetch data from multiple tables based on relationship

select*from customers inner join orders on customers.Customer_ID = orders.Customer_id; 
select customers.first_name,orders.order_date from customers inner join orders on customers.Customer_ID = orders.Customer_id;
select*from customers cross join orders on customers.customer_id = orders.customer_id;
select *from customers c , orders o where c.customer_id = o.customer_id;
select*from customers c,orders o where c.customer_id=o.customer_id order by address desc limit 2,2;
select customers.first_name,orders.order_date from customers left join orders on customers.Customer_ID = orders.Customer_id
union
select customers.first_name,orders.order_date from customers right join orders on customers.Customer_ID = orders.Customer_id;   
-- aggregate functios with group by and having
select*from customers;
select count(*),city from customers
group by city;

select count(*),address from customers 
group by address;

select count(*),city from customers
group by city
having city='mandi';

select count(*),city from customers
group by city
having count(*) = 4;

select*from orders;
use stocks;
-- views creation
create view view1
as select customer_id,First_name,company,city,upostal_code,rating,phone_number from customers;
create or  replace view view2 as select order_no,order_date,total,first_name,rating from (orders,customers);
select*from view2;
-- aggregate funtions 
select count(*) from view1;
select max(rating) from view1;
select min(rating) from view1;
select sum(rating) from view1;
select avg(rating) from view1;

-- ROLLUP,CUBE
select first_name,city, sum(rating) from view1
group by  first_name,city WITH ROLLUP;
 
SELECT first_name,phone_number, avg(rating)
from view1 
group by company;

select*from view1;
 
select company from view1
union
select rating from view1;

-- ARTHMATIC/Numeric FUNCTIONS

SELECT ABS(-10.2382348);
SELECT MOD(10,2);
SELECT SIGN(7686);
SELECT SIGN(-122);
SELECT FLOOR(5.34);
SELECT CEIL(5.34);
SELECT POWER(2,10);
SELECT ROUND(10.1);
SELECT ROUND(10.9);
SELECT SQRT(10);
SELECT SQRT(25);
SELECT ASIN(1);
SELECT ACOS(1);
SELECT ATAN(0);
SELECT SIN(10);
SELECT COS(90);

-- CHRACTER  and string functions 
SELECT LCASE("AFLJK");
SELECT LOWER("ETDFT"); 
SELECT UPPER ("hygyh");
select ucase("hvguhjb");
select concat("ashish","saklani");
select length("ashish_saklani"); 
select substr("ashsih",3);
select instr("ashish saklani is good boy","good");
select trim("database                           management");
select ltrim("  ashsih saklani");
select char(123);
select left("informatics",5);
select right("informatics",5);

-- date and time funtions
select curdate();
select sysdate();
select now();
select date("2023-01-01 ");
select month("2023-01-01");
select year("2023-12-03");
select dayname("1993-03-03");
select dayofmonth("2003-01-01");
select dayofweek("2003-01-01");
select dayofyear("2003-01-01");
select dayofyear("1998-08-28");

-- alter commands
create table alter1
(roll_no  int,
name       varchar(10),
class       varchar(10),
hobby       varchar(30));
insert into alter1 values(1,"rohan","mca","criket"),
                          (2,"manjit","cse","chess"),
                          (3,"avninder","law","badminton");
                          drop table alter1;
select*from alter1;
insert into alter1(last_name) values ("rawat"),("kumar"),("singh"); 
alter table alter1
add last_name varchar(20);
alter table alter1
modify last_name varchar(30);

Alter table alter1
drop class;
commit;
alter table alter1
add class varchar(20);

delete  from  alter1 where last_name in("rawat","kumar","singh"); 
	delete  from  alter1 where last_name ="rawat"	;
rollback;