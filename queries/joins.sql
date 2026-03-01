-- ============================================================
-- E-Commerce Database Project
-- File: joins.sql
-- Description: Queries using JOINs to combine multiple tables
-- ============================================================


-- 1. Get each order along with the customer name who placed it
SELECT 
    o.order_id,
    c.name        AS customer_name,
    c.city,
    o.order_date,
    o.status,
    o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;


-- 2. Get all order items along with the product name and price
SELECT 
    oi.order_id,
    p.name        AS product_name,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS item_total
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;


-- 3. Get full order details: customer name, product name, quantity, price
SELECT 
    c.name        AS customer_name,
    o.order_id,
    o.order_date,
    p.name        AS product_name,
    oi.quantity,
    oi.unit_price
FROM orders o
JOIN customers c   ON o.customer_id  = c.customer_id
JOIN order_items oi ON o.order_id    = oi.order_id
JOIN products p    ON oi.product_id  = p.product_id;


-- 4. Get each product along with its category name
SELECT 
    p.product_id,
    p.name        AS product_name,
    c.name        AS category,
    p.price,
    p.stock_quantity
FROM products p
JOIN categories c ON p.category_id = c.category_id;


-- 5. Get all delivered orders with customer name and city
SELECT 
    c.name        AS customer_name,
    c.city,
    o.order_id,
    o.order_date,
    o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.status = 'delivered';


-- 6. Get all orders with customer info that were placed in 2025
SELECT 
    c.name        AS customer_name,
    c.email,
    o.order_id,
    o.order_date,
    o.status,
    o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE YEAR(o.order_date) = 2025;


-- 7. Get all products from the Electronics category with order count
SELECT 
    p.name        AS product_name,
    COUNT(oi.order_item_id) AS times_ordered
FROM products p
JOIN categories c   ON p.category_id  = c.category_id
JOIN order_items oi ON p.product_id   = oi.product_id
WHERE c.name = 'Electronics'
GROUP BY p.name;
