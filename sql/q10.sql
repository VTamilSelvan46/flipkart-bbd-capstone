-- q10 — Customers who never ordered. Columns customer_id, first_name, last_name, region for customers that have no order at all, ordered by customer_id. Use a LEFT JOIN from customers to orders and test for the unmatched side.
SELECT customers.customer_id, customers.first_name, customers.last_name, customers.region 
FROM customers 
LEFT JOIN orders ON customers.customer_id = orders.customer_id 
WHERE orders.order_id IS NULL 
ORDER BY customers.customer_id ASC;
