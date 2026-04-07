# 📊 Retail Sales Analysis Dashboard

## 📌 Project Overview

This project analyzes retail sales data to uncover key business insights related to **revenue, profit, product performance, and regional trends**. The analysis was performed using **MySQL for data querying** and **Power BI for visualization** enabling data-driven decision-making.

---

## 🎯 Business Objective

* Analyze sales and profit trends over time
* Identify high-performing and low-performing products
* Evaluate category-wise and regional performance
* Provide actionable insights to improve profitability

---

## 🛠 Tools & Technologies Used

* **MySQL** – Data extraction and analysis
* **Power BI** – Data Modeling and Dashboard creation 
* **DAX** – KPI calculations
* **ODBC Connector** – Data connectivity

---

## 🗂 Dataset Details

The dataset includes:

* Order Date, Region, Segment
* Product Category & Sub-Category
* Sales, Profit, Quantity
* Customer Information

---

## 🔷 Data Processing (MySQL)  

Key steps performed:

* Checked for null values 
* Standardized column formats
* Handled date conversions
* Joined multiple tables
* Prepared dataset for analysis and visualization in Power BI

---

### SQL Analysis Queries

### 🔹 Key KPI Queries

```sql
-- Total Sales
SELECT SUM(sales) AS total_sales FROM sales;
```

### 🔹 Data Validation - Joins

```sql
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
```

---

### 🔹 Analytical Queries

**sales by region**

```sql
SELECT o.region,
SUM(s.sales) AS total_sales
FROM sales s
JOIN orders o ON s.order_id = o.order_id
GROUP BY o.region;
```

**profit by category**

```sql
SELECT p.category,
SUM(s.profit) AS total_profit
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category;
```

**sales by month and year**

``sql
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

## 🔷 Data Transformation (Power Query)

* Minor transformations done using **Power Query**

  * Checking datatypes
  * Checking column consistency
  * Column transformations

---

## 📊 Dashboard Overview

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

## 🔷 DAX Measures

```DAX
Total Sales = SUM(sales[Sales])

Total Profit = SUM(sales[Profit])

Profit Margin = DIVIDE([Total Profit], [Total Sales])

Sales per Order = DIVIDE([Total Sales], DISTINCTCOUNT(orders[Order ID]))
```

---

## 🔷 Key Insights

* **Technology** category generates the **highest sales**
* **West** region shows **strongest performance**
* Sales trend indicates steady growth over the years
* **Consumer** segment contributes the **largest share**
* Some sub-categories have high sales but low profitability

---

## 🔷 Business Recommendations

* Focus on **high-margin products** to improve profitability
* Review pricing strategy for low-profit products
* Optimize inventory for top-performing categories
* Reduce losses from underperforming products
* Target high-performing regions for expansion

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

## 📸 Dashboard Preview

### Data Modeling

![Star Schema](4_Screenshots/01_star_schema.png)

### Executive Dashboard

![Executive Dashboard](4_Screenshots/02_executive_dashboard.png)

### Profitability Analysis

![Profitability Analysis](4_Screenshots/03_profitability_analysis.png)

### Category and Product Deep Dive

![Deep Dive](4_Screenshots/04_deep_dive.png)

---

## 📁 Project Structure

```
Retail-Sales-Analysis/
│
├── 1_Dataset/
├── 2_SQL/
├── 3_PowerBI/
├── 4_Screenshots/
└── README.md
```

---

## 🔗 Project Files

* Dataset
* SQL Queries
* Power BI Dashboard (.pbix)
* Dashboard Screenshots

---

## 🔷 How to Use

1. Open SQL scripts to understand data preparation
2. Connect Power BI to MySQL using ODBC
3. Load dataset and refresh dashboard
4. Explore insights using filters and visuals
   
---

## 📌 Key Skills Demonstrated

* Data Analysis (SQL)
* Data Cleaning & Transformation
* Data Visualization (Power BI)
* KPI Development & DAX
* Business Insight Generation
* Dashboard Design

---

## 📬 Conclusion

This project demonstrates how retail data can be transformed into actionable insights to **increase revenue, improve profit margins, and optimize product strategy**.

---

## 🔗 Author

**Gowsalya Kannadhasan**
LinkedIn: www.linkedin.com/in/gowsalya-kannadhasan-0a7017139
GitHub: https://github.com/GowsalyaKannan
