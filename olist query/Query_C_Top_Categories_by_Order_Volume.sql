-- Query C: Top Categories by Order Volume
-- Question: Which products sell most -- are they repeat-purchase friendly?
-- Insight: Top categories (Bed/Bath, Furniture) are one-time purchase products
-- Key Finding: Structural repeat purchase problem -- not operational

USE olist;

SELECT 
    p.product_category_name,
    COUNT(o.order_id)              AS total_orders,
    ROUND(AVG(i.price), 2)         AS avg_price
FROM olist_orders_dataset o
JOIN olist_order_items_dataset i ON o.order_id = i.order_id
JOIN olist_products_dataset p ON i.product_id = p.product_id
WHERE o.order_status = 'delivered'
GROUP BY p.product_category_name
ORDER BY total_orders DESC
LIMIT 10;