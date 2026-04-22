CREATE DATABASE sales_analysis;
USE sales_analysis;


CREATE TABLE orders (
	row_id INT,
    order_id VARCHAR(50),
    order_date VARCHAR(20),
    ship_date VARCHAR(20),
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),   
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales FLOAT,
    quantity INT,
    discount FLOAT,
    profit FLOAT
);


SET GLOBAL local_infile = 1;
LOAD DATA LOCAL INFILE 'C:/Users/LENOVO/OneDrive/Desktop/superstore_clean_v2.csv'
INTO TABLE orders
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT* from orders;
SELECT COUNT(*) from orders;

SELECT region, ROUND(SUM(sales),2) AS total_sales
FROM orders
GROUP BY region
ORDER BY total_sales DESC;

SELECT customer_name, ROUND(SUM(sales),2) AS total_spent
FROM orders
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 10;

SELECT product_name, ROUND(SUM(profit),2) AS total_profit
FROM orders
GROUP BY product_name
HAVING total_profit < 0
ORDER BY total_profit;

SELECT DATE_FORMAT(STR_TO_DATE(order_date,'%m/%d/%Y'), '%Y-%m') AS month,
       ROUND(SUM(sales),2) AS monthly_sales
FROM orders
GROUP BY month
ORDER BY month;
 
SELECT category, ROUND(SUM(profit),2) AS total_profit
FROM orders
GROUP BY category
ORDER BY total_profit DESC;


