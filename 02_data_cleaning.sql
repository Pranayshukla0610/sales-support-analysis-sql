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