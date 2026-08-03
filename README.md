# Candy Distributor — US Market Analysis

This repository contains a complete end-to-end SQL analysis for the "US Candy Distributor" dataset. It answers business questions about revenue, units, profit, product profitability, geographic performance, target attainment, and data quality observations.

# Data sources
The dataset used here is the Maven Analytics sample for the Candy Distributor. The following tables are expected in the `candy_distributor` schema:

# How to run
1. Open MySQL Workbench and connect to your local MySQL instance.
2. Make sure the `candy_distributor` schema is available and the tables are loaded (the provided dataset files from Maven Analytics should be imported).
3. Open `analysis_queries.sql` and run individual statements or the entire file.

# Data-quality note (Ship Date)
During initial exploration a Ship Date data-quality issue was observed: several rows have missing or invalid `Ship Date` values and inconsistent formatting. Because shipping-duration calculations (Ship Date - Order Date) require reliable dates, shipping-duration analysis was excluded from the main deliverables. When you want this analysis included, please provide a cleaned `Ship Date` column (consistent date format and non-null values) or allow me to include a data-cleaning step to impute/validate ship dates.

📌 Project Overview

This project analyzes sales data using SQL to identify important business insights related to sales performance, customers, products, and revenue.

The project was created as a practical SQL data analysis project using a real-world dataset.

🎯 Objectives

* Analyze overall sales performance
* Identify top-selling products
* Analyze customer purchasing behavior
* Calculate total revenue and order metrics
* Identify trends and patterns in the data
* Answer business questions using SQL

🛠️ Tools & Technologies

* MySQL
* SQL
* MySQL Workbench
* GitHub

📂 Dataset

The dataset contains information related to:

* Customers
* Orders
* Products
* Sales transactions

🗄️ Database Structure

The dataset was imported into MySQL and organized into related tables using primary and foreign keys.

🔍 SQL Analysis

Some of the SQL concepts used in this project include:

* SELECT
* WHERE
* GROUP BY
* HAVING
* ORDER BY
* JOINs
* Aggregate Functions
* CASE statements
* Subqueries
* CTEs
* Window Functions

📈 Key Analysis

1. Top-Selling Products

The analysis identifies the products generating the highest sales.

2. Customer Analysis

Customer-level analysis was performed to identify purchasing patterns and high-value customers.

3. Revenue Analysis

Revenue was analyzed across different categories/time periods to understand overall business performance.

💡 Key Insights

Some of the major insights identified from the analysis include:

* Identified the highest-performing products.
* Identified high-value customers based on purchase behavior.
* Analyzed overall revenue performance.
* Compared sales performance across different segments.
* Used SQL aggregations and joins to answer business questions.

📁 Project Structure

SQL-Sales-Analysis/
│
├── data/
├── sql/
├── screenshots/
└── README.md

---

## Output screenshots

Below are the key analysis outputs. (Files are in `screenshots/`.)

![Database structure](screenshots/1.%20Databasetable%20structure.png)

![Division vs Targets](screenshots/Actual%20vs%20Target%20by%20Division.png)

![Best-sellers vs Profit](screenshots/CTE%20comparing%20best-sellers%20vs%20most-profitable.png)

![Factory vs Region](screenshots/Factory%20vs%20region%20performance%20(3-table%20JOIN).png)

![Population buckets](screenshots/Population%20bucket%20analysis%20(with%20the%20data-quality%20catch).png)

![Monthly trend](screenshots/Sales%20trend%20with%20running%20total%20+%20MoM%20growth.png)

![Top states](screenshots/Top%2010%20states%20with%20RANK().png)

🚀 How to Run the Project

1. Download or clone this repository.
2. Open MySQL Workbench.
3. Create the database.
4. Import the dataset.
5. Run the SQL scripts provided in the sql folder.
6. Execute the analysis queries to reproduce the results.

👩‍💻 Author

Afreen N
