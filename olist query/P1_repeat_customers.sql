USE olist;

-- P1: Repeat Customers Analysis
-- Question: How many customers ordered once vs multiple times?
-- Insight: 99,441 out of 99,441 customers ordered only once — Repeat Rate = 0%

SELECT total_orders, COUNT(customer_id) AS total_customers
FROM (
    SELECT customer_id, COUNT(order_id) AS total_orders
    FROM olist_orders_dataset
    GROUP BY customer_id
) AS customer_orders
GROUP BY total_orders;


-- P1b: Checking if any customer ordered 2 or more times
-- Question: Is there even a single customer who came back?
-- Insight: No results — confirms zero repeat customers

SELECT customer_id, COUNT(order_id) AS total_orders
FROM olist_orders_dataset
GROUP BY customer_id
HAVING COUNT(order_id) >= 2;