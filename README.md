# 🛒 E-commerce Growth & Retention Analytics

> **End-to-end analytics project** demonstrating how to build a production-style data warehouse, define business metrics, analyze growth & retention, and deliver executive-ready insights using **BigQuery, SQL, Python, and Tableau**.

---

## 🔎 Quick Navigation

- 📊 **Dashboards**: [Growth Overview](#-tableau-dashboards) | [Retention & Cohorts](#-tableau-dashboards)
- 🧱 **Data Warehouse**: [Architecture](#-architecture--data-model)
- 📈 **Key Insights**: [Business Findings](#-key-insights)
- 🧪 **Analytics Logic**: [SQL Pipeline](#-sql-pipeline)
- 🐍 **Python Notebooks**: [Validation & Insights](#-python-analytics-layer)

---

## 🎯 Project Goal

Analyze **e-commerce growth performance** and **customer retention behavior** to answer:

- Is revenue growth driven by **volume or pricing (AOV)**?
- How well do customers **retain after their first purchase**?
- Where are the **highest-impact levers** for sustainable growth?

This project is intentionally designed to mirror **real-world analytics workflows**, not notebook-only analysis.

---

## 📦 Data Source

- **TheLook eCommerce Dataset** (BigQuery Public Dataset)
- Time span: **2019 – 2026**
- Core entities: `orders`, `order_items`, `users`

---

## 🧱 Architecture & Data Model

### Data Warehouse (BigQuery)

**Staging Layer**

- `stg_orders`
- `stg_order_items`

**Dimension Layer**

- `dim_users_first_order`

**Fact / Mart Layer**

- `fct_orders_daily`
  - Daily revenue, orders, items sold
  - AOV, WoW growth, MoM growth
- `fct_user_retention_rates`
  - Cohort-based retention matrix
  - Month 0 cohort size
  - Retention rate (%) by month

All metric logic is defined **in SQL**, not BI tools.

---

## 🧪 SQL Pipeline

All queries used to build the warehouse are stored in `/sql` and ordered for reproducibility:

```
00_data_creation.sql
01_stg_orders.sql
02_stg_order_items.sql
03_fct_orders_daily.sql
04_dim_users_first_order.sql
05_fct_user_retention.sql
06_fct_user_retention_rates.sql
```

Each file contains:

- Purpose of the table
- Source tables
- Final output table

This mirrors **analytics engineering best practices**.

---

## 🐍 Python Analytics Layer

Located in `/notebooks`:

### `01_data_validation_and_kpis.ipynb`

- Validates daily grain (no duplicate dates)
- Confirms AOV = revenue / orders
- Checks retention rate bounds (0–100%)
- Provides a latest-day KPI snapshot

### `02_executive_insights.ipynb`

- Weekly revenue & AOV trends (noise-reduced)
- Filtered retention decay curve (≥30 cohorts)
- Executive-level written insights

Python is used **only where it adds value** (validation & interpretation).

---

## 📊 Tableau Dashboards

### 1️⃣ Growth Overview Dashboard

🔗 **Live link**:\
[https://public.tableau.com/views/ecommerce-growth-analytics01/Dashboard1](https://public.tableau.com/views/ecommerce-growth-analytics01/Dashboard1)

**Contents:**

- Total revenue per year
- Orders & items sold per year
- Average Order Value (AOV)
- Month-over-Month revenue growth

**Purpose:** Understand whether growth is driven by **volume or pricing**.

---

### 2️⃣ Retention & Cohort Dashboard

🔗 **Live link**:\
[https://public.tableau.com/views/ecommerce-growth-analytics02/Dashboard2](https://public.tableau.com/views/ecommerce-growth-analytics02/Dashboard2)

**Contents:**

- Cohort size heatmap
- Active users over time
- Average retention rate by cohort month

**Purpose:** Identify **early drop-off** and long-term retention behavior.

---

## 📈 Key Insights

- Revenue shows strong long-term growth, while **AOV remains relatively stable**, indicating growth is primarily **volume-driven**.
- Daily metrics are highly volatile; **weekly aggregation** reveals clearer growth patterns.
- Customer retention drops sharply after the first month (\~2–3%) and stabilizes at a low long-term baseline.
- Recent cohorts (2024–2026) are significantly larger, reflecting improved acquisition but **unchanged retention dynamics**.
- The highest-impact growth lever is **improving early repeat purchases (month 1–2)** rather than increasing prices.

---

## 📁 Repository Structure

```
├── assets/        # Dashboard & chart images
├── data/          # Final CSV extracts from BigQuery
├── notebooks/     # Python validation & insights
├── sql/           # Analytics SQL pipeline
└── README.md
```

---

## 🛠 Tools & Technologies

- **SQL** – BigQuery
- **Python** – pandas, matplotlib
- **BI** – Tableau Public
- **Data Modeling** – Fact & dimension design

---

## 🚀 Next Steps

- Design A/B experiments to improve month-1 retention
- Build cohort-based LTV models
- Automate transformations using dbt or scheduled queries

---

## 👤 Author

**Fizuli Hasanov**\
Aspiring Data / Business Analyst\
Focused on analytics engineering, growth analysis, and decision-driven insights

---

⭐ *If you’re a recruiter or reviewer: this project is intentionally scoped to demonstrate real-world analytics thinking rather than exploratory analysis.*


