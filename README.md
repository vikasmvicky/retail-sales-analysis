# 🛒 Retail Sales Analysis (SQL Project)

## 📖 Project Overview

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

## 🗂 Database Information

- **Database Name:** `retail_analysis`
- **Table Name:** `retail_sales`
- **SQL Version Used:** MySQL 8.0
- **Data Source:** Excel dataset (converted to CSV for import)

---

## 🏗 Table Schema

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
