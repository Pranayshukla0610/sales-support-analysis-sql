-- Top 5 agents by total sales
SELECT a.agent_name,
       SUM(o.ord_amount) AS total_sales
FROM agents a
JOIN orders o
  ON TRIM(a.agent_code) = TRIM(o.agent_code)
GROUP BY a.agent_name
ORDER BY total_sales DESC
LIMIT 5;

-- Rank agents by number of orders handled
SELECT a.agent_name,
       COUNT(o.ord_num) AS total_orders,
       RANK() OVER (ORDER BY COUNT(o.ord_num) DESC) AS agent_rank
FROM agents a
JOIN orders o
  ON TRIM(a.agent_code) = TRIM(o.agent_code)
GROUP BY a.agent_name;