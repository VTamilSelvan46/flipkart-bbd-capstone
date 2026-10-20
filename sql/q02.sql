-- q02 — Missing amounts. Columns order_id, customer_id, item, status for orders whose amount is missing, ordered by order_id.
SELECT orders.order_id, orders.customer_id, orders.item, orders.status 
FROM orders 
WHERE orders.amount IS NULL 
ORDER BY orders.order_id ASC;
