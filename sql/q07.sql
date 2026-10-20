-- q07 — Strong products. Columns item, number_of_orders, revenue for completed orders grouped by item, keeping only items whose revenue is greater than 20000, ordered by revenue descending.
SELECT orders.item, COUNT(*) AS number_of_orders, SUM(orders.amount) AS revenue 
FROM orders 
WHERE orders.status = 'completed' 
GROUP BY orders.item 
HAVING SUM(orders.amount) > 20000 
ORDER BY revenue DESC;
