-- Preview data
SELECT *
FROM sales
LIMIT 5;

-- Total Sales by Category
SELECT Category, ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY Category
ORDER BY total_sales DESC;

-- Total Profit by Category
SELECT Category, ROUND(SUM(Profit), 2) AS total_profit
FROM sales
GROUP BY Category
ORDER BY total_profit DESC;

-- Top 10 Customers by Sales
SELECT "Customer Name" AS customer_name,
       ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY "Customer Name"
ORDER BY total_sales DESC
LIMIT 10;

-- Sales by Region
SELECT Region, ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY Region
ORDER BY total_sales DESC;

-- Monthly Sales Trend
SELECT strftime('%Y-%m', "Order Date") AS month,
       ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY month
ORDER BY month;