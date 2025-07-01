-- Case 1. Orders Overview
-- Number of orders by status
select order_status, count(*) as count from olist_orders_dataset
group by 1 
order by count desc;