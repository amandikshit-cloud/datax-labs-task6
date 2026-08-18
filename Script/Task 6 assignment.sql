SELECT * FROM online_sales_2026;

-- Extracting order month from order dates
SELECT 
    order_id,
    order_date,
    EXTRACT(MONTH FROM order_date) AS order_month,
    amount
FROM online_sales_2026
ORDER BY order_date;

-- Sum of revenue of each month
SELECT 
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS monthly_revenue
FROM online_sales_2026
GROUP BY order_month
ORDER BY order_month;
-- Insight: June had the highest revenue so far, whereas July shows a stoop

-- Total number of orders in each month
SELECT 
    EXTRACT(MONTH FROM order_date) AS order_month,
    COUNT(DISTINCT order_id) AS monthly_order_volume
FROM online_sales_2026
GROUP BY order_month
ORDER BY order_month;
-- Insight: Not only June had the highest revenue, it also has the highest number of orders, and again July shows a sudden drop


-- Combined result of the above 2 queries. Sum of revenue and total orders of each month
SELECT 
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS monthly_order_volume
FROM online_sales_2026
GROUP BY order_month
ORDER BY order_month;
-- Insight: Here we can see how our sales were best in June overall.

-- Sum of total orders and total sales from 1st january to the end of the financial year
SELECT 
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS monthly_order_volume
FROM online_sales_2026
WHERE order_date BETWEEN '2026-01-01' AND '2026-03-31'
GROUP BY order_month
ORDER BY order_month;
-- Insight: the last three months of the financial year 2025-26 shows a depletion by each month

-- Top 3 months generating highest revenue throughout the year
SELECT 
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS monthly_order_volume
FROM online_sales_2026
GROUP BY order_month
ORDER BY monthly_revenue DESC
LIMIT 3;
-- Insight: Despite being second lowest in the last financial year, February still makes it to the top in three in terms of sales.