USE intro_sql;

SELECT product_name AS 'Product', category, unit_price AS 'Price'
FROM products
WHERE units_in_stock > 20
ORDER BY category ASC, unit_price DESC;