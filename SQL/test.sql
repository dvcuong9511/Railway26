DROP DATABASE Testing_Exam1;
CREATE DATABASE Testing_Exam1;
USE Testing_Exam1;
                    -- CUSTOMER = khach hang
                    -- CAR = oto
                    -- CAR_ORDER = oto da dat hang
-- 2.Viết lệnh lấy ra thông tin của khách hàng: tên, số lượng oto khách hàng đã
    -- mua và sắp sếp tăng dần theo số lượng oto đã mua.

SELECT      a.CustomerID,a.`Name`,COUNT(q.Amount)
FROM        customer a
JOIN        car_order q ON q.CustomerID = a.CustomerID
GROUP BY    a.CustomerID
ORDER BY    q.Amount ASC;