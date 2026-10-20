-- q04 — Target customer segment. Columns customer_id, first_name, last_name, region, age for customers in the North or West region whose age is between 25 and 40 inclusive, ordered by age ascending and then customer_id ascending. Use the IN and BETWEEN operators.
SELECT customers.customer_id, customers.first_name, customers.last_name, customers.region, customers.age 
FROM customers 
WHERE customers.region IN ('North', 'West') 
  AND customers.age BETWEEN 25 AND 40 
ORDER BY customers.age ASC, customers.customer_id ASC;
