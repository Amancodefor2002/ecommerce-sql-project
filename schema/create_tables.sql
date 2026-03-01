-- ============================================================
-- E-Commerce Database Project
-- File: create_tables.sql
-- Description: Creates all tables for the e-commerce database
-- ============================================================

-- Drop tables if they already exist (for clean re-runs)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS customers;

-- ============================================================
-- TABLE: customers
-- Stores information about each customer
-- ============================================================
CREATE TABLE customers (
    customer_id   INT PRIMARY KEY AUTO_INCREMENT,
    name          VARCHAR(100)        NOT NULL,
    email         VARCHAR(150) UNIQUE NOT NULL,
    phone         VARCHAR(20),
    city          VARCHAR(100),
    created_at    DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- TABLE: categories
-- Stores product categories (e.g. Electronics, Clothing)
-- ============================================================
CREATE TABLE categories (
    category_id   INT PRIMARY KEY AUTO_INCREMENT,
    name          VARCHAR(100) NOT NULL
);

-- ============================================================
-- TABLE: products
-- Stores product details; each product belongs to a category
-- ============================================================
CREATE TABLE products (
    product_id      INT PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(150)   NOT NULL,
    category_id     INT            NOT NULL,
    price           DECIMAL(10,2)  NOT NULL,
    stock_quantity  INT            DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- ============================================================
-- TABLE: orders
-- Stores each order placed by a customer
-- Status can be: 'pending', 'shipped', 'delivered', 'cancelled'
-- ============================================================
CREATE TABLE orders (
    order_id      INT PRIMARY KEY AUTO_INCREMENT,
    customer_id   INT            NOT NULL,
    order_date    DATETIME       DEFAULT CURRENT_TIMESTAMP,
    status        VARCHAR(20)    DEFAULT 'pending',
    total_amount  DECIMAL(10,2)  NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- ============================================================
-- TABLE: order_items
-- Stores individual products within each order
-- One order can have multiple items (products)
-- ============================================================
CREATE TABLE order_items (
    order_item_id   INT PRIMARY KEY AUTO_INCREMENT,
    order_id        INT            NOT NULL,
    product_id      INT            NOT NULL,
    quantity        INT            NOT NULL,
    unit_price      DECIMAL(10,2)  NOT NULL,
    FOREIGN KEY (order_id)    REFERENCES orders(order_id),
    FOREIGN KEY (product_id)  REFERENCES products(product_id)
);
