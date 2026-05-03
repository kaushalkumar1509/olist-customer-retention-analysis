qa
-- Question: Which product category has the most complaints?
-- Insight: Office Furniture (moveis_escritorio) = 26.1% bad review rate
-- Key Finding: Heavy products + long distance delivery = damage = complaints

USE olist;

SELECT 
    p.product_category_name,
    COUNT(r.review_id)                    AS total_reviews,
    ROUND(AVG(r.review_score), 2)         AS avg_review_score,
    SUM(CASE WHEN r.review_score <= 2 
        THEN 1 ELSE 0 END)                AS bad_reviews,
    ROUND(SUM(CASE WHEN r.review_score <= 2 
        THEN 1 ELSE 0 END) * 100.0 / 
        COUNT(*), 1)                      AS bad_review_pct
FROM olist_order_reviews_dataset r
JOIN olist_orders_dataset o ON r.order_id = o.order_id
JOIN olist_order_items_dataset i ON o.order_id = i.order_id
JOIN olist_products_dataset p ON i.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY bad_review_pct DESC
LIMIT 10;