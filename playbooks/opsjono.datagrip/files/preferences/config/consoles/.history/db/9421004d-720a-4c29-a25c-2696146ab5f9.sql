select vendor_email_sent, vendor_stock_updated from orders where orders_id = 4877139;
;-- -. . -..- - / . -. - .-. -.--
select * from poloshir_osC.products_stock_allocated;
;-- -. . -..- - / . -. - .-. -.--
select vendor_email_sent, vendor_stock_updated from orders where orders_id = 4877161;
;-- -. . -..- - / . -. - .-. -.--
select * from poloshir_osC.products_stock_allocated_extra;
;-- -. . -..- - / . -. - .-. -.--
update staff_info set is_admin = 1 and is_qs_admin = 1 where staff_id = 628;
;-- -. . -..- - / . -. - .-. -.--
update staff_info set is_admin = 0 and is_qs_admin = 0 where staff_id = 628;
;-- -. . -..- - / . -. - .-. -.--
update staff_info set is_admin = 0, is_qs_admin = 0 where staff_id = 628;
;-- -. . -..- - / . -. - .-. -.--
update staff_info set is_admin = 1, is_qs_admin = 1 where staff_id = 628;
;-- -. . -..- - / . -. - .-. -.--
select * from staff_info where first_name like "%onathan%";
;-- -. . -..- - / . -. - .-. -.--
select * from orders_customisations where order_id = 4877161;
;-- -. . -..- - / . -. - .-. -.--
select vendor_email_sent, vendor_stock_updated, orders_status from orders where orders_id = 4877161;
;-- -. . -..- - / . -. - .-. -.--
select * FROM poloshir_osC.products_stock_allocated WHERE allocated_site = 'c2o' and order_id = '0' AND ( vendors_id IN (0,28) OR vendor_email_sent = 'N' );
;-- -. . -..- - / . -. - .-. -.--
select * from poloshir_osC.products_stock_allocated where order_id = 4877161;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_products_id, op.orders_id, op.products_id, op.products_name, op.products_quantity, op.products_stock_attributes, o.customers_id
						 FROM orders_products op, orders o
						 WHERE op.orders_products_id = '2120633'
						 AND op.orders_id = '4877160'
						 AND o.orders_id = op.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT oc.custom_id AS cid, op.products_id AS pid, op.products_stock_attributes AS attrib FROM orders_products AS op LEFT JOIN orders_products_customisations AS opc ON op.orders_products_id = opc.orders_products_id LEFT JOIN orders_customisations AS oc ON opc.customisation_id = oc.customisation_id WHERE op.orders_id = '4877158' AND op.products_stock_attributes != '' AND oc.order_id = '4877158';
;-- -. . -..- - / . -. - .-. -.--
SELECT a.id, a.partner_name, a.api_status, a.partner_logo, a.on_demand
                        FROM api_partners a
                        JOIN orders AS b ON b. api_partner_id = a.id
                        WHERE b.orders_id = '4877158' LIMIT 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT a.id, a.partner_name, a.api_status, a.partner_logo, a.on_demand
                        FROM api_partners a;
;-- -. . -..- - / . -. - .-. -.--
UPDATE customisation_options set custom_type = 'emb_creativeb', custom_name = 'Creative Branding' where custom_type = 'emb_kingf' and custom_name = 'Kingfisher';
;-- -. . -..- - / . -. - .-. -.--
UPDATE customisation_options set custom_type = 'emb_kingf', custom_name = 'Kingfisher' where custom_type = 'emb_creativeb';
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO customisation_options (custom_type, custom_name, custom_base_type, customisation_department, is_selectable, is_external, active, default_printer, abbreviation)
VALUES('emb_creativeb', 'Creative Branding', 'emb', 'Outsourced', '1', '1', '1', 'emb', 'CB');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO customisation_options (custom_type, custom_name, custom_base_type, customisation_department, is_selectable, is_external, active, price_array, cust_address, daily_capacity_percentages, colour, default_printer, default_artworker, default_email_address, production_stage_timing, production_target_percentage, artwork_completion_target, abbreviation, sort_order)
VALUES('emb_creativeb', 'Creative Branding', 'emb', 'Outsourced', '1', '1', '1','', '', '', '', 'emb', '', '', '', '', '', 'CB', '0');
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM customisation_options WHERE active = '1';
;-- -. . -..- - / . -. - .-. -.--
UPDATE customisation_options set active = '0', is_selectable = '0' where custom_type = 'emb_kingf';
;-- -. . -..- - / . -. - .-. -.--
UPDATE customisation_options set active = '1', is_selectable = '1' where custom_type = 'emb_kingf';
;-- -. . -..- - / . -. - .-. -.--
select * from orders_customisations_types;
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address, cb.customers_basket_quantity, p.products_id

			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com'
			GROUP BY cb.customers_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address, cb.customers_basket_quantity, p.products_id

			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address, cb.customers_basket_quantity, p.products_id,
            MIN(cb.basket_date_added) AS basket_date_added,
            IF((SELECT count(o.orders_id)
				FROM orders AS o
				WHERE o.customers_id = c.customers_id
				GROUP BY o.customers_id) > 0, 'Yes', 'No') AS returning_customer,
            c.account_manager,
            ci.customers_info_number_of_logons,
            max(cb.basket_last_updated) AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address, cb.customers_basket_quantity, p.products_id,
            MIN(cb.basket_date_added) AS basket_date_added,
            
            c.account_manager,
            ci.customers_info_number_of_logons,
            max(cb.basket_last_updated) AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address, cb.customers_basket_quantity, p.products_id,
            MIN(cb.basket_date_added) AS basket_date_added,
            c.account_manager,
            ci.customers_info_number_of_logons,
            max(cb.basket_last_updated) AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address, cb.customers_basket_quantity, p.products_id,
            MIN(cb.basket_date_added) AS basket_date_added,
            c.account_manager,
            ci.customers_info_number_of_logons
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address, cb.customers_basket_quantity, p.products_id,
            MIN(cb.basket_date_added) AS basket_date_added,
            c.account_manager
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address, cb.customers_basket_quantity, p.products_id,
            MIN(cb.basket_date_added) AS basket_date_added
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address, cb.customers_basket_quantity, p.products_id
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address, cb.customers_basket_quantity, p.products_id,
            cb.basket_date_added AS basket_date_added
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address, cb.customers_basket_quantity, p.products_id,
            cb.basket_date_added AS basket_date_added,
            IF((SELECT count(o.orders_id)
				FROM orders AS o
				WHERE o.customers_id = c.customers_id
				GROUP BY o.customers_id) > 0, 'Yes', 'No') AS returning_customer,
            c.account_manager,
            ci.customers_info_number_of_logons,
            max(cb.basket_last_updated) AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address, cb.customers_basket_quantity, p.products_id,
            cb.basket_date_added AS basket_date_added,
            c.account_manager,
            ci.customers_info_number_of_logons,
            max(cb.basket_last_updated) AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address, cb.customers_basket_quantity, p.products_id,
            
            c.account_manager,
            ci.customers_info_number_of_logons,
            max(cb.basket_last_updated) AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address, cb.customers_basket_quantity, p.products_id,
            cb.basket_date_added AS basket_date_added,
            c.account_manager,
            ci.customers_info_number_of_logons,
            cb.basket_last_updated AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address, cb.customers_basket_quantity, p.products_id,
            cb.basket_date_added AS basket_date_added,
       IF((SELECT count(o.orders_id)
				FROM orders AS o
				WHERE o.customers_id = c.customers_id
				GROUP BY o.customers_id) > 0, 'Yes', 'No') AS returning_customer,
            c.account_manager,
            ci.customers_info_number_of_logons,
            cb.basket_last_updated AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
select * from products_options;
;-- -. . -..- - / . -. - .-. -.--
select * from products_options_values_to_products_options;
;-- -. . -..- - / . -. - .-. -.--
select * from customers_basket_attributes
where customers_id = 4993624
and products_id = 765
limit 10;
;-- -. . -..- - / . -. - .-. -.--
select * from customers_basket_customisations
where customers_id = 4993624
and products_id = 765
limit 10;
;-- -. . -..- - / . -. - .-. -.--
select * from products_options
# where customers_id = 4993624
# and products_id = 765
limit 10;
;-- -. . -..- - / . -. - .-. -.--
select * from products_store_options
# where customers_id = 4993624
# and products_id = 765
limit 10;
;-- -. . -..- - / . -. - .-. -.--
select * from products_attributes
# where customers_id = 4993624
# and products_id = 765
limit 10;
;-- -. . -..- - / . -. - .-. -.--
select * from products_attributes
# where customers_id = 4993624
and products_id = 765
limit 10;
;-- -. . -..- - / . -. - .-. -.--
select * from products_attributes
# where customers_id = 4993624
where products_id = 765
limit 10;
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address, cb.customers_basket_quantity, p.products_id,
            cb.basket_date_added AS basket_date_added,
       IF((SELECT count(o.orders_id)
				FROM orders AS o
				WHERE o.customers_id = c.customers_id
				GROUP BY o.customers_id) > 0, 'Yes', 'No') AS returning_customer,
            c.account_manager,
            ci.customers_info_number_of_logons,
            cb.basket_last_updated AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address, cb.customers_basket_quantity, cb.products_id,
            cb.basket_date_added AS basket_date_added,
       IF((SELECT count(o.orders_id)
				FROM orders AS o
				WHERE o.customers_id = c.customers_id
				GROUP BY o.customers_id) > 0, 'Yes', 'No') AS returning_customer,
            c.account_manager,
            ci.customers_info_number_of_logons,
            cb.basket_last_updated AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address,
            cb.customers_basket_quantity,
            p.products_id as products_id,
            cb.products_id as sku,
            cb.basket_date_added AS basket_date_added,
            IF((SELECT count(o.orders_id)
				FROM orders AS o
				WHERE o.customers_id = c.customers_id
				GROUP BY o.customers_id) > 0, 'Yes', 'No') AS returning_customer,
            c.account_manager,
            ci.customers_info_number_of_logons,
            cb.basket_last_updated AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
            left JOIN customers_basket_attributes AS cba ON cba.customers_id = cb.customers_id AND cba.products_id = cb.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address,
            cb.customers_basket_quantity,
            p.products_id as products_id,
            cb.products_id as sku,
            cb.basket_date_added AS basket_date_added,
            IF((SELECT count(o.orders_id)
				FROM orders AS o
				WHERE o.customers_id = c.customers_id
				GROUP BY o.customers_id) > 0, 'Yes', 'No') AS returning_customer,
            c.account_manager,
            ci.customers_info_number_of_logons,
            cb.basket_last_updated AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			JOIN products AS p ON cb.products_id = p.products_id
            left JOIN customers_basket_attributes AS cba ON cba.customers_id = cb.customers_id AND cba.products_id = cb.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address,
            cb.customers_basket_quantity,
            p.products_id as products_id,
            cb.products_id as sku,
            cb.basket_date_added AS basket_date_added,
            IF((SELECT count(o.orders_id)
				FROM orders AS o
				WHERE o.customers_id = c.customers_id
				GROUP BY o.customers_id) > 0, 'Yes', 'No') AS returning_customer,
            c.account_manager,
            ci.customers_info_number_of_logons,
            cb.basket_last_updated AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
            JOIN customers_basket_attributes AS cba ON cba.customers_id = cb.customers_id AND cba.products_id = cb.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address,
            cb.customers_basket_quantity,
            p.products_id as products_id,
            #cb.products_id as sku,
            cb.basket_date_added AS basket_date_added,
            IF((SELECT count(o.orders_id)
				FROM orders AS o
				WHERE o.customers_id = c.customers_id
				GROUP BY o.customers_id) > 0, 'Yes', 'No') AS returning_customer,
            c.account_manager,
            ci.customers_info_number_of_logons,
            cb.basket_last_updated AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
            JOIN customers_basket_attributes AS cba ON cba.customers_id = cb.customers_id AND cba.products_id = cb.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address,
            #cb.customers_basket_quantity,
            #p.products_id as products_id,
            #cb.products_id as sku,
            #cb.basket_date_added AS basket_date_added,
            IF((SELECT count(o.orders_id)
				FROM orders AS o
				WHERE o.customers_id = c.customers_id
				GROUP BY o.customers_id) > 0, 'Yes', 'No') AS returning_customer,
            #c.account_manager,
            #ci.customers_info_number_of_logons,
            cb.basket_last_updated AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
            JOIN customers_basket_attributes AS cba ON cba.customers_id = cb.customers_id AND cba.products_id = cb.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address,
            cb.customers_basket_quantity,
            p.products_id as products_id,
            cb.products_id as sku,
            cb.basket_date_added AS basket_date_added,
            IF((SELECT count(o.orders_id)
				FROM orders AS o
				WHERE o.customers_id = c.customers_id
				GROUP BY o.customers_id) > 0, 'Yes', 'No') AS returning_customer,
            c.account_manager,
            ci.customers_info_number_of_logons,
            cb.basket_last_updated AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
            JOIN customers_basket_attributes AS cba ON cba.customers_id = cb.customers_id AND cba.products_id = cb.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com'
group by c.customers_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address,
            cb.customers_basket_quantity,
            p.products_id as products_id,
            cb.products_id as sku,
            cb.basket_date_added AS basket_date_added,
            IF((SELECT count(o.orders_id)
				FROM orders AS o
				WHERE o.customers_id = c.customers_id
				GROUP BY o.customers_id) > 0, 'Yes', 'No') AS returning_customer,
            c.account_manager,
            ci.customers_info_number_of_logons,
            cb.basket_last_updated AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
            JOIN customers_basket_attributes AS cba ON cba.customers_id = cb.customers_id AND cba.products_id = cb.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com'
group by sku;
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address,
            cb.customers_basket_quantity,
            p.products_id as products_id,
            cb.products_id as sku,
            cb.basket_date_added AS basket_date_added,
            IF((SELECT count(o.orders_id)
				FROM orders AS o
				WHERE o.customers_id = c.customers_id
				GROUP BY o.customers_id) > 0, 'Yes', 'No') AS returning_customer,
            c.account_manager,
            ci.customers_info_number_of_logons,
            cb.basket_last_updated AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
            JOIN customers_basket_attributes AS cba ON cba.customers_id = cb.customers_id AND cba.products_id = cb.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com'
group by customers_id, sku;
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address,
            cb.customers_basket_quantity,
            p.products_id as products_id,
            cb.products_id as sku,
            cba.*,
            cb.basket_date_added AS basket_date_added,
            IF((SELECT count(o.orders_id)
				FROM orders AS o
				WHERE o.customers_id = c.customers_id
				GROUP BY o.customers_id) > 0, 'Yes', 'No') AS returning_customer,
            c.account_manager,
            ci.customers_info_number_of_logons,
            cb.basket_last_updated AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
            JOIN customers_basket_attributes AS cba ON cba.customers_id = cb.customers_id AND cba.products_id = cb.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com'
group by c.customers_id, sku;
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address,
            cb.customers_basket_quantity,
            p.products_id as products_id,
            cb.products_id as sku,
            cb.basket_date_added AS basket_date_added,
            IF((SELECT count(o.orders_id)
				FROM orders AS o
				WHERE o.customers_id = c.customers_id
				GROUP BY o.customers_id) > 0, 'Yes', 'No') AS returning_customer,
            c.account_manager,
            ci.customers_info_number_of_logons,
            cb.basket_last_updated AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com'
group by c.customers_id;
;-- -. . -..- - / . -. - .-. -.--
, sku;
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address,
            cb.customers_basket_quantity,
            p.products_id as products_id,
            cb.products_id as sku,
            cb.basket_date_added AS basket_date_added,
            IF((SELECT count(o.orders_id)
				FROM orders AS o
				WHERE o.customers_id = c.customers_id
				GROUP BY o.customers_id) > 0, 'Yes', 'No') AS returning_customer,
            c.account_manager,
            ci.customers_info_number_of_logons,
            cb.basket_last_updated AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com'
group by c.customers_id, sku;
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address,
            cb.customers_basket_quantity,
            p.products_id as products_id,
            cb.products_id as sku,
            cb.basket_date_added AS basket_date_added,
            IF((SELECT count(o.orders_id)
				FROM orders AS o
				WHERE o.customers_id = c.customers_id
				GROUP BY o.customers_id) > 0, 'Yes', 'No') AS returning_customer,
            c.account_manager,
            ci.customers_info_number_of_logons,
            cb.basket_last_updated AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN NOW() - INTERVAL 2 DAY AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
            AND c.customers_email_address = 'Jonathan.Marshall@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
select * from products_attributes
# where customers_id = 4993624
where products_id = 765
limit 100;
;-- -. . -..- - / . -. - .-. -.--
select * from products_attributes
# where customers_id = 4993624
where products_id = 765
and options_id = 1
and options_values_id = 62
limit 100;
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id, c.customers_firstname, c.customers_lastname, c.customers_telephone, c.customers_mobile, c.customers_email_address,
            cb.customers_basket_quantity,
            p.products_id as products_id,
            cb.products_id as sku,
            cb.basket_date_added AS basket_date_added,
            IF((SELECT count(o.orders_id)
				FROM orders AS o
				WHERE o.customers_id = c.customers_id
				GROUP BY o.customers_id) > 0, 'Yes', 'No') AS returning_customer,
            c.account_manager,
            ci.customers_info_number_of_logons,
            cb.basket_last_updated AS last_updated
			FROM customers_basket AS cb
			JOIN customers AS c ON cb.customers_id = c.customers_id
			JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
			left JOIN products AS p ON cb.products_id = p.products_id
			WHERE cb.basket_date_added BETWEEN DATE_SUB(NOW(), INTERVAL 12 MONTH) AND NOW()
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '');
;-- -. . -..- - / . -. - .-. -.--
select * from products_attributes
# where customers_id = 4993624
where products_id = 765
and options_id = 2
and options_values_id = 11
limit 100;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `customisation_files_perceptual_hashes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL,
  `customisation_id` bigint(20) NOT NULL DEFAULT '0',
  `file_type` int(11) NOT NULL,
  `url` text NOT NULL,
  `perceptual_hash` char(64) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `file_driver` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `customisation_files_customer_id_index` (`customer_id`),
  KEY `customisation_files_customisation_id_index` (`customisation_id`),
  KEY `customisation_files_perceptual_hash_index` (`perceptual_hash`),
  KEY `customisation_files_file_type_index` (`file_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1879938 DEFAULT CHARSET=latin1;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where perceptual_hash is not null;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes cfph1
join customisation_files_perceptual_hashes cfph2 on cfph1.url = cfph2.url and cfph1.id <> cfph2.id;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes cfph1
join customisation_files_perceptual_hashes cfph2 on cfph1.perceptual_hash = cfph2.perceptual_hash and cfph1.id <> cfph2.id;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes cfph1
join customisation_files_perceptual_hashes cfph2
    on cfph1.perceptual_hash = cfph2.perceptual_hash
    and cfph1.id <> cfph2.id
    and cfph1.file_type = cfph2.file_type;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes cfph1
join customisation_files_perceptual_hashes cfph2
    on cfph1.perceptual_hash = cfph2.perceptual_hash
    and cfph1.id <> cfph2.id
    and cfph1.file_type = cfph2.file_type
    and cfph1.customer_id = cfph2.customer_id;
;-- -. . -..- - / . -. - .-. -.--
select cfph1.*, cfph2.* from customisation_files_perceptual_hashes cfph1
join customisation_files_perceptual_hashes cfph2
    on cfph1.perceptual_hash = cfph2.perceptual_hash
    and cfph1.id <> cfph2.id
    and cfph1.file_type = cfph2.file_type
    and cfph1.customer_id = cfph2.customer_id;
;-- -. . -..- - / . -. - .-. -.--
select cfph1.id, cfph2.id, cfph1.created_at, cfph2.created_at, cfph1.customer_id, cfph1.url, cfph2.url, cfph1.perceptual_hash, cfph2.perceptual_hash  from customisation_files_perceptual_hashes cfph1
join customisation_files_perceptual_hashes cfph2
    on cfph1.perceptual_hash = cfph2.perceptual_hash
    and cfph1.id <> cfph2.id
    and cfph1.file_type = cfph2.file_type
    and cfph1.customer_id = cfph2.customer_id;
;-- -. . -..- - / . -. - .-. -.--
select cfph1.id, cfph2.id, cfph1.file_type, cfph1.created_at, cfph2.created_at, cfph1.customer_id, cfph1.url, cfph2.url, cfph1.perceptual_hash, cfph2.perceptual_hash  from customisation_files_perceptual_hashes cfph1
join customisation_files_perceptual_hashes cfph2
    on cfph1.perceptual_hash = cfph2.perceptual_hash
    and cfph1.id <> cfph2.id
    and cfph1.file_type = cfph2.file_type
    and cfph1.customer_id = cfph2.customer_id;
;-- -. . -..- - / . -. - .-. -.--
select cfph1.id, cfph2.id, cfph1.file_type, cfph1.customer_id, cfph1.created_at, cfph2.created_at, cfph1.url, cfph2.url, cfph1.perceptual_hash, cfph2.perceptual_hash  from customisation_files_perceptual_hashes cfph1
join customisation_files_perceptual_hashes cfph2
    on cfph1.perceptual_hash = cfph2.perceptual_hash
    and cfph1.id <> cfph2.id
    and cfph1.file_type = cfph2.file_type
    and cfph1.customer_id = cfph2.customer_id;
;-- -. . -..- - / . -. - .-. -.--
select cfph1.id, cfph2.id, cfph1.file_type, cfph1.customer_id, cfph1.created_at, cfph2.created_at, cfph1.perceptual_hash, cfph1.url, cfph2.url   from customisation_files_perceptual_hashes cfph1
join customisation_files_perceptual_hashes cfph2
    on cfph1.perceptual_hash = cfph2.perceptual_hash
    and cfph1.id <> cfph2.id
    and cfph1.file_type = cfph2.file_type
    and cfph1.customer_id = cfph2.customer_id;
;-- -. . -..- - / . -. - .-. -.--
select cfph1.id, cfph2.id, cfph1.file_type, cfph1.customer_id, cfph1.created_at, cfph2.created_at, cfph1.perceptual_hash, cfph1.url, cfph2.url   from customisation_files_perceptual_hashes cfph1
join customisation_files_perceptual_hashes cfph2
    on cfph1.perceptual_hash = cfph2.perceptual_hash
    and cfph1.id <> cfph2.id
    and cfph1.file_type = cfph2.file_type
    and cfph1.customer_id = cfph2.customer_id
    and cfph1.created_at <> cfph2.created_at;
;-- -. . -..- - / . -. - .-. -.--
select cfph1.id, cfph2.id, cfph1.file_type, cfph1.customer_id, cfph1.created_at, cfph2.created_at, cfph1.perceptual_hash, cfph1.url, cfph2.url   from customisation_files_perceptual_hashes cfph1
join customisation_files_perceptual_hashes cfph2
    on cfph1.perceptual_hash = cfph2.perceptual_hash
    and cfph1.id <> cfph2.id
    and cfph1.file_type = cfph2.file_type
    and cfph1.customer_id = cfph2.customer_id
    and cfph1.created_at <> cfph2.created_at

where cfph1.file_type > 1;
;-- -. . -..- - / . -. - .-. -.--
select cfph1.id, cfph2.id, cfph1.file_type, cfph1.customer_id, cfph1.created_at, cfph2.created_at, cfph1.perceptual_hash, cfph1.url, cfph2.url,
count(*)
from customisation_files_perceptual_hashes cfph1
join customisation_files_perceptual_hashes cfph2
    on cfph1.perceptual_hash = cfph2.perceptual_hash
    and cfph1.id <> cfph2.id
    and cfph1.file_type = cfph2.file_type
    and cfph1.customer_id = cfph2.customer_id
    and cfph1.created_at <> cfph2.created_at

where cfph1.file_type > 1;
;-- -. . -..- - / . -. - .-. -.--
select count(*)
from customisation_files_perceptual_hashes cfph1
join customisation_files_perceptual_hashes cfph2
    on cfph1.perceptual_hash = cfph2.perceptual_hash
    and cfph1.id <> cfph2.id
    and cfph1.file_type = cfph2.file_type
    and cfph1.customer_id = cfph2.customer_id
    and cfph1.created_at <> cfph2.created_at

where cfph1.file_type > 1;
;-- -. . -..- - / . -. - .-. -.--
select cfph1.id, cfph2.id, cfph1.file_type, cfph1.customer_id, cfph1.created_at, cfph2.created_at, cfph1.perceptual_hash, cfph1.url, cfph2.url
# select count(*)
from customisation_files_perceptual_hashes cfph1
join customisation_files_perceptual_hashes cfph2
    on cfph1.perceptual_hash = cfph2.perceptual_hash
    and cfph1.id <> cfph2.id
    and cfph1.file_type = cfph2.file_type
    and cfph1.customer_id = cfph2.customer_id
    and cfph1.created_at <> cfph2.created_at

where cfph1.file_type > 1;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_options_checkboxes;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_options;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_options where custom_type = 'emb_kingf';
;-- -. . -..- - / . -. - .-. -.--
select id from customisation_options where custom_type = 'emb_creativeb';
;-- -. . -..- - / . -. - .-. -.--
insert into customisation_options_checkboxes (custom_options_id, custom_box, custom_text, custom_class, sort_order) VALUES
((select id from customisation_options where custom_type = 'emb_creativeb' ),'custom_1','Artwork Sent to Digitiser','artwork_file_sent_digitiser','10'),
(14,'custom_2','Garments Ready for Customisation','garments_ready','35'),
(14,'custom_3','Artwork Received from Digitiser','artwork_file_received_digitiser','30'),
(14,'custom_4','Proof Sent to Customer','proof_sent','40'),
(14,'custom_5','Proof Approved','proof_approved','50'),
(14,'custom_6','File Sent to Embroiderers','artwork_file_ready','60'),
(14,'custom_7','Sample Required','sample_required','70'),
(14,'custom_8','Sample Produced','sample_produced','80'),
(14,'custom_9','Sample Approved','sample_approved','90'),
(14,'custom_10','Production QA Check Complete','prod_qa_check_comp','32'),
(14,'custom_11','Sample Collected','sample_collected','85');
;-- -. . -..- - / . -. - .-. -.--
insert into customisation_options_checkboxes (custom_options_id, custom_box, custom_text, custom_class, sort_order) VALUES
((select id from customisation_options where custom_type = 'emb_creativeb'),'custom_1','Artwork Sent to Digitiser','artwork_file_sent_digitiser','10'),
((select id from customisation_options where custom_type = 'emb_creativeb'),'custom_2','Garments Ready for Customisation','garments_ready','35'),
((select id from customisation_options where custom_type = 'emb_creativeb'),'custom_3','Artwork Received from Digitiser','artwork_file_received_digitiser','30'),
((select id from customisation_options where custom_type = 'emb_creativeb'),'custom_4','Proof Sent to Customer','proof_sent','40'),
((select id from customisation_options where custom_type = 'emb_creativeb'),'custom_5','Proof Approved','proof_approved','50'),
((select id from customisation_options where custom_type = 'emb_creativeb'),'custom_6','File Sent to Embroiderers','artwork_file_ready','60'),
((select id from customisation_options where custom_type = 'emb_creativeb'),'custom_7','Sample Required','sample_required','70'),
((select id from customisation_options where custom_type = 'emb_creativeb'),'custom_8','Sample Produced','sample_produced','80'),
((select id from customisation_options where custom_type = 'emb_creativeb'),'custom_9','Sample Approved','sample_approved','90'),
((select id from customisation_options where custom_type = 'emb_creativeb'),'custom_10','Production QA Check Complete','prod_qa_check_comp','32'),
((select id from customisation_options where custom_type = 'emb_creativeb'),'custom_11','Sample Collected','sample_collected','85');
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_options_checkboxes where custom_options_id = 36;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_options_checkboxes where custom_options_id = 14;
;-- -. . -..- - / . -. - .-. -.--
desc orders_customisations_types;
;-- -. . -..- - / . -. - .-. -.--
show create table orders_customisations_types;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE `orders_customisations_types`
    ADD COLUMN 'emb_kingf' tinyint(1) NOT NULL DEFAULT '0',
    ADD KEY `emb_kingf` (`emb_kingf`);
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE `orders_customisations_types` ADD COLUMN 'emb_kingf' tinyint(1) NOT NULL DEFAULT '0';
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE `orders_customisations_types` ADD COLUMN `emb_kingf` tinyint(1) NOT NULL DEFAULT '0';
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE `orders_customisations_types` DROP KEY `emb_kingf`;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE `orders_customisations_types` DROP COLUMN `emb_kingf`;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE `orders_customisations_types` ADD COLUMN `emb_kingf` tinyint(1) NOT NULL DEFAULT '0' AFTER `print_storm`;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE `orders_customisations_types` ADD KEY `emb_kingf` (`emb_kingf`);
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE `orders_customisations_types` ADD COLUMN `emb_creativeb` tinyint(1) NOT NULL DEFAULT '0' AFTER `emb_kingf`;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE `orders_customisations_types` ADD KEY `emb_creativeb` (`emb_creativeb`);
;-- -. . -..- - / . -. - .-. -.--
select countries_id, countries_iso_code_2, countries_iso_code_3 from countries;
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners;
;-- -. . -..- - / . -. - .-. -.--
select * from orders order by orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT countries_name, address_format_id
                    FROM countries
                    WHERE countries_name LIKE 'FR'
                    OR countries_iso_code_2 LIKE 'FR'
                    OR countries_iso_code_3 LIKE 'FR'
                    GROUP BY countries_name;
;-- -. . -..- - / . -. - .-. -.--
select count(*) from customisation_files_perceptual_hashes where perceptual_hash is not null and perceptual_hash > '';
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where perceptual_hash like "%%";
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where perceptual_hash like "% %";
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where perceptual_hash is not null and perceptual_hash > '' order by id desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT countries_name, address_format_id
                    FROM countries
                    WHERE countries_name LIKE 'fr'
                    OR countries_iso_code_2 LIKE 'fr'
                    OR countries_iso_code_3 LIKE 'fr'
                    GROUP BY countries_name;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
                    FROM countries
                    WHERE countries_name LIKE 'fr'
                    OR countries_iso_code_2 LIKE 'fr'
                    OR countries_iso_code_3 LIKE 'fr'
                    GROUP BY countries_name;
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners_log;
;-- -. . -..- - / . -. - .-. -.--
select * from orders where orders_id >= 4877168;
;-- -. . -..- - / . -. - .-. -.--
select countries_id, countries_name, countries_iso_code_2, countries_iso_code_3 from countries;
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners_log order by log_id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from orders where orders_id >= 4877177;
;-- -. . -..- - / . -. - .-. -.--
select * from orders where orders_id >= 4877191;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE customisation_files_perceptual_hashes add column `error` varchar(255) after perceptual_hash null default null;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE customisation_files_perceptual_hashes add column `error` varchar(255) null default null after perceptual_hash;
;-- -. . -..- - / . -. - .-. -.--
select count(*) from customisation_files_perceptual_hashes where perceptual_hash = '404: failed to get file from S3.';
;-- -. . -..- - / . -. - .-. -.--
select count(*) from customisation_files_perceptual_hashes where perceptual_hash like '%404%';
;-- -. . -..- - / . -. - .-. -.--
select count(*) from customisation_files_perceptual_hashes where perceptual_hash like '%404:%';
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where perceptual_hash = '';
;-- -. . -..- - / . -. - .-. -.--
update customisation_files_perceptual_hashes set perceptual_hash = null where perceptual_hash = '';
;-- -. . -..- - / . -. - .-. -.--
select distinct(error) from customisation_files_perceptual_hashes where error is not null;
;-- -. . -..- - / . -. - .-. -.--
update customisation_files_perceptual_hashes set perceptual_hash = '' where error is not null;
;-- -. . -..- - / . -. - .-. -.--
select id, file_type, url, error from customisation_files_perceptual_hashes where error is not null;
;-- -. . -..- - / . -. - .-. -.--
select id, created_at, file_type, url, error from customisation_files_perceptual_hashes where error is not null;
;-- -. . -..- - / . -. - .-. -.--
select id, created_at, file_type, url, error from customisation_files_perceptual_hashes where error like "Client error:%";
;-- -. . -..- - / . -. - .-. -.--
select count(id, created_at, file_type, url, error) from customisation_files_perceptual_hashes where error like "Client error:%";
;-- -. . -..- - / . -. - .-. -.--
select count(*) from customisation_files_perceptual_hashes where error like "Client error:%";
;-- -. . -..- - / . -. - .-. -.--
select count(*) from customisation_files_prod_backup;
;-- -. . -..- - / . -. - .-. -.--
select count(*), count(distinct perceptual_hash) from customisation_files_perceptual_hashes where perceptual_hash is not null;
;-- -. . -..- - / . -. - .-. -.--
select count(*) from customisation_files_perceptual_hashes where perceptual_hash is not null and perceptual_hash > '' order by id desc;
;-- -. . -..- - / . -. - .-. -.--
select count(*) from customisation_files_perceptual_hashes where error not like "Client error:%" and error is not null;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where error not like "Client error:%" and error is not null;
;-- -. . -..- - / . -. - .-. -.--
select cfph1.id, cfph2.id, cfph1.file_type, cfph1.customer_id, cfph1.created_at, cfph2.created_at, cfph1.perceptual_hash, cfph1.url, cfph2.url
# select count(*)
from customisation_files_perceptual_hashes cfph1
join customisation_files_perceptual_hashes cfph2
    on cfph1.perceptual_hash = cfph2.perceptual_hash
    and cfph1.id <> cfph2.id
    and cfph1.file_type = cfph2.file_type
    and cfph1.customer_id = cfph2.customer_id
    and cfph1.created_at <> cfph2.created_at;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_customisations;
;-- -. . -..- - / . -. - .-. -.--
select * from orders;
;-- -. . -..- - / . -. - .-. -.--
desc orders;
;-- -. . -..- - / . -. - .-. -.--
select * from orders
where mobile_order = 0;
;-- -. . -..- - / . -. - .-. -.--
select * from orders
where mobile_order = 0
and customers_id > 0
and staff_name is null;
;-- -. . -..- - / . -. - .-. -.--
select * from orders
where mobile_order = 0
and customers_id > 0
and staff_name = '';
;-- -. . -..- - / . -. - .-. -.--
select * from orders
where mobile_order = 0
and customers_id > 0
and staff_name = ''
and payment_method = 'replacement';
;-- -. . -..- - / . -. - .-. -.--
select * from orders
where mobile_order = 0
and customers_id > 0
and staff_name = ''
and payment_method <> 'replacement';
;-- -. . -..- - / . -. - .-. -.--
select o.orders_id, o.orders_status, o.customers_name from orders o
where mobile_order = 0
and customers_id > 0
and staff_name = ''
and payment_method <> 'replacement';
;-- -. . -..- - / . -. - .-. -.--
select o.orders_id, o.orders_status, o.customers_name, o.customers_email_address from orders o
where mobile_order = 0
and customers_id > 0
and staff_name = ''
and payment_method <> 'replacement';
;-- -. . -..- - / . -. - .-. -.--
select o.orders_id, o.orders_status, o.customers_name, o.customers_email_address from orders o

join orders_customisations oc on oc.order_id = o.orders_id

where mobile_order = 0
and customers_id > 0
and staff_name = ''
and payment_method <> 'replacement';
;-- -. . -..- - / . -. - .-. -.--
select
        o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
        oc.*
from orders o

join orders_customisations oc on oc.order_id = o.orders_id

where mobile_order = 0
and customers_id > 0
and staff_name = ''
and payment_method <> 'replacement';
;-- -. . -..- - / . -. - .-. -.--
select * from orders_customisations where customisation_id > 0;
;-- -. . -..- - / . -. - .-. -.--
select
        o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
        oc.primary_type,
        oc.custom_type
from orders o

join orders_customisations oc on oc.order_id = o.orders_id

where mobile_order = 0
and customers_id > 0
and staff_name = ''
and payment_method <> 'replacement';
;-- -. . -..- - / . -. - .-. -.--
select
       o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
       oc.custom_type,
       oc.application_count,
       oc.primary_type
from orders o

join orders_customisations oc on oc.order_id = o.orders_id

where mobile_order = 0
and customers_id > 0
and staff_name = ''
and payment_method <> 'replacement';
;-- -. . -..- - / . -. - .-. -.--
select
       o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
       oc.custom_type,
       oc.application_count,
       oc.primary_type
from orders o

join orders_customisations oc on oc.order_id = o.orders_id
join customisation_files cf on cf.customisation_id = oc.customisation_id

where mobile_order = 0
and customers_id > 0
and staff_name = ''
and payment_method <> 'replacement';
;-- -. . -..- - / . -. - .-. -.--
select
        o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
        oc.custom_type, oc.application_count, oc.primary_type,
        cf.*
from orders o

join orders_customisations oc on oc.order_id = o.orders_id
join customisation_files cf on cf.customisation_id = oc.customisation_id

where mobile_order = 0
and customers_id > 0
and staff_name = ''
and payment_method <> 'replacement';
;-- -. . -..- - / . -. - .-. -.--
select
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    cf.*
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0;
;-- -. . -..- - / . -. - .-. -.--
select
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    cf.*
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    cf.*
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    cf.*
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0

group by o.orders_id, cf.perceptual_hash

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    distinct(cf.perceptual_hash),
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0

group by o.orders_id, cf.perceptual_hash

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    distinct(cf.perceptual_hash),
    count(cf.perceptual_hash),
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0

group by o.orders_id, cf.perceptual_hash

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.perceptual_hash,
    count(cf.perceptual_hash),
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0

group by o.orders_id, cf.perceptual_hash

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.perceptual_hash,
    count(cf.perceptual_hash),
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.perceptual_hash,
    count(cf.perceptual_hash),
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0

group by cf.perceptual_hash

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.perceptual_hash,
    count(cf.perceptual_hash),
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
  and o.orders_id = 4872839

# group by o.orders_id, cf.perceptual_hash

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.perceptual_hash,
    count(cf.perceptual_hash),
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
  and o.orders_id = 4872839

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
  and o.orders_id = 4872839

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.perceptual_hash,
    count(distinct(cf.perceptual_hash)),
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
  and o.orders_id = 4872839

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.perceptual_hash,
    count(cf.perceptual_hash),
    count(distinct(cf.perceptual_hash)),
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
  and o.orders_id = 4872839

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.perceptual_hash,
    count(cf.perceptual_hash) as files_count,
    count(distinct(cf.perceptual_hash)) as unique_files_count,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
  and o.orders_id = 4872839

and files_count <> unique_files_count

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.perceptual_hash,
    count(cf.perceptual_hash) as files_count,
    count(distinct(cf.perceptual_hash)) as unique_files_count,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
  and o.orders_id = 4872839

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.perceptual_hash,
    count(cf.perceptual_hash) as files_count,
    count(distinct cf.perceptual_hash ) as unique_files_count,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
  and o.orders_id = 4872839

having count(cf.perceptual_hash) <> count(distinct cf.perceptual_hash)

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.perceptual_hash,
    count(cf.perceptual_hash) as files_count,
    count(distinct cf.perceptual_hash ) as unique_files_count,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
  and o.orders_id = 4872839

having count(cf.perceptual_hash) = count(distinct cf.perceptual_hash)

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.perceptual_hash,
    count(cf.perceptual_hash) as files_count,
    count(distinct cf.perceptual_hash ) as unique_files_count,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
#   and o.orders_id = 4872839

having count(cf.perceptual_hash) <> count(distinct cf.perceptual_hash)

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.perceptual_hash,
    count(cf.perceptual_hash) as files_count,
    count(distinct cf.perceptual_hash ) as unique_files_count,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
  and o.orders_id = 4464823

having count(cf.perceptual_hash) <> count(distinct cf.perceptual_hash)

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
  and o.orders_id = 4872839

having count(cf.perceptual_hash) <> count(distinct cf.perceptual_hash)

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.*,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
  and o.orders_id = 4872839

having count(cf.perceptual_hash) <> count(distinct cf.perceptual_hash)

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.*,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
#   and o.orders_id = 4872839

having count(cf.perceptual_hash) <> count(distinct cf.perceptual_hash)

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.id,
    cf.file_type,
    cf.perceptual_hash,
    count(cf.perceptual_hash) as files_count,
    count(distinct cf.perceptual_hash ) as unique_files_count,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
  and o.orders_id = 4872839

having count(cf.perceptual_hash) <> count(distinct cf.perceptual_hash)

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.id,
    cf.file_type,
    cf.perceptual_hash,
    count(cf.perceptual_hash) as files_count,
    count(distinct cf.perceptual_hash ) as unique_files_count,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
  and o.orders_id = 4872839

# having count(cf.perceptual_hash) <> count(distinct cf.perceptual_hash)

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.id,
    cf.file_type,
    cf.perceptual_hash,
    count(cf.perceptual_hash) as files_count,
    count(distinct cf.perceptual_hash ) as unique_files_count,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
#   and o.orders_id = 4872839

having count(cf.perceptual_hash) <> count(distinct cf.perceptual_hash)

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.id,
    cf.file_type,
    cf.perceptual_hash,
    count(cf.perceptual_hash) as files_count,
    count(distinct cf.perceptual_hash ) as unique_files_count,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
#   and o.orders_id = 4872839

having count(cf.perceptual_hash = cf.perceptual_hash) > 1

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.id,
    cf.file_type,
    cf.perceptual_hash,
#     count(cf.perceptual_hash) as files_count,
#     count(distinct cf.perceptual_hash ) as unique_files_count,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
#   and o.orders_id = 4872839

having count(cf.perceptual_hash = cf.perceptual_hash) > 1

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.id,
    cf.file_type,
    cf.perceptual_hash,
#     count(cf.perceptual_hash) as files_count,
#     count(distinct cf.perceptual_hash ) as unique_files_count,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
#   and o.orders_id = 4872839

# having count(cf.perceptual_hash = cf.perceptual_hash) > 1

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from poloshir_osC.products_stock_allocated where order_id = 4877161 and allocated_site = 'c2o'
AND ( vendors_id IN (0,28) OR vendor_email_sent = 'N' );
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
GROUP BY 1


desc orders;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
GROUP BY 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
GROUP BY 1
having COUNT(DISTINCT cf.perceptual_hash) AS used_count > 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
GROUP BY 1
having COUNT(DISTINCT cf.perceptual_hash) > 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
GROUP BY 1
order by used_count desc;
;-- -. . -..- - / . -. - .-. -.--
show full processlist;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url
# 	COUNT(DISTINCT cf.perceptual_hash) AS used_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.perceptual_hash
# 	COUNT(DISTINCT cf.perceptual_hash) AS used_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.perceptual_hash,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.perceptual_hash,
	COUNT(cf.perceptual_hash) AS used_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.perceptual_hash,
	COUNT(UNIQUE cf.perceptual_hash) AS used_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.perceptual_hash,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count
FROM customisation_files_perceptual_hashes as cf;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.perceptual_hash,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count
FROM customisation_files_perceptual_hashes as cf
JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
JOIN orders o ON oc.order_id = o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.perceptual_hash,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count
FROM customisation_files_perceptual_hashes as cf
JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0

GROUP BY 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.perceptual_hash,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count,
    o.orders_id,
    oc.customisation_id
FROM customisation_files_perceptual_hashes as cf
JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0

GROUP BY 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.perceptual_hash,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count,
    o.orders_id,
    oc.customisation_id
FROM customisation_files_perceptual_hashes as cf
JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.file_type = 1

GROUP BY 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.perceptual_hash,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count,
    o.orders_id,
    oc.customisation_id
FROM customisation_files_perceptual_hashes as cf
JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.file_type > 1

GROUP BY 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.file_type,
	cf.perceptual_hash,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count,
    o.orders_id,
    oc.customisation_id
FROM customisation_files_perceptual_hashes as cf
JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.file_type > 1

GROUP BY 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.file_type,
	cf.perceptual_hash,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count,
    o.orders_id,
    oc.customisation_id
FROM customisation_files_perceptual_hashes as cf
JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.file_type > 1

GROUP BY oc.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.file_type,
	cf.perceptual_hash,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count,
    o.orders_id,
    oc.customisation_id
FROM customisation_files_perceptual_hashes as cf
JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.file_type > 1

GROUP BY o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.file_type,
	cf.perceptual_hash,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count,
    o.orders_id,
    oc.customisation_id
FROM customisation_files_perceptual_hashes as cf
JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.file_type > 1

GROUP BY cf.perceptual_hash, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.file_type,
	cf.perceptual_hash,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count,
    o.orders_id,
    oc.customisation_id,
    o.customers_name, o.customers_email_address, o.customers_id
FROM customisation_files_perceptual_hashes as cf
JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.file_type > 1

GROUP BY cf.perceptual_hash, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.file_type,
	cf.perceptual_hash,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count,
    o.orders_id,
    oc.customisation_id,
    o.customers_name, o.customers_email_address, o.customers_id
FROM customisation_files_perceptual_hashes as cf
JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.file_type > 1

GROUP BY cf.perceptual_hash, o.orders_id
HAVING COUNT(DISTINCT cf.perceptual_hash) > 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.file_type,
	cf.perceptual_hash,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count,
    o.orders_id,
    oc.customisation_id,
    o.customers_name, o.customers_email_address, o.customers_id
FROM customisation_files_perceptual_hashes as cf
JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
HAVING COUNT(DISTINCT cf.perceptual_hash) > 1;
;-- -. . -..- - / . -. - .-. -.--
select
    cf.id,
    cf.file_type,
    cf.perceptual_hash,
#     count(cf.perceptual_hash) as files_count,
#     count(distinct cf.perceptual_hash ) as unique_files_count,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
  and o.orders_id = 4672244

# having count(cf.perceptual_hash = cf.perceptual_hash) > 1

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.file_type,
	cf.perceptual_hash,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count,
    o.orders_id,
    oc.customisation_id,
    o.customers_name, o.customers_email_address, o.customers_id
FROM orders AS o
LEFT JOIN orders_customisations as oc ON oc.order_id = o.orders_id
LEFT JOIN customisation_files_perceptual_hashes AS cf on cf.customisation_id = oc.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.orders_id,
    COUNT(cf.perceptual_hash) AS total_files_count,
    COUNT(DISTINCT cf.perceptual_hash) AS unique_files_count,
    o.customers_name, o.customers_email_address, o.customers_id

FROM orders AS o
LEFT JOIN orders_customisations as oc ON oc.order_id = o.orders_id
LEFT JOIN customisation_files_perceptual_hashes AS cf on cf.customisation_id = oc.customisation_id
WHERE true
  and o.orders_id = 4672244;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.orders_id,
    COUNT(cf.perceptual_hash) AS total_files_count,
    COUNT(DISTINCT cf.perceptual_hash) AS unique_files_count,
    o.customers_name, o.customers_email_address, o.customers_id

FROM orders AS o
LEFT JOIN orders_customisations as oc ON oc.order_id = o.orders_id
LEFT JOIN customisation_files_perceptual_hashes AS cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.file_type > 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.orders_id,
    COUNT(cf.perceptual_hash) AS total_files_count,
    COUNT(DISTINCT cf.perceptual_hash) AS unique_files_count,
    o.customers_name, o.customers_email_address, o.customers_id

FROM orders AS o
LEFT JOIN orders_customisations as oc ON oc.order_id = o.orders_id
LEFT JOIN customisation_files_perceptual_hashes AS cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.file_type,
	cf.perceptual_hash,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count,
    o.orders_id,
    oc.customisation_id,
    o.customers_name, o.customers_email_address, o.customers_id
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
HAVING COUNT(DISTINCT cf.perceptual_hash) > 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.file_type,
	cf.perceptual_hash,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count,
    o.orders_id,
    oc.customisation_id,
    o.customers_name, o.customers_email_address, o.customers_id
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0

GROUP BY 1
HAVING COUNT(DISTINCT cf.perceptual_hash) > 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.file_type,
	cf.perceptual_hash,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count,
    o.orders_id,
    o.customers_name, o.customers_email_address, o.customers_id
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0

GROUP BY 1
HAVING COUNT(DISTINCT cf.perceptual_hash) > 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.file_type,
	cf.perceptual_hash,
	COUNT(DISTINCT cf.perceptual_hash) AS used_count,
    o.orders_id,
    o.customers_name, o.customers_email_address, o.customers_id
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0

GROUP BY o.customers_name, o.orders_id
HAVING COUNT(DISTINCT cf.perceptual_hash) > 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	cf.url,
	cf.file_type,
	cf.perceptual_hash,
	COUNT(cf.perceptual_hash) AS files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
    o.orders_id,
    o.customers_name, o.customers_email_address, o.customers_id
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0

GROUP BY o.customers_name, o.orders_id
HAVING COUNT(DISTINCT cf.perceptual_hash) > 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	COUNT(cf.perceptual_hash) AS files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
    o.orders_id,
    o.customers_name, o.customers_email_address, o.customers_id
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0

GROUP BY o.customers_name, o.orders_id
HAVING COUNT(DISTINCT cf.perceptual_hash) > 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT
	COUNT(cf.perceptual_hash) AS files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
    o.orders_id,
    o.customers_name, o.customers_email_address, o.customers_id
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0

GROUP BY o.customers_name, o.orders_id
HAVING COUNT(DISTINCT cf.perceptual_hash) > 1 and (unique_files_on_order <> files_on_order);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.orders_id,
    o.customers_name, o.customers_email_address, o.customers_id,
    COUNT(cf.perceptual_hash) AS files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0

GROUP BY o.customers_name, o.orders_id
HAVING COUNT(DISTINCT cf.perceptual_hash) > 1 and (unique_files_on_order <> files_on_order);
;-- -. . -..- - / . -. - .-. -.--
select
    cf.id,
    cf.file_type,
    cf.perceptual_hash,
#     count(cf.perceptual_hash) as files_count,
#     count(distinct cf.perceptual_hash ) as unique_files_count,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o

         join orders_customisations oc on oc.order_id = o.orders_id
         join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id

where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0
  and o.orders_id = 4467791

# having count(cf.perceptual_hash = cf.perceptual_hash) > 1

order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    COUNT(cf.perceptual_hash) AS files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0

GROUP BY o.customers_name, o.orders_id
HAVING COUNT(DISTINCT cf.perceptual_hash) > 1 and (unique_files_on_order <> files_on_order);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    COUNT(cf.perceptual_hash) AS files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0

GROUP BY o.customers_name, o.orders_id
HAVING unique_files_on_order <> files_on_order;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    COUNT(cf.perceptual_hash) AS files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
HAVING unique_files_on_order <> files_on_order;
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0

and o.orders_id = 4569342

  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0

and o.orders_id = 4761536

  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'

  and oc.customisation_id > 0

and o.orders_id = 4701537

  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
desc orders_customisations;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    COUNT(cf.perceptual_hash) AS files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.custom_id = cf.customisation_id #AND cf.customer_id = oc.customer
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0

  and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
HAVING unique_files_on_order <> files_on_order;
;-- -. . -..- - / . -. - .-. -.--
desc customisations;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    COUNT(cf.perceptual_hash) AS files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.custom_id = cf.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0

  and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
HAVING unique_files_on_order <> files_on_order;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM customisation_files_perceptual_hashes AS cf
JOIN customisations AS c ON cf.customisation_id = c.customisation_id AND cf.customer_id = c.customer_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    COUNT(cf.perceptual_hash) AS files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0

  and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
HAVING unique_files_on_order <> files_on_order;
;-- -. . -..- - / . -. - .-. -.--
EXPLAIN SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    COUNT(cf.perceptual_hash) AS files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0

  and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
HAVING unique_files_on_order <> files_on_order;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes;
;-- -. . -..- - / . -. - .-. -.--
truncate customisation_files_perceptual_hashes;
;-- -. . -..- - / . -. - .-. -.--
select count(*) from customisation_files_perceptual_hashes where error is not null;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where error is not null and perceptual_hash is null;
;-- -. . -..- - / . -. - .-. -.--
select distinct error from customisation_files_perceptual_hashes where error is not null and perceptual_hash = '';
;-- -. . -..- - / . -. - .-. -.--
select distinct SUBSTRING(`error`, 0, 100) from customisation_files_perceptual_hashes where error is not null and perceptual_hash = '';
;-- -. . -..- - / . -. - .-. -.--
select distinct SUBSTRING(error, 0, 100) from customisation_files_perceptual_hashes where error is not null and perceptual_hash = '';
;-- -. . -..- - / . -. - .-. -.--
select SUBSTRING(error, 0, 100) from customisation_files_perceptual_hashes where error is not null and perceptual_hash = '';
;-- -. . -..- - / . -. - .-. -.--
select SUBSTRING(error, 1, 100) from customisation_files_perceptual_hashes where error is not null and perceptual_hash = '';
;-- -. . -..- - / . -. - .-. -.--
select distinct SUBSTRING(error, 1, 110) from customisation_files_perceptual_hashes where error is not null and perceptual_hash = '';
;-- -. . -..- - / . -. - .-. -.--
select distinct SUBSTRING(error, 1, 102) from customisation_files_perceptual_hashes where error is not null and perceptual_hash = '';
;-- -. . -..- - / . -. - .-. -.--
select distinct SUBSTRING(error, 1, 101) from customisation_files_perceptual_hashes where error is not null and perceptual_hash = '';
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where error like '{"bucket":null,"hash":"File not on disk","general":"Client error: `GET https:\/\/order-consumption-t%';
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where error like '%{"bucket":null,"hash":"File not on disk","general":"Client error: `GET https:\/\/order-consumption-t%';
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where error like '%{"bucket":null,"hash":"File not on disk","general":"Client error: %';
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where error like '%{"bucket":null,"hash":"File not on disk","general":"Client error: % order-consumption';
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where error like '%{"bucket":null,"hash":"File not on disk","general":"Client error: % order-consumption %';
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where error like '%{"bucket":null,"hash":"File not on disk","general":"Client error: % order-consumption%';
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where error like '%{"bucket":null,"hash":"File not on disk","general":"Client error:%order-consumption%';
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where perceptual_hash = '' and error like '%{"bucket":null,"hash":"File not on disk","general":"Client error:%order-consumption%';
;-- -. . -..- - / . -. - .-. -.--
select count(*) from customisation_files_perceptual_hashes where perceptual_hash = '' and error like '%{"bucket":null,"hash":"File not on disk","general":"Client error:%order-consumption%403 forb%';
;-- -. . -..- - / . -. - .-. -.--
select count(*) from customisation_files_perceptual_hashes where perceptual_hash = '' and error not like '%{"bucket":null,"hash":"File not on disk","general":"Client error:%order-consumption%403 forb%';
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where perceptual_hash = '' and error not like '%{"bucket":null,"hash":"File not on disk","general":"Client error:%order-consumption%403 forb%';
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where perceptual_hash = '' and error like '%{"bucket":null,"hash":"File not on disk","general":"Client error:%order-consumption%403 forb%';
;-- -. . -..- - / . -. - .-. -.--
select count(*) from customisation_files_perceptual_hashes where perceptual_hash = '' and error like '%{"bucket":null,"hash":"File not on disk","general":"Client error:%order-consumption%403 forbidden%';
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where perceptual_hash = '' and error like '%{"bucket":null,"hash":"File not on disk","general":"Client error:%order-consumption%403 forbidden%';
;-- -. . -..- - / . -. - .-. -.--
update customisation_files_perceptual_hashes set perceptual_hash = null, error = null where perceptual_hash = '' and error like '%{"bucket":null,"hash":"File not on disk","general":"Client error:%order-consumption%403 forbidden%';
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where error = '{"bucket":null,"hash":null,"general":null}';
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where perceptual_hash = '' and error like '%{"bucket":null,"hash":"File not on disk","general":"Client error:%order-consumption%403 forbidden%'
order by updated_at asc;
;-- -. . -..- - / . -. - .-. -.--
update customisation_files_perceptual_hashes set perceptual_hash = null, error = null where error like '{"bucket":null,"hash":"File not on disk","general":null}';
;-- -. . -..- - / . -. - .-. -.--
select count(*) from customisation_files_perceptual_hashes where error is not null and perceptual_hash = '';
;-- -. . -..- - / . -. - .-. -.--
update customisation_files_perceptual_hashes set perceptual_hash = null, error = null where error like '{"bucket":null,"hash":null,"general":"Error with ImageMagic RC:1 Message: identify-im6.q16: unable to open image%';
;-- -. . -..- - / . -. - .-. -.--
update customisation_files_perceptual_hashes set perceptual_hash = null, error = null where error like '{"bucket":null,"hash":null,"general":"Error with ImageMagic RC:1 Message: identify-im6.q16: unable to decompress%';
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where error is not null and perceptual_hash = '';
;-- -. . -..- - / . -. - .-. -.--
select distinct SUBSTRING(error, 1, 100), count(*) from customisation_files_perceptual_hashes where error is not null and perceptual_hash = '';
;-- -. . -..- - / . -. - .-. -.--
select distinct SUBSTRING(error, 1, 100), count(distinct SUBSTRING(error, 1, 100)) from customisation_files_perceptual_hashes where error is not null and perceptual_hash = '';
;-- -. . -..- - / . -. - .-. -.--
select distinct SUBSTRING(error, 1, 100) from customisation_files_perceptual_hashes where error is not null and perceptual_hash = '';
;-- -. . -..- - / . -. - .-. -.--
select distinct SUBSTRING(t1.error, 1, 100) as `unique`, count(t2.url)
from customisation_files_perceptual_hashes as t1
left join customisation_files_perceptual_hashes as t2 on t1.url = t2.url
where t1.error is not null and t1.perceptual_hash = ''
group by `unique`;
;-- -. . -..- - / . -. - .-. -.--
select distinct SUBSTRING(t1.error, 1, 100) as `unique`, count(t2.url) as `error_count`
from customisation_files_perceptual_hashes as t1
left join customisation_files_perceptual_hashes as t2 on t1.url = t2.url
where t1.error is not null and t1.perceptual_hash = ''
group by `unique`;
;-- -. . -..- - / . -. - .-. -.--
select distinct SUBSTRING(t1.error, 1, 100) as `error_message`, count(t2.url) as `error_count`, sum(t2.url)
from customisation_files_perceptual_hashes as t1
left join customisation_files_perceptual_hashes as t2 on t1.url = t2.url
where t1.error is not null and t1.perceptual_hash = ''
group by `error_message`;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where error = '{"bucket":null,"hash":"File not on disk","general":null}';
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where error like '{"bucket":null,"hash":"File not on disk"%';
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where error like '{"bucket":null,"hash":null,"general":"Error with ImageMagic RC:1 Message: identify-im6.q16: unable to open%';
;-- -. . -..- - / . -. - .-. -.--
select count(*) from customisation_files_perceptual_hashes where perceptual_hash > '' and error is not null;
;-- -. . -..- - / . -. - .-. -.--
update customisation_files_perceptual_hashes set perceptual_hash = null, error = null where error is not null and perceptual_hash > '';
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where perceptual_hash > '' and error is not null;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where perceptual_hash = '' and error like '%{"bucket":null,"hash":"File not on disk","general":"file_put_contents():%'
order by updated_at asc;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where error like '{"bucket":null,"hash":null,"general":"{"bucket":null,"hash":"File not on disk","general":"file_put_contents():%';
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where error like '{"bucket":null,"hash":"File not on disk","general":"file_put_contents():%';
;-- -. . -..- - / . -. - .-. -.--
update customisation_files_perceptual_hashes set perceptual_hash = null, error = null where error like '{"bucket":null,"hash":"File not on disk","general":"file_put_contents():%';
;-- -. . -..- - / . -. - .-. -.--
update customisation_files_perceptual_hashes set perceptual_hash = null, error = null where error like '%{"bucket":null,"hash":"File not on disk","general":"file_put_contents()%';
;-- -. . -..- - / . -. - .-. -.--
update customisation_files_perceptual_hashes set perceptual_hash = null, error = null where error like '%{"bucket":null,"hash":"File not on disk","general":"cURL error 23%';
;-- -. . -..- - / . -. - .-. -.--
update customisation_files_perceptual_hashes set perceptual_hash = null, error = null where error like '%{"bucket":null,"hash":"File not on disk%';
;-- -. . -..- - / . -. - .-. -.--
update customisation_files_perceptual_hashes set perceptual_hash = null, error = null where error is not null;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files_perceptual_hashes where error is not null;
;-- -. . -..- - / . -. - .-. -.--
select count(*) from customisation_files_perceptual_hashes where perceptual_hash is null;
;-- -. . -..- - / . -. - .-. -.--
select count(*) from customisation_files_perceptual_hashes where perceptual_hash is not null;
;-- -. . -..- - / . -. - .-. -.--
select count(*) from customisation_files_perceptual_hashes where perceptual_hash = '';
;-- -. . -..- - / . -. - .-. -.--
select count(*) from customisation_files_perceptual_hashes;
;-- -. . -..- - / . -. - .-. -.--
select distinct SUBSTRING(t1.error, 1, 100) as `error_message`, count(t2.url) as `error_count`
from customisation_files_perceptual_hashes as t1
left join customisation_files_perceptual_hashes as t2 on t1.url = t2.url
where t1.error is not null and t1.perceptual_hash = ''
group by `error_message`;
;-- -. . -..- - / . -. - .-. -.--
select count(*), count(distinct perceptual_hash) from customisation_files_perceptual_hashes where perceptual_hash is not null and error is null;