
-- Purpose: Build daily KPI mart (orders, revenue, AOV, WoW/MoM)
-- Source: bigquery-public-data.thelook_ecommerce
-- Output: ecommerce_analytics


SELECT table_name
FROM `bigquery-public-data.thelook_ecommerce.INFORMATION_SCHEMA.TABLES`
ORDER BY table_name;

SELECT
  COUNT(*) AS orders_count,
  MIN(created_at) AS first_order,
  MAX(created_at) AS last_order
FROM `bigquery-public-data.thelook_ecommerce.orders`;




