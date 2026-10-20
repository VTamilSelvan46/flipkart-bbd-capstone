-- q03 — Five biggest completed orders. Columns order_id, customer_id, item, amount for completed orders, ordered by amount descending and then order_id ascending, restricted to the first 5 rows.
SELECT orders.order_id, orders.customer_id, orders.item, orders.amount 
FROM orders 
WHERE orders.status = 'completed' 
ORDER BY orders.amount DESC, orders.order_id ASC 
LIMIT 5;
