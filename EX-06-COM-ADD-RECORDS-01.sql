USE intro_sql;

-- INSERT RECORDS INTO THE SHIPPERS TABLE
INSERT INTO shippers (shipper_name, phone)
VALUES ('Speedy Express', '503 555-9831'),
('United Package', '503 555-3199'),
('Federal Shipping', '503 555-9931');

-- CHECK FOR RECORDS
SELECT * FROM shippers;