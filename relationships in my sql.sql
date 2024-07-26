 -- relationships of tables
 
 create database department;
 show tables;
 desc employees;
use department;
create table departments
(
id int primary key auto_increment,
name varchar(20) not null unique);
desc departments;
create table employees
(
id int primary key auto_increment,
name varchar(20) not null,
salary int,
did int,
foreign key(did) references departments(id));

insert into departments(name) values("sales"),("hr"),("marketing"),("it");
select*from departments;

insert into employees(name,salary,did) values("komal","2000",3),
                                        ("virendar",34000,4),
                                        ("vaibhav",54000,3);
select *from employees; 


create table bank_details(
id int primary key auto_increment,
acc_no  varchar(20) unique not null,
age     int not null check (age between 11 and 21),
bank_name  varchar(20) unique not null,
city       varchar(20) default 'mandi',
eid int,
foreign key(eid) references employees(id));

desc bank_details;
select*from bank_details;
insert into bank_details(acc_no,age,bank_name,eid) values('a01',20,'sbi',3);

-- joins
-- inner join, left join, right join, cross join, equi join
-- fetch data from multiple tables based on relationship

use department;
select*from departments inner join employees on departments.id = employees.did;
select departments.name,employees.name from departments inner join employees on departments.id = employees.did;
select*from departments cross join employees on departments.id = employees.did;
select d.name from departments d inner join employees e on d.id = e.did; 

-- left join 
select*from departments d left join  employees e on d.id = e.did where e.name = 'komal';
select*from departments d left join employees e on d.id = e.did ;
-- right join
select*from departments d right join employees e on d.id =e.did;
select*from departments cross join employees;

select*from departments d ,employees e
where d.id = e.did;

select*from departments d , employees  e
where d.id = e.did and d.name='marketing';

select e.name,e.salary from employees e inner join departments d on e.did = d.id;

select e.name,e.salary,d.name from employees e inner join departments d on e.did = d.id;

select e.name,e.salary,d.name from employees e inner join departments d on e.did = d.id where d.name='marketing';

select e.name,e.salary,d.name from employees e inner join departments d on e.did = d.id
order by e.salary desc

limit 1,2;select e.name,e.salary,d.name from employees e inner join departments d on e.did = d.id
where d.name = 'Marketing'
order by e.salary desc 
limit 2;

-- aggregate functions
-- count(),max(),min(),avg(),sum()

select count(*) from departments;
select max(salary) from employees;
select min(salary) from employees;
select sum(salary) from employees;
select avg(salary) from employees;

select count(*),sum(salary) from employees;

-- group by - used byb aggregate funtions
select count(*) from departments d,employees e where d.id = e.did;

select count(*),d.name from departments d,employees e where d.id = e.did
group by d.name;

select count(*),d.name from departments d,employees e where d.id = e.did
group by d.name having d.name='marketing';

select count(*),d.name from departments d,employees e where d.id = e.did
group by d.name
having count(*)= 2;

-- format/sequence of writing querries are
-- select(*,columns)
-- joins and relations
-- where
-- group by
-- having
-- order by acs/desc
-- limit

create table std
(
roll_no   varchar(20) primary key,
name varchar(20),
class  varchar(20),
email  varchar(30),
phone   double);

desc std;
select*from std;













