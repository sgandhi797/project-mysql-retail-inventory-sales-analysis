# 🛒 Retail Inventory and Sales Analysis (SQL Project)

> A comprehensive SQL-based analysis of a retail dataset to uncover trends in sales, regional performance, inventory efficiency, and return behavior. This project demonstrates strong proficiency in MySQL, data cleaning, querying, and business insight generation.

---

## 📈 Project Overview

- This project explores and analyzes retail sales and inventory data using **MySQL**. The goal is to extract valuable insights into product performance, regional revenue, monthly sales trends, and return rates. The analysis simulates how a business analyst or data analyst would interact with company data to inform strategic decisions.

---

## 📦 Dataset

- **Source**: [Kaggle – Superstore Sales Data](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
- **Tables Used**:
  - `orders` – transactional sales data
  - `returns` – records of returned orders
  - `people` – sales representatives
- The dataset includes orders from 2014–2017 and contains fields such as `OrderDate`, `Sales`, `Category`, `Profit`, `Region`, and `Product`.

---

## 📂 Project Structure

```text
project-mysql-retail-inventory-sales-analysis/
├── dataset/
│   └── Sample Dataset - Superstore Sales.xlsx       # Raw dataset (Superstore Sales)
│   └── Orders.csv                                   # Raw dataset (Superstore Sales)
│   └── Returns.csv                                  # Raw dataset (Superstore Sales)                              
│   └── People.csv                                   # Raw dataset (Superstore Sales)
├── key_sql_queries/
│   ├── date_format_conversion.sql                   # Change orders.OrderDate column from dd/mm/yyyy to yyyy/mm/dd format
│   ├── date_format_conversion.sql                   # Change orders.ShipDate column from dd/mm/yyyy to yyyy/mm/dd format
│   ├── top_10_products_by_sales.sql                 # Top 10 products by total sales
│   ├── top_categories_by_sales.sql                  # Categories by total sales
│   ├── sales_by_region.sql                          # Region  by total sales
│   ├── top_10_states_by_sales.sql                   # Top 10 states by total sales
│   ├── return_rate_by_product.sql                   # Top 10 products by return rates
│   ├── monthly_sales_trend.sql                      # Date (yyyy/mm) by total monthly sales
│   ├── sales_vs._profit_margin_by_product.sql       # Products by profit margin
├── visualizations/
│   └── TBA                                          # Visualizations (charts, trends, dashboards)
├── key_insights/
│   └── business_insights.md                         # Summary of business insights and analysis
└── README.md                                        # Project overview, instructions, and insights
```

---

## 💡 Business Questions Answered

1. 📊 **Which products and categories drive the most sales?**
2. 🌎 **Which states and regions generate the most revenue?**
3. 🔁 **Which products have the highest return rates?**
4. 📆 **How do sales vary month-over-month?**
5. 💸 **Are there products with high revenue and low profit margins?**

---

## 🔍 Key SQL Queries

- `date_format_conversion.sql` 
  ```sql
  UPDATE orders 
  SET 
      OrderDate = STR_TO_DATE(OrderDate, '%m/%d/%Y')
  ;

- `date_format_conversion.sql`
  ```sql
  UPDATE orders 
  SET 
      ShipDate = STR_TO_DATE(ShipDate, '%m/%d/%Y')
  ;

- `top_10_products_by_sales.sql`
  ```sql
  SELECT 
      ProductName, 
      ROUND(SUM(Sales), 2) AS TotalSales
  FROM
      orders
  GROUP BY ProductName
  ORDER BY TotalSales DESC
  LIMIT 10
  ;

- `top_categories_by_sales.sql`
  ```sql
  SELECT 
      Category, 
      ROUND(SUM(Sales), 2) AS TotalSales
  FROM
      orders
  GROUP BY Category
  ORDER BY TotalSales DESC
  LIMIT 10
  ;

- `sales_by_region.sql`
  ```sql
  SELECT 
      Region, 
      ROUND(SUM(Sales), 2) AS TotalSales
  FROM
      orders
  GROUP BY Region
  ORDER BY TotalSales DESC
  ;

- `top_10_states_by_sales.sql`
  ```sql
  SELECT 
      State, 
      ROUND(SUM(Sales), 2) AS TotalSales
  FROM
      orders
  GROUP BY State
  ORDER BY TotalSales DESC
  LIMIT 10
  ;

- `return_rate_by_product.sql`
  ```sql
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

- `monthly_sales_trend.sql`
  ```sql
  SELECT 
      DATE_FORMAT(OrderDate, '%Y/%m') AS YearMonth,
      ROUND(SUM(Sales), 2) AS MonthlySales
  FROM
      orders
  GROUP BY YearMonth
  ORDER BY YearMonth DESC
  ;

- `sales_vs._profit_margin_by_product.sql`
  ```sql
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

---

## 📊 Visualizations

- TBA

---

## 📌 Key Insights

- California and New York are the most profitable states, with the highest sales volume.
- Office Supplies generate more consistent sales year-round compared to Furniture.
- Certain products, like tables, have disproportionately high return rates and low margins.
- December consistently spikes in sales, suggesting seasonal marketing opportunities.

---

## 🚀 How to Use

- Clone this repo:
  - `git clone https://github.com/sgandhi797/project-mysql-retail-inventory-sales-analysis.git`
  - cd project-mysql-retail-inventory-sales-analysis
- Import Orders.csv, Returns.csv, and People.csv into your MySQL database.
- Run scripts from /key_sql_queries in MySQL Workbench, DBeaver, or command line.

---

## 📚 Tools & Technologies

- **MySQL**: Data cleaning, querying, joins, aggregations
- **Excel/Sheets**: Quick data previews and summaries
- **GitHub**: Version control and hosting
- **Power BI or Tableau (optional)**: Dashboards and presentation-ready visuals

---

## 📄 License

- This project is licensed under the MIT License.
