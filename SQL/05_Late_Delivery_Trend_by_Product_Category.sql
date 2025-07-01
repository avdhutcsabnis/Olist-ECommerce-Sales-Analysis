-- 9. Late Delivery Trend by Product Category
SELECT pr.product_category_name, AVG(datediff(ordr.order_delivered_customer_date,ordr.order_estimated_delivery_date)) AS avg_delay_in_days
FROM olist_orders_dataset ordr
JOIN olist_order_items_dataset oi
ON ordr.order_id = oi.order_id
JOIN olist_products_dataset pr
ON oi.product_id = pr.product_id
WHERE ordr.order_delivered_customer_date> ordr.order_estimated_delivery_date
GROUP BY product_category_name
ORDER BY avg_delay_in_days DESC
LIMIT 10;