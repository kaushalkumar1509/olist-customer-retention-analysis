-- Question: How long does delivery actually take?
-- Insight: 12.5 days average -- 4x above 3-day benchmark
-- Note: Only delivered orders, blanks and NULLs excluded

USE olist;

SELECT 
    order_id,
    order_purchase_timestamp,
    order_delivered_customer_date,
    DATEDIFF(order_delivered_customer_date, order_purchase_timestamp) AS delivery_days
   


FROM olist_orders_dataset;
SELECT COUNT(*) 

FROM olist_orders_dataset
WHERE order_delivered_customer_date = '';
SELECT 
    AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)) AS avg_delivery_days
FROM olist_orders_dataset
WHERE order_status = 'delivered'
AND order_delivered_customer_date IS NOT NULL
AND order_delivered_customer_date != '';


