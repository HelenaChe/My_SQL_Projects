-- Creating a products table 
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10, 2)
);

-- Creating a customers table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    registration_date DATE
);

-- Creating a sales table
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    customer_id INT REFERENCES customers(customer_id),
    quantity INT,
    discount NUMERIC(5, 2),
    sale_date DATE,
    delivery_date DATE
);


-- Adding sample data to the products table
INSERT INTO products (product_name, category, price) VALUES
('Laptop Pro 15"', 'Electronics', 1300.00),
('Wireless Headphones', 'Electronics', 220.00),
('Gaming Mouse', 'Electronics', 75.00),
('Coffee Maker', 'Home Appliances', 180.00),
('Espresso Cup Set', 'Kitchen', 25.00),
('Office Chair', 'Furniture', 320.00),
('Notebook A5', 'Stationery', 4.50),
('Backpack X', 'Accessories', 60.00),
('Bluetooth Speaker', 'Electronics', 90.00),
('Standing Desk', 'Furniture', 490.00);


-- Adding sample data to the customers table
INSERT INTO customers (name, email, registration_date) VALUES
('Alice Green', 'alice.green@email.com', '2025-05-01'),
('Bob Brown', 'bob.brown@email.com', '2025-05-02'),
('Catherine Young', 'cathy.young@email.com', NULL),
('Daniel Smith', NULL, '2025-06-15'),
('Eva Black', 'eva.black@email.com', '2025-07-01'),
('Frank Lee', 'frank.lee@email.com', '2025-07-10'),
('Grace White', 'grace.white@email.com', NULL),
('Henry Adams', 'henry.adams@email.com', '2025-06-22'),
('Irene Moore', 'irene.moore@email.com', '2025-07-15'),
('Jack Wilson', NULL, NULL),
('Karen Davis', 'karen.davis@email.com', '2025-05-30'),
('Leo Carter', 'leo.carter@email.com', '2025-07-20'),
('Maria Lopez', NULL, '2025-07-25'),
('Nathan Bell', 'nathan.bell@email.com', '2025-07-26'),
('Olivia Rose', 'olivia.rose@email.com', '2025-08-01'),
('Peter Hall', 'peter.hall@email.com', '2025-08-01'),
('Quincy Ford', 'quincy.ford@email.com', NULL),
('Rachel Long', 'rachel.long@email.com', '2025-06-30'),
('Sam West', NULL, '2025-07-04'),
('Tina Ray', 'tina.ray@email.com', NULL),
('Ulysses King', 'ulysses.king@email.com', '2025-08-02'),
('Vera Nash', 'vera.nash@email.com', '2025-06-18'),
('Will Ortiz', 'will.ortiz@email.com', '2025-07-14'),
('Xander Fox', NULL, NULL),
('Yana Brooks', 'yana.brooks@email.com', '2025-08-03'),
('Zoe Price', 'zoe.price@email.com', '2025-07-29'),
('Adam Kent', 'adam.kent@email.com', '2025-07-05'),
('Bella Quinn', NULL, '2025-08-04'),
('Chris Dean', 'chris.dean@email.com', NULL),
('Daisy Hill', 'daisy.hill@email.com', '2025-06-11'),
('Anna Torres', NULL, '2025-06-01'),
('Ben Doyle', 'ben.doyle@email.com', '2025-06-02'),
('Clara Finch', 'clara.f@email.com', NULL),
('Derek Wu', 'derek.wu@email.com', '2025-06-03'),
('Elena Cruz', NULL, '2025-06-05'),
('Felix Hart', 'felix.h@email.com', '2025-06-06'),
('Greta Burns', NULL, NULL),
('Hugo Kemp', 'hugo.kemp@email.com', '2025-06-07'),
('Isabel Noor', 'isabel.noor@email.com', '2025-06-09'),
('Jason Fox', 'j.fox@email.com', NULL),
('Kylie Moon', 'kylie.moon@email.com', '2025-06-10'),
('Louis Webb', NULL, '2025-06-11'),
('Mona Drew', 'mona.drew@email.com', NULL),
('Nora Owen', 'nora.owen@email.com', '2025-06-12'),
('Oscar Finn', 'oscar.finn@email.com', '2025-06-13'),
('Paula Reed', NULL, '2025-06-15'),
('Quinn Marsh', 'quinn.marsh@email.com', '2025-06-16'),
('Rita Gale', 'rita.gale@email.com', '2025-06-17'),
('Simon Park', NULL, NULL),
('Tara Lee', 'tara.lee@email.com', '2025-06-18');



-- Adding sample data to the sales table
INSERT INTO sales (product_id, customer_id, quantity, discount, sale_date, delivery_date) VALUES
(1, 31, 1, 0.00, '2025-06-05', '2025-06-07'),
(2, 32, 2, 5.00, '2025-06-06', '2025-06-09'),
(3, 33, 1, 0.00, '2025-06-07', '2025-06-10'),
(4, 34, 1, 0.00, '2025-06-08', '2025-06-11'),
(5, 35, 2, 0.00, '2025-06-09', '2025-06-12'),
(6, 36, 1, 0.00, '2025-06-10', '2025-06-13'),
(7, 37, 1, 0.00, '2025-06-11', '2025-06-13'),
(8, 38, 2, 0.00, '2025-06-12', '2025-06-15'),
(9, 39, 1, 0.00, '2025-06-12', '2025-06-14'),
(10, 40, 1, 0.00, '2025-06-13', '2025-06-15'),
(1, 32, 1, 0.00, '2025-06-14', '2025-06-16'),  
(2, 32, 1, 0.00, '2025-06-14', '2025-06-17'),
(3, 34, 1, 0.00, '2025-06-15', '2025-06-17'),
(4, 34, 1, 0.00, '2025-06-16', '2025-06-19'),
(5, 34, 1, 0.00, '2025-06-17', '2025-06-20'),

(1, 1, 1, 0.00, '2025-07-01', '2025-07-03'),
(2, 2, 2, 5.00, '2025-07-01', '2025-07-04'),
(3, 2, 1, 0.00, '2025-07-10', '2025-07-12'),
(4, 4, 1, 10.00, '2025-07-11', '2025-07-14'),
(5, 5, 1, 0.00, '2025-07-12', '2025-07-15'),
(6, 6, 1, 0.00, '2025-07-12', '2025-07-14'),
(7, 7, 5, 0.00, '2025-07-14', '2025-07-16'),
(8, 8, 1, 0.00, '2025-07-14', '2025-07-16'),
(9, 9, 2, 0.00, '2025-07-15', '2025-07-18'),
(10, 10, 1, 0.00, '2025-07-16', NULL),
(2, 11, 2, 5.00, '2025-07-17', '2025-07-20'),
(3, 12, 1, 0.00, '2025-07-18', '2025-07-20'),
(4, 13, 2, 0.00, '2025-07-18', '2025-07-21'),
(5, 14, 1, 5.00, '2025-07-19', '2025-07-22'),
(1, 15, 1, 0.00, '2025-07-19', '2025-07-21'),
(6, 16, 2, 0.00, '2025-07-20', '2025-07-23'),
(7, 17, 1, 0.00, '2025-07-21', '2025-07-24'),
(8, 18, 2, 0.00, '2025-07-22', '2025-07-25'),
(9, 19, 1, 0.00, '2025-07-23', '2025-07-26'),
(10, 20, 1, 0.00, '2025-07-24', '2025-07-27'),
(1, 2, 1, 0.00, '2025-07-25', '2025-07-27'),
(2, 3, 1, 5.00, '2025-07-25', '2025-07-27'),
(3, 4, 1, 0.00, '2025-07-26', '2025-07-28'),
(4, 5, 2, 0.00, '2025-07-26', '2025-07-29'),
(5, 6, 1, 0.00, '2025-07-27', '2025-07-30'),
(6, 7, 1, 0.00, '2025-07-27', '2025-07-29'),
(7, 8, 2, 0.00, '2025-07-28', '2025-07-31'),
(8, 9, 1, 0.00, '2025-07-29', '2025-08-01'),
(9, 10, 1, 0.00, '2025-07-30', '2025-08-02'),
(10, 11, 2, 0.00, '2025-07-30', '2025-08-03'),

(1, 12, 1, 0.00, '2025-08-01', '2025-08-03'),
(2, 13, 2, 10.00, '2025-08-01', '2025-08-04'),
(3, 14, 1, 0.00, '2025-08-02', '2025-08-05'),
(4, 15, 2, 0.00, '2025-08-02', '2025-08-05'),
(5, 16, 1, 0.00, '2025-08-03', '2025-08-06'),
(6, 17, 1, 0.00, '2025-08-04', '2025-08-07'),
(7, 18, 2, 0.00, '2025-08-04', '2025-08-07'),
(8, 19, 1, 0.00, '2025-08-05', '2025-08-08'),
(9, 20, 1, 0.00, '2025-08-06', NULL),
(10, 21, 2, 5.00, '2025-08-06', '2025-08-09'),
(1, 22, 1, 0.00, '2025-08-07', '2025-08-10'),
(2, 23, 1, 0.00, '2025-08-07', '2025-08-10'),
(3, 24, 1, 0.00, '2025-08-08', '2025-08-11'),
(4, 25, 1, 0.00, '2025-08-09', '2025-08-12'),
(5, 26, 1, 0.00, '2025-08-09', '2025-08-12'),
(6, 27, 2, 0.00, '2025-08-10', '2025-08-13'),
(7, 28, 1, 0.00, '2025-08-10', '2025-08-13'),
(8, 29, 1, 0.00, '2025-08-10', NULL),
(9, 30, 1, 0.00, '2025-08-10', '2025-08-13');


-- Chapter 1. Product / User Behavior Metrics
--1.1 Daily/Weekly/Monthly Active Users (DAU/WAU/MAU) - сount unique customers per time period

SELECT sale_date as Day, count(distinct customer_id) as DAU
FROM sales
GROUP BY sale_date
ORDER BY sale_date

SELECT DATE_TRUNC('WEEK',sale_date) as week, count(distinct customer_id) as WAU
FROM sales
GROUP BY week
ORDER BY week

SELECT DATE_TRUNC('MONTH',sale_date) as Month, count(distinct customer_id) as MAU
FROM sales
GROUP BY month
ORDER BY month


-- 1.2 Retention Rate - сustomers who returned (made a purchase on more than one date)
--(Users who return / Users at start) × 100

SELECT
  first_week,
  ROUND(COUNT(*) FILTER (WHERE week_count > 1)::decimal / COUNT(*) * 100, 2) AS retention_rate
FROM (
    SELECT
        customer_id,
        MIN(DATE_TRUNC('week', sale_date)) AS first_week,
        COUNT(DISTINCT DATE_TRUNC('week', sale_date)) AS week_count
    FROM sales
    GROUP BY customer_id) sub_t
GROUP BY first_week
ORDER BY first_week;


-- 1.3 Activation Rate - % of customers who made at least one purchase

SELECT 
	round(COUNT(DISTINCT customer_id)/
	(SELECT COUNT(customer_id) FROM customers)::decimal*100,2) as Activation_Rate
FROM sales


-- 1.4 Conversion Rate - % of customers who made a purchase out of all customers

SELECT
	round(100*
	(SELECT COUNT(distinct customer_id) FROM sales) /
	(SELECT COUNT(distinct customer_id) FROM customers)::decimal,2) as Conversion_Rate


-- 1.5 Repeat Customers - customers made more than one purchase

SELECT customer_id, COUNT(product_id) as repeat_customer
FROM sales
GROUP BY customer_id
HAVING COUNT(product_id)>1
ORDER BY customer_id


-- 1.6 Top Products by quantity sold - rank products by total quantity sold

SELECT prod.product_name, SUM(quantity) as Top_Products_Quantity
FROM products prod left join sales sal on prod.product_id=sal.product_id
GROUP BY prod.product_name
ORDER BY Top_Products_Quantity DESC
LIMIT 10


-- 1.7 Product Popularity by category - group sales by product category

SELECT prod.category, SUM(quantity) as Top_category_sales
FROM products prod left join sales sal on prod.product_id=sal.product_id
GROUP BY prod.category
ORDER BY Top_category_sales DESC
LIMIT 10


-- 1.8 Average items per order - total quantity / number of sales

SELECT ROUND(AVG(quantity),2) as Avg_Items_per_Order
FROM sales

SELECT customer_id, ROUND(AVG(quantity),2) Avg_Items_per_Order_by_users
FROM sales
GROUP BY customer_id
ORDER BY customer_id


-- 1.9 Average time from Sale to delivery – (delivery date − sale date)

SELECT ROUND(AVG(delivery_date-sale_date),2) as avg_delivery_time
FROM sales


-- 1.10 Average Discount per product / Order

SELECT prod.product_name, ROUND(AVG(discount),2) as avg_discount_product
FROM sales sal JOIN products prod on sal.product_id=prod.product_id
GROUP BY prod.product_name
ORDER BY avg_discount_product DESC


-- 1.11 Orders per customer – customer engagement level

SELECT cus.customer_id, cus.name, COUNT(product_id) as orders_per_customer
FROM sales sal JOIN customers cus on sal.customer_id=cus.customer_id
GROUP BY cus.name, cus.customer_id
ORDER BY orders_per_customer DESC














