DROP DATABASE Testing_Exam1;
CREATE DATABASE Testing_Exam1;
USE Testing_Exam1;
-- CREATE TABLE CUSTOMER
DROP TABLE IF EXISTS CUSTOMER;
CREATE TABLE CUSTOMER (
    CustomerID     TINYINT UNSIGNED primary key AUTO_INCREMENT,
    Name           VARCHAR(20) NOT NULL UNIQUE KEY,        -- tên của khách hàng.
    Phone          VARCHAR(20) NOT NULL,           -- số điện thoại của khách hàng.
    Email          VARCHAR(20) NOT NULL,                 -- địa chỉ email của khách hàng.
    Address        VARCHAR(20) NOT NULL,                 -- địa chỉ của khách hàng.
    Note           VARCHAR(50) NULL                     -- tóm tắt mô tả về khách hàng.
);

INSERT INTO     CUSTOMER (Name,Phone,Email,Address,Note)
    VALUES      ('levanhoan','0502311234','lehoan@gmail.com','23hangbuom','detinh'),
                ('hongocha','09033241172','ngocha@gmail.com','nghean','nhinhanh'),
                ('maivanhuong','07033241172','huong23@gmail.com','hatinh','hoigat'),
                ('trinhvantuan','07068806757','tuan99@gmail.com','hanoi','ngoan'),
                ('hoanglong','09068806757','longdt@gmail.com','hanoi','deptrai');


-- CREATE TABLE  CAR
DROP TABLE IF EXISTS CAR;
CREATE TABLE  CAR (
    CarID       TINYINT UNSIGNED primary key AUTO_INCREMENT,    -- mã oto, primary key.
    Maker       ENUM ('HONDA','TOYOTA','NISSAN'),               -- tên hãng sản xuất (chỉ có thể là 3 giá trị: ‘HONDA’, ‘TOYOTA’,‘NISSAN’).
    Model        VARCHAR(20) NOT NULL ,                         -- tên của mẫu xe.
    Year        INT UNSIGNED,                                                -- năm sản xuất.
    Color       ENUM ('black','white','yellow'),                      -- màu của xe (black, white, yellow...).
    Note        VARCHAR(50) NULL                                                  -- tóm tắt mô tả về xe.
);
INSERT INTO     CAR (Maker,Model,`Year`,Color,Note)
VALUES          ('HONDA','honda','1989','black','di em'),
                 ('TOYOTA','toyota','1978','white','khong co gi'),
                  ('TOYOTA','toyota','1969','yellow','di em'),
                   ('NISSAN','nissan','2001','white','tiet kiem xang'),
                    ('NISSAN','nissan','1999','yellow','ngoi thoai mai');

-- CREATE TABLE  CAR_ORDER
DROP TABLE IF EXISTS CAR_ORDER;
CREATE TABLE  CAR_ORDER (        
 OrderID       TINYINT UNSIGNED primary key AUTO_INCREMENT,      -- mã đơn hàng, primary key, auto increment.
 CustomerID    TINYINT UNSIGNED,                                      -- mã khách hàng, foreign key.
 CarID          TINYINT UNSIGNED,                                     -- mã oto, foreign key.
 Amount         TINYINT UNSIGNED NOT NULL DEFAULT 1,                                   -- số lượng oto, default value = 1.
 SalePrice      INT UNSIGNED NOT NULL,                              -- giá bán oto.
 OrderDate       DATE,                                       -- ngày bán .
 DeliveryDate    DATE,                                       -- ngày giao hàng.
 DeliveryAddress   VARCHAR(50),                                     -- địa chỉ giao hàng.
 Staus             CHAR(15) DEFAULT 1,                 -- trạng thái của đơn hàng (0: đã đặt hàng, 1: đã giao, 2: đã hủy), mặc địnhtrạng thái là đã đặt hàng.
 Note              VARCHAR(50),                 -- tóm tắt mô tả về đơn hàng.
        FOREIGN KEY (CustomerID) REFERENCES CUSTOMER (CustomerID),
        FOREIGN KEY (CarID) REFERENCES CAR (CarID)
);
INSERT INTO     CAR_ORDER (CustomerID,CarID,Amount,SalePrice,OrderDate,DeliveryDate,DeliveryAddress,Staus,Note)
VALUES          ('1','2','1','123000000','2021-10-02','2021-10-14','hue','đã đặt hàng','khong'),
                ('2','1','1','213000000','2021-10-03','2021-10-12','hanoi','đã đặt hàng','khong'),
                ('3','3','1','100000000','2021-10-04','2021-10-15','danang','đã đặt hàng','khong'),
                ('2','4','1','200000000','2021-10-01','2021-10-21','camau','đã đặt hàng','khong'),
                ('4','2','1','300000000','2021-10-06','2021-10-24','donganh','đã đặt hàng','khong');
                
                

                
                
                
               
        