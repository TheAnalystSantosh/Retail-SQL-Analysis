
-- 03_analysis_queries.sql

-- Total sales per month/year
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month, ROUND(SUM(oi.sales), 2) AS total_sales
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY month ORDER BY month;

-- Best-selling products by revenue and quantity
SELECT p.product_name, SUM(oi.quantity) AS total_quantity, ROUND(SUM(oi.sales), 2) AS total_revenue
FROM Order_Items oi JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_name ORDER BY total_revenue DESC LIMIT 10;

-- Customer Lifetime Value
SELECT c.customer_id, c.customer_name, ROUND(SUM(oi.sales), 2) AS lifetime_value
FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name ORDER BY lifetime_value DESC LIMIT 10;
