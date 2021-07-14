-- query22
SELECT i_product_name, 
               i_brand, 
               i_class, 
               i_category, 
               Avg(inv_quantity_on_hand) qoh 
FROM   {{source('src__tpc_ds', 'inventory')}},
       {{source('src__tpc_ds', 'date_dim')}},
       {{source('src__tpc_ds', 'item')}},
       {{source('src__tpc_ds', 'warehouse')}}
WHERE  inv_date_sk = d_date_sk 
       AND inv_item_sk = i_item_sk 
       AND inv_warehouse_sk = w_warehouse_sk 
       AND d_month_seq BETWEEN 1205 AND 1205 + 11 
GROUP  BY i_product_name, i_brand, i_class, i_category 
ORDER  BY qoh, 
          i_product_name, 
          i_brand, 
          i_class, 
          i_category
LIMIT 100; 
