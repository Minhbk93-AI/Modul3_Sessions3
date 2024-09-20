CREATE DATABASE exercises3_5;
USE exercises3_5;

CREATE TABLE account(
	id INT PRIMARY KEY AUTO_INCREMENT,
    userName VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    status BIT
);

CREATE TABLE bill(
	id INT PRIMARY KEY AUTO_INCREMENT,
    billType BIT,
    accId INT,
    FOREIGN KEY(accId) REFERENCES account(id),
    created DATETIME,
    authDate DATETIME
);

CREATE TABLE billDetail(
	id INT PRIMARY KEY AUTO_INCREMENT,
    billId INT,
    FOREIGN KEY(billId) REFERENCES bill(id),
    productId INT,
    FOREIGN KEY(productId) REFERENCES product(id),
    quantity INT,
    price DOUBLE
);

CREATE TABLE product(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    created DATE,
    price DOUBLE,
    stock INT,
    status BIT
);

INSERT INTO account(userName, password, address, status)
VALUES ('Hùng','123456','Nghệ An',TRUE),('Cường','654321','Hà Nội',TRUE),('Bách','135790','Hà Nội',TRUE);

INSERT INTO bill(billType,accId,created,authDate)
VALUES (0,1,'2022-02-11','2022-03-12'),(0,1,'2023-05-10','2023-10-10'),(1,2,'2024-05-15','2022-05-20'),(1,3,'2022-02-01','2022-02-10');

INSERT INTO product(name, created, price, stock, status)
VALUES ('Quần Dài','2022-03-12', 1200, 5, TRUE),('Áo Dài','2023-03-15', 1500, 8, TRUE),('Mũ Cối','1999-03-08', 1600, 10, TRUE);

INSERT INTO billDetail(billId,productId,quantity,price)
VALUES (1,1,3,1200),(1,2,4,1500),(2,1,1,1200),(3,2,4,1500),(4,3,7,1600);

SELECT * FROM account
ORDER BY userName DESC;

SELECT * FROM bill
WHERE created BETWEEN '2023-02-11' AND '2023-05-15';

SELECT * FROM billDetail
ORDER BY billId;

SELECT * FROM product
ORDER BY name DESC;

SELECT * FROM product
WHERE stock > 10;

SELECT * FROM product
WHERE status = TRUE;
