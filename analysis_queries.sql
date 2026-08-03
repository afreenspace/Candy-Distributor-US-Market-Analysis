-- analysis_queries.sql
-- SQL analyses for the US Candy Distributor project
-- Run these in MySQL Workbench (schema: candy_distributor)

-- 1) Headline numbers: total revenue, total units, total profit
SELECT
  ROUND(SUM(`Sales`), 2) AS total_revenue,
  SUM(`Units`) AS total_units_sold,
  ROUND(SUM(`Profit`), 2) AS total_profit
FROM candy_distributor.`sales`;

-- 2) Sales / profit by Division (compare against targets)
SELECT
  s.`Division`,
  COALESCE(t.`target`, 0) AS target_units,
  SUM(s.`Units`) AS total_units_sold,
  ROUND(SUM(s.`Sales`),2) AS total_revenue,
  ROUND(SUM(s.`Profit`),2) AS total_profit
FROM candy_distributor.`sales` AS s
LEFT JOIN candy_distributor.`targets` AS t
  ON s.`Division` = t.`division`
GROUP BY s.`Division`, t.`target`;

-- 3) Actual vs target per Division (units difference and percent of target)
SELECT
  s.`Division`,
  COALESCE(t.`target`,0) AS target_units,
  SUM(s.`Units`) AS total_units_sold,
  SUM(s.`Units`) - COALESCE(t.`target`,0) AS units_difference,
  CASE WHEN COALESCE(t.`target`,0) = 0 THEN NULL
       ELSE ROUND(SUM(s.`Units`) / t.`target` * 100, 2)
  END AS percent_of_target
FROM candy_distributor.`sales` AS s
LEFT JOIN candy_distributor.`targets` AS t
  ON s.`Division` = t.`division`
GROUP BY s.`Division`, t.`target`;

-- 4) Profit margin per product (margin = total_profit / total_revenue)
SELECT
  p.`Product Name`,
  SUM(s.`Sales`) AS total_revenue,
  SUM(s.`Profit`) AS total_profit,
  CASE WHEN SUM(s.`Sales`) = 0 THEN NULL
       ELSE ROUND(SUM(s.`Profit`) / SUM(s.`Sales`) * 100, 2)
  END AS profit_margin_percent
FROM candy_distributor.`sales` AS s
JOIN candy_distributor.`products` AS p
  ON s.`Product ID` = p.`Product ID`
GROUP BY p.`Product Name`
ORDER BY profit_margin_percent DESC;

-- 5) Top 5 best-selling products by revenue
WITH revenue_rank AS (
  SELECT
    s.`Product Name`,
    SUM(s.`Sales`) AS total_revenue,
    RANK() OVER (ORDER BY SUM(s.`Sales`) DESC) AS revenue_rank
  FROM candy_distributor.`sales` AS s
  GROUP BY s.`Product Name`
)
SELECT * FROM revenue_rank
WHERE revenue_rank <= 5
ORDER BY revenue_rank;

-- 6) Top 5 most-profitable products and comparison with best-sellers
WITH revenue_rank AS (
  SELECT
    s.`Product Name`,
    SUM(s.`Sales`) AS total_revenue,
    RANK() OVER (ORDER BY SUM(s.`Sales`) DESC) AS revenue_rank
  FROM candy_distributor.`sales` AS s
  GROUP BY s.`Product Name`
),
profit_rank AS (
  SELECT
    s.`Product Name`,
    SUM(s.`Profit`) AS total_profit,
    RANK() OVER (ORDER BY SUM(s.`Profit`) DESC) AS profit_rank
  FROM candy_distributor.`sales` AS s
  GROUP BY s.`Product Name`
)
SELECT
  r.`Product Name`,
  r.total_revenue,
  r.revenue_rank,
  p.total_profit,
  p.profit_rank
FROM revenue_rank r
LEFT JOIN profit_rank p USING (`Product Name`)
ORDER BY r.revenue_rank
LIMIT 10;

-- 7) Sales by Region
SELECT
  `Region`,
  ROUND(SUM(`Sales`),2) AS total_revenue,
  ROUND(SUM(`Profit`),2) AS total_profit
FROM candy_distributor.`sales`
GROUP BY `Region`
ORDER BY total_revenue DESC;

-- 8) Top 10 States and Cities by revenue
-- States
SELECT
  `State/Province` AS state,
  ROUND(SUM(`Sales`),2) AS total_revenue,
  RANK() OVER (ORDER BY SUM(`Sales`) DESC) AS revenue_rank
FROM candy_distributor.`sales`
GROUP BY `State/Province`
ORDER BY total_revenue DESC
LIMIT 10;

-- Cities (top 10)
SELECT
  `City`,
  `State/Province` AS state,
  ROUND(SUM(`Sales`),2) AS total_revenue,
  RANK() OVER (ORDER BY SUM(`Sales`) DESC) AS revenue_rank
FROM candy_distributor.`sales`
GROUP BY `City`, `State/Province`
ORDER BY total_revenue DESC
LIMIT 10;

-- 9) Sales by Ship Mode and average order value per ship mode
SELECT
  `Ship Mode`,
  COUNT(DISTINCT `Order ID`) AS orders_count,
  ROUND(SUM(`Sales`),2) AS total_revenue,
  ROUND(AVG(`Sales`),2) AS avg_line_sales,
  ROUND(SUM(`Sales`) / NULLIF(COUNT(DISTINCT `Order ID`),0),2) AS avg_order_value
FROM candy_distributor.`sales`
GROUP BY `Ship Mode`
ORDER BY total_revenue DESC;

-- 10) Sales trend by month (running total and month-over-month % change)
WITH monthly AS (
  SELECT
    DATE_FORMAT(`Order Date`, '%Y-%m') AS sales_month,
    SUM(`Sales`) AS monthly_revenue
  FROM candy_distributor.`sales`
  GROUP BY sales_month
)
SELECT
  sales_month,
  monthly_revenue,
  SUM(monthly_revenue) OVER (ORDER BY sales_month) AS running_total,
  LAG(monthly_revenue) OVER (ORDER BY sales_month) AS previous_month_revenue,
  CASE WHEN LAG(monthly_revenue) OVER (ORDER BY sales_month) IS NULL THEN NULL
       ELSE ROUND((monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY sales_month))
                  / LAG(monthly_revenue) OVER (ORDER BY sales_month) * 100, 2)
  END AS mom_growth_percent
FROM monthly
ORDER BY sales_month;

-- 11) Sales by population bucket (join with uszips)
SELECT
  CASE
    WHEN z.`population` < 20000 THEN 'Low Population'
    WHEN z.`population` BETWEEN 20000 AND 100000 THEN 'Medium Population'
    WHEN z.`population` IS NULL THEN 'No Population Match'
    ELSE 'High Population'
  END AS population_group,
  COUNT(DISTINCT s.`Order ID`) AS total_orders,
  ROUND(SUM(s.`Sales`),2) AS total_revenue,
  ROUND(AVG(s.`Sales`),2) AS avg_order_value
FROM candy_distributor.`sales` AS s
LEFT JOIN candy_distributor.`uszips` AS z
  ON s.`Postal Code` = z.`zip`
GROUP BY population_group
ORDER BY total_revenue DESC;

-- 12) Data-quality note: Ship Date issues (documented only)
-- See README.md for the written explanation about Ship Date quality and why shipping-duration analysis was excluded.
