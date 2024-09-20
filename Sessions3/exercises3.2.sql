CREATE DATABASE exercises2_2;
USE exercises2_2;
CREATE TABLE products(
  pId INT AUTO_INCREMENT PRIMARY KEY,
  pName VARCHAR(255) NOT NULL,
  pPrice DOUBLE NOT NULL
);
INSERT INTO products(pName, pPrice)
VALUES ('Máy giặt',300),('Tủ lạnh',500),('Điều Hòa',700),('Quat',100),('Bep Điện', 200),('May Hut Mui',500);
SELECT* FROM products;

CREATE TABLE customers(
	cId INT AUTO_INCREMENT PRIMARY KEY,
	cName VARCHAR(255) NOT NULL,
    cAge INT NOT NULL
);
INSERT INTO customers(cName, cAge)
VALUES ('Minh Quân', 10),('Ngọc Anh',20),('Hồng Hà',50);
SELECT* FROM customers
INNER JOIN orders ON customers.cId = orders.cId
;
SELECT* FROM customers
LEFT JOIN orders ON customers.cId = orders.cId
WHERE customers.cId IS NULL;
;


CREATE TABLE orders(
	oId INT AUTO_INCREMENT PRIMARY KEY,
    cId INT NOT NULL,
    FOREIGN KEY (cId) REFERENCES customers(cId),
    oDate DATETIME,
    oTotalPrice DOUBLE
);

INSERT INTO orders(cId, oDate, oTotalPrice) 
VALUES (1, '2006-03-21', 150000),(2, '2006-03-26', 200000),(1, '2006-05-21',170000);
SELECT* FROM orders;

CREATE TABLE orderDetail(
  oId INT NOT NULL,
  pId INT NOT NULL,
  FOREIGN KEY (oId) REFERENCES orders(oId),
  FOREIGN KEY (pId) REFERENCES products(pId),
  odQuantity INT
);

INSERT INTO orderDetail(oId, pId, odQuantity)
VALUES (1,1,3),(1,3,7),(1,4,2),( 2,1,1),(3,1,8),(2,5,4),(2,3,3);
SELECT * FROM orderDetail;

SELECT 
    o.oId AS oId, 
    o.oDate AS oDate, 
    SUM(od.odQuantity * p.pPrice) AS oTotalPrice
FROM 
    orders o
JOIN 
    orderDetail od ON o.oId = od.oId
JOIN 
    products p ON od.pId = p.pId
GROUP BY 
    o.oId, o.oDate;