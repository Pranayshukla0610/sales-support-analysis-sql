-- Add average receive amount column
ALTER TABLE customer ADD avg_rcv_amt DECIMAL(12,2);

-- Update average receive amount per country
UPDATE customer c
SET avg_rcv_amt = (
  SELECT AVG(receive_amt)
  FROM customer
  WHERE cust_country = c.cust_country
);

-- Create UDF (My SQL)
DELIMITER $$

CREATE FUNCTION avg_amt(agentName VARCHAR(40))
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
	DECLARE avg_outstanding DECIMAL(12,2);
    
    SELECT AVG(c.outstanding_amt)
    INTO avg_outstanding
    FROM customer c 
    JOIN agents a ON TRIM(c.agent_code) = TRIM(a.agent_code)
	WHERE a.agent_name = agentName;
    
    RETURN avg_outstanding;
END$$
DELIMITER ;

SELECT avg_amt('Mukesh');