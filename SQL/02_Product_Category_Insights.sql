-- 2. Product Category Insights
-- Top 10 product categories by number of items sold
SELECT product_category_name, COUNT(*) AS total_items FROM olist_order_items_dataset oi
LEFT JOIN olist_products_dataset p
ON oi.product_id = p.product_id
GROUP BY 1
ORDER BY total_items DESC
LIMIT 10;