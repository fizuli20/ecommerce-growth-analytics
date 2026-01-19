CREATE OR REPLACE TABLE `gen-lang-client-0593698048.ecommerce_analytics.fct_user_retention_rates` AS
WITH cohort_sizes AS (
  SELECT
    cohort_month,
    active_users AS cohort_size
  FROM `gen-lang-client-0593698048.ecommerce_analytics.fct_user_retention`
  WHERE month_number = 0
)
SELECT
  r.cohort_month,
  r.month_number,
  r.active_users,
  c.cohort_size,
  SAFE_DIVIDE(r.active_users, c.cohort_size) AS retention_rate
FROM `gen-lang-client-0593698048.ecommerce_analytics.fct_user_retention` r
JOIN cohort_sizes c
  USING (cohort_month)
ORDER BY r.cohort_month, r.month_number;

SELECT *
FROM `gen-lang-client-0593698048.ecommerce_analytics.fct_user_retention_rates`
WHERE cohort_month = '2019-01'
ORDER BY month_number
LIMIT 10;