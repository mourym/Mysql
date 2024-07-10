USE intro_sql;

-- SELECT STATEMENT WITH WHERE CLAUSE
SELECT product_name AS 'Product', category, units_in_stock, discontinued AS 'Units'
FROM products
WHERE (category = 'Beverages' AND discontinued <> 1) OR 
(category = 'Dairy Products' AND discontinued <> 1);

-- STREAMLINE THE WHERE CONDITION USING THE IN FUNCTION
SELECT product_name AS 'Product', category, units_in_stock, discontinued AS 'Units'
FROM products
WHERE category IN('Beverages', 'Dairy Products') AND discontinued <> 1;