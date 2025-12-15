-- BUSINESS INSIGHTS USING SQL

-- 1. Total revenue by month
SELECT 
    strftime('%Y-%m', order_date) AS month,
    SUM(order_amount) AS total_revenue
FROM orders
GROUP BY month
ORDER BY month;

-- 2. Top 5 customers by revenue
SELECT 
    customer_id,
    SUM(order_amount) AS lifetime_value
FROM orders
GROUP BY customer_id
ORDER BY lifetime_value DESC
LIMIT 5;

-- 3. Average order value
SELECT 
    ROUND(AVG(order_amount), 2) AS avg_order_value
FROM orders;

-- 4. Repeat customer rate
SELECT 
    COUNT(DISTINCT customer_id) * 1.0 / 
    (SELECT COUNT(DISTINCT customer_id) FROM orders) AS repeat_rate
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;
