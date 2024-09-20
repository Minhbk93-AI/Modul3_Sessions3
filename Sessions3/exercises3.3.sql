CREATE DATABASE exercises2_3;
USE exercises2_3;

CREATE TABLE VatTu(
 maVT INT PRIMARY KEY AUTO_INCREMENT,
 tenVT VARCHAR(255) NOT NULL
);

CREATE TABLE DonDatHang(
 soDH INT PRIMARY KEY AUTO_INCREMENT,
 maNCC INT,
 ngayDH DATETIME
);
 CREATE TABLE ChiTietDonDatHang(
 maVT INT NOT NULL,
 soDH INT NOT NULL,
 FOREIGN KEY (maVT) REFERENCES VatTu(maVT),
 FOREIGN KEY (soDH) REFERENCES DonDatHang(soDH)
 );

CREATE TABLE NhaCungCap(
 maNCC INT,
 tenNCC VARCHAR(255) NOT NULL,
 diaChi VARCHAR(255) NOT NULL,
 soDienThoai VARCHAR(11) NOT NULL,
 FOREIGN KEY (maNCC) REFERENCES DonDatHang(maNCC)
);

CREATE TABLE PhieuXuat(
 soPx INT PRIMARY KEY AUTO_INCREMENT,
 ngayXuat DATETIME
);

CREATE TABLE PhieuXuatChiTiet(
 soPx INT NOT NULL,
 maVT INT NOT NULL,
 FOREIGN KEY( soPX) REFERENCES PhieuXuat(soPx),
 FOREIGN KEY(maVT) REFERENCES VatTu(maVT),
 donGiaXuat DOUBLE,
 soLuongXuat INT
);

CREATE TABLE PhieuNhap(
 soPn INT PRIMARY KEY AUTO_INCREMENT,
 ngayNhap DATETIME
);

CREATE TABLE PhieuNhapChiTiet(
 soPn INT NOT NULL,
 maVT INT NOT NULL,
 FOREIGN KEY (soPn) REFERENCES PhieuNhap(soPn),
 FOREIGN KEY (maVT) REFERENCES VatTu(maVT),
 donGiaNhap DOUBLE,
 soLuongNhap INT
);

INSERT INTO VatTu (tenVT)
VALUES ('Cement'), ('Steel'), ('Bricks'), ('Paint'), ('Tiles'), ('Sand'), ('Wood'), ('Glass'), ('Pipes'), ('Nails');

INSERT INTO DonDatHang (maNCC, ngayDH) 
VALUES (1, '2024-02-15'), (2, '2024-02-16'), (3, '2024-01-10'), (4, '2024-03-05'), (5, '2024-02-20');

INSERT INTO NhaCungCap (tenNCC, diaChi, soDienThoai)
VALUES ('Supplier A', '123 Supplier St', '0912345678'), 
       ('Supplier B', '456 Supply Blvd', '0987654321'), 
       ('Supplier C', '789 Material Ave', '0901234567'),
       ('Supplier D', '321 Industry Rd', '0945678901'),
       ('Supplier E', '654 Build Ln', '0976543210');

INSERT INTO PhieuXuatChiTiet (soPx, maVT, donGiaXuat, soLuongXuat)
VALUES (1, 1, 120, 50), (1, 2, 150, 30), (2, 3, 60, 100), (3, 4, 200, 20), (4, 5, 90, 70), 
       (4, 6, 50, 150), (5, 7, 75, 25), (6, 8, 180, 10), (6, 9, 300, 5), (6, 10, 10, 500);

INSERT INTO PhieuNhapChiTiet (soPn, maVT, donGiaNhap, soLuongNhap)
VALUES (1, 1, 100, 200), (1, 2, 140, 120), (2, 3, 55, 300), (3, 4, 195, 40), (3, 5, 80, 90), 
       (4, 6, 45, 500), (5, 7, 70, 80), (5, 8, 175, 60), (6, 9, 280, 15), (6, 10, 8, 600);

SELECT v.tenVT, SUM(pct.soLuongXuat) AS total_sold
FROM VatTu v
JOIN PhieuXuatChiTiet pct ON v.maVT = pct.maVT
GROUP BY v.tenVT
ORDER BY total_sold DESC LIMIT 3;

SELECT v.tenVT, 
       SUM(pnct.soLuongNhap) - COALESCE(SUM(pct.soLuongXuat), 0) AS remaining_stock
FROM VatTu v
LEFT JOIN PhieuNhapChiTiet pnct ON v.maVT = pnct.maVT
LEFT JOIN PhieuXuatChiTiet pct ON v.maVT = pct.maVT
GROUP BY v.tenVT
ORDER BY remaining_stock DESC;

SELECT DISTINCT ncc.tenNCC, ncc.diaChi, ncc.soDienThoai
FROM NhaCungCap ncc
JOIN DonDatHang ddh ON ncc.maNCC = ddh.maNCC
WHERE ddh.ngayDH BETWEEN '2024-02-12' AND '2024-02-22';
