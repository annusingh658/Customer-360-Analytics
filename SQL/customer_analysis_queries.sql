-- =====================================================
-- CUSTOMER 360 ANALYTICS PROJECT
-- SQL BUSINESS ANALYSIS QUERIES
-- =====================================================


-- =====================================================
-- 1. DATABASE TABLE CHECK
-- =====================================================

SHOW TABLES;


-- =====================================================
-- 2. OVERALL BUSINESS KPI ANALYSIS
-- Total Orders, Revenue, Profit
-- =====================================================

SELECT
COUNT(order_id) AS total_orders,
ROUND(SUM(revenue),2) AS total_revenue,
ROUND(SUM(profit),2) AS total_profit
FROM fact_sales;



-- =====================================================
-- 3. TOP 10 CUSTOMERS BY REVENUE
-- Customer Value Analysis
-- =====================================================

SELECT
c.customer_id,
c.city,
c.customer_segment,
ROUND(SUM(f.revenue),2) AS total_revenue,
ROUND(SUM(f.profit),2) AS total_profit
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY
c.customer_id,
c.city,
c.customer_segment
ORDER BY total_revenue DESC
LIMIT 10;



-- =====================================================
-- 4. MONTHLY SALES TREND ANALYSIS
-- Revenue and Profit Growth
-- =====================================================

SELECT
DATE_FORMAT(order_date,'%Y-%m') AS month,
COUNT(order_id) AS total_orders,
ROUND(SUM(revenue),2) AS revenue,
ROUND(SUM(profit),2) AS profit
FROM fact_sales
GROUP BY month
ORDER BY month;



-- =====================================================
-- 5. TOP 10 PRODUCTS BY REVENUE
-- Product Performance Analysis
-- =====================================================

SELECT
p.product_name,
p.category,
ROUND(SUM(f.revenue),2) AS total_revenue,
ROUND(SUM(f.profit),2) AS total_profit
FROM fact_sales f
JOIN dim_product p
ON f.product_id = p.product_id
GROUP BY
p.product_name,
p.category
ORDER BY total_revenue DESC
LIMIT 10;



-- =====================================================
-- 6. CUSTOMER SEGMENT PERFORMANCE ANALYSIS
-- =====================================================

SELECT
c.customer_segment,
COUNT(DISTINCT c.customer_id) AS customers,
ROUND(SUM(f.revenue),2) AS total_revenue,
ROUND(SUM(f.profit),2) AS total_profit
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_segment
ORDER BY total_revenue DESC;



-- =====================================================
-- 7. RFM CUSTOMER SEGMENT ANALYSIS
-- Champions, Loyal, Potential Loyal, At Risk
-- =====================================================

SELECT
Segment,
COUNT(customer_id) AS customers,
ROUND(AVG(Monetary),2) AS avg_spending,
ROUND(AVG(Frequency),2) AS avg_orders
FROM dim_customer
GROUP BY Segment
ORDER BY avg_spending DESC;



-- =====================================================
-- 8. CATEGORY PERFORMANCE ANALYSIS
-- =====================================================

SELECT
p.category,
COUNT(DISTINCT p.product_id) AS total_products,
ROUND(SUM(f.revenue),2) AS revenue,
ROUND(SUM(f.profit),2) AS profit
FROM fact_sales f
JOIN dim_product p
ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;



-- =====================================================
-- 9. MOST PROFITABLE PRODUCTS
-- =====================================================

SELECT
p.product_name,
p.category,
ROUND(SUM(f.profit),2) AS total_profit
FROM fact_sales f
JOIN dim_product p
ON f.product_id = p.product_id
GROUP BY
p.product_name,
p.category
ORDER BY total_profit DESC
LIMIT 10;



-- =====================================================
-- 10. LOSS MAKING PRODUCTS
-- Finding products with negative profit
-- =====================================================

SELECT
p.product_name,
p.category,
ROUND(SUM(f.revenue),2) AS revenue,
ROUND(SUM(f.profit),2) AS profit
FROM fact_sales f
JOIN dim_product p
ON f.product_id = p.product_id
GROUP BY
p.product_name,
p.category
HAVING profit < 0
ORDER BY profit;



-- =====================================================
-- 11. CITY-WISE SALES ANALYSIS
-- =====================================================

SELECT
c.city,
ROUND(SUM(f.revenue),2) AS revenue,
ROUND(SUM(f.profit),2) AS profit,
COUNT(f.order_id) AS orders
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.city
ORDER BY revenue DESC;



-- =====================================================
-- 12. PAYMENT METHOD ANALYSIS
-- =====================================================

SELECT
payment_method,
COUNT(order_id) AS total_orders,
ROUND(SUM(revenue),2) AS revenue
FROM fact_sales
GROUP BY payment_method
ORDER BY revenue DESC;



-- =====================================================
-- 13. AVERAGE ORDER VALUE (AOV)
-- =====================================================

SELECT
ROUND(
SUM(revenue)/COUNT(order_id),
2
) AS average_order_value
FROM fact_sales;



-- =====================================================
-- 14. CUSTOMER PROFIT CONTRIBUTION
-- =====================================================

SELECT
c.customer_id,
ROUND(SUM(f.profit),2) AS profit_generated
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY profit_generated DESC
LIMIT 10;