-- PART 2. Financial and Marketing Metrics

-- 2.1 Total Revenue - Total income from all sales
-- SUM(price × quantity × (1 - discount/100))

select round(sum(price*quantity*(1-discount/100)),2) as Total_Revenue
from product p join orders o using (product_id)


-- 2.2 Average Revenue per User (ARPU) - Average amount spent per customer
-- Total Revenue / Number of Active Customers

select 
	round(sum(price*quantity*(1-discount/100))/
	count(distinct customer_id),2) as ARPU
from product p join orders o using (product_id)


-- 2.3 Customer Lifetime Value (LTV) - Estimated revenue per customer over their lifetime
-- ARPU × Average Purchase Frequency

with 
arpu_t as
(select sum(price*quantity*(1-discount/100))/count(distinct customer_id) as ARPU
from product p join orders o using (product_id)),

freq_t as
(select count(order_id)/count(distinct customer_id)::decimal as avg_purchase_freq
from orders)

select round(arpu*avg_purchase_freq,2) as LTV
from arpu_t cross join freq_t


-- 2.4 Average Order Value (AOV) - Average value per order
-- Total Revenue / Number of Orders

select 
	round(sum(price*quantity*(1-discount/100))/
	count(order_id),2) as AOV
from product p join orders o using (product_id)


-- 2.5 Customer Acquisition Cost (CAC) - Average cost to acquire one customer
-- Total Marketing Spend (constant) / New Customers

select round(20500/count(distinct customer_id),2) as CAC
from orders


-- 2.6 Return on Investment (ROI) - Profitability of sales relative to cost
-- ((Revenue – Cost) / Cost) × 100; assume cost = 35% of product price

select 
	round(
	(sum(price*quantity*(1-discount/100))-sum(price*quantity*0.35))
	/sum(price*quantity*0.35)*100,2) as ROI
from product p join orders o using (product_id)


-- 2.7 Discount Rate Impact - Average percentage of discount on sold products
-- (Average Discount / 100)

select round(avg(discount),2) as Average_Discount
from orders






