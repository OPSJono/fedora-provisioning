/*SELECT oc.customisation_complete, oc.*,c.customisation_name, c.customisation_type, c.customisation_id, c.customisation_logo, sum(occ.completed_apps) as completed_apps
FROM orders_customisations as oc
    LEFT JOIN orders_customisations_complete as occ ON (oc.custom_id = occ.custom_id AND oc.order_id = occ.orders_id), customisations as c
WHERE oc.customisation_id = c.customisation_id
  AND oc.order_id = '4877140'
group by oc.custom_id;

select * from orders where orders_id = 4877140;*/

select * from shopify_user_options where (value in (122, 121)) and shopify_user = 98;

select * from staff_info where first_name like "%onathan%";

update staff_info set is_admin = 1, is_qs_admin = 1 where staff_id = 628;

select * from additional_tracking;

select * from ms_stores;

select * from customers_basket_attributes
where customers_id = 4993624
and products_id = 765
limit 10;

select * from orders where api_partner_id = 6 order by date_purchased desc;
select * from api_partners where show_custom_invoice > 0;
###
# Get the records from this table based on the products id, options id and options values id.
# Then  if there is a price_prefix and the options_values_price > 0, do the math...
#
# We need to get these records for all sku's of a product in the basket.
###
select * from products_attributes
# where customers_id = 4993624
where products_id = 765
and options_id = 2
and options_values_id = 11
limit 100;


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
            AND (c.customers_email_address != '' OR c.customers_mobile != '' OR c.customers_telephone != '')
;

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

;


SELECT oc.custom_id AS cid, op.products_id AS pid, op.products_stock_attributes AS attrib FROM orders_products AS op LEFT JOIN orders_products_customisations AS opc ON op.orders_products_id = opc.orders_products_id LEFT JOIN orders_customisations AS oc ON opc.customisation_id = oc.customisation_id WHERE op.orders_id = '4877158' AND op.products_stock_attributes != '' AND oc.order_id = '4877158';
SELECT * FROM customisation_options WHERE active = '1';

select * from orders_customisations_types;
INSERT INTO customisation_options (custom_type, custom_name, custom_base_type, customisation_department, is_selectable, is_external, active, price_array, cust_address, daily_capacity_percentages, colour, default_printer, default_artworker, default_email_address, production_stage_timing, production_target_percentage, artwork_completion_target, abbreviation, sort_order)
VALUES('emb_creativeb', 'Creative Branding', 'emb', 'Outsourced', '1', '1', '1','', '', '', '', 'emb', '', '', '', '', '', 'CB', '0');

select * from customisation_options where custom_type = 'emb_kingf';

# Add the customisation checkboxes (same ones Kingfisher have)
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
((select id from customisation_options where custom_type = 'emb_creativeb'),'custom_11','Sample Collected','sample_collected','85')
;

# Add the new column for emb_creativeb
ALTER TABLE `orders_customisations_types` ADD COLUMN `emb_creativeb` tinyint(1) NOT NULL DEFAULT '0' AFTER `emb_kingf`;
ALTER TABLE `orders_customisations_types` ADD KEY `emb_creativeb` (`emb_creativeb`);

ALTER TABLE `orders_customisations_types` DROP KEY `emb_creativeb`;
ALTER TABLE `orders_customisations_types` DROP COLUMN `emb_creativeb`;



SELECT op.orders_products_id, op.orders_id, op.products_id, op.products_name, op.products_quantity, op.products_stock_attributes, o.customers_id
						 FROM orders_products op, orders o
						 WHERE op.orders_products_id = '2120633'
						 AND op.orders_id = '4877160'
						 AND o.orders_id = op.orders_id;


select vendor_email_sent, vendor_stock_updated, orders_status from orders where orders_id = 4877161;
select * from poloshir_osC.products_stock_allocated where order_id = 4877161;
select * from poloshir_osC.products_stock_allocated where order_id = 4877161 and allocated_site = 'c2o'
AND ( vendors_id IN (0,28) OR vendor_email_sent = 'N' );

select * from customisation_files;

select * FROM poloshir_osC.products_stock_allocated WHERE allocated_site = 'c2o' and order_id = '0' AND ( vendors_id IN (0,28) OR vendor_email_sent = 'N' );

select * from poloshir_osC.products_stock_allocated_extra;
select * from customers where customers_id = 4993624;

update customers set account_credit = 100 where customers_id = 4993624;

select * from orders_customisations where order_id = 4877161;


SELECT co.custom_type,coc.custom_box,coc.custom_class FROM customisation_options as co, customisation_options_checkboxes as coc WHERE co.id = coc.custom_options_id AND coc.custom_class != '';

select * from quaysidg_news.staff_info;
select * from quaysidg_news.staff_departments;

select countries_id, countries_name, countries_iso_code_2, countries_iso_code_3 from countries;


select * from orders where orders_id >= 4877191;

select * from api_partners;
select * from api_partners_log order by log_id desc;
select * from orders order by orders_id desc;
SELECT *
                    FROM countries
                    WHERE countries_name LIKE 'fr'
                    OR countries_iso_code_2 LIKE 'fr'
                    OR countries_iso_code_3 LIKE 'fr'
                    GROUP BY countries_name
;

select * from configuration;

DROP TABLE IF EXISTS `sales_wallboard_targets`;
CREATE TABLE `sales_wallboard_targets` (
  `id` int(11) AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `month` int(2) NOT NULL,
  `year` int(4) NOT NULL,
  `target` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `month` (`month`),
  KEY `year` (`year`),
  UNIQUE `unique_index`(`staff_id`, `month`, `year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

select swt.id, si.staff_id, concat_ws(' ', si.first_name, si.last_name) as staff_name, swt.month, swt.year, swt.target
from quaysidg_news.sales_wallboard_targets as swt
join quaysidg_news.staff_info as si on swt.staff_id = si.staff_id;
select count(distinct staff_id) from sales_wallboard_targets;
select * from staff_info where first_name like "%Rebecca%" and employed = 1;

select * from sales_wallboard_targets;
truncate sales_wallboard_targets;


CREATE TABLE `customisation_files_s3` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL,
  `customisation_id` bigint(20) NOT NULL DEFAULT '0',
  `file_type` int(11) NOT NULL,
  `url` text NOT NULL,
  `s3` boolean NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `file_driver` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `customisation_files_customer_id_index` (`customer_id`),
  KEY `customisation_files_customisation_id_index` (`customisation_id`),
  KEY `customisation_files_s3_index` (`s3`),
  KEY `customisation_files_file_type_index` (`file_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1879938 DEFAULT CHARSET=latin1;

update staff_info set password = '7CN7+V1PfZ6rMIfz/UUxTFRK0d7w4fz224PqMxSRCQM=' where staff_id = 628;
select * from staff_info where first_name like "%Steve%";
select staff_id, concat_ws(' ', first_name, last_name) as full_name from quaysidg_news.staff_info
    where first_name > '' and last_name > ''
    and (department = 14 or dep_filter = 'sales')
    order by first_name asc, last_name asc
;

# truncate customisation_files_perceptual_hashes;


select count(*) from customisation_files_perceptual_hashes; # 317254 total
select count(*) from customisation_files_perceptual_hashes where perceptual_hash is not null; #
select count(*) from customisation_files_perceptual_hashes where perceptual_hash is null; #
select count(*) from customisation_files_perceptual_hashes where error is not null; #
select * from customisation_files_perceptual_hashes where error is not null and perceptual_hash > ''; #
select * from customisation_files_perceptual_hashes where perceptual_hash = '' and error is null; # 144 at 15:15

# Files hashed but have an error (46)
select * from customisation_files_perceptual_hashes where perceptual_hash > '' and error is not null;

select * from customisation_files_perceptual_hashes where error like '{"bucket":null,"hash":"File not on disk"%';
select * from customisation_files_perceptual_hashes where error like '{"bucket":null,"hash":"File not on disk","general":"file_put_contents():%';
update customisation_files_perceptual_hashes set perceptual_hash = null, error = null where error is not null and perceptual_hash > '';
select * from customisation_files_perceptual_hashes where perceptual_hash = '' and error like '%{"bucket":null,"hash":"File not on disk","general":"file_put_contents():%';

# Errors and their counts
select distinct SUBSTRING(t1.error, 1, 100) as `error_message`, count(t2.url) as `error_count`
from customisation_files_perceptual_hashes as t1
left join customisation_files_perceptual_hashes as t2 on t1.url = t2.url
where t1.error is not null and t1.perceptual_hash = ''
group by `error_message`
; # 5 different errors


# update customisation_files_perceptual_hashes set perceptual_hash = null, error = null where error is not null and perceptual_hash > '';
# update customisation_files_perceptual_hashes set perceptual_hash = null, error = null where error is not null;

select count(*), count(distinct perceptual_hash) from customisation_files_perceptual_hashes where perceptual_hash is not null and error is null; # 279005, 197157
select count(*) from customisation_files_perceptual_hashes where perceptual_hash is not null and perceptual_hash > '' order by id desc; # 111717

select cfph1.id, cfph2.id, cfph1.file_type, cfph1.customer_id, cfph1.created_at, cfph2.created_at, cfph1.perceptual_hash, cfph1.url, cfph2.url
# select count(*)
from customisation_files_perceptual_hashes cfph1
join customisation_files_perceptual_hashes cfph2
    on cfph1.perceptual_hash = cfph2.perceptual_hash
    and cfph1.id <> cfph2.id
    and cfph1.file_type = cfph2.file_type
    and cfph1.customer_id = cfph2.customer_id
    and cfph1.created_at <> cfph2.created_at

#where cfph1.file_type > 1
;

ALTER TABLE customisation_files_perceptual_hashes add column `error` varchar(255) null default null after perceptual_hash;


# List all files for an order id.
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

  order by o.orders_id desc
;

# List all orders where the total number of files on customisations does not match
# the total number of unique files on customisations.
# Takes about 15 seconds to run on staging; with 437 results. :: 286 results if we ignore file_type = 1.
# The results in here might be the file_type 1 is duplicated; but the other files types are not.
# Which would indicate they started with the same base file, but cropped/rotated it differently.
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
HAVING unique_files_on_order <> files_on_order
;

desc customisations;

# 141 times a base file has been re-uploaded and then cropped or rotated differently.
# 286 times a base file has been re-uploaded and cropped or rotated in exactly the same way as before (for that order).

show full processlist;
desc orders_customisations;