-- P4: State-wise Delivery Performance
-- Question: Kaunse states mein delivery sabse slow hai?
-- Insight: Remote states (RR=29.3 days, AP=27.1 days) vs SP=8.7 days
-- Key Finding: Warehouse nahi = delivery slow = review score kam

-- P4a: Sabse slow states (Top 10)
SELECT 
    c.customer_state,
    COUNT(o.order_id)                                                    AS total_orders,
    ROUND(AVG(DATEDIFF(o.order_delivered_customer_date, 
              o.order_purchase_timestamp)), 1)                           AS avg_delivery_days,
    ROUND(AVG(r.review_score), 2)                                        AS avg_review_score
FROM olist_orders_dataset o
JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
JOIN olist_order_reviews_dataset r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
AND o.order_delivered_customer_date IS NOT NULL
AND o.order_delivered_customer_date != ''
GROUP BY c.customer_state
ORDER BY avg_delivery_days DESC
LIMIT 10;

-- P4b: SP (Sao Paulo) performance -- benchmark state
-- Insight: SP = 8.7 days delivery, 4.25 stars -- best performer
SELECT 
    c.customer_state,
    COUNT(o.order_id)                                                    AS total_orders,
    ROUND(AVG(DATEDIFF(o.order_delivered_customer_date, 
              o.order_purchase_timestamp)), 1)                           AS avg_delivery_days,
    ROUND(AVG(r.review_score), 2)                                        AS avg_review_score
FROM olist_orders_dataset o
JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
JOIN olist_order_reviews_dataset r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
AND o.order_delivered_customer_date IS NOT NULL
AND o.order_delivered_customer_date != ''
AND c.customer_state = 'SP'
GROUP BY c.customer_state;