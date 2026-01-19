SELECT *
FROM `bigquery-public-data.thelook_ecommerce.orders`
LIMIT 5;

SELECT
  order_id,
  user_id,
  status,
  created_at,
  shipped_at,
  delivered_at,
  returned_at,
  num_of_item AS items_count
FROM `bigquery-public-data.thelook_ecommerce.orders`;
