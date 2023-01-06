SELECT c.customers_firstname,
       c.customers_lastname,
       c.customers_id,
       c.customers_email_address,
       c.customers_telephone,
       c.customers_mobile,
       c.customers_newsletter,
       c.api_partner_id,
       c.api_partner_customer_id,
       c.account_manager,
       ci.customers_info_date_account_created,
       sum(ot.value) as ordersum,
       count(o.orders_id) as ordernum,
       ci.customers_info_source_id,
       ab.entry_company,
       ab.entry_street_address,
       ab.entry_suburb,
       ab.entry_city,
       ab.entry_state,
       ab.entry_postcode,
       c.do_not_postal_mail
     FROM customers AS c
     JOIN orders AS o ON c.customers_id = o.customers_id
     JOIN orders_total AS ot ON o.orders_id = ot.orders_id
     JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
     JOIN address_book AS ab ON c.customers_default_address_id = ab.address_book_id
     WHERE o.orders_status IN ('11','12','2','3') AND ot.class = 'ot_subtotal'
     GROUP BY c.customers_id
     ORDER BY ordersum DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT products_always_a 
             FROM products_stock
             WHERE poloStockId='2016-26-13';
;-- -. . -..- - / . -. - .-. -.--
SELECT products_stock_quantity
             FROM products_stock 
             WHERE poloStockId='2016-26-13';
;-- -. . -..- - / . -. - .-. -.--
SELECT p.manufacturers_id,ps.vendor_price,ps.vendor_price_avg,ps.products_always_a,
       				ps.products_stock_quantity as qty,
       				(	SELECT sum(quantity) 
       					FROM products_stock_allocated as psa 
       					WHERE psa.poloStockId = ps.poloStockId AND psa.vendors_id = '28'
					) as allocated, ps.vendors_id,
       			 btc_id,fruit_id,pc_id,ral_id,uneek_id,btc_stock_held,fruit_stock_held,pc_stock_held,ral_stock_held,uneek_stock_held,btc_price,fruit_price,pc_price,ral_price,uneek_price
       			 FROM products_stock as ps 
				 LEFT JOIN vendors_stock  AS vs ON (ps.poloStockId = vs.poloStockId)
				 LEFT JOIN polo_products AS p ON (p.products_id = SUBSTRING_INDEX(ps.poloStockId,'-',1))
				 WHERE ps.poloStockId='2016-26-13';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM products_to_categories WHERE categories_id = '34' AND products_id = '1315';
;-- -. . -..- - / . -. - .-. -.--
select pd.products_name, p.products_model,p.vendors_product_price,p.vendors_product_price_colour, p.products_bimage, p.products_id, p.manufacturers_id, p.products_price, p.products_weight, p.products_price1,p.products_price2,p.products_price3,p.products_price4, p.products_price5,p.products_price6,p.products_price7,p.products_price8, p.products_price1_qty,p.products_price2_qty,p.products_price3_qty,p.products_price4_qty, p.products_price5_qty,p.products_price6_qty,p.products_price7_qty,p.products_price8_qty, p.products_qty_blocks, p.products_tax_class_id, IF(s.status, s.specials_new_products_price, NULL) as specials_new_products_price, IF(s.status, s.specials_new_products_price, p.products_price) as final_price from products_description pd,      products p left join manufacturers m on p.manufacturers_id = m.manufacturers_id,      products_to_categories p2c left join specials s on p2c.products_id = s.products_id where p.products_status = '1'   and p.products_id = '1023'   and pd.products_id = '1023'   and pd.language_id = '1';
;-- -. . -..- - / . -. - .-. -.--
select information_id from information where information_id LIKE 'AWDis/Just/Cool/Smooth/T-Shirt';
;-- -. . -..- - / . -. - .-. -.--
SELECT store_id FROM products WHERE products_id = '1315';
;-- -. . -..- - / . -. - .-. -.--
select SUM(quantity) as al_quan 
             from products_stock_allocated 
             where poloStockId='2016-26-13';
;-- -. . -..- - / . -. - .-. -.--
select options_values_price, price_prefix from products_attributes where products_id = '1023' and options_id = '1' and options_values_id = '281';
;-- -. . -..- - / . -. - .-. -.--
select options_values_price, price_prefix from products_attributes where products_id = '1023' and options_id = '2' and options_values_id = '13';
;-- -. . -..- - / . -. - .-. -.--
SELECT site_key FROM permission_groups WHERE site_key != 'ALL' GROUP BY site_key;
;-- -. . -..- - / . -. - .-. -.--
SELECT dp.*,pg.*,pfg.* FROM staff_info as si, department_permissions AS dp, permission_groups as pg, permission_file_group as pfg WHERE si.staff_id = '0' AND si.department = dp.department_id AND pg.group_id = dp.group_id AND pfg.group_id = dp.group_id ORDER BY pg.site_key <> 'ALL';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM staff_permissions AS sp  WHERE sp.staff_id = '0' AND sp.processed = '1';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM staff_info WHERE employed='1' ORDER BY first_name,last_name;
;-- -. . -..- - / . -. - .-. -.--
use quaysidg_news;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM staff_departments;
;-- -. . -..- - / . -. - .-. -.--
SET NAMES latin1;
;-- -. . -..- - / . -. - .-. -.--
SELECT options_values_price FROM products_attributes WHERE products_attributes_id = '25926';
;-- -. . -..- - / . -. - .-. -.--
SELECT options_values_price FROM products_attributes WHERE products_attributes_id = '25927';
;-- -. . -..- - / . -. - .-. -.--
SELECT sum(op.products_quantity) as apps,oc.custom_id, oc.customisation_id, oc.custom_type, oc.customisation_complete, oc.custom_1,oc.custom_2,oc.custom_3,oc.custom_4,oc.custom_5, oc.custom_6,oc.custom_7,oc.custom_8,oc.custom_9,oc.custom_10,oc.custom_11,oc.custom_12,oc.custom_13  FROM 
 		orders_products as op,orders_products_customisations as opc, orders as o, orders_customisations as oc 
 		WHERE o.orders_id = '5370553' AND op.orders_id = o.orders_id AND op.orders_id = oc.order_id AND op.orders_products_id = opc.orders_products_id AND opc.customisation_id != '0' AND opc.customisation_id = oc.customisation_id 
 		 AND op.products_id NOT IN ('2','399','421','450','427','418','937','938','1426','1667','1525','1526') AND oc.custom_type = 'print_storm' GROUP BY oc.custom_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT products_stock_quantity,poloMap FROM products_stock WHERE products_id = '1315' AND products_stock_attributes = '1-26,2-14';
;-- -. . -..- - / . -. - .-. -.--
SELECT sum(completed_apps) as completed_apps FROM orders_customisations_complete WHERE orders_id = '5370553' AND custom_id = '1513014';
;-- -. . -..- - / . -. - .-. -.--
SELECT options_values_price FROM products_attributes WHERE products_attributes_id = '25928';
;-- -. . -..- - / . -. - .-. -.--
SELECT options_values_price FROM products_attributes WHERE products_attributes_id = '25929';
;-- -. . -..- - / . -. - .-. -.--
use `clothes2_osC`;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
            FROM tep_mail_sent
            WHERE message_sent = 0
            AND message_send_error < 2
            AND IFNULL(priority, 0) IN (1,2,0,3)
            AND (
                (send_window_start = '00:00:00' AND send_window_end = '00:00:00')
                OR ('09:30:02' BETWEEN send_window_start AND send_window_end)
            );
;-- -. . -..- - / . -. - .-. -.--
use ops;
;-- -. . -..- - / . -. - .-. -.--
set session sql_mode='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM shopify_user_options WHERE shopify_user = NULL AND value_type IN ('category','product','position','width');
;-- -. . -..- - / . -. - .-. -.--
select give_carton_price, percentage_off_all_prices,product_discounts,product_discounts_flat from customers WHERE customers_id = '3893247';
;-- -. . -..- - / . -. - .-. -.--
select * from `cron_log` where `cron_name` = 'update_tags' limit 1;
;-- -. . -..- - / . -. - .-. -.--
UPDATE vendor_log SET end_date = now(), result = '0',raw_data = 'null' WHERE vendor_log_id = '4142388';
;-- -. . -..- - / . -. - .-. -.--
select * from `ams.production_file_attribute_values` where `attribute_id` = 1;
;-- -. . -..- - / . -. - .-. -.--
select * from clothes2_osC.products_stock limit 1;
;-- -. . -..- - / . -. - .-. -.--
select * from poloshir_osC.products_stock limit 1;
;-- -. . -..- - / . -. - .-. -.--
select cd.categories_name from categories_description cd, categories c where cd.categories_id=c.categories_id and cd.categories_id='15' and cd.language_id='1' and c.parent_id='0';
;-- -. . -..- - / . -. - .-. -.--
SELECT products_always_a
FROM products_stock
WHERE poloStockId='2016-26-13';
;-- -. . -..- - / . -. - .-. -.--
SELECT products_stock_quantity
FROM products_stock
WHERE poloStockId='2016-26-13';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM polo_vendors WHERE stock_table_id !='' AND active ='1' ORDER BY vendors_name;
;-- -. . -..- - / . -. - .-. -.--
select languages_id, name, code, image, directory from languages order by sort_order;
;-- -. . -..- - / . -. - .-. -.--
use poloshir_osC;
;-- -. . -..- - / . -. - .-. -.--
SELECT p.manufacturers_id,ps.vendor_price,ps.vendor_price_avg,ps.products_always_a,
ps.products_stock_quantity as qty,
(       SELECT sum(quantity)
FROM products_stock_allocated as psa
WHERE psa.poloStockId = ps.poloStockId AND psa.vendors_id = '28'
) as allocated, ps.vendors_id,
btc_id,fruit_id,pc_id,ral_id,uneek_id,btc_stock_held,fruit_stock_held,pc_stock_held,ral_stock_held,uneek_stock_held,btc_price,fruit_price,pc_price,ral_price,uneek_price
FROM products_stock as ps
LEFT JOIN vendors_stock  AS vs ON (ps.poloStockId = vs.poloStockId)
LEFT JOIN polo_products AS p ON (p.products_id = SUBSTRING_INDEX(ps.poloStockId,'-',1))
WHERE ps.poloStockId='2016-26-13';
;-- -. . -..- - / . -. - .-. -.--
select cd.categories_id from categories_description cd, categories c where cd.categories_id=c.categories_id and cd.categories_name='AWDis/Just/Cool/Smooth/T-Shirt' and c.parent_id='15';
;-- -. . -..- - / . -. - .-. -.--
select pd.products_id, p.products_status from products_description pd, products_to_categories p2c, products p where p.products_id = pd.products_id and pd.products_id=p2c.products_id and pd.products_name='AWDis/Just/Cool/Smooth/T-Shirt' and p2c.categories_id='15' ORDER BY p.products_status DESC LIMIT 0,1;
;-- -. . -..- - / . -. - .-. -.--
select manufacturers_id from manufacturers where manufacturers_name='AWDis/Just/Cool/Smooth/T-Shirt';
;-- -. . -..- - / . -. - .-. -.--
select tax_rate FROM tax_rates WHERE tax_rates_id ='1';
;-- -. . -..- - / . -. - .-. -.--
use clothes2_osC;
;-- -. . -..- - / . -. - .-. -.--
SELECT co.custom_type,coc.custom_box,coc.custom_class FROM customisation_options as co, customisation_options_checkboxes as coc WHERE co.id = coc.custom_options_id AND coc.custom_class != '';