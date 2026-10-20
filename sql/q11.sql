-- q11 — Region and month report. Columns region, order_month, number_of_orders, number_of_customers (distinct customers), total_revenue, average_revenue for completed orders, grouped by the customer's region and the order month, ordered by region then order_month. Add a SQL comment stating why you chose the join type you used and why the distinct count is necessary.
-- Join type chosen: INNER JOIN because we want revenue metrics aggregated over customer regions and order months for completed orders. 
-- Distinct count is necessary because multiple orders can be placed by the same customer within the same month.
SELECT 
    customers.region, 
    orders.order_month, 
    COUNT(orders.order_id) AS number_of_orders, 
    COUNT(DISTINCT customers.customer_id) AS number_of_customers, 
    SUM(orders.amount) AS total_revenue, 
    AVG(orders.amount) AS average_revenue 
FROM orders 
JOIN customers ON orders.customer_id = customers.customer_id 
WHERE orders.status = 'completed' 
GROUP BY customers.region, orders.order_month 
ORDER BY customers.region ASC, orders.order_month ASC;
