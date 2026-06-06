[README.md](https://github.com/user-attachments/files/28663308/README.md)
# 🛒 Olist E-Commerce — Customer Retention Analysis
### Business Analyst Portfolio Project | SQL + Power BI | Real Data

![Dashboard](dashboard_preview.png)

---

## 📌 Problem Statement

> **"93,099 out of 93,358 unique customers placed exactly ONE order and never returned. Repeat Rate = 3.1%. Why?"**

A Brazilian e-commerce company (Olist) was spending heavily on customer acquisition but losing almost every customer after their first purchase. This project digs into the real data to find out why — and what to fix.

---

## 🛠️ Tools Used

| Tool | Purpose |
|------|---------|
| MySQL Workbench | SQL queries + Views |
| Power BI Desktop | Dashboard + DAX measures |
| Kaggle Dataset | Real Olist e-commerce data |

---

## 📂 Dataset

**Source:** [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

| File | Description |
|------|-------------|
| `olist_orders_dataset.csv` | All orders 2016-2018 |
| `olist_customers_dataset.csv` | Customer info + unique ID |
| `olist_order_items_dataset.csv` | Products per order |
| `olist_order_reviews_dataset.csv` | Review scores |
| `olist_order_payments_dataset.csv` | Payment values |
| `olist_products_dataset.csv` | Product categories |
| `olist_sellers_dataset.csv` | Seller locations |
| `olist_geolocation_dataset.csv` | State coordinates |
| `product_category_name_translation.csv` | Portuguese → English |

---

## 📊 Dashboard KPIs

| Metric | Value | Target | Status |
|--------|-------|--------|--------|
| Unique Customers | 93,358 | — | ✅ |
| Repeat Rate | 3.1% | 25%+ | 🔴 Critical |
| Avg Delivery Days | 12.5 days | 8 days | 🟡 Monitor |
| Avg Review Score | 4.09 / 5 | 4.5+ | 🟡 Monitor |
| Total Revenue | R$15.42M | — | ✅ |

---

## 🔍 Key Findings

### Finding 1 — 97% One-Time Buyers
93,099 customers ordered exactly once. Root cause: 77% of orders were furniture and electronics — one-time purchase products. Only Beauty & Health (13K orders) was repeat-friendly but Olist had **no loyalty program**.

### Finding 2 — Geographic Delivery Gap
| State | Avg Delivery |
|-------|-------------|
| RR (Roraima) | 29.3 days 🔴 |
| AP (Amapá) | 27.1 days 🔴 |
| SP (São Paulo) | 9.0 days 🟢 |

Remote states had no warehouse coverage — marketing was running in areas that couldn't be served properly.

### Finding 3 — Delivery Speed vs Satisfaction
| Delivery Speed | Avg Review Score |
|----------------|-----------------|
| 1–7 days (Fast) | ⭐ 4.41 |
| 8–15 days (Normal) | ⭐ 4.29 |
| 16–20 days (Slow) | ⭐ 4.11 |
| 20+ days (Very Slow) | ⭐ 3.16 |

### Finding 4 — Product Mix Problem
Top categories were all one-time purchases:
- Furniture & Home: 29K orders
- Electronics: 19K orders
- Only Beauty & Health (13K) = repeat-friendly

---

## 💡 Recommendations

| # | Action | Based On | Impact |
|---|--------|----------|--------|
| 1 | Launch loyalty program for Beauty & Health | Only repeat-friendly category | Start recovering toward 25% repeat rate |
| 2 | Re-engagement emails to 90K+ one-time buyers | 97% one-time rate | Even 5% conversion = major revenue gain |
| 3 | Stop marketing in RR, AP, AM states | 29+ day delivery, no warehouse | Save CAC + protect brand |
| 4 | Add 3PL logistics for remote states | State delivery gap | Cut remote delivery from 29 → 15 days |
| 5 | Improve packaging for office furniture | 26% bad review rate | Reduce complaints below 10% |

---

## 🗃️ SQL Queries

| Query | Question | Key Result |
|-------|----------|------------|
| P1 | How many customers came back? | 3.1% repeat rate |
| P2 | Avg delivery time? | 12.5 days |
| P3 | Does late delivery hurt reviews? | 20+ days = 3.16 stars |
| P4 | Which states have worst delivery? | RR = 29.3 days |
| Query A | Which categories get most complaints? | Office Furniture 26% |
| Query B | Does price affect satisfaction? | No impact |
| Query C | Which products sell most? | Furniture 29K |
| Query D | Revenue per customer? | R$159.86 |
| Query E | Did any customer return next month? | Only 3.1% |

---

## 📐 DAX Measure — Repeat Rate %

```dax
Repeat Rate % =
VAR RepeatCustomers =
    COUNTROWS(
        FILTER(
            ADDCOLUMNS(
                VALUES(customers[customer_unique_id]),
                "OrderCount",
                CALCULATE(COUNTROWS(Orders))
            ),
            [OrderCount] >= 2
        )
    )
VAR TotalCustomers =
    DISTINCTCOUNT(customers[customer_unique_id])
RETURN
    ROUND(DIVIDE(RepeatCustomers, TotalCustomers) * 100, 1)
```

> ⚠️ **Important:** Always use `customer_unique_id` (not `customer_id`) in Olist dataset. `customer_id` is order-specific — same person gets different `customer_id` for each order.

---

## 🎯 North Star Metric

> **Repeat Purchase Rate | Current: 3.1% → Target: 25%+**

---

## 📁 Repository Structure

```
olist-retention-analysis/
│
├── README.md
├── olist_ba_project_UPGRADED.docx    # Full BA project document
│
├── sql/
│   ├── P1_repeat_customers.sql
│   ├── P2_avg_delivery.sql
│   ├── P3_delivery_vs_review.sql
│   ├── P4_state_delivery.sql
│   ├── Query_A_bad_reviews.sql
│   ├── Query_B_price_vs_review.sql
│   ├── Query_C_top_categories.sql
│   ├── Query_D_revenue.sql
│   ├── Query_E_cohort.sql
│   └── views/
│       └── create_all_views.sql
│
├── powerbi/
│   └── olist_retention.pbix
│
└── data/
    └── (Download from Kaggle link above)
```

---

## 👤 About

**Kaushal Kumar** — Aspiring Business Analyst / Data Analyst

Currently learning: SQL • Power BI • Excel • Python

📧 Connect on [LinkedIn](https://linkedin.com/in/your-profile)

---

*All numbers verified from real Olist dataset. No assumptions made.*
