[README.md](https://github.com/user-attachments/files/27318445/README.md)
# 📊 Olist E-Commerce — Customer Acquisition vs Retention Analysis

> **Business Analyst Portfolio Project** | SQL (MySQL) + Power BI | Real Data

---

## 🎯 Project Overview

This project analyzes the **Olist Brazilian E-Commerce Dataset** (publicly available on Kaggle) to answer one critical business question:

> **"Why are customers not coming back after their first order?"**

Using SQL for data extraction and Power BI for visualization, this project uncovers the root cause of a 0% repeat rate across 99,441 customers over 18 months (2016–2018).

---

## 🔍 Key Findings

| Metric | Value | Insight |
|---|---|---|
| **Repeat Rate** | 0% | Not a single customer reordered |
| **Total Customers** | 99,441 | All one-time buyers |
| **Avg Delivery Days** | 12.5 days | Acceptable by Brazil standards |
| **Worst State (RR)** | 29.3 days | Remote state — no warehouse |
| **Best State (SP)** | 8.7 days | Near warehouse — fast delivery |
| **20+ day delivery score** | 3.16 / 5 | Clear dissatisfaction signal |
| **Total Revenue** | R$15.42M | R$159 per customer |

---

## 🧩 Root Cause Analysis

**Why 0% Repeat Rate despite positive reviews?**

1. **Structural Product Mix** — 77% orders are one-time purchase categories:
   - Furniture & Home: 29K orders ❌ (buy once, use for years)
   - Electronics: 19K orders ❌ (buy once, use for years)
   - Only Beauty & Health (13K) was repeat-friendly ✅

2. **No Retention Infrastructure** — Olist had:
   - No loyalty program
   - No re-engagement emails
   - No reminder system
   - No second-order discount

3. **Geographic Delivery Gap** — Marketing ran in remote states without warehouse coverage:
   - RR: 29.3 days | AP: 27.1 days | AM: 26.2 days
   - vs SP (Sao Paulo): 8.7 days

4. **Platform Model** — Olist is a marketplace. Customers remember the seller, not Olist.

---

## 🗄️ SQL Queries

| Query | Business Question | Key Finding |
|---|---|---|
| P1 | How many customers returned? | 0% repeat rate |
| P2 | How long does delivery take? | 12.5 days avg |
| P3 | Does late delivery cause bad reviews? | 20+ days = 3.16 stars |
| P4 | Which states have worst delivery? | RR=29.3 vs SP=8.7 days |
| Query A | Which categories get most complaints? | Office furniture 26% bad |
| Query B | Does price affect satisfaction? | No impact |
| Query C | Which categories sell most? | Furniture, Electronics (one-time) |
| Query D | Revenue & payment analysis | R$159 per customer |
| Query E | Cohort analysis | 0% retention across 18 months |

---

## 📊 Power BI Dashboard

Single-page interactive dashboard with:

- **5 KPI Cards** — Total Customers, Repeat Rate, Avg Delivery, Avg Review, Total Revenue
- **Delivery Speed vs Review Score** — Bar chart
- **Orders by Category Group** — Bar chart with repeat-friendly indicators
- **Order Status Distribution** — Donut chart (97% delivered)
- **State-wise Avg Delivery Days** — Bar chart (SP green, remote states red)
- **Monthly Customer Trend** — Line chart with Black Friday annotation
- **Key Findings & Recommendations** — Text section
- **3 Slicers** — Category, State, Year

---

## 🗂️ Repository Structure

```
📁 Dashboard
📁 Data csv
📁 Document
📁 olist query 
📄 README.md
```

---

## 🚀 Recommendations

| # | Recommendation | Based On |
|---|---|---|
| 1 | Launch loyalty program for Beauty & Health | Query C — only repeat-friendly category |
| 2 | Re-engagement campaign for 99,441 one-time buyers | P1 — 0% repeat rate |
| 3 | Stop marketing in RR, AP, AM — no warehouse | P4 — 29.3 day delivery |
| 4 | Add 3PL logistics for remote states | P4 — state delivery data |
| 5 | Improve packaging for office furniture | Query A — 26% bad reviews |

---

## ⭐ North Star Metric

> **Repeat Purchase Rate**
> Current: **0%** | Target: **25%+**

Tracking user count alone is meaningless. The business only becomes sustainable when customers return.

---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| MySQL | Data storage + SQL queries |
| MySQL Workbench | Query interface |
| Power BI Desktop | Dashboard & visualization |
| Kaggle | Dataset source |

---

## 📦 Dataset

**Brazilian E-Commerce Public Dataset by Olist**
- Source: [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- Size: ~99,441 customers, ~99,000 orders
- Period: 2016–2018
- Tables: 9 (orders, customers, reviews, products, sellers, payments, etc.)

---

## 👤 Author

**Kaushal Kumar**
Business Analyst | SQL + Power BI
📧 kaushasha15@gmail.com
📍 New Delhi, India

---

> *"Growth without retention is a slow death. The fix is not more customers — it is giving existing customers a reason to return."*
