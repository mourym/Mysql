USE intro_sql;

SELECT year(order_date) AS 'YEAR', SUM(freight) as 'Freight'
FROM orders
GROUP BY year(order_date);
