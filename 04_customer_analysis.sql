-- Total number of customers
SELECT COUNT(*) FROM customer;

-- Percentage of repeat customers
SELECT
  COUNT(DISTINCT cust_code) * 100.0 /
  (SELECT COUNT(*) FROM customer) AS repeat_customer_percentage
FROM orders;

-- Customer with maximum outstanding amount from each country
SELECT cust_country, cust_name, outstanding_amt
FROM (
  SELECT cust_country, cust_name, outstanding_amt,
         RANK() OVER (PARTITION BY cust_country ORDER BY outstanding_amt DESC) rnk
  FROM customer
) t
WHERE rnk = 1;

-- Customer grade distribution
SELECT grade,
       COUNT(*) * 100.0 /
       (SELECT COUNT(*) FROM customer) AS percentage
FROM customer
GROUP BY grade;