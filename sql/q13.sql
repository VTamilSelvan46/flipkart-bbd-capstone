-- q13 — Rep performance against target. Columns rep_name, order_month, monthly_target, revenue, performance_tier for completed orders, grouped by rep, month and the rep's monthly_target (join reps, customers, orders), ordered by rep_name then order_month. performance_tier is Below Target when revenue is below the rep's monthly_target, On Target when revenue is at least the target but below 1.1 times the target, and Above Target otherwise. Compute the tier directly from the aggregate expression: an alias of an aggregate or conditional expression cannot be referenced in WHERE (aggregates are not allowed in WHERE), so write the expression out in full.
SELECT 
    reps.rep_name, 
    orders.order_month, 
    reps.monthly_target, 
    SUM(orders.amount) AS revenue, 
    CASE 
        WHEN SUM(orders.amount) < reps.monthly_target THEN 'Below Target' 
        WHEN SUM(orders.amount) < (reps.monthly_target * 1.1) THEN 'On Target' 
        ELSE 'Above Target' 
    END AS performance_tier 
FROM orders 
JOIN customers ON orders.customer_id = customers.customer_id 
JOIN reps ON customers.rep_id = reps.rep_id 
WHERE orders.status = 'completed' 
GROUP BY reps.rep_name, orders.order_month, reps.monthly_target 
ORDER BY reps.rep_name ASC, orders.order_month ASC;
