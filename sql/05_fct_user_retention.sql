CREATE OR REPLACE TABLE `gen-lang-client-0593698048.ecommerce_analytics.fct_user_retention` AS
WITH user_orders AS (
  SELECT
    o.user_id,
    d.cohort_month,
    DATE_TRUNC(DATE(o.created_at), MONTH) AS order_month,
    DATE_TRUNC(d.first_order_date, MONTH) AS first_order_month
  FROM `gen-lang-client-0593698048.ecommerce_analytics.stg_orders` o
  JOIN `gen-lang-client-0593698048.ecommerce_analytics.dim_users_first_order` d
    USING (user_id)
  WHERE o.status NOT IN ('Cancelled')
),
cohort_activity AS (
  SELECT
    cohort_month,
    DATE_DIFF(order_month, first_order_month, MONTH) AS month_number,
    COUNT(DISTINCT user_id) AS active_users
  FROM user_orders
  GROUP BY 1, 2
)
SELECT
  cohort_month,
  month_number,
  active_users
FROM cohort_activity
ORDER BY cohort_month, month_number;


SELECT *
FROM `gen-lang-client-0593698048.ecommerce_analytics.fct_user_retention`
WHERE cohort_month = '2019-01'
ORDER BY month_number
LIMIT 10;
