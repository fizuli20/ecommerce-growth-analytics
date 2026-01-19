CREATE OR REPLACE TABLE `gen-lang-client-0593698048.ecommerce_analytics.fct_orders_daily` AS
SELECT
  DATE(o.created_at) AS order_date,
  COUNT(DISTINCT o.order_id) AS orders,
  SUM(oi.sale_price) AS revenue,
  COUNT(oi.order_item_id) AS items_sold
FROM `gen-lang-client-0593698048.ecommerce_analytics.stg_orders` o
JOIN `gen-lang-client-0593698048.ecommerce_analytics.stg_order_items` oi
  USING (order_id)
WHERE o.status NOT IN ('Cancelled')  
GROUP BY 1
ORDER BY 1;

SELECT *
FROM `gen-lang-client-0593698048.ecommerce_analytics.fct_orders_daily`
ORDER BY order_date DESC
LIMIT 10;


CREATE OR REPLACE TABLE `gen-lang-client-0593698048.ecommerce_analytics.fct_orders_daily` AS
WITH base AS (
  SELECT
    DATE(o.created_at) AS order_date,
    COUNT(DISTINCT o.order_id) AS orders,
    SUM(oi.sale_price) AS revenue,
    COUNT(oi.order_item_id) AS items_sold
  FROM `gen-lang-client-0593698048.ecommerce_analytics.stg_orders` o
  JOIN `gen-lang-client-0593698048.ecommerce_analytics.stg_order_items` oi
    USING (order_id)
  WHERE o.status NOT IN ('Cancelled')
  GROUP BY 1
)
SELECT
  order_date,
  orders,
  revenue,
  items_sold,
  SAFE_DIVIDE(revenue, orders) AS aov,

  -- Week over Week revenue growth
  SAFE_DIVIDE(
    revenue - LAG(revenue, 7) OVER (ORDER BY order_date),
    LAG(revenue, 7) OVER (ORDER BY order_date)
  ) AS revenue_wow_growth,

  -- Month over Month revenue growth
  SAFE_DIVIDE(
    revenue - LAG(revenue, 30) OVER (ORDER BY order_date),
    LAG(revenue, 30) OVER (ORDER BY order_date)
  ) AS revenue_mom_growth

FROM base
ORDER BY order_date;

SELECT *
FROM `gen-lang-client-0593698048.ecommerce_analytics.fct_orders_daily`
ORDER BY order_date DESC
LIMIT 5;