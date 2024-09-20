CREATE DATABASE exercise2_1;
USE exercise2_1;
CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    created DATE
);
CREATE TABLE size (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    status BIT
);
CREATE TABLE color (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    status BIT
);

INSERT INTO color(name, status)
VALUES ('Red',TRUE),('Blue',TRUE),('Green',TRUE);
SELECT * FROM color;

INSERT INTO size(name, status)
VALUES ('X', TRUE),('M', TRUE),('L', TRUE), ('XL', TRUE),('XXL', TRUE);
SELECT* FROM size;

INSERT INTO product(name, created)
VALUES ('Quần dài', current_date()),('Áo dài', current_date()),('Mũ phớt', current_date());
SELECT* FROM product;



CREATE TABLE product_detail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    color_id INT,
    size_id INT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    status BIT,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (color_id) REFERENCES color(id),
    FOREIGN KEY (size_id) REFERENCES size(id)
);
INSERT INTO product_detail ( product_id, color_id, size_id, price, stock, status)
VALUES (1,1,1,1200,5,TRUE),(2,1,1,1500,2,TRUE),(1,2,3,500,3,TRUE),(1,2,3,1600,3,FALSE),(3,1,4,1200,5,TRUE),(3,3,5,1200,6,TRUE),(2,3,5,2000,10,FALSE);
SELECT* FROM product_detail WHERE price > 1200;
SELECT* FROM product_detail WHERE product_id=1;
