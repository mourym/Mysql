USE intro_sql;

create table shippers(
	id int not null auto_increment,
    shipper_name varchar(255),
    phone varchar(100),
	primary key (id)
);

select * from shippers;

-- Insert Into tables 
--  here id we are not using bcs we set to auto_increment, so by default it will increment


insert into shippers
values(default, 'speedy expr', '503 555-9831'),
(default, 'United Package', '503 555-3199'),
(default, 'Federal Ship', '503 555-9931');


select * from shippers;


use intro_sql;

select * from customers;

select * from employees;


select emp.first_name, emp.last_name, cust.company_name, cust.country
from employees emp
left join customers cust 
on emp.id = cust.employee_id
where cust.company_name IS NULL;


-- Exercise


select cust.company_name as 'Company', cust.country,
orders.order_date as 'Order Date', orders.shipper, orders.freight 
from customers cust
inner join orders
on cust.employee_id = orders.customer_id;

