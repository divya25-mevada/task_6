show databases;
use divdbb;
CREATE TABLE online_sales (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    product_id INT
);

INSERT INTO online_sales (order_id, order_date, amount, product_id)
 VALUES

(1, '2023-01-05', 150.00, 101),
(2, '2023-01-12', 200.00, 102),
(3, '2023-01-18', 75.50, 103),
(4, '2023-01-25', 300.00, 101),
(5, '2023-01-30', 125.00, 104),

(6, '2023-02-03', 180.00, 102),
(7, '2023-02-10', 220.00, 105),
(8, '2023-02-14', 350.00, 101),
(9, '2023-02-22', 90.00, 103),
(10, '2023-02-28', 400.00, 104),
(11, '2023-03-05', 250.00, 102),
(12, '2023-03-12', 175.00, 105),
(13, '2023-03-15', 300.00, 101),
(14, '2023-03-20', 125.00, 103),
(15, '2023-03-25', 450.00, 104),
(16, '2023-04-02', 200.00, 102),
(17, '2023-04-08', 275.00, 105),
(18, '2023-04-15', 150.00, 101),
(19, '2023-04-20', 100.00, 103),
(20, '2023-04-29', 500.00, 104),
(21, '2023-05-03', 225.00, 102),
(22, '2023-05-10', 325.00, 105),
(23, '2023-05-18', 175.00, 101),
(24, '2023-05-22', 125.00, 103),
(25, '2023-05-30', 550.00, 104),
(26, '2023-06-05', 250.00, 102),
(27, '2023-06-12', 375.00, 105),
(28, '2023-06-18', 200.00, 101),
(29, '2023-06-24', 150.00, 103),
(30, '2023-06-30', 600.00, 104),
(31, '2022-12-10', 100.00, 101),
(32, '2022-12-15', 200.00, 102),
(33, '2022-11-05', 75.00, 103),
(34, '2022-11-20', 250.00, 104),
(35, '2022-10-08', 150.00, 105);

SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    online_sales
GROUP BY
    YEAR(order_date), MONTH(order_date)
ORDER BY
    year, month;
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue
FROM
    online_sales
GROUP BY
    YEAR(order_date), MONTH(order_date)
ORDER BY
    total_revenue DESC
LIMIT 3;
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    online_sales
WHERE
    order_date BETWEEN '2023-01-01' AND '2023-03-31'
GROUP BY
    YEAR(order_date), MONTH(order_date)
ORDER BY
    year, month;
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY 
    year ASC,
    month ASC;
    SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    online_sales
GROUP BY
    year, month  -- Grouping by both year and month
ORDER BY
    year, month;  -- Sorting chronologically
    SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    online_sales
GROUP BY
    year, month
ORDER BY
    year ASC,          -- Sorts years in ascending order (oldest to newest)
    month ASC;         -- Sorts months in ascending order (January to December)