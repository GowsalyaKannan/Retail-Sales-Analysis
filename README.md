# 📊 Retail Sales Analysis using MySQL & Power BI

## 🔷 Project Overview

This project focuses on analyzing retail sales data to uncover key business insights related to sales performance, profitability, and customer segments. The analysis was performed using **MySQL for data querying** and **Power BI for data visualization and dashboard creation**.

The goal of this project is to help stakeholders make data-driven decisions by identifying trends, high-performing areas, and improvement opportunities.

---

## 🔷 Tools & Technologies

* **MySQL** – Data cleaning and analysis
* **ODBC Connector** – Database connectivity
* **Power BI** – Data modeling and dashboard creation
* **DAX (Data Analysis Expressions)** – Measures and calculations

---

## 🔷 Dataset Description

The dataset contains transactional retail data with the following key fields:

* Order ID
* Order Date
* Ship Date
* Customer ID
* Product Category & Sub-category
* Sales
* Profit
* Region
* Segment

---

## 🔷 Data Processing (MySQL)

### ✅ Data Cleaning

* Checked for null values 
* Removed duplicates where necessary
* Standardized column formats

### ✅ SQL Analysis

Created fact and dimension tables using **STAR Schema**.
Some key SQL queries used:

```sql
-- Total Sales
SELECT SUM(sales) AS total_sales FROM sales;

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

-- sales by month and year
SELECT 
YEAR(o.order_date) AS year,
MONTH(o.order_date) AS month,
SUM(s.sales) AS total_sales
FROM sales s 
JOIN orders o ON s.order_id = o.order_id
GROUP BY year,month
ORDER BY year,month;
```

---

## 🔷 Data Connection

The MySQL database was connected to Power BI using an **ODBC connector**:

* Installed MySQL ODBC driver
* Configured DSN connection
* Imported tables into Power BI

---

## 🔷 Data Modeling (Power BI)

* Established relationships between:

  * Orders
  * Sales
  * Products
  * Customers

---

## 🔷 DAX Measures

```DAX
Total Sales = SUM(sales[Sales])

Total Profit = SUM(sales[Profit])

Profit Margin = DIVIDE([Total Profit], [Total Sales])

Sales per Order = DIVIDE([Total Sales], DISTINCTCOUNT(orders[Order ID]))

---

## 🔷 Dashboard Features

### 📊 Executive Dashboard

* KPI Cards:

  * Total Sales
  * Total Revenue
  * Total Profit
  * Total Orders
  * Profit Margin

* Visualizations:

  * Sales by Category
  * Sales by Region
  * Sales by Segment
  * Sales by Sub-category
  * Year-wise Sales Trend

---

### 📊 Profitability Analysis

* Profit by Category
* Sales by Category
* Profit Margin insights

---

### 📊 Category & Product Deep Dive

* Drill-through functionality
* Product-level analysis
* Category performance

---

## 🔷 Key Insights

* Technology category generates the highest sales
* West region shows strongest performance
* Sales trend indicates steady growth over the years
* Consumer segment contributes the largest share
* Some sub-categories have high sales but low profitability

---

## 🔷 Business Recommendations

* Focus on high-performing categories like Technology
* Improve performance in low-performing regions
* Optimize pricing for low-margin products
* Expand high-demand sub-categories

---

## 🔷 Challenges Faced

* Managing relationships across multiple tables
* Ensuring dynamic DAX calculations

---

## 🔷 Project Outcome

Successfully developed an interactive dashboard that:

* Tracks sales and profit performance
* Enables dynamic filtering and drill-down
* Provides actionable business insights

---

## 🔷 Repository Structure

Contains README.md, SQL scripts, Power BI files, and dashboard screenshots.

---

## 🔷 How to Use

1. Clone the repository
2. Open `.pbix` file in Power BI Desktop
3. Ensure ODBC connection is configured
4. Refresh data if needed

---

## 🔷 Resume Highlight

**Retail Sales Analysis Project**
Developed an end-to-end retail analytics solution using MySQL and Power BI, implementing DAX measures and time intelligence to analyze sales trends, profitability, and regional performance.

---

## 🔷 Author

**Gowsalya**

---

