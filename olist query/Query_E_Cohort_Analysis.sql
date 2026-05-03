-- ============================================================
-- QUERY D3: Cohort Analysis
-- Question: Did any customer return in subsequent months?
-- Insight: 0% retention across all cohorts 2016-2018
-- Key Finding: Even Black Friday customers (7,544 in Nov 2017)
--              never returned next month
-- ============================================================

USE olist;
-- CREATE VIEW v_cohort_analysis AS
-- Step 1: Run this query to see cohort data
SELECT
    DATE_FORMAT(first_order.first_order_date, '%Y-%m') AS cohort_month,
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m')   AS order_month,
    COUNT(DISTINCT o.customer_id)                      AS active_customers
FROM olist_orders_dataset o
JOIN (
    SELECT 
        customer_id,
        MIN(order_purchase_timestamp) AS first_order_date
    FROM olist_orders_dataset
    GROUP BY customer_id
) AS first_order ON o.customer_id = first_order.customer_id
GROUP BY cohort_month, order_month
ORDER BY cohort_month, order_month;

-- Result Summary:
-- 2016-09  4 customers    -- Dataset start
-- 2017-01  800 customers  -- Growth begins
-- 2017-11  7,544 customers -- Black Friday spike
-- 2018-08  6,512 customers -- Last full month
-- 2018-09  16 customers   -- Dataset ending (incomplete)

-- Key Observation:
-- cohort_month = order_month for ALL rows
-- No customer appears in ANY subsequent month
-- Confirms 0% Repeat Rate across entire 18-month period



