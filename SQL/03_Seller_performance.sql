-- 3. Seller performance
-- Top 10 sellers by revenue
SELECT s.seller_id, ROUND(SUM(oi.price+oi.freight_value),2) revenue FROM olist_order_items_dataset oi
JOIN olist_sellers_dataset s
ON oi.seller_id = s.seller_id
GROUP BY seller_id
ORDER BY revenue DESC
LIMIT 10;