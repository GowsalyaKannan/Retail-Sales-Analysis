#importing data 
CREATE DATABASE superstore_project;
USE superstore_project;

SELECT * FROM superstore;

#EDA
#Check total records
SELECT COUNT(*) FROM superstore; 

#check null values
SELECT * FROM superstore
WHERE Sales IS NULL
OR `Order ID` IS NULL;

#check unique values
SELECT DISTINCT Segment FROM superstore;
SELECT DISTINCT Region From superstore;
SELECT DISTINCT Category FROM superstore;
SELECT DISTINCT `Sub-Category` FROM superstore;
SELECT COUNT(DISTINCT State) FROM superstore;
SELECT COUNT(DISTINCT City) FROM superstore;

#Basic metrics
SELECT SUM(Sales) AS total_sales,
SUM(Profit) AS total_profit,
SUM(quantity) AS total_quantity
FROM superstore;

#check duplicates (i.e) multiple orders per order_id 
SELECT `Order ID`, 	COUNT(*)
FROM superstore
GROUP BY `Order ID`
HAVING COUNT(*) > 1;

#Data Cleaning and Data Modeling
#Creating fact and dimension tables 
#Creating and importing data into the table
CREATE TABLE customers AS
SELECT DISTINCT 
`Customer ID` AS customer_id,
`Customer Name` AS customer_name,
Segment AS segment
FROM superstore;

#Convert date format in powerbi as it throws errors
#Inconsistencies can be handled using CASE WHEN but simple in powerbi
CREATE TABLE orders AS
SELECT DISTINCT
`Order ID` AS order_id,
`Order Date` AS order_date,
`Ship Date` AS ship_date,
`Ship Mode` AS ship_mode,
Region AS region,
`Customer ID` AS customer_id
FROM superstore; 

CREATE TABLE products AS
SELECT DISTINCT 
`Product ID` AS product_id,
`Product Name` AS product_name,
Category AS category,
`Sub-Category` AS sub_category
FROM superstore;

CREATE TABLE sales AS
SELECT
`Order ID` AS order_id,
`Product ID` AS product_id,
Sales AS sales,
Quantity AS quantity,
Discount AS discount,
Profit AS profit
FROM superstore;

#Data Validation - Joins
SELECT o.order_id,
o.region,
c.customer_name,
p.product_name,
s.sales,
s.profit
FROM sales s
JOIN orders o ON s.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
LIMIT 10;

#sales by region
SELECT o.region,
SUM(s.sales) AS total_sales
FROM sales s
JOIN orders o ON s.order_id = o.order_id
GROUP BY o.region;

#profit by category
SELECT p.category,
SUM(s.profit) AS total_profit
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category;

#top 10 products
SELECT p.product_name,
SUM(s.sales) AS total_sales
FROM sales s 
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC 
LIMIT 10;
 
#changing text format to date format by altering the orders table
ALTER TABLE orders
ADD COLUMN order_date_clean DATE;

SET SQL_SAFE_UPDATES = 0;

UPDATE orders
SET order_date_clean = STR_TO_DATE(order_date, '%m/%d/%Y');

SET SQL_SAFE_UPDATES = 1;

#verifying the conversion
SELECT order_date, order_date_clean
FROM orders
LIMIT 20;

#check null values 
SELECT order_date
FROM orders
WHERE STR_TO_DATE(order_date, '%m/%d/%Y') IS NULL;

#Drop old column
ALTER TABLE orders 
DROP COLUMN order_date;

#Replace new column name with old column name
ALTER TABLE orders 
CHANGE order_date_clean order_date DATE; 

#sales by month and year
SELECT 
YEAR(o.order_date) AS year,
MONTH(o.order_date) AS month,
SUM(s.sales) AS total_sales
FROM sales s 
JOIN orders o ON s.order_id = o.order_id
GROUP BY year,month
ORDER BY year,month;

#create view 
CREATE VIEW executive_dashboard AS
SELECT
o.order_date,
o.region,
c.segment,
p.category,
p.sub_category,
SUM(s.sales) AS total_sales,
SUM(s.profit) AS total_profit,
SUM(s.quantity) AS total_quantity
FROM sales s
JOIN orders o ON s.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY
o.order_date,
o.region,
c.segment,
p.category,
p.sub_category;





