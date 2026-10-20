-- q09 — Order-level fact table. Columns order_id, order_month, first_name, last_name, region (the customer's region), rep_name, item, quantity, amount, status for every order, produced by joining orders, customers and reps on their key columns, ordered by order_id.
SELECT 
    orders.order_id, 
    orders.order_month, 
    customers.first_name, 
    customers.last_name, 
    customers.region, 
    reps.rep_name, 
    orders.item, 
    orders.quantity, 
    orders.amount, 
    orders.status 
FROM orders 
JOIN customers ON orders.customer_id = customers.customer_id 
JOIN reps ON customers.rep_id = reps.rep_id 
ORDER BY orders.order_id ASC;
