-- q01 — Pending orders. Columns order_id, customer_id, item, amount for orders with status pending, ordered by order_id ascending.
SELECT orders.order_id, orders.customer_id, orders.item, orders.amount 
FROM orders 
WHERE orders.status = 'pending' 
ORDER BY orders.order_id ASC;
