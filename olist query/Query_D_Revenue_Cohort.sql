-- ============================================================
-- QUERY D: Revenue & Business Health Analysis
-- Question: How much revenue is Olist generating per customer?
-- Is the business profitable or loss-making?
-- ============================================================

-- D1: Overall Revenue Analysis
-- Insight: Revenue per customer = R$159.86
-- With 0% repeat rate -- business losing money on every customer

SELECT
    COUNT(DISTINCT o.customer_id)                    AS total_customers,
    ROUND(SUM(p.payment_value), 2)                   AS total_revenue,
    ROUND(AVG(p.payment_value), 2)                   AS avg_order_value,
    ROUND(SUM(p.payment_value) / 
          COUNT(DISTINCT o.customer_id), 2)          AS revenue_per_customer
FROM olist_orders_dataset o
JOIN olist_order_payments_dataset p ON o.order_id = p.order_id
WHERE o.order_status = 'delivered';

-- Result:
-- total_customers    = 96,477
-- total_revenue      = R$ 15,422,461.77
-- avg_order_value    = R$ 153.07
-- revenue_per_customer = R$ 159.86

-- Business Insight:
-- Olist earns ~15% commission = R$24 per customer
-- If CAC = R$50-100 -- loss of R$26-76 per customer
-- Fix: Need 3+ repeat orders per customer to break even


-- ============================================================
-- D2: Payment Type Analysis
-- Question: Which payment method do customers prefer?
-- Insight: 77% credit card -- avg 3.5 EMI
-- ============================================================

SELECT 
    payment_type,
    COUNT(*)                                         AS total_orders,
    ROUND(AVG(payment_value), 2)                     AS avg_order_value,
    ROUND(SUM(payment_value), 2)                     AS total_revenue,
    ROUND(AVG(payment_installments), 1)              AS avg_installments
FROM olist_order_payments_dataset
GROUP BY payment_type
ORDER BY total_orders DESC;

-- Result:
-- credit_card  76,795 orders  R$163 avg  3.5 EMI
-- boleto       19,784 orders  R$145 avg  1.0 EMI
-- voucher       5,775 orders  R$65  avg  1.0 EMI
-- debit_card    1,529 orders  R$142 avg  1.0 EMI

-- Business Insight:
-- 77% customers use credit card -- financially capable of repeat purchase
-- Voucher users (R$65 avg) = discount hunters -- low loyalty
-- Boleto = cash customers -- lower income -- repeat unlikely


-- ============================================================
-- D3: Cohort Analysis
-- Question: Did any customer come back in subsequent months?
-- Insight: Every cohort shows 0 returning customers
-- ============================================================

CREATE VIEW v_cohort_analysis AS
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

-- Result:
-- cohort_month = order_month for ALL rows
-- No customer appears in any subsequent month
-- Confirms: 0% Repeat Rate across ALL cohorts 2016-2018

-- Business Insight:
-- November 2017 spike (7,544 customers) = Black Friday effect
-- Even Black Friday customers never returned
-- Platform acquiring customers but building zero loyalty