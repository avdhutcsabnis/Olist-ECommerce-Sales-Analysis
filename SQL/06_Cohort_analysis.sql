-- 10. Cohort analysis (Repeat Purchase by Month)
WITH first_order AS
(SELECT cus.customer_unique_id, MIN(DATE_FORMAT(ordr.order_purchase_timestamp, '%Y-%m')) AS cohort_month
FROM olist_orders_dataset ordr
JOIN olist_customers_dataset cus
ON ordr.customer_id = cus.customer_id
GROUP BY customer_unique_id
ORDER BY cohort_month),

monthly_order AS
(SELECT cus.customer_unique_id, DATE_FORMAT(ordr.order_purchase_timestamp, '%Y-%m') AS order_month
FROM olist_orders_dataset ordr
JOIN olist_customers_dataset cus
ON ordr.customer_id = cus.customer_id),

cohort_analysis AS 
(SELECT f.cohort_month, m.order_month, COUNT(DISTINCT f.customer_unique_id) AS active_customers
FROM first_order f
JOIN monthly_order m
ON f.customer_unique_id = m.customer_unique_id
GROUP BY cohort_month, order_month
ORDER BY cohort_month, order_month)

SELECT * FROM cohort_analysis;