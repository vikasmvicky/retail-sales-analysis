-- Retail Sales Analysis - P1

CREATE DATABASE IF NOT EXISTS retail_analysis;
USE retail_analysis;

DROP TABLE IF EXISTS retail_sales;

CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
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

-- After creating table, import using Table Data Import Wizard
-- Make sure to use existing table (retail_sales)

-- Data Cleaning
SELECT *
FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR gender IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

-- Total Sales
SELECT COUNT(*) AS total_sales
FROM retail_sales;

-- Total Revenue
SELECT SUM(total_sale) AS total_revenue
FROM retail_sales;

-- Unique Customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM retail_sales;

-- Unique Categories
SELECT DISTINCT category
FROM retail_sales;

-- Sales on specific date
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';

-- Clothing sales > 10 quantity in Nov 2022
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND YEAR(sale_date) = 2022
  AND MONTH(sale_date) = 11
  AND quantity > 10;

-- Revenue per category
SELECT 
    category,
    SUM(total_sale) AS total_revenue,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category
ORDER BY total_revenue DESC;

-- Average age for Beauty category
SELECT ROUND(AVG(age),2) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';

-- High value transactions
SELECT *
FROM retail_sales
WHERE total_sale > 1000;

-- Transactions by gender in each category
SELECT 
    category,
    gender,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY category, gender
ORDER BY category;

-- Best selling month per year
SELECT year, month, avg_sale
FROM (
    SELECT 
        YEAR(sale_date) AS year,
        MONTH(sale_date) AS month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER (
            PARTITION BY YEAR(sale_date)
            ORDER BY AVG(total_sale) DESC
        ) AS rnk
    FROM retail_sales
    GROUP BY YEAR(sale_date), MONTH(sale_date)
) t
WHERE rnk = 1;

-- Top 5 customers
SELECT 
    customer_id,
    SUM(total_sale) AS total_spent
FROM retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;

-- Unique customers per category
SELECT 
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;

-- Shift analysis
WITH shift_data AS (
    SELECT *,
        CASE
            WHEN HOUR(sale_time) < 12 THEN 'Morning'
            WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM retail_sales
)
SELECT 
    shift,
    COUNT(*) AS total_orders
FROM shift_data
GROUP BY shift;

-- Profit analysis
SELECT 
    category,
    SUM(total_sale - cogs) AS total_profit
FROM retail_sales
GROUP BY category
ORDER BY total_profit DESC;