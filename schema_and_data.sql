-- 01_database_exploration.sql
SHOW TABLES;

DESC agents;
DESC customer;
DESC orders;

SELECT COUNT(*) FROM agents;
SELECT COUNT(*) FROM customer;
SELECT COUNT(*) FROM orders;

-- 02_data_cleaning.sql
SELECT DISTINCT agent_code, LENGTH(agent_code)
FROM agents;
-- orders with invalid agent codes
SELECT *
FROM orders
WHERE TRIM(agent_code) NOT IN (SELECT TRIM(agent_code) FROM agents);

-- customers with undefined grade
SELECT *
FROM customer
WHERE grade = 0;

-- 03_sales_analysis.sql

-- Total orders, revenue, average order value
SELECT
  COUNT(*) AS total_orders,
  SUM(ord_amount) AS total_revenue,
  AVG(ord_amount) AS avg_order_value
FROM orders;

-- Top 3 cities by order amount
SELECT c.cust_city, SUM(o.ord_amount) AS total_order_amount
FROM customer c
JOIN orders o
  ON c.cust_code = o.cust_code
GROUP BY c.cust_city
ORDER BY total_order_amount DESC
LIMIT 3;

-- 04_customer_analysis.sql

-- Total customers
SELECT COUNT(*) FROM customer;

-- Repeat customers percentage
SELECT
  COUNT(DISTINCT cust_code) * 100.0 /
  (SELECT COUNT(*) FROM customer) AS repeat_customer_pct
FROM orders;

-- Max outstanding amount per country
SELECT *
FROM (
  SELECT cust_country, cust_name, outstanding_amt,
         RANK() OVER (PARTITION BY cust_country ORDER BY outstanding_amt DESC) rnk
  FROM customer
) t
WHERE rnk = 1;

-- 05_agent_performance,sql

-- Top 5 agents by sales
SELECT a.agent_name, SUM(o.ord_amount) AS total_sales
FROM agents a
JOIN orders o
  ON TRIM(a.agent_code) = TRIM(o.agent_code)
GROUP BY a.agent_name
ORDER BY total_sales DESC
LIMIT 5;

-- Rank agents by orders handled
SELECT a.agent_name,
       COUNT(o.ord_num) AS total_orders,
       RANK() OVER (ORDER BY COUNT(o.ord_num) DESC) AS agent_rank
FROM agents a
JOIN orders o
  ON TRIM(a.agent_code) = TRIM(o.agent_code)
GROUP BY a.agent_name;

-- 06_advance_sql.sql

-- Add avg_rcv_amt column
ALTER TABLE customer ADD avg_rcv_amt DECIMAL(12,2);

-- UDF, procedures, cursor code here
