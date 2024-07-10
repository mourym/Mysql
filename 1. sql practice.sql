
-- this is single line comment

/* this is
multi line 
comment */

USE intro_sql;

select * from customers;


select company_name as Company from customers;


select distinct country from customers;


select id,company_name,phone from customers
WHERE  country = 'france';

select id,order_date,shipper,freight from orders
WHERE freight > 100;

-- retuns all customer with USA and OR region
select id,company_name,region,country from customers
where country='USA' and region='OR';

select id,order_date,shipper,freight from orders
where order_date >= '2019-01-01' and order_date <= '2019-12-31';

-- we can use between instead of above one
select * from orders 
where order_date between '2019-01-01' and '2019-12-31';


-- OR Operator

select region,country from customers
where country='USA' or country='Germany';


select * from customers
where company_name LIKE 'l%';




-- exercise 2



/* SQL WHERE CLAUSE

Create a SELECT statement that retrieves the following columns from the PRODUCT table.

Columns

product_name (ALIAS = 'Product')

category

units_in_stock (ALIAS = 'Units') */

select product_name, category, units_in_stock, discontinued from products
where (category = 'Beverages' or category = 'Dairy Products') and discontinued <> 1;




-- SELECT STATEMENT WITH WHERE CLAUSE
SELECT product_name AS 'Product', category, units_in_stock, discontinued AS 'Units'
FROM products
WHERE (category = 'Beverages' AND discontinued <> 1) OR 
(category = 'Dairy Products' AND discontinued <> 1);

-- STREAMLINE THE WHERE CONDITION USING THE IN FUNCTION
SELECT product_name AS 'Product', category, units_in_stock, discontinued AS 'Units'
FROM products
WHERE category IN('Beverages', 'Dairy Products') AND discontinued <> 1;


select id, company_name, country from customers
order by country desc;


-- sorting with multiple columns

select id, company_name, country from customers
order by country desc, company_name desc;


select product_name as Product, category, unit_price as Price from products
where units_in_stock > 20 
order by category asc, unit_price desc;


select country from customers
group by country;

select category, stddev(units_in_stock) as 'Total Stock' from products
group by category;


select category, avg(unit_price) as avg_price from products
group by category;

select category, count(id) as 'Total Products' from products
group by category;


select category, sum(units_in_stock) as 'Total Units' from products
group by category;

select distinct(category) as 'Categories' from products;

select count(distinct(category)) as 'Categories' from products;


select group_concat(distinct(category)) as 'Categories' from products;

select stddev(unit_price) as 'STD Deviation' from products;


-- Having clause



select category, units_in_stock from products
where sum(units_in_stock) >100;


select category, sum(units_in_stock) from products
group by category
having sum(units_in_stock) > 300 ;


select year(order_date) as 'Year', sum(freight) as 'Freight' from orders
group by year(order_date);














