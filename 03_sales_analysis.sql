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