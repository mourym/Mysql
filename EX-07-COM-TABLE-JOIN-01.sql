USE intro_sql;

SELECT customers.company_name AS 'Company', customers.country,
orders.order_date AS 'Order Date', orders.shipper, orders.freight
FROM customers
INNER JOIN orders ON customers.id = orders.customer_id;