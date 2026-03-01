# 🛒 E-Commerce Database Project

A beginner-to-intermediate SQL project that simulates a real-world e-commerce database. This project covers database design, table relationships, sample data, and a variety of SQL queries ranging from basic selects to advanced aggregations.

---

## 📁 Project Structure

```
ecommerce-sql-project/
│
├── README.md
├── schema/
│   └── create_tables.sql       # Creates all tables with relationships
├── data/
│   └── sample_data.sql         # Inserts realistic dummy data
├── queries/
│   ├── basic_queries.sql       # Simple SELECT, WHERE, ORDER BY queries
│   ├── joins.sql               # Queries combining multiple tables
│   └── aggregations.sql        # GROUP BY, SUM, COUNT, AVG queries
└── docs/
    └── erd_diagram.png         # Entity Relationship Diagram
```

---

## 🗂️ Database Schema

The database consists of 5 tables:

| Table | Description |
|---|---|
| `customers` | Stores customer info like name, email, city |
| `categories` | Product categories like Electronics, Clothing |
| `products` | Product details with price and stock |
| `orders` | Orders placed by customers with status |
| `order_items` | Individual products within each order |

### Relationships
- A **customer** can place many **orders**
- An **order** can contain many **products** (via `order_items`)
- A **product** belongs to one **category**

---

## ⚙️ How to Set Up and Run

### Prerequisites
- MySQL or any SQL-compatible database (MySQL Workbench, DBeaver, etc.)

### Steps

**1. Clone the repository**
```bash
git clone https://github.com/YOUR_USERNAME/ecommerce-sql-project.git
cd ecommerce-sql-project
```

**2. Create the database**
```sql
CREATE DATABASE ecommerce_db;
USE ecommerce_db;
```

**3. Run the schema file**
```bash
source schema/create_tables.sql
```

**4. Load the sample data**
```bash
source data/sample_data.sql
```

**5. Run any queries you like**
```bash
source queries/basic_queries.sql
source queries/joins.sql
source queries/aggregations.sql
```

---

## 🔍 Sample Queries & Output

### Total Revenue from Delivered Orders
```sql
SELECT SUM(total_amount) AS total_revenue
FROM orders
WHERE status = 'delivered';
```
| total_revenue |
|---|
| 194234.00 |

---

### Top 5 Customers by Spending
```sql
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.status = 'delivered'
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 5;
```
| customer_name | total_spent |
|---|---|
| Aman Singh | 85497.00 |
| Arjun Kapoor | 69999.00 |
| Karan Mehta | 8497.00 |
| ... | ... |

---

### Most Ordered Products
```sql
SELECT p.name, SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_quantity_sold DESC
LIMIT 5;
```

---

## 💡 Concepts Covered

- Database design and normalization
- Primary keys and foreign keys
- One-to-many relationships
- INNER JOIN, LEFT JOIN
- WHERE, ORDER BY, LIMIT
- GROUP BY, COUNT, SUM, AVG
- Subqueries and filtering with HAVING

---

## 🛠️ Tools Used

- MySQL
- MySQL Workbench
- Git & GitHub

---

## 👤 Author

**Aman Singh**  
GitHub: [@Amancodefor2002](https://github.com/Amancodefor2002)

---

## 📌 Note

This project was built for learning and practice purposes. Feel free to fork it, use it, or build on top of it!
