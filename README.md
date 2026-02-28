# 🛒 Retail Sales Analysis (SQL Project)

##  Project Overview

This project analyzes retail sales data using MySQL.  
The goal is to perform data cleaning, exploratory data analysis (EDA), and business-driven analysis using structured SQL queries.

This project demonstrates:

- Database creation
- Data validation and cleaning
- Aggregations (SUM, AVG, COUNT)
- GROUP BY & HAVING
- Window functions (RANK)
- CTE (Common Table Expressions)
- Business insight generation

---

##  Database Information

- **Database Name:** `retail_analysis`
- **Table Name:** `retail_sales`
- **SQL Version Used:** MySQL 8.0
- **Data Source:** Excel dataset (converted to CSV for import)

---

##  Table Schema

```sql
CREATE TABLE retail_sales (
    transaction_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(20),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    cogs DECIMAL(10,2),
    total_sale DECIMAL(10,2)
);
Importing Excel Dataset into MySQL
Step 1: Convert Excel to CSV
Open Excel file
Click File → Save As
Choose format: CSV (Comma delimited)
Save as: retail_sales.csv
**Check MySQL Secure Folder**
SHOW VARIABLES LIKE 'secure_file_priv';
---

### Step 3: Import CSV into MySQL

```sql
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/retail_sales.csv'
INTO TABLE retail_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
Data Cleaning

Checked for NULL values and removed incomplete records.
SELECT *
FROM retail_sales
WHERE transaction_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR gender IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;
Exploratory Data Analysis (EDA)

Performed analysis on:
Total transactions
Unique customer
Revenue by category
Monthly sales trends
Top customers
Shift-based sales distribution

