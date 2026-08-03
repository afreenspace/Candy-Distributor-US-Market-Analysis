# Candy Distributor — US Market Analysis

Overview
--------
This repository contains a complete end-to-end SQL analysis for the "US Candy Distributor" dataset. It answers business questions about revenue, units, profit, product profitability, geographic performance, target attainment, and data quality observations.

Files added
-----------
- `analysis_queries.sql` — All analysis queries for the client questions (headline numbers, division targets, profitability, top products, regional & temporal trends, population buckets). Run these in MySQL Workbench using the `candy_distributor` schema.
- `docs/screenshots/README.md` — Captions and suggested filenames for the screenshots you provided.

Data sources
------------
The dataset used here is the Maven Analytics sample for the Candy Distributor. The following tables are expected in the `candy_distributor` schema:
- `sales` (Order ID, Order Date, Ship Date, Ship Mode, City, State/Province, Postal Code, Division, Region, Product ID, Product Name, Sales, Units, Unit Price, Unit Cost, Profit, ...)
- `products` (Product ID, Product Name, Category, etc.)
- `targets` (division, target)
- `uszips` (zip, population, city, state, latitude, longitude)

If your local files are already present, the folder path used for this project on your machine is:

`C:/Users/Afreen/Downloads/SQL PRACTICE DATABASE/SQL CANDY DISTRIBUTOR PROJECT/US+Candy+Distributor`

How to run
----------
1. Open MySQL Workbench and connect to your local MySQL instance.
2. Make sure the `candy_distributor` schema is available and the tables are loaded (the provided dataset files from Maven Analytics should be imported).
3. Open `analysis_queries.sql` and run individual statements or the entire file.

Deliverables (what's included)
--------------------------------
- SQL queries that answer the client's 11 analytic questions (plus one documented data-quality note). Each query is commented and numbered to match the client's list.
- A professional README (this file) that explains the project, data sources, and next steps.
- A `docs/screenshots` helper README where you can place the screenshot image files; the README includes captions so screenshots will display correctly when the images are added to the repository.

Data-quality note (Ship Date)
-----------------------------
During initial exploration a Ship Date data-quality issue was observed: several rows have missing or invalid `Ship Date` values and inconsistent formatting. Because shipping-duration calculations (Ship Date - Order Date) require reliable dates, shipping-duration analysis was excluded from the main deliverables. When you want this analysis included, please provide a cleaned `Ship Date` column (consistent date format and non-null values) or allow me to include a data-cleaning step to impute/validate ship dates.

Next steps (for you)
--------------------
1. Add the screenshot image files to `docs/screenshots/` using the filenames described in `docs/screenshots/README.md`.
2. Review `analysis_queries.sql` in MySQL Workbench and run queries against your `candy_distributor` schema.
3. Create a GitHub repository and push this folder. Share the repo link and I can help prepare a short commit history and a polished first PR message.

- Execute the queries locally and produce CSVs/plots (if you provide either a GitHub link or give me permission to run locally),
- Add sample output tables to the README, or
- Format the queries into a Jupyter notebook with visualizations.
If you'd like, I can also:
- Execute the queries locally and produce CSVs/plots (if you provide either a GitHub link or give me permission to run locally),
- Add sample output tables to the README, or
- Format the queries into a Jupyter notebook with visualizations.

Repository
----------
This project is prepared to be pushed to GitHub (example remote):

https://github.com/afreenspace/Candy-Distributor-US-Market-Analysis.git
- Execute the queries locally and produce CSVs/plots (if you provide either a GitHub link or give me permission to run locally),
- Add sample output tables to the README, or
- Format the queries into a Jupyter notebook with visualizations.
