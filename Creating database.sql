-- Creating a new database

create database database_new;

-- CAUTION!!!! BE CAREFUL
-- deleting the database

drop database database_new;
drop table awesome_customers;

USE database_new;

-- CREATING TABLES
-- constraint NOT NULL (NOT TO BE EMPTY)
-- MYSQL autoincrement (whenever new record is inserted id column will get incremented)
-- PRIMARY KEY 

create table awesome_employees(
	id int NOT NULL auto_increment, 
    first_name varchar(255) NOT NULL,
    last_name varchar(255),
    dept varchar(255),
    PRIMARY KEY (ID)

);

create table awesome_customers(

	id INT NOT NULL auto_increment,
    company_name varchar(255),
    country varchar(255),
    emp_id INT,
    primary key(id),
    foreign key(emp_id) references awesome_employees(id)
);





-- insert into demo
-- here we are not using id bcs it is set to auto_increment while creating table

INSERT INTO awesome_employees(first_name, last_name, dept)
values('Mourya', 'M', 'IT');


select * from awesome_employees;


-- inserting data into every column of a table

-- here we need to specify id as "default" keyword bcs its auto_increment and expects each column to mention

INSERT INTO awesome_employees
values(default, 'Jamuna', 'T', 'Sales');



-- Exercise















