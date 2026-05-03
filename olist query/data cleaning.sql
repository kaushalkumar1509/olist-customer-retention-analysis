USE olist;
-- NULL check

-- SELECT 
--     COUNT(*) AS total_rows,
--     COUNT(order_delivered_customer_date) AS delivered_not_null,
--     COUNT(order_estimated_delivery_date) AS estimated_not_null
-- FROM olist_orders_dataset;

-- Missing delivery data check


-- SELECT *
-- FROM olist_orders_dataset
-- WHERE order_delivered_customer_date IS NULL
-- LIMIT 05;

-- Duplicate check 

--   SELECT order_id, COUNT(*)
-- FROM olist_orders_dataset
-- GROUP BY order_id
-- HAVING COUNT(*) > 1;

-- Negative delivery check

-- SELECT *
-- FROM clean_orders
-- WHERE DATEDIFF(order_delivered_customer_date, order_purchase_timestamp) < 0;

-- Outlier check

-- SELECT 
--     MIN(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)) AS min_days,
--     MAX(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)) AS max_days,
--     AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)) AS avg_days
-- FROM clean_orders;

-- Outlier remove

-- CREATE VIEW clean_orders_final AS
-- SELECT *
-- FROM clean_orders
-- WHERE DATEDIFF(order_delivered_customer_date, order_purchase_timestamp) BETWEEN 0 AND 30;

-- Payments cleaning

-- SELECT *
-- FROM olist_order_payments_dataset
-- WHERE payment_value IS NULL;

-- Reviews cleaning

-- SELECT *
-- FROM olist_order_reviews_dataset
-- WHERE review_score IS NULL;

-- SELECT COUNT(*) FROM olist_orders_dataset;
-- SELECT COUNT(*) FROM olist_customers_dataset;
-- SELECT * FROM olist_orders_dataset LIMIT 5;





