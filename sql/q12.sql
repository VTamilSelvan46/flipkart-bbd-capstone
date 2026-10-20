-- q12 — Product contribution tiers. Columns item, total_revenue, contribution_tier for completed orders grouped by item, ordered by total_revenue descending. contribution_tier is High when the item's total revenue is at least 60000, Medium when it is at least 15000 but below 60000, and Low otherwise.
SELECT 
    orders.item, 
    SUM(orders.amount) AS total_revenue, 
    CASE 
        WHEN SUM(orders.amount) >= 60000 THEN 'High' 
        WHEN SUM(orders.amount) >= 15000 THEN 'Medium' 
        ELSE 'Low' 
    END AS contribution_tier 
FROM orders 
WHERE orders.status = 'completed' 
GROUP BY orders.item 
ORDER BY total_revenue DESC;
