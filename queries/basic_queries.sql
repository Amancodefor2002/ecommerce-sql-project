-- ============================================================
-- E-Commerce Database Project
-- File: basic_queries.sql
-- Description: Simple SELECT queries to explore the data
-- ============================================================


-- 1. View all customers
SELECT * FROM customers;

-- 2. View all products
SELECT * FROM products;

-- 3. View all orders
SELECT * FROM orders;

-- 4. View all categories
SELECT * FROM categories;

-- 5. Get all customers from Delhi
SELECT * FROM customers
WHERE city = 'Delhi';

-- 6. Get all products that cost less than 1000
SELECT * FROM products
WHERE price < 1000;

-- 7. Get all delivered orders
SELECT * FROM orders
WHERE status = 'delivered';

-- 8. Get all products sorted by price (highest first)
SELECT * FROM products
ORDER BY price DESC;

-- 9. Get top 5 most expensive products
SELECT * FROM products
ORDER BY price DESC
LIMIT 5;

-- 10. Get all orders placed in February 2025
SELECT * FROM orders
WHERE order_date BETWEEN '2025-02-01' AND '2025-02-28';

-- 11. Count total number of customers
SELECT COUNT(*) AS total_customers FROM customers;

-- 12. Count total number of products
SELECT COUNT(*) AS total_products FROM products;

-- 13. Get all products that are out of stock
SELECT * FROM products
WHERE stock_quantity = 0;

-- 14. Get all cancelled orders
SELECT * FROM orders
WHERE status = 'cancelled';

-- 15. Get all customers whose name starts with 'A'
SELECT * FROM customers
WHERE name LIKE 'A%';
