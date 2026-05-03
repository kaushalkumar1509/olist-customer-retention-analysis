-- P3: Delivery Speed vs Review Score (Brazil benchmarks)
-- Question: Do late deliveries get worse reviews?
-- Insight: 1-7 days = 4.41 stars | 8-15 days = 4.29 | 16-20 days = 4.11 | 20+ days = 3.16 stars
-- Key Finding: 20+ days delivery = score drops to 3.16 -- clear dissatisfaction
USE olist;

SELECT 
    CASE
        WHEN DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp) BETWEEN 1 AND 7 
             THEN '1-7 days (Fast)'
        WHEN DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp) BETWEEN 8 AND 15 
             THEN '8-15 days (Normal)'
        WHEN DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp) BETWEEN 16 AND 20 
             THEN '16-20 days (Slow)'
        ELSE '20+ days (Very Slow)'
    END AS delivery_bucket,
    COUNT(*) AS total_orders,
    ROUND(AVG(r.review_score), 2) AS avg_review_score
FROM olist_orders_dataset o
JOIN olist_order_reviews_dataset r 
ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
AND o.order_delivered_customer_date IS NOT NULL
AND o.order_delivered_customer_date != ''
GROUP BY delivery_bucket
ORDER BY avg_review_score DESC;