USE intro_sql;

CREATE TABLE shippers (
	id INT NOT NULL AUTO_INCREMENT,
    shipper_name VARCHAR(255),
    phone VARCHAR(255),
    PRIMARY KEY (id)
);

-- THE TABLE WILL BE EMPTY, BUT SHOWS THE COLUMNS CREATED
SELECT * FROM shippers;