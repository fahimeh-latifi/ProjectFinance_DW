Project-Based Financial Data Warehouse (OLAP)

Author: Fahimeh Latifi
Date: 2026-02-27
Technology Stack: Oracle 19c / SQL / ETL / OLAP / Star Schema

📌 Project Overview

This project demonstrates a financial data warehouse designed for project-based tracking of revenue, expenses, labor cost, profit, and project progress.

It simulates a full OLTP-to-OLAP ETL pipeline including:

Dimension and Fact tables

Staging and ETL processes (Extract, Transform, Load)

Sample OLAP queries for reporting and analytics

Star schema design for high-performance query execution

The project highlights advanced data warehousing concepts and enterprise-ready reporting.

🗂 Project Structure
ProjectFinance_DW/
├── README.md
├── data/                ← Sample CSV files for testing
│   ├── project_data.csv
│   ├── employee_data.csv
│   ├── task_data.csv
│   ├── time_data.csv
│   ├── costcenter_data.csv
│   └── fact_projectfinance_data.csv
├── sql/                 ← SQL scripts for DW and ETL
│   ├── create_dimensions.sql
│   ├── create_fact.sql
│   ├── create_stage.sql
│   ├── etl_extract.sql
│   ├── etl_transform.sql
│   ├── etl_load.sql
│   └── sample_queries.sql
├── diagrams/            ← Star Schema & ETL flow diagrams
│   ├── star_schema.png
│   └── etl_flow.png
⭐ Star Schema Diagram

Fact Table: Fact_ProjectFinance
Metrics stored: Revenue, Expense, Labor_Cost, Profit, Hours_Worked, Progress_Percent

Dimension Tables:

Dim_Project → Project information

Dim_Employee → Employee details

Dim_Task → Task details

Dim_Time → Date/time hierarchy

Dim_CostCenter → Cost center information

🔄 ETL Pipeline Overview

Extract: Load raw OLTP data into Staging tables (Stage_*)

Transform: Clean, validate, and calculate metrics such as Profit and Progress

Load: Populate DW tables (Dim & Fact) from Staging

Reporting: Execute OLAP queries for project finance insights

Skills Demonstrated:

Data transformation and validation

ETL pipeline design

OLAP query optimization

Star schema design for analytics

🛠 Sample OLAP Queries

Total Expense, Revenue, and Profit per Project

Monthly Revenue & Profit Trends

Profit and Average Progress by Cost Center

Employee Contribution to Profit

Top 5 Tasks by Profit

For full query scripts, see sql/sample_queries.sql

📊 Data Source

Sample CSV files in data/ folder

Fact table initially has Profit = 0; calculated during ETL Transform step

⚡ How to Run
-- 1. Create Dimension & Fact Tables
@sql/create_dimensions.sql
@sql/create_fact.sql

-- 2. Create Staging Tables
@sql/create_stage.sql

-- 3. ETL Pipeline
@sql/etl_extract.sql
@sql/etl_transform.sql
@sql/etl_load.sql

-- 4. Run Sample OLAP Queries
@sql/sample_queries.sql
💡 Key Technical Skills Demonstrated

Enterprise OLAP & OLTP integration

Data Warehouse design (Star Schema)

ETL pipeline development

Data validation & profit calculation logic

Analytical query design & performance optimization

Hands-on SQL development for reporting

👩‍💻 Author

Fahimeh Latifi
Database Developer | Oracle & Data Systems
Toronto, Canada
Email: latififahimeehh@gmail.com