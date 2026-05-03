-- Query B: Price vs Review Score
-- Question: Do expensive products get worse reviews?
-- Insight: Price has NO significant impact on review score
-- Key Finding: Low (4.08) vs Premium (4.10) -- almost same score
-- Conclusion: Problem is NOT price-related -- it is geography and category specific

USE olist;

SELECT 
    CASE
        WHEN i.price <= 50   THEN 'Low (0-50)'
        WHEN i.price <= 200  THEN 'Mid (51-200)'
        WHEN i.price <= 500  THEN 'High (201-500)'
        ELSE 'Premium (500+)'
    END                                   AS price_bucket,
    COUNT(r.review_id)                    AS total_orders,
    ROUND(AVG(r.review_score), 2)         AS avg_review_score,
    ROUND(SUM(CASE WHEN r.review_score <= 2 
        THEN 1 ELSE 0 END) * 100.0 / 
        COUNT(*), 1)                      AS bad_review_pct
FROM olist_order_reviews_dataset r
JOIN olist_orders_dataset o ON r.order_id = o.order_id
JOIN olist_order_items_dataset i ON o.order_id = i.order_id
WHERE o.order_status = 'delivered'
GROUP BY price_bucket
ORDER BY avg_review_score ASC;