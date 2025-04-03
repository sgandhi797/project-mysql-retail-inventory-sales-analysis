-- PROJECT: Retail Inventory and Sales Analysis (MySQL) using Superstore Dataset (Kaggle)


SELECT 
    *
FROM
    orders
;


-- Converting date format of orders.OrderDate from dd/mm/yyyy to yyyy/mm/dd
UPDATE orders 
SET 
    OrderDate = STR_TO_DATE(OrderDate, '%m/%d/%Y')
;


-- Converting date format of orders.ShipDate from dd/mm/yyyy to yyyy/mm/dd
UPDATE orders 
SET 
    ShipDate = STR_TO_DATE(ShipDate, '%m/%d/%Y')
;


-- Reviewing data within returns table
SELECT 
    *
FROM
    returns
;


-- Reviewing data within people table
SELECT 
    *
FROM
    people
;


-- 1a. Top 10 Products by Sales
SELECT 
    ProductName, 
    ROUND(SUM(Sales), 2) AS TotalSales
FROM
    orders
GROUP BY ProductName
ORDER BY TotalSales DESC
LIMIT 10
;


-- 1b. Top Categories by Sales
SELECT 
    Category, 
    ROUND(SUM(Sales), 2) AS TotalSales
FROM
    orders
GROUP BY Category
ORDER BY TotalSales DESC
LIMIT 10
;


-- 2a. Sales by Region
SELECT 
    Region, 
    ROUND(SUM(Sales), 2) AS TotalSales
FROM
    orders
GROUP BY Region
ORDER BY TotalSales DESC
;


-- 2b. Top 10 States by Sales
SELECT 
    State, 
    ROUND(SUM(Sales), 2) AS TotalSales
FROM
    orders
GROUP BY State
ORDER BY TotalSales DESC
LIMIT 10
;


-- 3. Return Rate by Product
SELECT 
    o.ProductName,
    COUNT(r.OrderID) AS Returns,
    COUNT(o.OrderID) AS TotalOrders,
    ROUND(COUNT(r.OrderID) / COUNT(o.OrderID) * 100,
            2) AS ReturnRatePercentage
FROM
    orders o
        LEFT JOIN
    returns r ON o.OrderID = r.OrderID
GROUP BY o.ProductName
ORDER BY ReturnRatePercentage DESC
LIMIT 10
;


-- 4. Monthly Sales Trend
SELECT 
    DATE_FORMAT(OrderDate, '%Y/%m') AS YearMonth,
    ROUND(SUM(Sales), 2) AS MonthlySales
FROM
    orders
GROUP BY YearMonth
ORDER BY YearMonth DESC
;


-- 5. Sales vs. Profit Margin by Product
SELECT 
    ProductName,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit,
    ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
            2) AS ProfitMarginPercentage
FROM
    orders
GROUP BY ProductName
HAVING TotalSales > 1000
ORDER BY ProfitMarginPercentage DESC
LIMIT 10
;

