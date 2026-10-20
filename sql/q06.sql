-- q06 — Orders by status. Columns status, number_of_orders, total_amount for all orders, grouped by status and ordered by number_of_orders descending.
SELECT orders.status, COUNT(*) AS number_of_orders, SUM(orders.amount) AS total_amount 
FROM orders 
GROUP BY orders.status 
ORDER BY number_of_orders DESC;
