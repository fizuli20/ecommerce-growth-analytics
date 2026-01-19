CREATE OR REPLACE TABLE `gen-lang-client-0593698048.ecommerce_analytics.dim_users_first_order` AS
SELECT
  user_id,
  DATE(MIN(created_at)) AS first_order_date,
  FORMAT_DATE('%Y-%m', DATE(MIN(created_at))) AS cohort_month
FROM `gen-lang-client-0593698048.ecommerce_analytics.stg_orders`
WHERE status NOT IN ('Cancelled')
GROUP BY user_id;

SELECT *
FROM `gen-lang-client-0593698048.ecommerce_analytics.dim_users_first_order`
ORDER BY first_order_date
LIMIT 10;