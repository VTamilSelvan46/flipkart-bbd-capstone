-- q08 — Customer profile by region. Columns region, number_of_customers, average_age, min_age, max_age from the customers table, grouped by region and ordered by region.
SELECT customers.region, COUNT(*) AS number_of_customers, AVG(customers.age) AS average_age, MIN(customers.age) AS min_age, MAX(customers.age) AS max_age 
FROM customers 
GROUP BY customers.region 
ORDER BY customers.region ASC;
