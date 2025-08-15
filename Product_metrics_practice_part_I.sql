-- PART 1. Product & User Behavior Metrics

--1.1 Daily/Weekly/Monthly Active Users (DAU/WAU/MAU) - сount unique customers per time period

SELECT sale_date as Day, count(distinct customer_id) as DAU
FROM orders
GROUP BY sale_date
ORDER BY sale_date

SELECT DATE_TRUNC('WEEK',sale_date) as week, count(distinct customer_id) as WAU
FROM orders
GROUP BY week
ORDER BY week

SELECT DATE_TRUNC('MONTH',sale_date) as Month, count(distinct customer_id) as MAU
FROM orders
GROUP BY month
ORDER BY month


-- 1.2 Retention Rate - сustomers who returned (made a purchase on more than one date)
--(Users who return / Users at start) × 100

SELECT DATE_TRUNC('month',start_date)::date as start_month,
       start_date, 
       date-start_date as day_number, 
       round(count(distinct customer_id)/
	   max(count(distinct customer_id))over(partition by start_date)::numeric,2) as retention
FROM
(SELECT customer_id, sale_date::date as date, min(sale_date::date)over(partition by customer_id) as start_date
FROM orders) t
GROUP BY start_date, date
ORDER BY start_date, day_number


-- 1.3 Conversion Rate - % of customers who made a purchase out of all customers

SELECT
	round(100*
	(SELECT COUNT(distinct customer_id) FROM orders) /
	(SELECT COUNT(distinct customer_id) FROM customer)::decimal,2) as Conversion_Rate


-- 1.4 Repeat Customers - customers made more than one purchase

SELECT customer_id, COUNT(product_id) as repeat_customer
FROM orders
GROUP BY customer_id
HAVING COUNT(product_id)>1
ORDER BY customer_id


-- 1.5 Top Products by quantity sold - rank products by total quantity sold

SELECT prod.product_name, SUM(quantity) as Top_Products_Quantity
FROM product prod left join orders o on prod.product_id=o.product_id
GROUP BY prod.product_name
ORDER BY Top_Products_Quantity DESC
LIMIT 10


-- 1.6 Product Popularity by category - group sales by product category

SELECT prod.category, SUM(quantity) as Top_category_sales
FROM product prod left join orders o on prod.product_id=o.product_id
GROUP BY prod.category
ORDER BY Top_category_sales DESC
LIMIT 3


-- 1.7 Average items per order - total quantity / number of sales

SELECT ROUND(AVG(quantity),2) as Avg_Items_per_Order
FROM orders

SELECT customer_id, ROUND(AVG(quantity),2) Avg_Items_per_Order_by_users
FROM orders
GROUP BY customer_id
ORDER BY customer_id


-- 1.8 Average time from Sale to delivery – (delivery date − sale date)

SELECT ROUND(AVG(delivery_date-sale_date),2) as avg_delivery_time
FROM orders


-- 1.9 Average Discount per product 

SELECT prod.product_name, ROUND(AVG(discount),2) as avg_discount_product
FROM orders o JOIN product prod on o.product_id=prod.product_id
GROUP BY prod.product_name
ORDER BY avg_discount_product DESC


-- 1.10 Orders per customer – customer engagement level

SELECT cus.customer_id, cus.customer_name, COUNT(product_id) as orders_per_customer
FROM orders o JOIN customer cus on o.customer_id=cus.customer_id
GROUP BY cus.customer_name, cus.customer_id
ORDER BY orders_per_customer DESC