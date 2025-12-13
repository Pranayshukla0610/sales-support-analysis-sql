📊 Sales and Support Analysis using SQL
📌 Project Overview

This project is an end-to-end SQL analysis of a retail sales and customer support database. The objective is to analyze sales performance, customer behavior, and agent efficiency to support data-driven business decisions.

The project is based on a relational MySQL database and demonstrates strong SQL fundamentals along with advanced SQL concepts such as window functions, user-defined functions (UDFs), stored procedures, and cursors.

🎯 Business Objectives

Analyze overall sales performance and revenue trends

Identify high-value customers and repeat customers

Evaluate agent performance and incentive eligibility

Support commission restructuring using data

Improve customer retention and service quality

🗄 Database Schema

The database contains the following tables:

Table Name	Description
agents	Stores sales/support agent details
customer	Stores customer details and financial information
orders	Stores order-level transaction data
🛠 Tools & Technologies

MySQL

MySQL Workbench

SQL (DDL, DML, Window Functions, Procedures, Cursors)

GitHub

📂 Project Structure
sales-support-analysis-sql/
│
├── data/
│   └── schema_and_data.sql
│
├── sql/
│   ├── 01_database_exploration.sql
│   ├── 02_data_cleaning.sql
│   ├── 03_sales_analysis.sql
│   ├── 04_customer_analysis.sql
│   ├── 05_agent_performance.sql
│   ├── 06_advanced_sql.sql
│
└── insights/
    └── business_insights.md

🔍 Key Analyses Performed

Database exploration and data quality checks

Sales metrics: total revenue, average order value

Customer analysis: repeat customers, grade distribution

Agent performance ranking and incentive evaluation

Advanced SQL: UDFs, stored procedures, cursor-based logic

🚀 How to Run the Project

Install MySQL and MySQL Workbench

Execute data/schema_and_data.sql

Run SQL scripts in order from sql/01_... to sql/06_...

📈 Key Business Insights

Major revenue contribution comes from a small set of cities

Repeat customers form a significant percentage of total sales

Agent commission can be optimized using advance payment behavior

Certain regions have consistently higher outstanding balances

🧠 Skills Demonstrated

SQL Joins & Aggregations

Window Functions (RANK, PARTITION BY)

Data Cleaning & Validation

Stored Procedures & UDFs

Cursor-based processing


Business-oriented data analysis
