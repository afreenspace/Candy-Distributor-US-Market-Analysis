# Candy Distributor — US Market Analysis

Overview
This repository contains a complete end-to-end SQL analysis for the "US Candy Distributor" dataset. It answers business questions about revenue, units, profit, product profitability, geographic performance, target attainment, and data quality observations.

Files added

Data sources
The dataset used here is the Maven Analytics sample for the Candy Distributor. The following tables are expected in the `candy_distributor` schema:

If your local files are already present, the folder path used for this project on your machine is:

`C:/Users/Afreen/Downloads/SQL PRACTICE DATABASE/SQL CANDY DISTRIBUTOR PROJECT/US+Candy+Distributor`

How to run
1. Open MySQL Workbench and connect to your local MySQL instance.
2. Make sure the `candy_distributor` schema is available and the tables are loaded (the provided dataset files from Maven Analytics should be imported).
3. Open `analysis_queries.sql` and run individual statements or the entire file.

Deliverables (what's included)

Data-quality note (Ship Date)
During initial exploration a Ship Date data-quality issue was observed: several rows have missing or invalid `Ship Date` values and inconsistent formatting. Because shipping-duration calculations (Ship Date - Order Date) require reliable dates, shipping-duration analysis was excluded from the main deliverables. When you want this analysis included, please provide a cleaned `Ship Date` column (consistent date format and non-null values) or allow me to include a data-cleaning step to impute/validate ship dates.

Next steps (for you)
1. Add the screenshot image files to `docs/screenshots/` using the filenames described in `docs/screenshots/README.md`.
2. Review `analysis_queries.sql` in MySQL Workbench and run queries against your `candy_distributor` schema.
3. Create a GitHub repository and push this folder. Share the repo link and I can help prepare a short commit history and a polished first PR message.

If you'd like, I can also:

Repository
This project is prepared to be pushed to GitHub (example remote):

https://github.com/afreenspace/Candy-Distributor-US-Market-Analysis.git
📊 Sales Data Analysis using SQL

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

🚀 How to Run the Project

1. Download or clone this repository.
2. Open MySQL Workbench.
3. Create the database.
4. Import the dataset.
5. Run the SQL scripts provided in the sql folder.
6. Execute the analysis queries to reproduce the results.

👩‍💻 Author

Afreen

Aspiring Data Analyst | SQL | Power BI | Excel | Python
- Execute the queries locally and produce CSVs/plots (if you provide either a GitHub link or give me permission to run locally),
- Add sample output tables to the README, or
- Format the queries into a Jupyter notebook with visualizations.
