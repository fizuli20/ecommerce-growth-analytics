SELECT
  id AS order_item_id,
  order_id,
  product_id,
  sale_price,
  created_at
FROM `bigquery-public-data.thelook_ecommerce.order_items`;