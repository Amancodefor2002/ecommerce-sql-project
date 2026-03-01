-- ============================================================
-- E-Commerce Database Project
-- File: aggregations.sql
-- Description: Advanced queries using GROUP BY, COUNT, SUM, AVG
-- These are the kinds of queries used in real business analysis
-- ============================================================


-- 1. Total revenue generated from all delivered orders
SELECT 
    SUM(total_amount) AS total_revenue
FROM orders
WHERE status = 'delivered';


-- 2. Total number of orders per status
SELECT 
    status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY status;


-- 3. Total revenue per month
SELECT 
    MONTHNAME(order_date) AS month,
    YEAR(order_date)      AS year,
    SUM(total_amount)     AS monthly_revenue
FROM orders
WHERE status = 'delivered'
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);


-- 4. Top 5 customers by total amount spent
SELECT 
    c.name            AS customer_name,
    c.city,
    SUM(o.total_amount) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.status = 'delivered'
GROUP BY c.customer_id, c.name, c.city
ORDER BY total_spent DESC
LIMIT 5;


-- 5. Most ordered products (by quantity)
SELECT 
    p.name              AS product_name,
    SUM(oi.quantity)    AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.name
ORDER BY total_quantity_sold DESC
LIMIT 5;


-- 6. Total revenue per product category
SELECT 
    cat.name              AS category,
    SUM(oi.quantity * oi.unit_price) AS category_revenue
FROM order_items oi
JOIN products p   ON oi.product_id  = p.product_id
JOIN categories cat ON p.category_id = cat.category_id
GROUP BY cat.category_id, cat.name
ORDER BY category_revenue DESC;


-- 7. Average order value
SELECT 
    ROUND(AVG(total_amount), 2) AS avg_order_value
FROM orders
WHERE status = 'delivered';


-- 8. Number of orders placed by each customer
SELECT 
    c.name          AS customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_orders DESC;


-- 9. Customers who have never placed an order
SELECT 
    c.name,
    c.email,
    c.city
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- 10. Products that have never been ordered
SELECT 
    p.name        AS product_name,
    p.price,
    cat.name      AS category
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
JOIN categories cat      ON p.category_id = cat.category_id
WHERE oi.order_item_id IS NULL;
