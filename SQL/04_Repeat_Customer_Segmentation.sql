-- 8. Repeat Customer Segmentation
WITH customer_orders AS (
	SELECT cus.customer_unique_id, ordr.order_id, 
    ROW_NUMBER() OVER(PARTITION BY cus.customer_unique_id ORDER BY ordr.order_purchase_timestamp DESC) AS order_rank
    FROM olist_customers_dataset cus
    JOIN olist_orders_dataset ordr
    ON cus.customer_id = ordr.customer_id
)
-- Segmentating unique customers based on number of times they repeat the orders.
SELECT customer_unique_id, count(order_rank) AS total_orders,
CASE
	WHEN COUNT(order_rank)>= 5 THEN 'High'
	WHEN COUNT(order_rank) BETWEEN 3 AND 4 THEN 'Medium'
	WHEN COUNT(order_rank) = 2 THEN 'Low'
    ELSE 'One-Time'
END AS customer_segment
FROM customer_orders
GROUP BY customer_unique_id
ORDER BY total_orders DESC;