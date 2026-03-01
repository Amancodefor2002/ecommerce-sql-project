-- ============================================================
-- E-Commerce Database Project
-- File: sample_data.sql
-- Description: Inserts realistic dummy data into all tables
-- Run this AFTER create_tables.sql
-- ============================================================


-- ============================================================
-- INSERT: customers (20 records)
-- ============================================================
INSERT INTO customers (name, email, phone, city) VALUES
('Aman Singh',       'aman.singh@email.com',     '9876543210', 'Delhi'),
('Priya Sharma',     'priya.sharma@email.com',   '9812345678', 'Mumbai'),
('Rahul Verma',      'rahul.verma@email.com',    '9823456789', 'Bangalore'),
('Sneha Patel',      'sneha.patel@email.com',    '9834567890', 'Ahmedabad'),
('Karan Mehta',      'karan.mehta@email.com',    '9845678901', 'Pune'),
('Ananya Roy',       'ananya.roy@email.com',     '9856789012', 'Kolkata'),
('Vikram Nair',      'vikram.nair@email.com',    '9867890123', 'Chennai'),
('Divya Iyer',       'divya.iyer@email.com',     '9878901234', 'Hyderabad'),
('Arjun Kapoor',     'arjun.kapoor@email.com',   '9889012345', 'Jaipur'),
('Meera Joshi',      'meera.joshi@email.com',    '9890123456', 'Lucknow'),
('Rohit Das',        'rohit.das@email.com',       '9801234567', 'Bhopal'),
('Pooja Gupta',      'pooja.gupta@email.com',    '9811234567', 'Chandigarh'),
('Amit Tiwari',      'amit.tiwari@email.com',    '9822345678', 'Indore'),
('Neha Saxena',      'neha.saxena@email.com',    '9833456789', 'Nagpur'),
('Suresh Kumar',     'suresh.kumar@email.com',   '9844567890', 'Patna'),
('Kavya Reddy',      'kavya.reddy@email.com',    '9855678901', 'Visakhapatnam'),
('Manish Yadav',     'manish.yadav@email.com',   '9866789012', 'Surat'),
('Riya Malhotra',    'riya.malhotra@email.com',  '9877890123', 'Vadodara'),
('Deepak Chauhan',   'deepak.chauhan@email.com', '9888901234', 'Coimbatore'),
('Sonia Bhatt',      'sonia.bhatt@email.com',    '9899012345', 'Agra');


-- ============================================================
-- INSERT: categories (6 records)
-- ============================================================
INSERT INTO categories (name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Home & Kitchen'),
('Sports'),
('Beauty & Personal Care');


-- ============================================================
-- INSERT: products (20 records)
-- ============================================================
INSERT INTO products (name, category_id, price, stock_quantity) VALUES
('iPhone 15',             1, 79999.00, 50),
('Samsung Galaxy S24',    1, 69999.00, 40),
('Laptop Dell Inspiron',  1, 55000.00, 30),
('Wireless Earbuds',      1, 2999.00,  100),
('Smart Watch',           1, 4999.00,  75),
('Men\'s Casual Shirt',   2, 799.00,   200),
('Women\'s Kurti',        2, 599.00,   250),
('Denim Jeans',           2, 1299.00,  180),
('Running Shoes',         2, 2499.00,  120),
('Winter Jacket',         2, 3499.00,  60),
('The Alchemist',         3, 299.00,   500),
('Atomic Habits',         3, 399.00,   450),
('Python Programming',    3, 699.00,   300),
('Pressure Cooker 5L',    4, 1999.00,  80),
('Non-stick Pan Set',     4, 2499.00,  65),
('Cricket Bat',           5, 1499.00,  90),
('Yoga Mat',              5, 899.00,   110),
('Dumbbells 5kg Pair',    5, 1299.00,  70),
('Face Wash',             6, 299.00,   400),
('Moisturizer SPF 50',    6, 499.00,   350);


-- ============================================================
-- INSERT: orders (20 records)
-- ============================================================
INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
(1,  '2025-01-05 10:30:00', 'delivered',  82998.00),
(2,  '2025-01-10 11:00:00', 'delivered',  3598.00),
(3,  '2025-01-15 09:45:00', 'delivered',  699.00),
(4,  '2025-01-20 14:00:00', 'shipped',    4998.00),
(5,  '2025-02-01 16:30:00', 'delivered',  2499.00),
(6,  '2025-02-05 12:00:00', 'delivered',  1298.00),
(7,  '2025-02-10 10:00:00', 'cancelled',  55000.00),
(8,  '2025-02-14 15:00:00', 'delivered',  899.00),
(9,  '2025-02-18 13:30:00', 'shipped',    69999.00),
(10, '2025-02-20 11:45:00', 'delivered',  798.00),
(11, '2025-03-01 09:00:00', 'delivered',  1999.00),
(12, '2025-03-05 10:30:00', 'pending',    2998.00),
(13, '2025-03-10 14:00:00', 'delivered',  4999.00),
(14, '2025-03-15 16:00:00', 'delivered',  1299.00),
(15, '2025-03-20 11:00:00', 'shipped',    3498.00),
(1,  '2025-04-01 10:00:00', 'delivered',  2499.00),
(2,  '2025-04-05 09:30:00', 'delivered',  699.00),
(3,  '2025-04-10 13:00:00', 'pending',    1298.00),
(4,  '2025-04-15 15:30:00', 'delivered',  499.00),
(5,  '2025-04-20 12:00:00', 'delivered',  5998.00);


-- ============================================================
-- INSERT: order_items (30 records)
-- ============================================================
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1,  1,  1, 79999.00),
(1,  4,  1, 2999.00),
(2,  6,  2, 799.00),
(2,  19, 1, 299.00),  -- face wash with shirt order
(3,  13, 1, 699.00),
(4,  9,  2, 2499.00),
(5,  15, 1, 2499.00),
(6,  11, 2, 299.00),
(6,  12, 1, 399.00),  -- wait adjusted below
(7,  3,  1, 55000.00),
(8,  17, 1, 899.00),
(9,  2,  1, 69999.00),
(10, 7,  1, 599.00),
(10, 19, 1, 299.00),  -- adjusted
(11, 14, 1, 1999.00),
(12, 4,  1, 2999.00),
(13, 5,  1, 4999.00),
(14, 8,  1, 1299.00),
(15, 10, 1, 3499.00),
(16, 15, 1, 2499.00),
(17, 12, 1, 699.00),
(18, 6,  1, 799.00),
(18, 20, 1, 499.00),
(19, 20, 1, 499.00),
(20, 16, 2, 1499.00),
(20, 18, 1, 1299.00),
(20, 19, 1, 299.00),
(6,  20, 1, 499.00),
(3,  11, 1, 299.00),
(4,  17, 1, 899.00);
