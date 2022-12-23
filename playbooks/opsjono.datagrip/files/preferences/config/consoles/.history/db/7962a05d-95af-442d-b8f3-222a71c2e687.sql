select * from shopify_users where shopify_user = 51;
;-- -. . -..- - / . -. - .-. -.--
select * from configuration where configuration_key = 'trust_pilot_review_count';
;-- -. . -..- - / . -. - .-. -.--
select * from configuration where configuration_key like "%pilot%';;
;-- -. . -..- - / . -. - .-. -.--
select * from configuration where configuration_key like "%pilot%";
;-- -. . -..- - / . -. - .-. -.--
use clothes2_osC;
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners;
;-- -. . -..- - / . -. - .-. -.--
select order_products_id from orders_products;
;-- -. . -..- - / . -. - .-. -.--
select * from customers_basket;
;-- -. . -..- - / . -. - .-. -.--
explain
SELECT c.customers_id,
       c.customers_firstname,
       c.customers_lastname,
       c.customers_email_address,
       c.customers_newsletter,
       c.customers_mobile,
       c.account_credit,
       c.account_manager,
       ci.customers_info_source_id,
       ci.customers_info_date_account_created,
       dab.entry_company,
       dab.entry_country_id,
       dab.entry_city,
       dab.entry_state,
       MAX(o.date_purchased) AS last_purchase_date
FROM customers c
         LEFT JOIN customers_info ci ON ci.customers_info_id = c.customers_id
         LEFT JOIN address_book dab
                   ON dab.customers_id = c.customers_id AND dab.address_book_id = customers_default_address_id AND
                      dab.entry_city != 'Enter Your City'
         LEFT JOIN orders o ON o.customers_id = c.customers_id AND o.orders_status = 3
WHERE c.customers_id IN (
    SELECT cp.customer_id
    FROM customer_contact_preferences cp
    WHERE cp.customer_id = c.customers_id
      AND cp.activity_type = 'EMAIL'
      AND cp.has_opted_in = 1
)
  AND c.customers_email_address LIKE 'jonathan%'
GROUP BY c.customers_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id,
       c.customers_firstname,
       c.customers_lastname,
       c.customers_email_address,
       c.customers_newsletter,
       c.customers_mobile,
       c.account_credit,
       c.account_manager,
       ci.customers_info_source_id,
       ci.customers_info_date_account_created,
       dab.entry_company,
       dab.entry_country_id,
       dab.entry_city,
       dab.entry_state,
       MAX(o.date_purchased) AS last_purchase_date
FROM customers c
         LEFT JOIN customers_info ci ON ci.customers_info_id = c.customers_id
         LEFT JOIN address_book dab
                   ON dab.customers_id = c.customers_id AND dab.address_book_id = customers_default_address_id AND
                      dab.entry_city != 'Enter Your City'
         LEFT JOIN orders o ON o.customers_id = c.customers_id AND o.orders_status = 3
WHERE c.customers_id IN (
    SELECT cp.customer_id
    FROM customer_contact_preferences cp
    WHERE cp.customer_id = c.customers_id
      AND cp.activity_type = 'EMAIL'
      AND cp.has_opted_in = 1
)
  AND c.customers_email_address LIKE 'jonathan%'
GROUP BY c.customers_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customers_id,
       c.customers_firstname,
       c.customers_lastname,
       c.customers_email_address,
       c.customers_newsletter,
       c.customers_mobile,
       c.account_credit,
       c.account_manager,
       ci.customers_info_source_id,
       ci.customers_info_date_account_created,
       dab.entry_company,
       dab.entry_country_id,
       dab.entry_city,
       dab.entry_state,
       MAX(o.date_purchased) AS last_purchase_date
FROM customers c
         LEFT JOIN customers_info ci ON ci.customers_info_id = c.customers_id
         LEFT JOIN address_book dab
                   ON dab.customers_id = c.customers_id AND dab.address_book_id = customers_default_address_id AND
                      dab.entry_city != 'Enter Your City'
         LEFT JOIN orders o ON o.customers_id = c.customers_id AND o.orders_status = 3
WHERE c.customers_id IN (
    SELECT cp.customer_id
    FROM customer_contact_preferences cp
    WHERE cp.customer_id = c.customers_id
      AND cp.activity_type = 'EMAIL'
      AND cp.has_opted_in = 1
)
  AND c.customers_email_address LIKE 'j%'
GROUP BY c.customers_id;
;-- -. . -..- - / . -. - .-. -.--
explain
SELECT c.customers_id,
       c.customers_firstname,
       c.customers_lastname,
       c.customers_email_address,
       c.customers_newsletter,
       c.customers_mobile,
       c.account_credit,
       c.account_manager,
       ci.customers_info_source_id,
       ci.customers_info_date_account_created,
       dab.entry_company,
       dab.entry_country_id,
       dab.entry_city,
       dab.entry_state,
       MAX(o.date_purchased) AS last_purchase_date
FROM customers c
         LEFT JOIN customers_info ci ON ci.customers_info_id = c.customers_id
         LEFT JOIN address_book dab
                   ON dab.customers_id = c.customers_id AND dab.address_book_id = customers_default_address_id AND
                      dab.entry_city != 'Enter Your City'
         LEFT JOIN orders o ON o.customers_id = c.customers_id AND o.orders_status = 3
WHERE c.customers_id IN (
    SELECT cp.customer_id
    FROM customer_contact_preferences cp
    WHERE cp.customer_id = c.customers_id
      AND cp.activity_type = 'EMAIL'
      AND cp.has_opted_in = 1
)
  AND c.customers_email_address LIKE 'j%'
GROUP BY c.customers_id;
;-- -. . -..- - / . -. - .-. -.--
explain
SELECT `occa`.`performed_by`,
       `occa`.`custom_id`,
       MAX(`occa`.`date`),
       (
           SELECT SUM(`op`.`products_quantity`)
           FROM `orders_customisations` AS `sub_oc`
                    JOIN `orders_products_customisations` AS `opc`
                         ON `sub_oc`.`customisation_id` = `opc`.`customisation_id` AND
                            `sub_oc`.`order_id` = `opc`.`orders_id`
                    JOIN `orders_products` AS `op` ON `opc`.`orders_products_id` = `op`.`orders_products_id`
           WHERE `sub_oc`.`custom_id` = `occa`.`custom_id`
       ) AS `completed_apps`,
       `occa`.`orders_id`
FROM `orders_customisations_checkbox_audit` AS `occa`
         JOIN `orders_customisations` AS `oc` ON `occa`.`custom_id` = `oc`.`custom_id`
WHERE `occa`.`input_type` = "checkbox"
  AND `occa`.`date` BETWEEN "2021-06-23 00:00:00" AND "2021-06-24 00:00:00"
  AND `occa`.`input_id` = CASE
                              WHEN `oc`.`custom_type` IN
                                   ("print_flock", "print_laser", "print_sublim", "print_versacamm", "print_vinyl")
                                  THEN "custom_2"
                              ELSE NULL END
  AND CASE
          WHEN `oc`.`custom_type` IN ("print_flock", "print_laser", "print_sublim", "print_versacamm", "print_vinyl")
              THEN `oc`.`custom_2`
          ELSE NULL END <> "0000-00-00 00:00:00"
  AND `occa`.`performed_by` NOT IN
      ("Adam Brant", "Artur Olczak", "Chris Hughes", "Darren Longworth", "Ewelina Ladouceur", "Justyna Olkuszewska",
       "Karolina Olejnicka", "Kathryn  Gledhill", "Miriam Nemetova", "Paul Rigby", "Renata Posvicova",
       "Sally Mulderig ", "Sam Jones")
GROUP BY `occa`.`custom_id`;
;-- -. . -..- - / . -. - .-. -.--
SELECT o.billing_company, o.orders_id, gpd.post_town, gpd.long_cord, gpd.lat_cord, SUM(op.products_quantity) AS prod_quan,
       ci.customers_info_source_id, UNIX_TIMESTAMP(o.last_modified) as unix_time
     FROM orders o, google_postcode_data gpd, orders_products op, customers_info ci
     WHERE o.orders_status = 3 AND o.delivery_country = gpd.country
     AND ( (SUBSTRING_INDEX(UPPER(o.delivery_postcode),' ', 1) = gpd.postcode) OR (o.delivery_postcode = gpd.postcode) )
     AND o.last_modified > '2021-06-16 00:00:00'
     AND o.orders_id = op.orders_id AND o.customers_id = ci.customers_info_id
     GROUP BY o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
show create table orders;
;-- -. . -..- - / . -. - .-. -.--
explain
SELECT o.billing_company,
       o.orders_id,
       gpd.post_town,
       gpd.long_cord,
       gpd.lat_cord,
       SUM(op.products_quantity)       AS prod_quan,
       ci.customers_info_source_id,
       UNIX_TIMESTAMP(o.last_modified) as unix_time
FROM orders o,
     google_postcode_data gpd,
     orders_products op,
     customers_info ci
WHERE o.orders_status = 3
  AND o.delivery_country = gpd.country
  AND ((SUBSTRING_INDEX(UPPER(o.delivery_postcode), ' ', 1) = gpd.postcode) OR (o.delivery_postcode = gpd.postcode))
  AND o.last_modified > '2021-06-16 00:00:00'
  AND o.orders_id = op.orders_id
  AND o.customers_id = ci.customers_info_id
GROUP BY o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT o.billing_company,
       o.orders_id,
       gpd.post_town,
       gpd.long_cord,
       gpd.lat_cord,
       SUM(op.products_quantity)       AS prod_quan,
       ci.customers_info_source_id,
       UNIX_TIMESTAMP(o.last_modified) as unix_time
FROM orders o,
     google_postcode_data gpd,
     orders_products op,
     customers_info ci
WHERE o.orders_status = 3
  AND o.delivery_country = gpd.country
  AND ((SUBSTRING_INDEX(UPPER(o.delivery_postcode), ' ', 1) = gpd.postcode) OR (o.delivery_postcode = gpd.postcode))
  AND o.last_modified > '2021-06-16 00:00:00'
  AND o.orders_id = op.orders_id
  AND o.customers_id = ci.customers_info_id
GROUP BY o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT o.billing_company,
       o.orders_id,
       gpd.post_town,
       gpd.long_cord,
       gpd.lat_cord,
       SUM(op.products_quantity)       AS prod_quan,
       ci.customers_info_source_id,
       UNIX_TIMESTAMP(o.last_modified) as unix_time
FROM orders o,
     google_postcode_data gpd,
     orders_products op,
     customers_info ci
WHERE o.orders_status = 3
  AND o.delivery_country = gpd.country
#   AND ((SUBSTRING_INDEX(UPPER(o.delivery_postcode), ' ', 1) = gpd.postcode) OR (o.delivery_postcode = gpd.postcode))
  AND o.last_modified > '2021-06-16 00:00:00'
  AND o.orders_id = op.orders_id
  AND o.customers_id = ci.customers_info_id
GROUP BY o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products_customisations where customisation_id = 4500614;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_customisations where customisation_id = 4500614;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_orders so
join shopify_users su on so.shopify_user = su.shopify_user
where so.order_status = 'failed';
;-- -. . -..- - / . -. - .-. -.--
select su.shopify_user, su.shop,
       so.shopify_order_id, so.order_number,
       so.cost_price, so.total_price,
       so.currency, so.financial_status,
       so.order_status, so.order_paid, so.email
from shopify_orders so
join shopify_users su on so.shopify_user = su.shopify_user
where so.order_status = 'failed';
;-- -. . -..- - / . -. - .-. -.--
select publically from custom_positions;
;-- -. . -..- - / . -. - .-. -.--
select su.shopify_user, su.shop,
       so.shopify_order_id, so.order_number,
       so.cost_price, so.total_price,
       so.currency, so.financial_status,
       so.order_status, so.order_paid, so.email
from shopify_orders so
join shopify_users su on so.shopify_user = su.shopify_user
where so.order_status = 'failed'
order by su.shopify_user, so.shopify_order_id;
;-- -. . -..- - / . -. - .-. -.--
desc custom_types;
;-- -. . -..- - / . -. - .-. -.--
desc customisation_options;
;-- -. . -..- - / . -. - .-. -.--
select * customisation_options;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_options;
;-- -. . -..- - / . -. - .-. -.--
SELECT o.orders_id, count(cn.custom_names_id) AS artwork_count,cn.custom_name,UNIX_TIMESTAMP(o.date_purchased) AS date_purchased_stamp,cn.artwork_done,UNIX_TIMESTAMP(cn.artwork_done) AS artwork_done_stamp
                                          FROM orders AS o, custom_names AS cn
                                          WHERE o.orders_id = cn.custom_order_id
                                          AND cn.custom_name != ''
                                          AND (o.orders_status = '2' OR o.orders_status = '12')
                                          AND cn.artwork_done = '0000-00-00 00:00:00'
                                          GROUP BY o.orders_id, cn.custom_name;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files where customisation_id = 4298803;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_customisations where customisation_id = 4298803;
;-- -. . -..- - / . -. - .-. -.--
select *, is_duplicate from customisations where customisation_id = 4298803;
;-- -. . -..- - / . -. - .-. -.--
select *, duplicate_of from customisations where customisation_id = 4298803;
;-- -. . -..- - / . -. - .-. -.--
select * from customisations where customisation_id = 4298803;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
        FROM clothes2_osC.orders AS o_sub
                 JOIN clothes2_osC.orders_customisations AS oc_sub ON oc_sub.order_id = o_sub.orders_id
        WHERE oc_sub.customisation_id = 4298803
          AND o_sub.orders_status = 3;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
        FROM clothes2_osC.orders AS o_sub
                 JOIN clothes2_osC.orders_customisations AS oc_sub ON oc_sub.order_id = o_sub.orders_id
        WHERE oc_sub.customisation_id = 4298803
#           AND o_sub.orders_status = 3
          AND o_sub.orders_id <> 5369951;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
        FROM clothes2_osC.orders AS o_sub
                 JOIN clothes2_osC.orders_customisations AS oc_sub ON oc_sub.order_id = o_sub.orders_id
        WHERE oc_sub.customisation_id = 4298803
          AND o_sub.orders_status = 3
          AND o_sub.orders_id <> 5369951;
;-- -. . -..- - / . -. - .-. -.--
SELECT o_sub.orders_id, o_sub.orders_status
        FROM clothes2_osC.orders AS o_sub
                 JOIN clothes2_osC.orders_customisations AS oc_sub ON oc_sub.order_id = o_sub.orders_id
        WHERE oc_sub.customisation_id = 4298803
#           AND o_sub.orders_status = 3
          AND o_sub.orders_id <> 5369951;
;-- -. . -..- - / . -. - .-. -.--
SELECT o_sub.orders_id, o_sub.orders_status, os.orders_status_name
        FROM clothes2_osC.orders AS o_sub
        JOIN clothes2_osC.orders_customisations AS oc_sub ON oc_sub.order_id = o_sub.orders_id
        JOIN clothes2_osC.orders_status os on os.orders_status_id = o_sub.orders_status
        WHERE oc_sub.customisation_id = 4298803
          AND o_sub.orders_status = 3
          AND o_sub.orders_id <> 5369951;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_orders where order_status = 'failed';
;-- -. . -..- - / . -. - .-. -.--
SELECT o_sub.orders_id, o_sub.orders_status, os.orders_status_name
        FROM clothes2_osC.orders AS o_sub
        JOIN clothes2_osC.orders_customisations AS oc_sub ON oc_sub.order_id = o_sub.orders_id
        JOIN clothes2_osC.orders_status os on os.orders_status_id = o_sub.orders_status
        WHERE oc_sub.customisation_id = 4298803
#           AND o_sub.orders_status = 3
          AND o_sub.orders_id <> 5369951;
;-- -. . -..- - / . -. - .-. -.--
SELECT oc.custom_id,
       oc.customisation_id,
       oc.custom_type,
       oc.assigned_artworker,
       oc.preview_match,
       c.customisation_name,
       c.customer_id,
       c.colours,
       c.duplicate_of,
       c.redraw_service,
       c.customisation_purchased,
       c.customisation_type,
       oc.custom_1,
       oc.custom_2,
       oc.custom_3,
       oc.custom_4,
       oc.custom_5,
       oc.custom_6,
       oc.custom_7,
       oc.custom_8,
       oc.custom_9,
       oc.custom_10,
       oc.custom_11,
       oc.custom_12,
       oc.custom_13,
       oc.size_correct,
       oc.colour_checked,
       oc.position_correct,
       oc.artwork_ok,
       oc.garment_ok,
       cq.proceed_with_quality,
       (SELECT COUNT(*)
        FROM clothes2_osC.orders AS o_sub
                 JOIN clothes2_osC.orders_customisations AS oc_sub ON oc_sub.order_id = o_sub.orders_id
        WHERE oc_sub.customisation_id = oc.customisation_id
          AND o_sub.orders_status = 3
          AND o_sub.orders_id <> oc.order_id) AS repeat_customisation
FROM orders_customisations AS oc
         LEFT JOIN customisations AS c ON oc.customisation_id = c.customisation_id
         LEFT JOIN customisation_quality AS cq ON oc.customisation_id = cq.customisation_id
WHERE oc.order_id = 5369951
ORDER BY FIELD(oc.custom_id, 1511888);
;-- -. . -..- - / . -. - .-. -.--
select * from customisations where customisation_id = 4519427;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files where customisation_id = 4519427;
;-- -. . -..- - / . -. - .-. -.--
select * from api_customisation_files where customisation_id = 4519427;
;-- -. . -..- - / . -. - .-. -.--
select distinct redraw_service from customisations;
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners where partner_name like "%Blended Trails%";
;-- -. . -..- - / . -. - .-. -.--
select shopify_user from api_partners where partner_name like "%Blended Trails%";
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_orders where shopify_user = 535;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_orders where shopify_user = 535 order by order_number desc;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_orders
where shopify_user = 535
  and order_number in ('#1037','#1036')
order by order_number desc;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_issues where shopify_order_id in (41778,41777);
;-- -. . -..- - / . -. - .-. -.--
SELECT CONCAT('="', ps.poloMap, '"') AS SKU,
       cpc.custom_positions_id as PositionId,
       cp.short_name as PositionName
FROM products p
JOIN products_stock ps ON ps.products_id = p.products_id
JOIN products_options_values ovc ON ovc.products_options_values_id = SUBSTR(ps.products_stock_attributes,
    LOCATE('-', ps.products_stock_attributes) + 1,
    (LOCATE(',', ps.products_stock_attributes) -
    (LOCATE('-', ps.products_stock_attributes) + 1)))
JOIN products_customisation_options pco ON (
    p.products_id = pco.products_id
    AND pco.colour_id = ovc.products_options_values_id
)
JOIN custom_positions_products cpc ON p.products_id = cpc.products_id
JOIN custom_positions cp ON cpc.custom_positions_id = cp.custom_positions_id
WHERE p.products_status = 1
  AND p.products_id NOT IN (2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526, 3198)
  AND ps.poloMap > 0
GROUP BY ps.products_id, ps.poloMap, cpc.custom_positions_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT `input`
FROM api_partners_submission_log
WHERE orders_id > 0
AND request_type = 'post'
ORDER BY id DESC
LIMIT 500;
;-- -. . -..- - / . -. - .-. -.--
show create table `clothes2_osC`.`shopify_issues`;
;-- -. . -..- - / . -. - .-. -.--
show create table clothes2_osC.orders_customisations_checkbox_audit;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `orders_customisations_checkbox_audit` (
  `audit_id` int(100) NOT NULL AUTO_INCREMENT,
  `custom_id` int(50) NOT NULL,
  `orders_id` int(20) NOT NULL,
  `customisation_id` int(50) DEFAULT NULL,
  `input_type` varchar(100) NOT NULL,
  `input_id` varchar(50) NOT NULL,
  `input_value` varchar(200) NOT NULL,
  `performed_by` varchar(200) NOT NULL,
  `file` text NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`audit_id`),
  KEY `custom_id` (`custom_id`),
  KEY `orders_id` (`orders_id`),
  KEY `customisation_id` (`customisation_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11663407 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
;-- -. . -..- - / . -. - .-. -.--
explain SELECT c.customers_id,
       c.customers_firstname,
       c.customers_lastname,
       c.customers_email_address,
       c.customers_newsletter,
       c.customers_mobile,
       c.account_credit,
       c.account_manager,
       ci.customers_info_source_id,
       ci.customers_info_date_account_created,
       dab.entry_company,
       dab.entry_country_id,
       dab.entry_city,
       dab.entry_state,
       MAX(o.date_purchased) AS last_purchase_date
FROM customers c
         LEFT JOIN customers_info ci ON ci.customers_info_id = c.customers_id
         LEFT JOIN address_book dab
                   ON dab.customers_id = c.customers_id AND dab.address_book_id = customers_default_address_id AND
                      dab.entry_city != 'Enter Your City'
         LEFT JOIN orders o ON o.customers_id = c.customers_id AND o.orders_status = 3
WHERE c.customers_id IN (
    SELECT cp.customer_id
    FROM customer_contact_preferences cp
    WHERE cp.customer_id = c.customers_id
      AND cp.activity_type = 'EMAIL'
      AND cp.has_opted_in = 1
)
  AND c.customers_email_address LIKE 'j%'
GROUP BY c.customers_id;
;-- -. . -..- - / . -. - .-. -.--
explain SELECT c.customers_id,
       c.customers_firstname,
       c.customers_lastname,
       c.customers_email_address,
       c.customers_newsletter,
       c.customers_mobile,
       c.account_credit,
       c.account_manager,
       ci.customers_info_source_id,
       ci.customers_info_date_account_created,
       dab.entry_company,
       dab.entry_country_id,
       dab.entry_city,
       dab.entry_state,
       MAX(o.date_purchased) AS last_purchase_date
FROM customers c
         LEFT JOIN customers_info ci ON ci.customers_info_id = c.customers_id
         LEFT JOIN address_book dab
                   ON dab.customers_id = c.customers_id AND dab.address_book_id = customers_default_address_id AND
                      dab.entry_city != 'Enter Your City'
         LEFT JOIN orders o ON o.customers_id = c.customers_id AND o.orders_status = 3
WHERE c.customers_id IN (
    SELECT cp.customer_id
    FROM customer_contact_preferences cp
    WHERE cp.customer_id = c.customers_id
      AND cp.activity_type = 'EMAIL'
      AND cp.has_opted_in = 1
)
  AND c.customers_email_address in ('jonathan.marshall@c2o.com')
GROUP BY c.customers_id;
;-- -. . -..- - / . -. - .-. -.--
explain SELECT c.customers_id,
       c.customers_firstname,
       c.customers_lastname,
       c.customers_email_address,
       c.customers_newsletter,
       c.customers_mobile,
       c.account_credit,
       c.account_manager,
       ci.customers_info_source_id,
       ci.customers_info_date_account_created,
       dab.entry_company,
       dab.entry_country_id,
       dab.entry_city,
       dab.entry_state,
       MAX(o.date_purchased) AS last_purchase_date
FROM customers c
         LEFT JOIN customers_info ci ON ci.customers_info_id = c.customers_id
         LEFT JOIN address_book dab
                   ON dab.customers_id = c.customers_id AND dab.address_book_id = customers_default_address_id AND
                      dab.entry_city != 'Enter Your City'
         LEFT JOIN orders o ON o.customers_id = c.customers_id AND o.orders_status = 3
WHERE c.customers_id IN (
    SELECT cp.customer_id
    FROM customer_contact_preferences cp
    WHERE cp.customer_id = c.customers_id
      AND cp.activity_type = 'EMAIL'
      AND cp.has_opted_in = 1
)
  AND c.customers_email_address in ('jonathan.marshall@c2o.com', 'michael.hopwood@c2o.com')
GROUP BY c.customers_id;
;-- -. . -..- - / . -. - .-. -.--
select customers_email_address from customers where customers_email_address LIKE 'j%';
;-- -. . -..- - / . -. - .-. -.--
explain select customers_email_address from customers where customers_email_address LIKE 'j%';
;-- -. . -..- - / . -. - .-. -.--
explain SELECT c.customers_id,
       c.customers_firstname,
       c.customers_lastname,
       c.customers_email_address,
       c.customers_newsletter,
       c.customers_mobile,
       c.account_credit,
       c.account_manager,
       ci.customers_info_source_id,
       ci.customers_info_date_account_created,
       dab.entry_company,
       dab.entry_country_id,
       dab.entry_city,
       dab.entry_state,
       MAX(o.date_purchased) AS last_purchase_date
FROM customers c
         LEFT JOIN customers_info ci ON ci.customers_info_id = c.customers_id
         LEFT JOIN address_book dab
                   ON dab.customers_id = c.customers_id AND dab.address_book_id = customers_default_address_id AND
                      dab.entry_city != 'Enter Your City'
         LEFT JOIN orders o ON o.customers_id = c.customers_id AND o.orders_status = 3
WHERE c.customers_id IN (
    SELECT cp.customer_id
    FROM customer_contact_preferences cp
    WHERE cp.customer_id = c.customers_id
      AND cp.activity_type = 'EMAIL'
      AND cp.has_opted_in = 1
)
  AND c.customers_email_address in (
      select customers_email_address from customers where customers_email_address LIKE 'j%'
    )
GROUP BY c.customers_id;
;-- -. . -..- - / . -. - .-. -.--
explain SELECT c.customers_firstname,
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
explain SELECT c.customers_firstname,
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
     FROM orders AS o
     JOIN customers AS c ON c.customers_id = o.customers_id
     JOIN orders_total AS ot ON o.orders_id = ot.orders_id
     JOIN customers_info AS ci ON c.customers_id = ci.customers_info_id
     JOIN address_book AS ab ON c.customers_default_address_id = ab.address_book_id
     WHERE o.orders_status IN ('11','12','2','3') AND ot.class = 'ot_subtotal'
     GROUP BY c.customers_id
     ORDER BY ordersum DESC;
;-- -. . -..- - / . -. - .-. -.--
explain
SELECT o.orders_id, osh.date_added
FROM orders as o,
     orders_status_history as osh
WHERE o.orders_status = '3'
  AND osh.orders_status_id = o.orders_status
  AND o.orders_id = osh.orders_id
  AND osh.date_added BETWEEN now() AND now();
;-- -. . -..- - / . -. - .-. -.--
explain
SELECT o.orders_id, o.last_modified as dateDispatched, MIN(pshPartial.date_added) as datePartDispatched
                                                    FROM orders o
                                                    JOIN orders_status_history osh ON (
                                                        o.orders_id = osh.orders_id
                                                        AND o.orders_status = osh.orders_status_id
                                                    )
                                                    JOIN orders_status_history pshPartial ON (
                                                        o.orders_id = pshPartial.orders_id
                                                        AND pshPartial.orders_status_id = 12
                                                    )
                                                    WHERE o.orders_status = 3
                                                      AND o.last_modified BETWEEN '" . tep_db_input(date("Y-m-d H:i:s", $startDate)) . "' AND '" . tep_db_input(date("Y-m-d H:i:s", $endDate)) . "'
                                                    GROUP BY o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
explain
SELECT o.orders_id, o.last_modified as dateDispatched, MIN(pshPartial.date_added) as datePartDispatched
                                                    FROM orders o
                                                    JOIN orders_status_history osh ON (
                                                        o.orders_id = osh.orders_id
                                                        AND o.orders_status = osh.orders_status_id
                                                    )
                                                    JOIN orders_status_history pshPartial ON (
                                                        o.orders_id = pshPartial.orders_id
                                                        AND pshPartial.orders_status_id = 12
                                                    )
                                                    WHERE o.orders_status = 3
                                                      AND o.last_modified BETWEEN now() AND now()
                                                    GROUP BY o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT o.orders_id, o.date_purchased, o.dispatch_target, o.dispatch_target2, o.orders_status, o.shipping_type, o.shipped_by, o.tracking_no, o.delivery_postcode, o.api_partner_order_id
                    FROM orders o;
;-- -. . -..- - / . -. - .-. -.--
SELECT oc.*,
       IF((o.staff_name != '' OR o.pre_order_id > 0), 'ACCMAN',
          IF(o.payment_method = 'API', IF(o.ms_store_id > 0, 'MERCH', 'API'),
             IF(o.payment_method = 'Replacement', 'REPLACE', 'ECOM')))              as channel,
       (ott.value + ots.value)                                                      AS net,
       (SELECT ci.customers_info_source_id
        FROM orders o,
             customers_info ci
        WHERE o.orders_id = oc.orders_id
          AND ci.customers_info_id = o.customers_id)                                AS customer_type,
       (SELECT o2.pc_order_type FROM orders o2 WHERE o2.orders_id = oc.orders_id)   AS order_type,
       (SELECT orders.staff_name FROM orders WHERE orders.orders_id = oc.orders_id) AS account_manager
FROM orders_cancellations oc
    JOIN orders o on oc.orders_id = o.orders_id
         LEFT JOIN orders_total ott ON oc.orders_id = ott.orders_id AND ott.class = 'ot_subtotal'
         LEFT JOIN orders_total ots ON oc.orders_id = ots.orders_id AND ots.class = 'ot_shipping'
WHERE oc.date BETWEEN '2021-07-27 00:00:00' AND '2021-07-28 00:00:00'
  AND oc.type = '6';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM customisations WHERE customisation_type IS NOT NULL ORDER BY customisation_type, customisation_name limit 500;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM customisations WHERE customisation_type IS NOT NULL ORDER BY customisation_type, customisation_name limit 2000 offset 500;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM customisations WHERE customisation_type IS NOT NULL ORDER BY customisation_type, customisation_name limit 500 offset 500;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM customisations WHERE customisation_type IS NOT NULL ORDER BY customisation_type, customisation_name limit 500 offset 1000;
;-- -. . -..- - / . -. - .-. -.--
select * from customers where customers_email_address = 'tom.coad@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
select * from tep_mail_sent where customers_email_address like "michelle%";
;-- -. . -..- - / . -. - .-. -.--
select * from tep_mail_sent where customers_email_address like "michelle.harris@clothes2order.com%";
;-- -. . -..- - / . -. - .-. -.--
select * from qtagcom_osC.tep_mail_sent where customers_email_address like "michelle.harris@clothes2order.com";
;-- -. . -..- - / . -. - .-. -.--
select * from qtagcom_osC.tep_mail_sent where customers_email_address like "finance.team@c2o.com";
;-- -. . -..- - / . -. - .-. -.--
select * from qtagcom_osC.polo_configuration where configuration_key = 'SEND_EMAILS';
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.integrity_check;
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.integrity_check_frequency;
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.integrity_check_notification_action;
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.integrity_check_notification;
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.integrity_check_status;
;-- -. . -..- - / . -. - .-. -.--
select * from clothes2_osC.customisations;
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.integrity_check_result;
;-- -. . -..- - / . -. - .-. -.--
show create table customisations;
;-- -. . -..- - / . -. - .-. -.--
select * from configuration where configuration_key in (
    'COMPANY_PHONE_START',
    'COMPANY_PHONE_END',
    'COMPANY_PHONE_START_SHORT',
    'COMPANY_PHONE_END_SHORT'
);
;-- -. . -..- - / . -. - .-. -.--
explain SELECT o.orders_id, o.date_first_processing, o.due_by_date, o.dispatch_target, o.shipping_type, st.dispatch_name,os.orders_status_name, oc.custom_id, oc.custom_type, co.custom_name, co.customisation_department, oc.customisation_id, oc.assigned_artworker, art_file_ready.custom_box AS art_file_ready, art_file_sent_digi.custom_box AS file_sent_digi, MIN(cca.date) AS date_assigned,
(	SELECT COUNT(*)
    FROM clothes2_osC.orders_issue_escalation AS oie
    WHERE oie.orders_id = o.orders_id
        AND oie.custom_id = oc.custom_id
        AND oie.end_date = '0000-00-00 00:00:00'
) AS open_esc,
(	SELECT COUNT(*)
    FROM clothes2_osC.orders_issue_escalation AS oie
    WHERE oie.orders_id = o.orders_id
        AND oie.end_date = '0000-00-00 00:00:00'
) AS open_esc_order,
(	SELECT GROUP_CONCAT(DISTINCT oier.text)
    FROM clothes2_osC.orders_issue_escalation AS oie
    JOIN clothes2_osC.orders_issue_escalation_reasons AS oier ON oie.reason_id = oier.id
    WHERE oie.orders_id = o.orders_id
        AND oie.custom_id = oc.custom_id
) AS esc_types,
(	SELECT COUNT(so.orders_id)
    FROM clothes2_osC.orders_customisations soc, clothes2_osC.orders so
    WHERE soc.customisation_id = oc.customisation_id
    AND so.orders_id = soc.order_id
    AND so.date_purchased < o.date_purchased
    AND so.orders_id != oc.order_id
    AND so.orders_status IN (2,3,12)
) AS repeat_cust,
( SELECT GROUP_CONCAT(DISTINCT oier.notification)
    FROM clothes2_osC.orders_issue_escalation AS oie
    JOIN clothes2_osC.orders_issue_escalation_reasons AS oier
    WHERE oie.orders_id = o.orders_id
        AND oie.custom_id = oc.custom_id
) AS esc_class
, oc.custom_1, oc.custom_2, oc.custom_3, oc.custom_4, oc.custom_5, oc.custom_6, oc.custom_7, oc.custom_8, oc.custom_9, oc.custom_10, oc.custom_11, oc.custom_12
FROM clothes2_osC.orders AS o
JOIN clothes2_osC.orders_customisations AS oc ON o.orders_id = oc.order_id
JOIN clothes2_osC.customisation_options AS co ON oc.custom_type = co.custom_type
JOIN clothes2_osC.shipping_types AS st ON o.shipping_type = st.shipping_type
JOIN clothes2_osC.orders_status AS os ON os.orders_status_id = o.orders_status
LEFT JOIN clothes2_osC.orders_customisations_checkbox_audit AS cca ON
    cca.input_type = 'artworker' AND cca.input_value = oc.assigned_artworker AND cca.custom_id = oc.custom_id
LEFT JOIN clothes2_osC.customisation_options_checkboxes AS art_file_ready ON
    co.id = art_file_ready.custom_options_id AND art_file_ready.custom_class = 'artwork_file_ready'
LEFT JOIN clothes2_osC.customisation_options_checkboxes AS art_file_sent_digi ON
    co.id = art_file_sent_digi.custom_options_id AND art_file_sent_digi.custom_class = 'artwork_file_sent_digitiser'
WHERE o.orders_status IN (2,12)
GROUP BY oc.custom_id;
;-- -. . -..- - / . -. - .-. -.--
desc custom_colours;
;-- -. . -..- - / . -. - .-. -.--
select oc.customisation_id,
       count(op.orders_products_id) as app_count,
       oc.custom_type,
       co.customisation_department
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE opc.orders_id in (
    5356618,
    5356616,
    5356615
)
group by op.products_id, opc.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products_customisations order by orders_products_customisations_id desc;
;-- -. . -..- - / . -. - .-. -.--
select oc.customisation_id,
       count(op.orders_products_id) as app_count,
       oc.custom_type,
       co.customisation_department
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE opc.orders_id in (
5391199,
5391198,
5391197,
5391197,
5391196,
5391196,
5391196,
5391195,
5391194,
5391194,
5391193,
5391193,
5391193,
5391192,
5391192,
5391192,
5391192,
5391192,
5391192,
5391192,
5391192,
5391191,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190
)
group by op.products_id, opc.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
select oc.customisation_id,
       count(op.orders_products_id) as app_count,
       oc.custom_type,
       co.customisation_department
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''

AND opc.orders_id in (
5391199,
5391198,
5391197,
5391197,
5391196,
5391196,
5391196,
5391195,
5391194,
5391194,
5391193,
5391193,
5391193,
5391192,
5391192,
5391192,
5391192,
5391192,
5391192,
5391192,
5391192,
5391191,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190,
5391190
)
group by op.products_id, opc.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
select oc.customisation_id,
       count(op.orders_products_id) as app_count,
       oc.custom_type,
       co.customisation_department
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND opc.orders_id in (
5391199
)
group by op.products_id, opc.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
select oc.customisation_id,
       count(op.orders_products_id) as app_count,
       oc.custom_type,
       co.customisation_department
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND opc.orders_id in (
5391199,
5391198,
5391197,
5391197
)
group by op.products_id, opc.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
select oc.customisation_id,
       count(op.orders_products_id) as app_count,
       oc.custom_type,
       co.customisation_department
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND opc.orders_id in (

5391197
)
group by op.products_id, opc.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
select oc.customisation_id,
       op.products_id,
       count(distinct op.orders_products_id) as app_count,
       oc.custom_type,
       co.customisation_department
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND opc.orders_id in (
5391197
)
group by op.products_id, opc.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
select oc.customisation_id,
       op.products_id,
       count(op.orders_products_id) as app_count,
       oc.custom_type,
       co.customisation_department
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND opc.orders_id in (
5391197
)
group by op.products_id, opc.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
select op.products_id,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department,
       count(op.orders_products_id) as app_count
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND opc.orders_id in (
5391197
)
group by op.orders_products_id, opc.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
select op.products_id,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department,
       count(op.orders_products_id) as app_count
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND opc.orders_id in (
5391197
)
group by op.orders_products_id, opc.customisation_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select op.products_id,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department,
       count(op.orders_products_id) as app_count
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND opc.orders_id in (
5391197
)
group by op.products_id, opc.customisation_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select op.products_id,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department,
       count(op.orders_products_id) as app_count
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND opc.orders_id in (
5391197
)
group by opc.customisation_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products where orders_id = 4582829;
;-- -. . -..- - / . -. - .-. -.--
select op.products_id,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department,
       count(op.orders_products_id) as app_count
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND opc.orders_id in (
5391197
)
AND op.products_id <> 938
group by opc.customisation_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select op.products_id,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department,
       count(op.orders_products_id) as app_count
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND opc.orders_id in (
5391197
)
AND op.products_id <> 938
AND op.products_id <> 2
group by opc.customisation_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select op.products_id,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department,
       count(op.orders_products_id) as app_count
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND opc.orders_id in (
5391197
)
AND op.products_id <> 938
AND op.products_id <> 2
group by op.orders_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select op.products_id,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department,
       count(op.orders_products_id) as app_count
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND opc.orders_id in (
5391197
)
AND op.products_id <> 938
AND op.products_id <> 2
group by co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select op.products_id,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department,
       count(op.orders_products_id) as app_count
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND opc.orders_id in (
5391197
)
AND op.products_id <> 938
AND op.products_id <> 2;
;-- -. . -..- - / . -. - .-. -.--
select op.products_id,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department,
       count(op.orders_products_id) as app_count
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND opc.orders_id in (
5391197
);
;-- -. . -..- - / . -. - .-. -.--
select op.products_id,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department
#        count(op.orders_products_id) as app_count
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND opc.orders_id in (
5391197
);
;-- -. . -..- - / . -. - .-. -.--
select opc.orders_products_customisations_id,
       op.products_id,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department
#        count(op.orders_products_id) as app_count
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND opc.orders_id in (
5391197
);
;-- -. . -..- - / . -. - .-. -.--
select opc.orders_products_customisations_id,
       op.orders_products_id,
       op.products_id,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department
#        count(op.orders_products_id) as app_count
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join orders_customisations oc on opc.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND opc.orders_id in (
5391197
);
;-- -. . -..- - / . -. - .-. -.--
select opc.orders_products_customisations_id,
       op.orders_products_id,
       op.products_id,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department
#        count(op.orders_products_id) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
5391197
);
;-- -. . -..- - / . -. - .-. -.--
select op.orders_products_id,
       op.products_id,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department
#        count(op.orders_products_id) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
5391197
);
;-- -. . -..- - / . -. - .-. -.--
select op.orders_products_id,
       op.products_id,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department,
       count(op.orders_products_id) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
5391197
);
;-- -. . -..- - / . -. - .-. -.--
select op.orders_products_id,
       op.products_id,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department,
       count(op.orders_products_id) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
     op.orders_id in (
5391197
);
;-- -. . -..- - / . -. - .-. -.--
select op.orders_products_id,
       op.products_id,
       op.products_quantity,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department,
       count(op.orders_products_id) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
5391197
);
;-- -. . -..- - / . -. - .-. -.--
select op.orders_products_id,
       op.products_id,
       op.products_quantity,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department,
       count(oc.customisation_id) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
5391197
);
;-- -. . -..- - / . -. - .-. -.--
select op.orders_products_id,
       op.products_id,
       op.products_quantity,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
5391197
);
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products_customisations
where orders_products_id in (
4594965
4594966,
4594967,
4594968
)
order by orders_products_customisations_id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products_customisations
where orders_products_id in (
4594965,
4594966,
4594967,
4594968
);
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products
where orders_products_id in (
4594965,
4594966,
4594967,
4594968
);
;-- -. . -..- - / . -. - .-. -.--
select op.orders_products_id,
       op.products_id,
       op.products_quantity,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
    5391197
)
AND op.products_id NOT IN (
    2,
    938
);
;-- -. . -..- - / . -. - .-. -.--
select op.orders_products_id,
       op.products_id,
       op.products_quantity,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
    4582829
)
AND op.products_id NOT IN (
    2,
    938
);
;-- -. . -..- - / . -. - .-. -.--
select op.orders_products_id,
       op.products_id,
       op.products_quantity,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department,
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
    4582829
)
AND op.products_id NOT IN (
    2,
    938
)
group by co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_products_id,
       op.products_id,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department,
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
    4582829
)
AND op.products_id NOT IN (
    2,
    938
)
group by co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_products_id,
       op.products_id,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department,
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
    4582829
)
AND op.products_id NOT IN (
    2,
    938
)
group by op.orders_products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(op.orders_products_id),
       op.products_id,
       oc.customisation_id,
       co.custom_type,
       co.customisation_department,
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
    4582829
)
AND op.products_id NOT IN (
    2,
    938
)
group by co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(op.orders_products_id),
       group_concat(op.products_id),
       group_concat(oc.customisation_id),
       co.custom_type,
       co.customisation_department,
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
    4582829
)
AND op.products_id NOT IN (
    2,
    938
)
group by co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(op.orders_products_id),
       group_concat(op.products_id),
       group_concat(oc.customisation_id),
       group_concat(co.custom_type),
       group_concat(co.customisation_department),
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
    4582829
)
AND op.products_id NOT IN (
    2,
    938
)
group by co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_products_id),
       group_concat(distinct op.products_id),
       group_concat(distinct oc.customisation_id),
       group_concat(distinct co.custom_type),
       group_concat(distinct co.customisation_department),
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
    4582829
)
AND op.products_id NOT IN (
    2,
    938
)
group by co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_products_id),
       group_concat(distinct op.products_id),
       group_concat(distinct oc.customisation_id),
       group_concat(distinct co.custom_type),
       group_concat(distinct co.customisation_department),
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
    5356618,
    5356616,
    5356615
)
AND op.products_id NOT IN (
    2,
    938
)
group by co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_products_id),
       group_concat(distinct op.products_id),
       group_concat(distinct oc.customisation_id),
       group_concat(distinct co.custom_type),
       group_concat(distinct co.customisation_department),
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
    5356618,
    5356616,
    5356615
)
AND op.products_id NOT IN (
    2,
    938
)
group by op.orders_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_products_id) as opc_ids,
       group_concat(distinct op.products_id) as product_ids,
       group_concat(distinct oc.customisation_id) as customisation_ids,
       co.custom_type,
       co.customisation_department,
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
    5356618,
    5356616,
    5356615
)
AND op.products_id NOT IN (
    2,
    938
)
group by op.orders_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_products_id) as opc_ids,
       group_concat(distinct op.products_id) as product_ids,
       group_concat(distinct oc.customisation_id) as customisation_ids,
       co.custom_type,
       co.customisation_department,
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
    5356618,
    5356616,
    5356615
)
AND op.products_id NOT IN (
    2,
    938
)
group by op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_products_id) as opc_ids,
       group_concat(distinct op.products_id) as product_ids,
       group_concat(distinct oc.customisation_id) as customisation_ids,
       co.custom_type,
       co.customisation_department,
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
    5356618
)
AND op.products_id NOT IN (
    2,
    938
)
group by op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_products_id) as opc_ids,
       group_concat(distinct op.products_id) as product_ids,
       group_concat(distinct oc.customisation_id) as customisation_ids,
       co.custom_type,
       co.customisation_department,
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
    5356618,
    5356616,
    5356615
)
AND op.products_id NOT IN (
    2,
    938,
    1082
)
group by op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_products_id) as opc_ids,
       group_concat(distinct op.products_id) as product_ids,
       group_concat(distinct oc.customisation_id) as customisation_ids,
       co.custom_type,
       co.customisation_department,
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
    5356618,
    5356616,
    5356615
)
AND op.products_id NOT IN (
    2,399,421,450,427,418,937,938
                          
)
group by op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_products_id) as opc_ids,
       group_concat(distinct op.products_id) as product_ids,
       group_concat(distinct oc.customisation_id) as customisation_ids,
       co.custom_type,
       co.customisation_department,
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
    5356618,
    5356616,
    5356615
)
AND op.products_id NOT IN (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526

)
group by op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_products_id) as opc_ids,
       group_concat(distinct oc.customisation_id) as customisation_ids,
       op.products_id,
       co.custom_type,
       co.customisation_department,
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id in (
    5356618,
    5356616,
    5356615
)
AND op.products_id NOT IN (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526

)
group by op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_products_id) as opc_ids,
       group_concat(distinct oc.customisation_id) as customisation_ids,
       op.products_id,
       co.custom_type,
       co.customisation_department,
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id = 5356618
AND op.products_id = 630
# 700
# 1023
# 1082
AND op.products_id NOT IN (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_products_id) as opc_ids,
       group_concat(distinct oc.customisation_id) as customisation_ids,
       op.products_id,
       co.custom_type,
       co.customisation_department,
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id = 5356618
AND op.products_id = 700
# 700
# 1023
# 1082
AND op.products_id NOT IN (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_products_id) as opc_ids,
       group_concat(distinct oc.customisation_id) as customisation_ids,
       op.products_id,
       co.custom_type,
       co.customisation_department,
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id = 5356618
AND op.products_id = 1023
# 700
# 1023
# 1082
AND op.products_id NOT IN (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_products_id) as opc_ids,
       group_concat(distinct oc.customisation_id) as customisation_ids,
       op.products_id,
       co.custom_type,
       co.customisation_department,
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id = 5356618
AND op.products_id = 1082
# 700
# 1023
# 1082
AND op.products_id NOT IN (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_products_id) as opc_ids,
       group_concat(distinct oc.customisation_id) as customisation_ids,
       op.products_id,
       co.custom_type,
       co.customisation_department,
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id = 5356615
#5356616,
#5356618
AND op.products_id NOT IN (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526

)
group by op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_products_id) as opc_ids,
       group_concat(distinct oc.customisation_id) as customisation_ids,
       op.products_id,
       co.custom_type,
       co.customisation_department,
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id = 5356616
#5356616,
#5356618
AND op.products_id = 700
AND op.products_id NOT IN (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526

)
group by op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_products_id) as opc_ids,
       group_concat(distinct oc.customisation_id) as customisation_ids,
       op.products_id,
       co.custom_type,
       co.customisation_department,
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id = 5356615
#5356616,
#5356618
AND op.products_id = 700
AND op.products_id NOT IN (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526

)
group by op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select op.products_id,
       co.custom_type,
       co.customisation_department,
       sum(products_quantity) as app_count
    FROM orders_products op
    join orders_customisations oc on op.orders_id = oc.order_id
    join customisation_options co on co.custom_type = oc.custom_type
WHERE
    co.customisation_department <> ''
AND op.orders_id = 5356615
AND op.products_id = 700
AND op.products_id NOT IN (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select distinct customisation_department from customisation_options;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct cn.custom_order_id),
       op.products_id,
       count(op.orders_products_id) as app_count
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5356597,
    5356594,
    5356592,
    5356583
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct cn.custom_order_id),
       op.products_id,
       count(op.orders_products_id) as app_count
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5645760,
    6478517,
    6328332,
    4013195
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct cn.custom_order_id),
       op.products_id,
       count(op.orders_products_id) as app_count
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267,
    5391262,
    5391177,
    5391160
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_id),
       op.products_id,
       count(op.orders_products_id) as app_count
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267,
    5391262,
    5391177,
    5391160
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_id),
       op.products_id,
       count(op.orders_products_id) as app_count
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select * from custom_names where custom_order_id = 5391267;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_id),
       op.products_id,
       count(cn.custom_names_id) as app_count
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_id),
       op.products_id,
       op.products_quantity,
       count(op.products_id) as app_count
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_id),
       op.products_id,
       op.products_quantity
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select group_concat(distinct op.orders_id),
       op.products_id,
       op.products_quantity,
       cn.custom_name
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       op.products_quantity,
       cn.custom_name
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       op.products_quantity,
       cn.custom_name
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
);
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       op.products_quantity
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
);
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       sum(op.products_quantity)
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       group_concat(op.products_quantity)
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       op.products_quantity
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       sum(distinct op.products_quantity)
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       sum(distinct op.products_quantity) as app_count
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       sum(distinct op.products_quantity) as nn_app_count
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5390464
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       sum(distinct op.products_quantity) as nn_app_count
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       sum(distinct op.products_quantity) as nn_app_count
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    #5391267
    5390464
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select * from custom_names order by custom_order_id desc;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       sum(distinct op.products_quantity) as nn_app_count
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    #5391267 # 27 - charge on order says 16.
    #5390464 # 14 - matches charge on order.
    5390690
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       sum(op.products_quantity) as nn_app_count
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    #5391267 # 27 - charge on order says 16.
    #5390464 # 14 - matches charge on order.
    5390690
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       op.products_quantity as nn_app_count
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    #5391267 # 27 - charge on order says 16.
    #5390464 # 14 - matches charge on order.
    5390690
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       sum(op.products_quantity) as nn_app_count
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    #5391267 # 27 - charge on order says 16.
    #5390464 # 14 - matches charge on order.
    5390690
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       op.products_quantity as nn_app_count
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    #5391267 # 27 - charge on order says 16.
    #5390464 # 14 - matches charge on order.
    5390690
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       op.products_quantity as nn_app_count
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267 # 27 - charge on order says 16.
    #5390464 # 14 - matches charge on order.
#     5390690
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       op.products_quantity as nn_app_count
from custom_names cn
    inner join orders_products op on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267 # 27 - charge on order says 16.
    #5390464 # 14 - matches charge on order.
#     5390690
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       op.products_quantity as nn_app_count
from orders_products op
    inner join  custom_names cn on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267 # 27 - charge on order says 16.
    #5390464 # 14 - matches charge on order.
#     5390690
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       op.products_quantity as nn_app_count
from orders_products op
    right outer join custom_names cn on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267 # 27 - charge on order says 16.
    #5390464 # 14 - matches charge on order.
#     5390690
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       op.products_quantity as nn_app_count
from orders_products op
    inner join custom_names cn on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    5391267 # 27 - charge on order says 16.
    #5390464 # 14 - matches charge on order.
#     5390690
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       op.products_quantity as nn_app_count
from orders_products op
    join custom_names cn on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    #5391267 # 27 - charge on order says 16.
    5390464 # 14 - matches charge on order.
#     5390690
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       group_concat(op.products_quantity) as nn_app_count
from orders_products op
    join custom_names cn on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
WHERE cn.custom_order_id in (
    #5391267 # 27 - charge on order says 16.
    5390464 # 14 - matches charge on order.
#     5390690
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products where orders_id = 5390464;
;-- -. . -..- - / . -. - .-. -.--
select * from custom_names where custom_order_id = 5390464;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       group_concat(op.products_quantity) as nn_app_count
from orders_products op
    join custom_names cn on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                            and op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
WHERE cn.custom_order_id in (
    #5391267 # 27 - charge on order says 16.
    5390464 # 14 - matches charge on order.
#     5390690
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       count(op.products_quantity) as nn_app_count
from orders_products op
    join custom_names cn on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                            and op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
WHERE cn.custom_order_id in (
    #5391267 # 27 - charge on order says 16.
    5390464 # 14 - matches charge on order.
#     5390690
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       count(op.products_quantity) as nn_app_count
from orders_products op
    join custom_names cn on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                            and op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
WHERE cn.custom_order_id in (
    5391267 # 27 - charge on order says 16.
    #5390464 # 14 - matches charge on order.
#     5390690
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
                       op.products_id,
                       count(op.products_quantity) AS nn_app_count
                FROM custom_names cn
                    JOIN orders_products op ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                                            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
                WHERE cn.custom_order_id = 5390690
                AND op.products_id = 765 # 432,765
                GROUP BY op.products_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
                op.products_id,
                co.custom_type,
                co.customisation_department,
                sum(products_quantity) AS app_count
            FROM orders_products op
                JOIN orders_customisations oc ON op.orders_id = oc.order_id
                JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE
                co.customisation_department <> ''
            AND op.orders_id = 5390690
            #AND op.products_id = ". (int) $products_id ."
            #AND co.customisation_department = ". general::db_input($department)."
            GROUP BY op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT
                op.products_id,
                co.custom_type,
                co.customisation_department,
                sum(products_quantity) AS app_count
            FROM orders_products op
                JOIN orders_customisations oc ON op.orders_id = oc.order_id
                JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE
                co.customisation_department <> ''
            AND op.orders_id = 5390690
            AND op.products_id = 421
            #AND co.customisation_department = ". general::db_input($department)."
            GROUP BY op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT
                sum(products_quantity) AS app_count
            FROM orders_products op
                JOIN orders_customisations oc ON op.orders_id = oc.order_id
                JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE
                co.customisation_department <> ''
            AND op.orders_id = 5390690
            AND op.products_id = 421
            #AND co.customisation_department = ". general::db_input($department)."
            GROUP BY op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select op.orders_id,
       op.products_id,
       count(op.products_quantity) as nn_app_count
from orders_products op
    join custom_names cn on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                            and op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
WHERE cn.custom_order_id in (
    #5391267
    #5390464
     5390690
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select 
       count(op.products_quantity) as nn_app_count
from orders_products op
    join custom_names cn on cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                            and op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
WHERE cn.custom_order_id in (
    #5391267
    #5390464
     5390690
)
AND op.products_id not in (
    2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select * from poloshir_osC.products_stock;
;-- -. . -..- - / . -. - .-. -.--
select poloStockId, btc_id, pc_id, uneek_id, ral_id, fruit_id from poloshir_osC.vendors_stock;
;-- -. . -..- - / . -. - .-. -.--
select poloStockId, btc_id, pc_id, uneek_id, ral_id, fruit_id from poloshir_osC.vendors_stock
where concat(btc_id, pc_id, uneek_id, ral_id, fruit_id) <> '';
;-- -. . -..- - / . -. - .-. -.--
select CONCAT('="', poloStockId, '"') as SKU, btc_id, pc_id, uneek_id, ral_id, fruit_id from poloshir_osC.vendors_stock
where concat(btc_id, pc_id, uneek_id, ral_id, fruit_id) <> '';
;-- -. . -..- - / . -. - .-. -.--
select CONCAT('="', poloStockId, '"') as poloMap, btc_id, pc_id, uneek_id, ral_id, fruit_id from poloshir_osC.vendors_stock
where concat(btc_id, pc_id, uneek_id, ral_id, fruit_id) <> '';
;-- -. . -..- - / . -. - .-. -.--
select CONCAT('="', poloStockId, '"') as poloStockId, btc_id, pc_id, uneek_id, ral_id, fruit_id from poloshir_osC.vendors_stock
where concat(btc_id, pc_id, uneek_id, ral_id, fruit_id) <> '';
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
                       op.products_id,
                       sum(op.products_quantity) AS nn_app_count
                FROM custom_names cn
                    JOIN orders_products op ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                                            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
                WHERE cn.custom_order_id = 5390690
                AND op.products_id = 432 # 432,765
                GROUP BY op.products_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
                       op.products_id,
                       count(op.products_id) AS nn_app_count
                FROM custom_names cn
                    JOIN orders_products op ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                                            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
                WHERE cn.custom_order_id = 5390690
                AND op.products_id = 432 # 432,765
                GROUP BY op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select * from products_options;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
                       op.products_id,
                       count(op.products_quantity) AS nn_app_count
                FROM custom_names cn
                    JOIN orders_products op ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                                            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
                WHERE cn.custom_order_id = 5390690
                AND op.products_id = 432 # 432,765
                GROUP BY op.products_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
                       op.products_id,
                       count(op.products_quantity) AS nn_app_count
                FROM custom_names cn
                    JOIN orders_products op ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                                            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
                WHERE cn.custom_order_id = 5390690
                AND op.products_id = 432 # 432,765
                GROUP BY op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
                       op.products_id,
                       op.products_stock_attributes,
                       count(op.products_quantity) AS nn_app_count
                FROM custom_names cn
                    JOIN orders_products op ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                                            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
                WHERE cn.custom_order_id = 5390690
                AND op.products_id = 432 # 432,765
                GROUP BY op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
                       op.products_id,
                       op.products_stock_attributes,
                       count(op.products_quantity) AS nn_app_count
                FROM custom_names cn
                    JOIN orders_products op ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                                            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
                WHERE cn.custom_order_id = 5390690
                AND op.products_id = 432 # 432,765
                AND op.products_stock_attributes = '1-2,2-13' # '1-2,2-13','1-2,2-14'
                GROUP BY op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
                       op.products_id,
                       op.products_stock_attributes,
                       op.products_quantity AS nn_app_count
                FROM custom_names cn
                    JOIN orders_products op ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                                            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
                WHERE cn.custom_order_id = 5390690
                AND op.products_id = 432 # 432,765
                AND op.products_stock_attributes = '1-2,2-13' # '1-2,2-13','1-2,2-14'
                GROUP BY op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
                       op.products_id,
                       op.products_stock_attributes,
                       group_concat(op.products_quantity) AS nn_app_count
                FROM custom_names cn
                    JOIN orders_products op ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                                            #AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
                WHERE cn.custom_order_id = 5390690
                AND op.products_id = 432 # 432,765
                AND op.products_stock_attributes = '1-2,2-13' # '1-2,2-13','1-2,2-14'
                GROUP BY op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
                       op.products_id,
                       op.products_stock_attributes,
                       group_concat(op.products_quantity) AS nn_app_count
                FROM custom_names cn
                    JOIN orders_products op ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                                            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
                WHERE cn.custom_order_id = 5390690
                AND op.products_id = 432 # 432,765
                AND op.products_stock_attributes = '1-2,2-13' # '1-2,2-13','1-2,2-14'
                GROUP BY op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.dhl_invoices;
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.dhl_invoices order by id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.dhl_invoices
where invoice_number = 'MANR004545440'
order by id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.dhl_invoices
where invoice_number = 'MANR004545440'
and shipper_reference = 'C2O5332880'
order by id desc;
;-- -. . -..- - / . -. - .-. -.--
select count(*) from orders
where mobile_order = 1
and date_purchased > DATE_SUB(now(), INTERVAL 1 MONTH);
;-- -. . -..- - / . -. - .-. -.--
select count(*) from orders o
join custom_names cn on o.orders_id = cn.custom_order_id
where mobile_order = 1
and date_purchased > DATE_SUB(now(), INTERVAL 1 MONTH);
;-- -. . -..- - / . -. - .-. -.--
select count(*) from orders o
# join custom_names cn on o.orders_id = cn.custom_order_id
where mobile_order = 1
and date_purchased > DATE_SUB(now(), INTERVAL 1 MONTH);
;-- -. . -..- - / . -. - .-. -.--
select count(*) from orders o
# join custom_names cn on o.orders_id = cn.custom_order_id
where mobile_order = 1
and date_purchased > DATE_SUB(now(), INTERVAL 1 YEAR);
;-- -. . -..- - / . -. - .-. -.--
select count(*) from orders o
join custom_names cn on o.orders_id = cn.custom_order_id
where mobile_order = 1
and date_purchased > DATE_SUB(now(), INTERVAL 1 YEAR);
;-- -. . -..- - / . -. - .-. -.--
SELECT CONCAT('="', vs.poloStockId, '"') AS poloStockId,
       btc_id,
       pc_id,
       uneek_id,
       ral_id,
       fruit_id
FROM poloshir_osC.vendors_stock vs
WHERE CONCAT(btc_id, pc_id, uneek_id, ral_id, fruit_id) <> ''
and vs.poloStockId = '4349-2-10';
;-- -. . -..- - / . -. - .-. -.--
SELECT CONCAT('="', vs.poloStockId, '"') AS poloStockId,
       btc_id,
       pc_id,
       uneek_id,
       ral_id,
       fruit_id
FROM poloshir_osC.vendors_stock vs
WHERE CONCAT(btc_id, pc_id, uneek_id, ral_id, fruit_id) <> ''
and vs.poloStockId like '4349%';
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.*,
       o.orders_status                                    AS real_status,
       ap.partner_name,
       (SELECT SUM(op.products_quantity)
        FROM clothes2_osC.orders_products AS op
                 JOIN clothes2_osC.products_stock AS ps
                      ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
                 JOIN clothes2_osC.orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
                 JOIN clothes2_osC.orders_customisations oc
                      on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
                 JOIN clothes2_osC.customisation_options co ON co.custom_type = oc.custom_type
        WHERE op.orders_id = sd.orders_id
          AND opc.customisation_id <> 0
          AND ps.poloMap = sd.sku_id
          AND co.customisation_department = 'DTG')        AS dtg_app_count,
       (SELECT SUM(op.products_quantity)
        FROM clothes2_osC.orders_products AS op
                 JOIN clothes2_osC.products_stock AS ps
                      ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
                 JOIN clothes2_osC.orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
                 JOIN clothes2_osC.orders_customisations oc
                      on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
                 JOIN clothes2_osC.customisation_options co ON co.custom_type = oc.custom_type
        WHERE op.orders_id = sd.orders_id
          AND opc.customisation_id <> 0
          AND ps.poloMap = sd.sku_id
          AND co.customisation_department = 'Embroidery') AS emb_app_count,
       (SELECT SUM(op.products_quantity)
        FROM clothes2_osC.orders_products AS op
                 JOIN clothes2_osC.products_stock AS ps
                      ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
                 JOIN clothes2_osC.orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
                 JOIN clothes2_osC.orders_customisations oc
                      on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
                 JOIN clothes2_osC.customisation_options co ON co.custom_type = oc.custom_type
        WHERE op.orders_id = sd.orders_id
          AND opc.customisation_id <> 0
          AND ps.poloMap = sd.sku_id
          AND co.customisation_department = 'Vinyl')      AS trn_app_count,
       (SELECT COUNT(*)
        FROM clothes2_osC.orders_products AS op
                 JOIN clothes2_osC.custom_names AS cn
                      ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                 JOIN clothes2_osC.products_stock AS ps
                      ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
        WHERE op.orders_id = sd.orders_id
          AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
          AND ps.poloMap = sd.sku_id)                     AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         LEFT JOIN clothes2_osC.orders AS o ON sd.orders_id = o.orders_id
         LEFT JOIN clothes2_osC.api_partners AS ap ON ap.id = o.api_partner_id
WHERE ((sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00') OR
       (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00'))
  AND sd.site = 'C2O'
ORDER BY sd.orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.sales_data;
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.sales_data sd
WHERE ((sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00') OR
       (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00'))
  AND sd.site = 'C2O';
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.sales_data_id, sd.orders_id, sd.sku_id,
       (SELECT SUM(op.products_quantity)
        FROM clothes2_osC.orders_products AS op
                 JOIN clothes2_osC.products_stock AS ps
                      ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
                 JOIN clothes2_osC.orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
                 JOIN clothes2_osC.orders_customisations oc
                      on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
                 JOIN clothes2_osC.customisation_options co ON co.custom_type = oc.custom_type
        WHERE op.orders_id = sd.orders_id
          AND opc.customisation_id <> 0
          AND ps.poloMap = sd.sku_id
          AND co.customisation_department = 'DTG')        AS dtg_app_count
FROM quaysidg_news.sales_data sd
WHERE sd.sales_data_id in (
                           29399092,
                           29399093,
                           29399094,
                           29399095,
                           29399096,
                           29399097,
                           29399098,
                           29399099,
                           29399661,
                           29399662,
                           29399663,
                           29399664,
                           29399722,
                           29399723,
                           29399724,
                           29399725,
                           29399726,
                           29399727,
                           29399752,
                           29399753,
                           29399754,
                           29399755,
                           29399840,
                           29399841,
                           29399842,
                           29399843,
                           29399844,
                           29399845,
                           29399872,
                           29399873,
                           29399874,
                           29399875,
                           29399876,
                           29399877,
                           29399878,
                           29399879,
                           29399880,
                           29399881,
                           29399882,
                           29399971,
                           29399972,
                           29399973,
                           29399974,
                           29400112,
                           29400113,
                           29400114,
                           29400115,
                           29400116,
                           29400117,
                           29400323,
                           29400324,
                           29400325,
                           29400326,
                           29400327,
                           29400328,
                           29400547,
                           29400548,
                           29400549,
                           29400550,
                           29400885,
                           29400886,
                           29400887,
                           29400888,
                           29400889,
                           29400890,
                           29400891,
                           29400911,
                           29400912,
                           29400913,
                           29400914,
                           29400915,
                           29400916,
                           29400917,
                           29401443,
                           29401444,
                           29401445,
                           29401446,
                           29401447,
                           29401448,
                           29401449,
                           29401450,
                           29401767,
                           29401768,
                           29401769,
                           29401770,
                           29401888,
                           29401889,
                           29401890,
                           29401891,
                           29401892,
                           29401893,
                           29401894,
                           29401895,
                           29401896,
                           29402432,
                           29402433,
                           29402434,
                           29402435,
                           29402436,
                           29402437,
                           29402438,
                           29402439,
                           29402440,
                           29402441,
                           29402442,
                           29402443,
                           29402444,
                           29402445,
                           29402728,
                           29402729,
                           29402730,
                           29402731,
                           29402732,
                           29402733,
                           29402734,
                           29402735,
                           29404394,
                           29404395,
                           29404396,
                           29404397,
                           29404398,
                           29404557,
                           29404558,
                           29404559,
                           29404560,
                           29404650,
                           29404651,
                           29404652,
                           29404653,
                           29404654,
                           29404655,
                           29404860,
                           29404861,
                           29404862,
                           29404863,
                           29404864,
                           29404865,
                           29404866,
                           29404867,
                           29404868,
                           29404869,
                           29404870,
                           29404871,
                           29404872,
                           29404873,
                           29404874,
                           29404875,
                           29405199,
                           29405200,
                           29405201,
                           29405202,
                           29405203,
                           29405204,
                           29405205,
                           29405474,
                           29405475,
                           29405476,
                           29405477,
                           29405998,
                           29405999,
                           29406000,
                           29406001,
                           29406002,
                           29406003,
                           29406274,
                           29406275,
                           29406276,
                           29406277,
                           29406278,
                           29406279,
                           29406280,
                           29406424,
                           29406425,
                           29406610,
                           29406611,
                           29406612,
                           29406613,
                           29406614,
                           29406796,
                           29406797,
                           29406798,
                           29406799,
                           29406990,
                           29406991,
                           29406992,
                           29406993,
                           29406994,
                           29406995,
                           29406996,
                           29406997,
                           29407056,
                           29407057,
                           29407058,
                           29407059,
                           29407060,
                           29407061,
                           29407062,
                           29407063,
                           29407250,
                           29407251,
                           29407252,
                           29407253,
                           29407254,
                           29407255,
                           29407256,
                           29407307,
                           29407308,
                           29407309,
                           29407310,
                           29407311,
                           29407408,
                           29407409,
                           29407410,
                           29407411,
                           29407412,
                           29407413,
                           29407694,
                           29407695,
                           29407696,
                           29407697,
                           29407698,
                           29407699,
                           29407731,
                           29407732,
                           29407733,
                           29407734,
                           29407735,
                           29407736,
                           29407737,
                           29407738,
                           29407739,
                           29407740,
                           29407741,
                           29407742,
                           29407743,
                           29407744,
                           29407745,
                           29407746,
                           29407767,
                           29407768,
                           29407769,
                           29407770,
                           29407838,
                           29407839,
                           29407840,
                           29407841,
                           29407842,
                           29407843,
                           29407844,
                           29407845,
                           29407846,
                           29407847,
                           29407848,
                           29407849,
                           29407850,
                           29407851,
                           29407852,
                           29407853,
                           29407854,
                           29407855,
                           29407856,
                           29407857,
                           29408047,
                           29408048,
                           29408049,
                           29408050,
                           29408051,
                           29408052,
                           29408070,
                           29408071,
                           29408072,
                           29408073,
                           29408074,
                           29408075,
                           29408344,
                           29408345,
                           29408346,
                           29408347,
                           29408348,
                           29408349,
                           29408350,
                           29408351,
                           29408352,
                           29408353,
                           29408775,
                           29408776,
                           29408777,
                           29408778,
                           29408779,
                           29408780,
                           29408781,
                           29408782,
                           29408783,
                           29408784,
                           29408827,
                           29408828,
                           29408829,
                           29408830,
                           29408850,
                           29408851,
                           29408852,
                           29408853,
                           29408854,
                           29408855,
                           29409041,
                           29409042,
                           29409043,
                           29409044,
                           29409194,
                           29409195,
                           29409196,
                           29409197,
                           29409198,
                           29409199,
                           29409200,
                           29409539,
                           29409540,
                           29409541,
                           29409542,
                           29409543,
                           29409544,
                           29409720,
                           29409721,
                           29409722,
                           29409723,
                           29409724,
                           29409725,
                           29409726,
                           29409795,
                           29409796,
                           29409797,
                           29409798,
                           29409799,
                           29409800,
                           29409801,
                           29409802,
                           29409803,
                           29409872,
                           29409873,
                           29409874,
                           29409875,
                           29409876,
                           29409877,
                           29409878,
                           29409879,
                           29409880,
                           29409911,
                           29409912,
                           29409913,
                           29409914,
                           29409915,
                           29409916,
                           29409917,
                           29409918,
                           29409919,
                           29409920,
                           29409921,
                           29410049,
                           29410050,
                           29410051,
                           29410052,
                           29410379,
                           29410380,
                           29410381,
                           29410382,
                           29410383,
                           29410384,
                           29410385,
                           29410386,
                           29410415,
                           29410416,
                           29410417,
                           29410418,
                           29410419,
                           29410420,
                           29410421,
                           29410422,
                           29410423,
                           29410424,
                           29410425,
                           29410426,
                           29410427,
                           29410428,
                           29410429,
                           29410430,
                           29410431,
                           29410432,
                           29410474,
                           29410475,
                           29410476,
                           29410477,
                           29410478,
                           29410702,
                           29410703,
                           29410704,
                           29410705,
                           29410706,
                           29410707,
                           29410708,
                           29410709,
                           29410710,
                           29411055,
                           29411056,
                           29411057,
                           29411058,
                           29411059,
                           29411060,
                           29411061,
                           29411062,
                           29411063,
                           29411064,
                           29411065,
                           29411368,
                           29411369,
                           29411370,
                           29411371,
                           29411689,
                           29411690,
                           29411691,
                           29411692,
                           29411693,
                           29411694,
                           29411794,
                           29411795,
                           29411796,
                           29411797,
                           29411798,
                           29411799,
                           29411800,
                           29411801,
                           29411802,
                           29411803,
                           29411804,
                           29411805,
                           29411806,
                           29411807,
                           29411817,
                           29411818,
                           29411819,
                           29411820,
                           29411821,
                           29411822,
                           29411823,
                           29411824,
                           29411825,
                           29411826,
                           29412104,
                           29412105,
                           29412106,
                           29412107,
                           29412273,
                           29412274,
                           29412275,
                           29412276,
                           29412357,
                           29412358,
                           29412359,
                           29412360,
                           29412361,
                           29412362,
                           29412363,
                           29412364,
                           29412365,
                           29412366,
                           29412367,
                           29412368,
                           29412369,
                           29412370,
                           29412766,
                           29412767,
                           29412768,
                           29412769,
                           29412770,
                           29412771,
                           29412772,
                           29412773,
                           29412774,
                           29412775,
                           29412962,
                           29412963,
                           29412964,
                           29412965,
                           29412966,
                           29412967,
                           29412968,
                           29412969,
                           29412970,
                           29412971,
                           29412972,
                           29412973,
                           29412974,
                           29412975,
                           29412976,
                           29412977,
                           29412978,
                           29412979,
                           29412980,
                           29412981,
                           29412982,
                           29412983
    );
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.sales_data_id, sd.orders_id, sd.sku_id,
       (SELECT SUM(op.products_quantity)
        FROM clothes2_osC.orders_products AS op
                 JOIN clothes2_osC.products_stock AS ps
                      ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
                 JOIN clothes2_osC.orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
                 JOIN clothes2_osC.orders_customisations oc
                      on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
                 JOIN clothes2_osC.customisation_options co ON co.custom_type = oc.custom_type
        WHERE op.orders_id = sd.orders_id
          AND opc.customisation_id <> 0
          AND ps.poloMap = sd.sku_id
          AND co.customisation_department <> ''
          GROUP BY co.customisation_department)        AS dtg_app_count
FROM quaysidg_news.sales_data sd
WHERE sd.sales_data_id in (
                           29399092,
                           29399093,
                           29399094,
                           29399095,
                           29399096,
                           29399097,
                           29399098,
                           29399099,
                           29399661,
                           29399662,
                           29399663,
                           29399664,
                           29399722,
                           29399723,
                           29399724,
                           29399725,
                           29399726,
                           29399727,
                           29399752,
                           29399753,
                           29399754,
                           29399755,
                           29399840,
                           29399841,
                           29399842,
                           29399843,
                           29399844,
                           29399845,
                           29399872,
                           29399873,
                           29399874,
                           29399875,
                           29399876,
                           29399877,
                           29399878,
                           29399879,
                           29399880,
                           29399881,
                           29399882,
                           29399971,
                           29399972,
                           29399973,
                           29399974,
                           29400112,
                           29400113,
                           29400114,
                           29400115,
                           29400116,
                           29400117,
                           29400323,
                           29400324,
                           29400325,
                           29400326,
                           29400327,
                           29400328,
                           29400547,
                           29400548,
                           29400549,
                           29400550,
                           29400885,
                           29400886,
                           29400887,
                           29400888,
                           29400889,
                           29400890,
                           29400891,
                           29400911,
                           29400912,
                           29400913,
                           29400914,
                           29400915,
                           29400916,
                           29400917,
                           29401443,
                           29401444,
                           29401445,
                           29401446,
                           29401447,
                           29401448,
                           29401449,
                           29401450,
                           29401767,
                           29401768,
                           29401769,
                           29401770,
                           29401888,
                           29401889,
                           29401890,
                           29401891,
                           29401892,
                           29401893,
                           29401894,
                           29401895,
                           29401896,
                           29402432,
                           29402433,
                           29402434,
                           29402435,
                           29402436,
                           29402437,
                           29402438,
                           29402439,
                           29402440,
                           29402441,
                           29402442,
                           29402443,
                           29402444,
                           29402445,
                           29402728,
                           29402729,
                           29402730,
                           29402731,
                           29402732,
                           29402733,
                           29402734,
                           29402735,
                           29404394,
                           29404395,
                           29404396,
                           29404397,
                           29404398,
                           29404557,
                           29404558,
                           29404559,
                           29404560,
                           29404650,
                           29404651,
                           29404652,
                           29404653,
                           29404654,
                           29404655,
                           29404860,
                           29404861,
                           29404862,
                           29404863,
                           29404864,
                           29404865,
                           29404866,
                           29404867,
                           29404868,
                           29404869,
                           29404870,
                           29404871,
                           29404872,
                           29404873,
                           29404874,
                           29404875,
                           29405199,
                           29405200,
                           29405201,
                           29405202,
                           29405203,
                           29405204,
                           29405205,
                           29405474,
                           29405475,
                           29405476,
                           29405477,
                           29405998,
                           29405999,
                           29406000,
                           29406001,
                           29406002,
                           29406003,
                           29406274,
                           29406275,
                           29406276,
                           29406277,
                           29406278,
                           29406279,
                           29406280,
                           29406424,
                           29406425,
                           29406610,
                           29406611,
                           29406612,
                           29406613,
                           29406614,
                           29406796,
                           29406797,
                           29406798,
                           29406799,
                           29406990,
                           29406991,
                           29406992,
                           29406993,
                           29406994,
                           29406995,
                           29406996,
                           29406997,
                           29407056,
                           29407057,
                           29407058,
                           29407059,
                           29407060,
                           29407061,
                           29407062,
                           29407063,
                           29407250,
                           29407251,
                           29407252,
                           29407253,
                           29407254,
                           29407255,
                           29407256,
                           29407307,
                           29407308,
                           29407309,
                           29407310,
                           29407311,
                           29407408,
                           29407409,
                           29407410,
                           29407411,
                           29407412,
                           29407413,
                           29407694,
                           29407695,
                           29407696,
                           29407697,
                           29407698,
                           29407699,
                           29407731,
                           29407732,
                           29407733,
                           29407734,
                           29407735,
                           29407736,
                           29407737,
                           29407738,
                           29407739,
                           29407740,
                           29407741,
                           29407742,
                           29407743,
                           29407744,
                           29407745,
                           29407746,
                           29407767,
                           29407768,
                           29407769,
                           29407770,
                           29407838,
                           29407839,
                           29407840,
                           29407841,
                           29407842,
                           29407843,
                           29407844,
                           29407845,
                           29407846,
                           29407847,
                           29407848,
                           29407849,
                           29407850,
                           29407851,
                           29407852,
                           29407853,
                           29407854,
                           29407855,
                           29407856,
                           29407857,
                           29408047,
                           29408048,
                           29408049,
                           29408050,
                           29408051,
                           29408052,
                           29408070,
                           29408071,
                           29408072,
                           29408073,
                           29408074,
                           29408075,
                           29408344,
                           29408345,
                           29408346,
                           29408347,
                           29408348,
                           29408349,
                           29408350,
                           29408351,
                           29408352,
                           29408353,
                           29408775,
                           29408776,
                           29408777,
                           29408778,
                           29408779,
                           29408780,
                           29408781,
                           29408782,
                           29408783,
                           29408784,
                           29408827,
                           29408828,
                           29408829,
                           29408830,
                           29408850,
                           29408851,
                           29408852,
                           29408853,
                           29408854,
                           29408855,
                           29409041,
                           29409042,
                           29409043,
                           29409044,
                           29409194,
                           29409195,
                           29409196,
                           29409197,
                           29409198,
                           29409199,
                           29409200,
                           29409539,
                           29409540,
                           29409541,
                           29409542,
                           29409543,
                           29409544,
                           29409720,
                           29409721,
                           29409722,
                           29409723,
                           29409724,
                           29409725,
                           29409726,
                           29409795,
                           29409796,
                           29409797,
                           29409798,
                           29409799,
                           29409800,
                           29409801,
                           29409802,
                           29409803,
                           29409872,
                           29409873,
                           29409874,
                           29409875,
                           29409876,
                           29409877,
                           29409878,
                           29409879,
                           29409880,
                           29409911,
                           29409912,
                           29409913,
                           29409914,
                           29409915,
                           29409916,
                           29409917,
                           29409918,
                           29409919,
                           29409920,
                           29409921,
                           29410049,
                           29410050,
                           29410051,
                           29410052,
                           29410379,
                           29410380,
                           29410381,
                           29410382,
                           29410383,
                           29410384,
                           29410385,
                           29410386,
                           29410415,
                           29410416,
                           29410417,
                           29410418,
                           29410419,
                           29410420,
                           29410421,
                           29410422,
                           29410423,
                           29410424,
                           29410425,
                           29410426,
                           29410427,
                           29410428,
                           29410429,
                           29410430,
                           29410431,
                           29410432,
                           29410474,
                           29410475,
                           29410476,
                           29410477,
                           29410478,
                           29410702,
                           29410703,
                           29410704,
                           29410705,
                           29410706,
                           29410707,
                           29410708,
                           29410709,
                           29410710,
                           29411055,
                           29411056,
                           29411057,
                           29411058,
                           29411059,
                           29411060,
                           29411061,
                           29411062,
                           29411063,
                           29411064,
                           29411065,
                           29411368,
                           29411369,
                           29411370,
                           29411371,
                           29411689,
                           29411690,
                           29411691,
                           29411692,
                           29411693,
                           29411694,
                           29411794,
                           29411795,
                           29411796,
                           29411797,
                           29411798,
                           29411799,
                           29411800,
                           29411801,
                           29411802,
                           29411803,
                           29411804,
                           29411805,
                           29411806,
                           29411807,
                           29411817,
                           29411818,
                           29411819,
                           29411820,
                           29411821,
                           29411822,
                           29411823,
                           29411824,
                           29411825,
                           29411826,
                           29412104,
                           29412105,
                           29412106,
                           29412107,
                           29412273,
                           29412274,
                           29412275,
                           29412276,
                           29412357,
                           29412358,
                           29412359,
                           29412360,
                           29412361,
                           29412362,
                           29412363,
                           29412364,
                           29412365,
                           29412366,
                           29412367,
                           29412368,
                           29412369,
                           29412370,
                           29412766,
                           29412767,
                           29412768,
                           29412769,
                           29412770,
                           29412771,
                           29412772,
                           29412773,
                           29412774,
                           29412775,
                           29412962,
                           29412963,
                           29412964,
                           29412965,
                           29412966,
                           29412967,
                           29412968,
                           29412969,
                           29412970,
                           29412971,
                           29412972,
                           29412973,
                           29412974,
                           29412975,
                           29412976,
                           29412977,
                           29412978,
                           29412979,
                           29412980,
                           29412981,
                           29412982,
                           29412983
    );
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.sales_data_id, sd.orders_id, sd.sku_id,
       concat((SELECT SUM(op.products_quantity)
        FROM clothes2_osC.orders_products AS op
                 JOIN clothes2_osC.products_stock AS ps
                      ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
                 JOIN clothes2_osC.orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
                 JOIN clothes2_osC.orders_customisations oc
                      on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
                 JOIN clothes2_osC.customisation_options co ON co.custom_type = oc.custom_type
        WHERE op.orders_id = sd.orders_id
          AND opc.customisation_id <> 0
          AND ps.poloMap = sd.sku_id
          AND co.customisation_department <> ''
          GROUP BY co.customisation_department))        AS dtg_app_count
FROM quaysidg_news.sales_data sd
WHERE sd.sales_data_id in (
                           29399092,
                           29399093,
                           29399094,
                           29399095,
                           29399096,
                           29399097,
                           29399098,
                           29399099,
                           29399661,
                           29399662,
                           29399663,
                           29399664,
                           29399722,
                           29399723,
                           29399724,
                           29399725,
                           29399726,
                           29399727,
                           29399752,
                           29399753,
                           29399754,
                           29399755,
                           29399840,
                           29399841,
                           29399842,
                           29399843,
                           29399844,
                           29399845,
                           29399872,
                           29399873,
                           29399874,
                           29399875,
                           29399876,
                           29399877,
                           29399878,
                           29399879,
                           29399880,
                           29399881,
                           29399882,
                           29399971,
                           29399972,
                           29399973,
                           29399974,
                           29400112,
                           29400113,
                           29400114,
                           29400115,
                           29400116,
                           29400117,
                           29400323,
                           29400324,
                           29400325,
                           29400326,
                           29400327,
                           29400328,
                           29400547,
                           29400548,
                           29400549,
                           29400550,
                           29400885,
                           29400886,
                           29400887,
                           29400888,
                           29400889,
                           29400890,
                           29400891,
                           29400911,
                           29400912,
                           29400913,
                           29400914,
                           29400915,
                           29400916,
                           29400917,
                           29401443,
                           29401444,
                           29401445,
                           29401446,
                           29401447,
                           29401448,
                           29401449,
                           29401450,
                           29401767,
                           29401768,
                           29401769,
                           29401770,
                           29401888,
                           29401889,
                           29401890,
                           29401891,
                           29401892,
                           29401893,
                           29401894,
                           29401895,
                           29401896,
                           29402432,
                           29402433,
                           29402434,
                           29402435,
                           29402436,
                           29402437,
                           29402438,
                           29402439,
                           29402440,
                           29402441,
                           29402442,
                           29402443,
                           29402444,
                           29402445,
                           29402728,
                           29402729,
                           29402730,
                           29402731,
                           29402732,
                           29402733,
                           29402734,
                           29402735,
                           29404394,
                           29404395,
                           29404396,
                           29404397,
                           29404398,
                           29404557,
                           29404558,
                           29404559,
                           29404560,
                           29404650,
                           29404651,
                           29404652,
                           29404653,
                           29404654,
                           29404655,
                           29404860,
                           29404861,
                           29404862,
                           29404863,
                           29404864,
                           29404865,
                           29404866,
                           29404867,
                           29404868,
                           29404869,
                           29404870,
                           29404871,
                           29404872,
                           29404873,
                           29404874,
                           29404875,
                           29405199,
                           29405200,
                           29405201,
                           29405202,
                           29405203,
                           29405204,
                           29405205,
                           29405474,
                           29405475,
                           29405476,
                           29405477,
                           29405998,
                           29405999,
                           29406000,
                           29406001,
                           29406002,
                           29406003,
                           29406274,
                           29406275,
                           29406276,
                           29406277,
                           29406278,
                           29406279,
                           29406280,
                           29406424,
                           29406425,
                           29406610,
                           29406611,
                           29406612,
                           29406613,
                           29406614,
                           29406796,
                           29406797,
                           29406798,
                           29406799,
                           29406990,
                           29406991,
                           29406992,
                           29406993,
                           29406994,
                           29406995,
                           29406996,
                           29406997,
                           29407056,
                           29407057,
                           29407058,
                           29407059,
                           29407060,
                           29407061,
                           29407062,
                           29407063,
                           29407250,
                           29407251,
                           29407252,
                           29407253,
                           29407254,
                           29407255,
                           29407256,
                           29407307,
                           29407308,
                           29407309,
                           29407310,
                           29407311,
                           29407408,
                           29407409,
                           29407410,
                           29407411,
                           29407412,
                           29407413,
                           29407694,
                           29407695,
                           29407696,
                           29407697,
                           29407698,
                           29407699,
                           29407731,
                           29407732,
                           29407733,
                           29407734,
                           29407735,
                           29407736,
                           29407737,
                           29407738,
                           29407739,
                           29407740,
                           29407741,
                           29407742,
                           29407743,
                           29407744,
                           29407745,
                           29407746,
                           29407767,
                           29407768,
                           29407769,
                           29407770,
                           29407838,
                           29407839,
                           29407840,
                           29407841,
                           29407842,
                           29407843,
                           29407844,
                           29407845,
                           29407846,
                           29407847,
                           29407848,
                           29407849,
                           29407850,
                           29407851,
                           29407852,
                           29407853,
                           29407854,
                           29407855,
                           29407856,
                           29407857,
                           29408047,
                           29408048,
                           29408049,
                           29408050,
                           29408051,
                           29408052,
                           29408070,
                           29408071,
                           29408072,
                           29408073,
                           29408074,
                           29408075,
                           29408344,
                           29408345,
                           29408346,
                           29408347,
                           29408348,
                           29408349,
                           29408350,
                           29408351,
                           29408352,
                           29408353,
                           29408775,
                           29408776,
                           29408777,
                           29408778,
                           29408779,
                           29408780,
                           29408781,
                           29408782,
                           29408783,
                           29408784,
                           29408827,
                           29408828,
                           29408829,
                           29408830,
                           29408850,
                           29408851,
                           29408852,
                           29408853,
                           29408854,
                           29408855,
                           29409041,
                           29409042,
                           29409043,
                           29409044,
                           29409194,
                           29409195,
                           29409196,
                           29409197,
                           29409198,
                           29409199,
                           29409200,
                           29409539,
                           29409540,
                           29409541,
                           29409542,
                           29409543,
                           29409544,
                           29409720,
                           29409721,
                           29409722,
                           29409723,
                           29409724,
                           29409725,
                           29409726,
                           29409795,
                           29409796,
                           29409797,
                           29409798,
                           29409799,
                           29409800,
                           29409801,
                           29409802,
                           29409803,
                           29409872,
                           29409873,
                           29409874,
                           29409875,
                           29409876,
                           29409877,
                           29409878,
                           29409879,
                           29409880,
                           29409911,
                           29409912,
                           29409913,
                           29409914,
                           29409915,
                           29409916,
                           29409917,
                           29409918,
                           29409919,
                           29409920,
                           29409921,
                           29410049,
                           29410050,
                           29410051,
                           29410052,
                           29410379,
                           29410380,
                           29410381,
                           29410382,
                           29410383,
                           29410384,
                           29410385,
                           29410386,
                           29410415,
                           29410416,
                           29410417,
                           29410418,
                           29410419,
                           29410420,
                           29410421,
                           29410422,
                           29410423,
                           29410424,
                           29410425,
                           29410426,
                           29410427,
                           29410428,
                           29410429,
                           29410430,
                           29410431,
                           29410432,
                           29410474,
                           29410475,
                           29410476,
                           29410477,
                           29410478,
                           29410702,
                           29410703,
                           29410704,
                           29410705,
                           29410706,
                           29410707,
                           29410708,
                           29410709,
                           29410710,
                           29411055,
                           29411056,
                           29411057,
                           29411058,
                           29411059,
                           29411060,
                           29411061,
                           29411062,
                           29411063,
                           29411064,
                           29411065,
                           29411368,
                           29411369,
                           29411370,
                           29411371,
                           29411689,
                           29411690,
                           29411691,
                           29411692,
                           29411693,
                           29411694,
                           29411794,
                           29411795,
                           29411796,
                           29411797,
                           29411798,
                           29411799,
                           29411800,
                           29411801,
                           29411802,
                           29411803,
                           29411804,
                           29411805,
                           29411806,
                           29411807,
                           29411817,
                           29411818,
                           29411819,
                           29411820,
                           29411821,
                           29411822,
                           29411823,
                           29411824,
                           29411825,
                           29411826,
                           29412104,
                           29412105,
                           29412106,
                           29412107,
                           29412273,
                           29412274,
                           29412275,
                           29412276,
                           29412357,
                           29412358,
                           29412359,
                           29412360,
                           29412361,
                           29412362,
                           29412363,
                           29412364,
                           29412365,
                           29412366,
                           29412367,
                           29412368,
                           29412369,
                           29412370,
                           29412766,
                           29412767,
                           29412768,
                           29412769,
                           29412770,
                           29412771,
                           29412772,
                           29412773,
                           29412774,
                           29412775,
                           29412962,
                           29412963,
                           29412964,
                           29412965,
                           29412966,
                           29412967,
                           29412968,
                           29412969,
                           29412970,
                           29412971,
                           29412972,
                           29412973,
                           29412974,
                           29412975,
                           29412976,
                           29412977,
                           29412978,
                           29412979,
                           29412980,
                           29412981,
                           29412982,
                           29412983
    );
;-- -. . -..- - / . -. - .-. -.--
SELECT SUM(op.products_quantity)

FROM quaysidg_news.sales_data sd
       LEFT JOIN clothes2_osC.orders_products AS op
                 LEFT JOIN clothes2_osC.products_stock AS ps
                      ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
                 LEFT JOIN clothes2_osC.orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
                 LEFT JOIN clothes2_osC.orders_customisations oc
                      on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
                 LEFT JOIN clothes2_osC.customisation_options co ON co.custom_type = oc.custom_type
WHERE op.orders_id = sd.orders_id
          AND opc.customisation_id <> 0
          AND ps.poloMap = sd.sku_id
          AND co.customisation_department <> ''
AND sd.sales_data_id in (29399092,29399093,29399094,29399095,29399096,29399097,29399098,29399099,29399661,29399662,29399663,29399664,29399722,29399723,29399724,29399725,29399726,29399727,29399752,29399753,29399754,29399755,29399840,29399841,29399842,29399843,29399844,29399845,29399872,29399873,29399874,29399875,29399876,29399877,29399878,29399879,29399880,29399881,29399882,29399971,29399972,29399973,29399974,29400112,29400113,29400114,29400115,29400116,29400117,29400323,29400324,29400325,29400326,29400327,29400328,29400547,29400548,29400549,29400550,29400885,29400886,29400887,29400888,29400889,29400890,29400891,29400911,29400912,29400913,29400914,29400915,29400916,29400917,29401443,29401444,29401445,29401446,29401447,29401448,29401449,29401450,29401767,29401768,29401769,29401770,29401888,29401889,29401890,29401891,29401892,29401893,29401894,29401895,29401896,29402432,29402433,29402434,29402435,29402436,29402437,29402438,29402439,29402440,29402441,29402442,29402443,29402444,29402445,29402728,29402729,29402730,29402731,29402732,29402733,29402734,29402735,29404394,29404395,29404396,29404397,29404398,29404557,29404558,29404559,29404560,29404650,29404651,29404652,29404653,29404654,29404655,29404860,29404861,29404862,29404863,29404864,29404865,29404866,29404867,29404868,29404869,29404870,29404871,29404872,29404873,29404874,29404875,29405199,29405200,29405201,29405202,29405203,29405204,29405205,29405474,29405475,29405476,29405477,29405998,29405999,29406000,29406001,29406002,29406003,29406274,29406275,29406276,29406277,29406278,29406279,29406280,29406424,29406425,29406610,29406611,29406612,29406613,29406614,29406796,29406797,29406798,29406799,29406990,29406991,29406992,29406993,29406994,29406995,29406996,29406997,29407056,29407057,29407058,29407059,29407060,29407061,29407062,29407063,29407250,29407251,29407252,29407253,29407254,29407255,29407256,29407307,29407308,29407309,29407310,29407311,29407408,29407409,29407410,29407411,29407412,29407413,29407694,29407695,29407696,29407697,29407698,29407699,29407731,29407732,29407733,29407734,29407735,29407736,29407737,29407738,29407739,29407740,29407741,29407742,29407743,29407744,29407745,29407746,29407767,29407768,29407769,29407770,29407838,29407839,29407840,29407841,29407842,29407843,29407844,29407845,29407846,29407847,29407848,29407849,29407850,29407851,29407852,29407853,29407854,29407855,29407856,29407857,29408047,29408048,29408049,29408050,29408051,29408052,29408070,29408071,29408072,29408073,29408074,29408075,29408344,29408345,29408346,29408347,29408348,29408349,29408350,29408351,29408352,29408353,29408775,29408776,29408777,29408778,29408779,29408780,29408781,29408782,29408783,29408784,29408827,29408828,29408829,29408830,29408850,29408851,29408852,29408853,29408854,29408855,29409041,29409042,29409043,29409044,29409194,29409195,29409196,29409197,29409198,29409199,29409200,29409539,29409540,29409541,29409542,29409543,29409544,29409720,29409721,29409722,29409723,29409724,29409725,29409726,29409795,29409796,29409797,29409798,29409799,29409800,29409801,29409802,29409803,29409872,29409873,29409874,29409875,29409876,29409877,29409878,29409879,29409880,29409911,29409912,29409913,29409914,29409915,29409916,29409917,29409918,29409919,29409920,29409921,29410049,29410050,29410051,29410052,29410379,29410380,29410381,29410382,29410383,29410384,29410385,29410386,29410415,29410416,29410417,29410418,29410419,29410420,29410421,29410422,29410423,29410424,29410425,29410426,29410427,29410428,29410429,29410430,29410431,29410432,29410474,29410475,29410476,29410477,29410478,29410702,29410703,29410704,29410705,29410706,29410707,29410708,29410709,29410710,29411055,29411056,29411057,29411058,29411059,29411060,29411061,29411062,29411063,29411064,29411065,29411368,29411369,29411370,29411371,29411689,29411690,29411691,29411692,29411693,29411694,29411794,29411795,29411796,29411797,29411798,29411799,29411800,29411801,29411802,29411803,29411804,29411805,29411806,29411807,29411817,29411818,29411819,29411820,29411821,29411822,29411823,29411824,29411825,29411826,29412104,29412105,29412106,29412107,29412273,29412274,29412275,29412276,29412357,29412358,29412359,29412360,29412361,29412362,29412363,29412364,29412365,29412366,29412367,29412368,29412369,29412370,29412766,29412767,29412768,29412769,29412770,29412771,29412772,29412773,29412774,29412775,29412962,29412963,29412964,29412965,29412966,29412967,29412968,29412969,29412970,29412971,29412972,29412973,29412974,29412975,29412976,29412977,29412978,29412979,29412980,29412981,29412982,29412983)
GROUP BY co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT SUM(op.products_quantity)

FROM quaysidg_news.sales_data sd
       LEFT JOIN clothes2_osC.orders_products AS op on op.orders_id = sd.orders_id
                 LEFT JOIN clothes2_osC.products_stock AS ps
                      ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
                 LEFT JOIN clothes2_osC.orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
                 LEFT JOIN clothes2_osC.orders_customisations oc
                      on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
                 LEFT JOIN clothes2_osC.customisation_options co ON co.custom_type = oc.custom_type
WHERE op.orders_id = sd.orders_id
          AND opc.customisation_id <> 0
          AND ps.poloMap = sd.sku_id
          AND co.customisation_department <> ''
AND sd.sales_data_id in (29399092,29399093,29399094,29399095,29399096,29399097,29399098,29399099,29399661,29399662,29399663,29399664,29399722,29399723,29399724,29399725,29399726,29399727,29399752,29399753,29399754,29399755,29399840,29399841,29399842,29399843,29399844,29399845,29399872,29399873,29399874,29399875,29399876,29399877,29399878,29399879,29399880,29399881,29399882,29399971,29399972,29399973,29399974,29400112,29400113,29400114,29400115,29400116,29400117,29400323,29400324,29400325,29400326,29400327,29400328,29400547,29400548,29400549,29400550,29400885,29400886,29400887,29400888,29400889,29400890,29400891,29400911,29400912,29400913,29400914,29400915,29400916,29400917,29401443,29401444,29401445,29401446,29401447,29401448,29401449,29401450,29401767,29401768,29401769,29401770,29401888,29401889,29401890,29401891,29401892,29401893,29401894,29401895,29401896,29402432,29402433,29402434,29402435,29402436,29402437,29402438,29402439,29402440,29402441,29402442,29402443,29402444,29402445,29402728,29402729,29402730,29402731,29402732,29402733,29402734,29402735,29404394,29404395,29404396,29404397,29404398,29404557,29404558,29404559,29404560,29404650,29404651,29404652,29404653,29404654,29404655,29404860,29404861,29404862,29404863,29404864,29404865,29404866,29404867,29404868,29404869,29404870,29404871,29404872,29404873,29404874,29404875,29405199,29405200,29405201,29405202,29405203,29405204,29405205,29405474,29405475,29405476,29405477,29405998,29405999,29406000,29406001,29406002,29406003,29406274,29406275,29406276,29406277,29406278,29406279,29406280,29406424,29406425,29406610,29406611,29406612,29406613,29406614,29406796,29406797,29406798,29406799,29406990,29406991,29406992,29406993,29406994,29406995,29406996,29406997,29407056,29407057,29407058,29407059,29407060,29407061,29407062,29407063,29407250,29407251,29407252,29407253,29407254,29407255,29407256,29407307,29407308,29407309,29407310,29407311,29407408,29407409,29407410,29407411,29407412,29407413,29407694,29407695,29407696,29407697,29407698,29407699,29407731,29407732,29407733,29407734,29407735,29407736,29407737,29407738,29407739,29407740,29407741,29407742,29407743,29407744,29407745,29407746,29407767,29407768,29407769,29407770,29407838,29407839,29407840,29407841,29407842,29407843,29407844,29407845,29407846,29407847,29407848,29407849,29407850,29407851,29407852,29407853,29407854,29407855,29407856,29407857,29408047,29408048,29408049,29408050,29408051,29408052,29408070,29408071,29408072,29408073,29408074,29408075,29408344,29408345,29408346,29408347,29408348,29408349,29408350,29408351,29408352,29408353,29408775,29408776,29408777,29408778,29408779,29408780,29408781,29408782,29408783,29408784,29408827,29408828,29408829,29408830,29408850,29408851,29408852,29408853,29408854,29408855,29409041,29409042,29409043,29409044,29409194,29409195,29409196,29409197,29409198,29409199,29409200,29409539,29409540,29409541,29409542,29409543,29409544,29409720,29409721,29409722,29409723,29409724,29409725,29409726,29409795,29409796,29409797,29409798,29409799,29409800,29409801,29409802,29409803,29409872,29409873,29409874,29409875,29409876,29409877,29409878,29409879,29409880,29409911,29409912,29409913,29409914,29409915,29409916,29409917,29409918,29409919,29409920,29409921,29410049,29410050,29410051,29410052,29410379,29410380,29410381,29410382,29410383,29410384,29410385,29410386,29410415,29410416,29410417,29410418,29410419,29410420,29410421,29410422,29410423,29410424,29410425,29410426,29410427,29410428,29410429,29410430,29410431,29410432,29410474,29410475,29410476,29410477,29410478,29410702,29410703,29410704,29410705,29410706,29410707,29410708,29410709,29410710,29411055,29411056,29411057,29411058,29411059,29411060,29411061,29411062,29411063,29411064,29411065,29411368,29411369,29411370,29411371,29411689,29411690,29411691,29411692,29411693,29411694,29411794,29411795,29411796,29411797,29411798,29411799,29411800,29411801,29411802,29411803,29411804,29411805,29411806,29411807,29411817,29411818,29411819,29411820,29411821,29411822,29411823,29411824,29411825,29411826,29412104,29412105,29412106,29412107,29412273,29412274,29412275,29412276,29412357,29412358,29412359,29412360,29412361,29412362,29412363,29412364,29412365,29412366,29412367,29412368,29412369,29412370,29412766,29412767,29412768,29412769,29412770,29412771,29412772,29412773,29412774,29412775,29412962,29412963,29412964,29412965,29412966,29412967,29412968,29412969,29412970,29412971,29412972,29412973,29412974,29412975,29412976,29412977,29412978,29412979,29412980,29412981,29412982,29412983)
GROUP BY co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.sales_data_id, sd.orders_id, sd.sku_id,
       SUM(op.products_quantity)
FROM quaysidg_news.sales_data sd
       LEFT JOIN clothes2_osC.orders_products AS op on op.orders_id = sd.orders_id
                 LEFT JOIN clothes2_osC.products_stock AS ps
                      ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
                 LEFT JOIN clothes2_osC.orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
                 LEFT JOIN clothes2_osC.orders_customisations oc
                      on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
                 LEFT JOIN clothes2_osC.customisation_options co ON co.custom_type = oc.custom_type
WHERE op.orders_id = sd.orders_id
          AND opc.customisation_id <> 0
          AND ps.poloMap = sd.sku_id
          AND co.customisation_department <> ''
AND sd.sales_data_id in (29399092,29399093,29399094,29399095,29399096,29399097,29399098,29399099,29399661,29399662,29399663,29399664,29399722,29399723,29399724,29399725,29399726,29399727,29399752,29399753,29399754,29399755,29399840,29399841,29399842,29399843,29399844,29399845,29399872,29399873,29399874,29399875,29399876,29399877,29399878,29399879,29399880,29399881,29399882,29399971,29399972,29399973,29399974,29400112,29400113,29400114,29400115,29400116,29400117,29400323,29400324,29400325,29400326,29400327,29400328,29400547,29400548,29400549,29400550,29400885,29400886,29400887,29400888,29400889,29400890,29400891,29400911,29400912,29400913,29400914,29400915,29400916,29400917,29401443,29401444,29401445,29401446,29401447,29401448,29401449,29401450,29401767,29401768,29401769,29401770,29401888,29401889,29401890,29401891,29401892,29401893,29401894,29401895,29401896,29402432,29402433,29402434,29402435,29402436,29402437,29402438,29402439,29402440,29402441,29402442,29402443,29402444,29402445,29402728,29402729,29402730,29402731,29402732,29402733,29402734,29402735,29404394,29404395,29404396,29404397,29404398,29404557,29404558,29404559,29404560,29404650,29404651,29404652,29404653,29404654,29404655,29404860,29404861,29404862,29404863,29404864,29404865,29404866,29404867,29404868,29404869,29404870,29404871,29404872,29404873,29404874,29404875,29405199,29405200,29405201,29405202,29405203,29405204,29405205,29405474,29405475,29405476,29405477,29405998,29405999,29406000,29406001,29406002,29406003,29406274,29406275,29406276,29406277,29406278,29406279,29406280,29406424,29406425,29406610,29406611,29406612,29406613,29406614,29406796,29406797,29406798,29406799,29406990,29406991,29406992,29406993,29406994,29406995,29406996,29406997,29407056,29407057,29407058,29407059,29407060,29407061,29407062,29407063,29407250,29407251,29407252,29407253,29407254,29407255,29407256,29407307,29407308,29407309,29407310,29407311,29407408,29407409,29407410,29407411,29407412,29407413,29407694,29407695,29407696,29407697,29407698,29407699,29407731,29407732,29407733,29407734,29407735,29407736,29407737,29407738,29407739,29407740,29407741,29407742,29407743,29407744,29407745,29407746,29407767,29407768,29407769,29407770,29407838,29407839,29407840,29407841,29407842,29407843,29407844,29407845,29407846,29407847,29407848,29407849,29407850,29407851,29407852,29407853,29407854,29407855,29407856,29407857,29408047,29408048,29408049,29408050,29408051,29408052,29408070,29408071,29408072,29408073,29408074,29408075,29408344,29408345,29408346,29408347,29408348,29408349,29408350,29408351,29408352,29408353,29408775,29408776,29408777,29408778,29408779,29408780,29408781,29408782,29408783,29408784,29408827,29408828,29408829,29408830,29408850,29408851,29408852,29408853,29408854,29408855,29409041,29409042,29409043,29409044,29409194,29409195,29409196,29409197,29409198,29409199,29409200,29409539,29409540,29409541,29409542,29409543,29409544,29409720,29409721,29409722,29409723,29409724,29409725,29409726,29409795,29409796,29409797,29409798,29409799,29409800,29409801,29409802,29409803,29409872,29409873,29409874,29409875,29409876,29409877,29409878,29409879,29409880,29409911,29409912,29409913,29409914,29409915,29409916,29409917,29409918,29409919,29409920,29409921,29410049,29410050,29410051,29410052,29410379,29410380,29410381,29410382,29410383,29410384,29410385,29410386,29410415,29410416,29410417,29410418,29410419,29410420,29410421,29410422,29410423,29410424,29410425,29410426,29410427,29410428,29410429,29410430,29410431,29410432,29410474,29410475,29410476,29410477,29410478,29410702,29410703,29410704,29410705,29410706,29410707,29410708,29410709,29410710,29411055,29411056,29411057,29411058,29411059,29411060,29411061,29411062,29411063,29411064,29411065,29411368,29411369,29411370,29411371,29411689,29411690,29411691,29411692,29411693,29411694,29411794,29411795,29411796,29411797,29411798,29411799,29411800,29411801,29411802,29411803,29411804,29411805,29411806,29411807,29411817,29411818,29411819,29411820,29411821,29411822,29411823,29411824,29411825,29411826,29412104,29412105,29412106,29412107,29412273,29412274,29412275,29412276,29412357,29412358,29412359,29412360,29412361,29412362,29412363,29412364,29412365,29412366,29412367,29412368,29412369,29412370,29412766,29412767,29412768,29412769,29412770,29412771,29412772,29412773,29412774,29412775,29412962,29412963,29412964,29412965,29412966,29412967,29412968,29412969,29412970,29412971,29412972,29412973,29412974,29412975,29412976,29412977,29412978,29412979,29412980,29412981,29412982,29412983)
GROUP BY co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.sales_data_id, sd.orders_id, sd.sku_id,
       co.customisation_department,
       SUM(op.products_quantity)
FROM quaysidg_news.sales_data sd
       LEFT JOIN clothes2_osC.orders_products AS op on op.orders_id = sd.orders_id
                 LEFT JOIN clothes2_osC.products_stock AS ps
                      ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
                 LEFT JOIN clothes2_osC.orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
                 LEFT JOIN clothes2_osC.orders_customisations oc
                      on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
                 LEFT JOIN clothes2_osC.customisation_options co ON co.custom_type = oc.custom_type
WHERE op.orders_id = sd.orders_id
          AND opc.customisation_id <> 0
          AND ps.poloMap = sd.sku_id
          AND co.customisation_department <> ''
AND sd.sales_data_id in (29399092,29399093,29399094,29399095,29399096,29399097,29399098,29399099,29399661,29399662,29399663,29399664,29399722,29399723,29399724,29399725,29399726,29399727,29399752,29399753,29399754,29399755,29399840,29399841,29399842,29399843,29399844,29399845,29399872,29399873,29399874,29399875,29399876,29399877,29399878,29399879,29399880,29399881,29399882,29399971,29399972,29399973,29399974,29400112,29400113,29400114,29400115,29400116,29400117,29400323,29400324,29400325,29400326,29400327,29400328,29400547,29400548,29400549,29400550,29400885,29400886,29400887,29400888,29400889,29400890,29400891,29400911,29400912,29400913,29400914,29400915,29400916,29400917,29401443,29401444,29401445,29401446,29401447,29401448,29401449,29401450,29401767,29401768,29401769,29401770,29401888,29401889,29401890,29401891,29401892,29401893,29401894,29401895,29401896,29402432,29402433,29402434,29402435,29402436,29402437,29402438,29402439,29402440,29402441,29402442,29402443,29402444,29402445,29402728,29402729,29402730,29402731,29402732,29402733,29402734,29402735,29404394,29404395,29404396,29404397,29404398,29404557,29404558,29404559,29404560,29404650,29404651,29404652,29404653,29404654,29404655,29404860,29404861,29404862,29404863,29404864,29404865,29404866,29404867,29404868,29404869,29404870,29404871,29404872,29404873,29404874,29404875,29405199,29405200,29405201,29405202,29405203,29405204,29405205,29405474,29405475,29405476,29405477,29405998,29405999,29406000,29406001,29406002,29406003,29406274,29406275,29406276,29406277,29406278,29406279,29406280,29406424,29406425,29406610,29406611,29406612,29406613,29406614,29406796,29406797,29406798,29406799,29406990,29406991,29406992,29406993,29406994,29406995,29406996,29406997,29407056,29407057,29407058,29407059,29407060,29407061,29407062,29407063,29407250,29407251,29407252,29407253,29407254,29407255,29407256,29407307,29407308,29407309,29407310,29407311,29407408,29407409,29407410,29407411,29407412,29407413,29407694,29407695,29407696,29407697,29407698,29407699,29407731,29407732,29407733,29407734,29407735,29407736,29407737,29407738,29407739,29407740,29407741,29407742,29407743,29407744,29407745,29407746,29407767,29407768,29407769,29407770,29407838,29407839,29407840,29407841,29407842,29407843,29407844,29407845,29407846,29407847,29407848,29407849,29407850,29407851,29407852,29407853,29407854,29407855,29407856,29407857,29408047,29408048,29408049,29408050,29408051,29408052,29408070,29408071,29408072,29408073,29408074,29408075,29408344,29408345,29408346,29408347,29408348,29408349,29408350,29408351,29408352,29408353,29408775,29408776,29408777,29408778,29408779,29408780,29408781,29408782,29408783,29408784,29408827,29408828,29408829,29408830,29408850,29408851,29408852,29408853,29408854,29408855,29409041,29409042,29409043,29409044,29409194,29409195,29409196,29409197,29409198,29409199,29409200,29409539,29409540,29409541,29409542,29409543,29409544,29409720,29409721,29409722,29409723,29409724,29409725,29409726,29409795,29409796,29409797,29409798,29409799,29409800,29409801,29409802,29409803,29409872,29409873,29409874,29409875,29409876,29409877,29409878,29409879,29409880,29409911,29409912,29409913,29409914,29409915,29409916,29409917,29409918,29409919,29409920,29409921,29410049,29410050,29410051,29410052,29410379,29410380,29410381,29410382,29410383,29410384,29410385,29410386,29410415,29410416,29410417,29410418,29410419,29410420,29410421,29410422,29410423,29410424,29410425,29410426,29410427,29410428,29410429,29410430,29410431,29410432,29410474,29410475,29410476,29410477,29410478,29410702,29410703,29410704,29410705,29410706,29410707,29410708,29410709,29410710,29411055,29411056,29411057,29411058,29411059,29411060,29411061,29411062,29411063,29411064,29411065,29411368,29411369,29411370,29411371,29411689,29411690,29411691,29411692,29411693,29411694,29411794,29411795,29411796,29411797,29411798,29411799,29411800,29411801,29411802,29411803,29411804,29411805,29411806,29411807,29411817,29411818,29411819,29411820,29411821,29411822,29411823,29411824,29411825,29411826,29412104,29412105,29412106,29412107,29412273,29412274,29412275,29412276,29412357,29412358,29412359,29412360,29412361,29412362,29412363,29412364,29412365,29412366,29412367,29412368,29412369,29412370,29412766,29412767,29412768,29412769,29412770,29412771,29412772,29412773,29412774,29412775,29412962,29412963,29412964,29412965,29412966,29412967,29412968,29412969,29412970,29412971,29412972,29412973,29412974,29412975,29412976,29412977,29412978,29412979,29412980,29412981,29412982,29412983)
GROUP BY sd.orders_id, sd.sku_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.sales_data_id, sd.orders_id, sd.sku_id,
       group_concat(co.customisation_department),
       SUM(op.products_quantity)
FROM quaysidg_news.sales_data sd
       LEFT JOIN clothes2_osC.orders_products AS op on op.orders_id = sd.orders_id
                 LEFT JOIN clothes2_osC.products_stock AS ps
                      ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
                 LEFT JOIN clothes2_osC.orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
                 LEFT JOIN clothes2_osC.orders_customisations oc
                      on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
                 LEFT JOIN clothes2_osC.customisation_options co ON co.custom_type = oc.custom_type
WHERE op.orders_id = sd.orders_id
          AND opc.customisation_id <> 0
          AND ps.poloMap = sd.sku_id
          AND co.customisation_department <> ''
AND sd.sales_data_id in (29399092,29399093,29399094,29399095,29399096,29399097,29399098,29399099,29399661,29399662,29399663,29399664,29399722,29399723,29399724,29399725,29399726,29399727,29399752,29399753,29399754,29399755,29399840,29399841,29399842,29399843,29399844,29399845,29399872,29399873,29399874,29399875,29399876,29399877,29399878,29399879,29399880,29399881,29399882,29399971,29399972,29399973,29399974,29400112,29400113,29400114,29400115,29400116,29400117,29400323,29400324,29400325,29400326,29400327,29400328,29400547,29400548,29400549,29400550,29400885,29400886,29400887,29400888,29400889,29400890,29400891,29400911,29400912,29400913,29400914,29400915,29400916,29400917,29401443,29401444,29401445,29401446,29401447,29401448,29401449,29401450,29401767,29401768,29401769,29401770,29401888,29401889,29401890,29401891,29401892,29401893,29401894,29401895,29401896,29402432,29402433,29402434,29402435,29402436,29402437,29402438,29402439,29402440,29402441,29402442,29402443,29402444,29402445,29402728,29402729,29402730,29402731,29402732,29402733,29402734,29402735,29404394,29404395,29404396,29404397,29404398,29404557,29404558,29404559,29404560,29404650,29404651,29404652,29404653,29404654,29404655,29404860,29404861,29404862,29404863,29404864,29404865,29404866,29404867,29404868,29404869,29404870,29404871,29404872,29404873,29404874,29404875,29405199,29405200,29405201,29405202,29405203,29405204,29405205,29405474,29405475,29405476,29405477,29405998,29405999,29406000,29406001,29406002,29406003,29406274,29406275,29406276,29406277,29406278,29406279,29406280,29406424,29406425,29406610,29406611,29406612,29406613,29406614,29406796,29406797,29406798,29406799,29406990,29406991,29406992,29406993,29406994,29406995,29406996,29406997,29407056,29407057,29407058,29407059,29407060,29407061,29407062,29407063,29407250,29407251,29407252,29407253,29407254,29407255,29407256,29407307,29407308,29407309,29407310,29407311,29407408,29407409,29407410,29407411,29407412,29407413,29407694,29407695,29407696,29407697,29407698,29407699,29407731,29407732,29407733,29407734,29407735,29407736,29407737,29407738,29407739,29407740,29407741,29407742,29407743,29407744,29407745,29407746,29407767,29407768,29407769,29407770,29407838,29407839,29407840,29407841,29407842,29407843,29407844,29407845,29407846,29407847,29407848,29407849,29407850,29407851,29407852,29407853,29407854,29407855,29407856,29407857,29408047,29408048,29408049,29408050,29408051,29408052,29408070,29408071,29408072,29408073,29408074,29408075,29408344,29408345,29408346,29408347,29408348,29408349,29408350,29408351,29408352,29408353,29408775,29408776,29408777,29408778,29408779,29408780,29408781,29408782,29408783,29408784,29408827,29408828,29408829,29408830,29408850,29408851,29408852,29408853,29408854,29408855,29409041,29409042,29409043,29409044,29409194,29409195,29409196,29409197,29409198,29409199,29409200,29409539,29409540,29409541,29409542,29409543,29409544,29409720,29409721,29409722,29409723,29409724,29409725,29409726,29409795,29409796,29409797,29409798,29409799,29409800,29409801,29409802,29409803,29409872,29409873,29409874,29409875,29409876,29409877,29409878,29409879,29409880,29409911,29409912,29409913,29409914,29409915,29409916,29409917,29409918,29409919,29409920,29409921,29410049,29410050,29410051,29410052,29410379,29410380,29410381,29410382,29410383,29410384,29410385,29410386,29410415,29410416,29410417,29410418,29410419,29410420,29410421,29410422,29410423,29410424,29410425,29410426,29410427,29410428,29410429,29410430,29410431,29410432,29410474,29410475,29410476,29410477,29410478,29410702,29410703,29410704,29410705,29410706,29410707,29410708,29410709,29410710,29411055,29411056,29411057,29411058,29411059,29411060,29411061,29411062,29411063,29411064,29411065,29411368,29411369,29411370,29411371,29411689,29411690,29411691,29411692,29411693,29411694,29411794,29411795,29411796,29411797,29411798,29411799,29411800,29411801,29411802,29411803,29411804,29411805,29411806,29411807,29411817,29411818,29411819,29411820,29411821,29411822,29411823,29411824,29411825,29411826,29412104,29412105,29412106,29412107,29412273,29412274,29412275,29412276,29412357,29412358,29412359,29412360,29412361,29412362,29412363,29412364,29412365,29412366,29412367,29412368,29412369,29412370,29412766,29412767,29412768,29412769,29412770,29412771,29412772,29412773,29412774,29412775,29412962,29412963,29412964,29412965,29412966,29412967,29412968,29412969,29412970,29412971,29412972,29412973,29412974,29412975,29412976,29412977,29412978,29412979,29412980,29412981,29412982,29412983)
GROUP BY sd.orders_id, sd.sku_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.sales_data_id, sd.orders_id, sd.sku_id,
       group_concat(co.customisation_department),
       group_concat(op.products_quantity)
FROM quaysidg_news.sales_data sd
       LEFT JOIN clothes2_osC.orders_products AS op on op.orders_id = sd.orders_id
                 LEFT JOIN clothes2_osC.products_stock AS ps
                      ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
                 LEFT JOIN clothes2_osC.orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
                 LEFT JOIN clothes2_osC.orders_customisations oc
                      on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
                 LEFT JOIN clothes2_osC.customisation_options co ON co.custom_type = oc.custom_type
WHERE op.orders_id = sd.orders_id
          AND opc.customisation_id <> 0
          AND ps.poloMap = sd.sku_id
          AND co.customisation_department <> ''
AND sd.sales_data_id in (29399092,29399093,29399094,29399095,29399096,29399097,29399098,29399099,29399661,29399662,29399663,29399664,29399722,29399723,29399724,29399725,29399726,29399727,29399752,29399753,29399754,29399755,29399840,29399841,29399842,29399843,29399844,29399845,29399872,29399873,29399874,29399875,29399876,29399877,29399878,29399879,29399880,29399881,29399882,29399971,29399972,29399973,29399974,29400112,29400113,29400114,29400115,29400116,29400117,29400323,29400324,29400325,29400326,29400327,29400328,29400547,29400548,29400549,29400550,29400885,29400886,29400887,29400888,29400889,29400890,29400891,29400911,29400912,29400913,29400914,29400915,29400916,29400917,29401443,29401444,29401445,29401446,29401447,29401448,29401449,29401450,29401767,29401768,29401769,29401770,29401888,29401889,29401890,29401891,29401892,29401893,29401894,29401895,29401896,29402432,29402433,29402434,29402435,29402436,29402437,29402438,29402439,29402440,29402441,29402442,29402443,29402444,29402445,29402728,29402729,29402730,29402731,29402732,29402733,29402734,29402735,29404394,29404395,29404396,29404397,29404398,29404557,29404558,29404559,29404560,29404650,29404651,29404652,29404653,29404654,29404655,29404860,29404861,29404862,29404863,29404864,29404865,29404866,29404867,29404868,29404869,29404870,29404871,29404872,29404873,29404874,29404875,29405199,29405200,29405201,29405202,29405203,29405204,29405205,29405474,29405475,29405476,29405477,29405998,29405999,29406000,29406001,29406002,29406003,29406274,29406275,29406276,29406277,29406278,29406279,29406280,29406424,29406425,29406610,29406611,29406612,29406613,29406614,29406796,29406797,29406798,29406799,29406990,29406991,29406992,29406993,29406994,29406995,29406996,29406997,29407056,29407057,29407058,29407059,29407060,29407061,29407062,29407063,29407250,29407251,29407252,29407253,29407254,29407255,29407256,29407307,29407308,29407309,29407310,29407311,29407408,29407409,29407410,29407411,29407412,29407413,29407694,29407695,29407696,29407697,29407698,29407699,29407731,29407732,29407733,29407734,29407735,29407736,29407737,29407738,29407739,29407740,29407741,29407742,29407743,29407744,29407745,29407746,29407767,29407768,29407769,29407770,29407838,29407839,29407840,29407841,29407842,29407843,29407844,29407845,29407846,29407847,29407848,29407849,29407850,29407851,29407852,29407853,29407854,29407855,29407856,29407857,29408047,29408048,29408049,29408050,29408051,29408052,29408070,29408071,29408072,29408073,29408074,29408075,29408344,29408345,29408346,29408347,29408348,29408349,29408350,29408351,29408352,29408353,29408775,29408776,29408777,29408778,29408779,29408780,29408781,29408782,29408783,29408784,29408827,29408828,29408829,29408830,29408850,29408851,29408852,29408853,29408854,29408855,29409041,29409042,29409043,29409044,29409194,29409195,29409196,29409197,29409198,29409199,29409200,29409539,29409540,29409541,29409542,29409543,29409544,29409720,29409721,29409722,29409723,29409724,29409725,29409726,29409795,29409796,29409797,29409798,29409799,29409800,29409801,29409802,29409803,29409872,29409873,29409874,29409875,29409876,29409877,29409878,29409879,29409880,29409911,29409912,29409913,29409914,29409915,29409916,29409917,29409918,29409919,29409920,29409921,29410049,29410050,29410051,29410052,29410379,29410380,29410381,29410382,29410383,29410384,29410385,29410386,29410415,29410416,29410417,29410418,29410419,29410420,29410421,29410422,29410423,29410424,29410425,29410426,29410427,29410428,29410429,29410430,29410431,29410432,29410474,29410475,29410476,29410477,29410478,29410702,29410703,29410704,29410705,29410706,29410707,29410708,29410709,29410710,29411055,29411056,29411057,29411058,29411059,29411060,29411061,29411062,29411063,29411064,29411065,29411368,29411369,29411370,29411371,29411689,29411690,29411691,29411692,29411693,29411694,29411794,29411795,29411796,29411797,29411798,29411799,29411800,29411801,29411802,29411803,29411804,29411805,29411806,29411807,29411817,29411818,29411819,29411820,29411821,29411822,29411823,29411824,29411825,29411826,29412104,29412105,29412106,29412107,29412273,29412274,29412275,29412276,29412357,29412358,29412359,29412360,29412361,29412362,29412363,29412364,29412365,29412366,29412367,29412368,29412369,29412370,29412766,29412767,29412768,29412769,29412770,29412771,29412772,29412773,29412774,29412775,29412962,29412963,29412964,29412965,29412966,29412967,29412968,29412969,29412970,29412971,29412972,29412973,29412974,29412975,29412976,29412977,29412978,29412979,29412980,29412981,29412982,29412983)
GROUP BY sd.orders_id, sd.sku_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT o.orders_id,
       IF((
            SELECT COUNT(*)
            FROM clothes2_osC.custom_names AS cn
            WHERE cn.custom_order_id = o.orders_id
       ) > 0, 1, 0) AS has_nn,
       IF(coe.printed_label_id > 0, 1, 0) AS has_neck_label,
       IF(coe.ind_bags > 0, 1, 0) AS has_individual_bags,
       IF(coe.gift_pricing > 0, 1, 0) AS has_gift_pricing,
       IF(LENGTH(IF(coe.gift_message IS NULL, '', coe.gift_message)) > 0, 1, 0) AS has_gift_message
FROM clothes2_osC.orders AS o
LEFT JOIN clothes2_osC.custom_order_extras AS coe ON o.orders_id = coe.order_id
WHERE o.orders_status IN (2,3,12) AND o.mobile_order = 1
AND o.date_first_processing BETWEEN '2020-03-01 00:00:00' AND NOW();
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.staff_info where first_name like "%Daria%";
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products where orders_id = 5398110;
;-- -. . -..- - / . -. - .-. -.--
select * from poloshir_osC.vendors_stock;
;-- -. . -..- - / . -. - .-. -.--
select * from poloshir_osC.vendors_stock where poloStockId = '700-1-12';
;-- -. . -..- - / . -. - .-. -.--
SELECT t.*
              FROM poloshir_osC.vendors_stock t
              WHERE poloStockId="933-1-12";
;-- -. . -..- - / . -. - .-. -.--
SELECT custom_colours_name, custom_colours_image FROM custom_colours WHERE custom_colours_type = 0 ORDER BY custom_colours_name;
;-- -. . -..- - / . -. - .-. -.--
SELECT custom_colours_name, custom_colours_image, custom_colours_type FROM custom_colours ORDER BY custom_colours_name;
;-- -. . -..- - / . -. - .-. -.--
SELECT custom_colours_name, custom_colours_image, custom_colours_type FROM custom_colours WHERE custom_colours_type = 0 ORDER BY custom_colours_name;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM custom_colours WHERE custom_colours_type = 0 ORDER BY custom_colours_name;
;-- -. . -..- - / . -. - .-. -.--
SELECT custom_colours_id        as id,
       custom_colours_type      as type,
       custom_colours_name      as name,
       custom_colours_image     as image,
       custom_colours_label     as label,
       custom_colours_hex       as hex,
       custom_background_colour as background_colour,
       vinyl_category_id,
       madera_thread_code
FROM custom_colours
WHERE custom_colours_type = 0
ORDER BY custom_colours_name;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM custom_colours ORDER BY custom_colours_name;
;-- -. . -..- - / . -. - .-. -.--
SELECT custom_colours_id        as id,
       custom_colours_type      as type,
       custom_colours_name      as name,
       custom_colours_image     as image,
       custom_colours_label     as label,
       custom_colours_hex       as hex,
       custom_background_colour as background_colour,
       madera_thread_code,
       display_on_frontend
FROM custom_colours
WHERE custom_colours_type = 0
ORDER BY custom_colours_name;
;-- -. . -..- - / . -. - .-. -.--
SHOW FULL PROCESSLIST;
;-- -. . -..- - / . -. - .-. -.--
select * from api_customisation_files;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files where customisation_id = 4612885;
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners_ftp_gateway_accounts;
;-- -. . -..- - / . -. - .-. -.--
select * from pulse_queue;
;-- -. . -..- - / . -. - .-. -.--
select poloMap from products_stock limit 10;
;-- -. . -..- - / . -. - .-. -.--
select poloMap from products_stock where poloMap <> '' limit 10;
;-- -. . -..- - / . -. - .-. -.--
select poloMap from products_stock where poloMap <> '' and poloMap <> 0 limit 10;
;-- -. . -..- - / . -. - .-. -.--
select poloMap from products_stock where poloMap <> '' and poloMap <> 0 order by products_stock_id desc limit 10;
;-- -. . -..- - / . -. - .-. -.--
select * from orders where customers_id is null;
;-- -. . -..- - / . -. - .-. -.--
select * from protx_direct;
;-- -. . -..- - / . -. - .-. -.--
select * from protx_direct where customer_id = 83168;
;-- -. . -..- - / . -. - .-. -.--
select * from qtagcom_osC.polo_customers where customers_email_address = 'info@cowlardconstruction.com';
;-- -. . -..- - / . -. - .-. -.--
select * from qtagcom_osC.protx_direct where customer_id = 83168;
;-- -. . -..- - / . -. - .-. -.--
select * from qtagcom_osC.protx_direct where customer_id = 83168 order by id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from qtagcom_osC.polo_customers_info where customers_info_source_id = 83168;
;-- -. . -..- - / . -. - .-. -.--
select * from qtagcom_osC.polo_customers_info;
;-- -. . -..- - / . -. - .-. -.--
select * from qtagcom_osC.additional_tracking;
;-- -. . -..- - / . -. - .-. -.--
select * from custom_positions;
;-- -. . -..- - / . -. - .-. -.--
SELECT ca . *,
                c.is_duplicate_auto ,c.customisation_type,c.customisation_id as primary_customisations_id,
                c.customisation_font,c.customer_id,c.customisation_crop_applied,c.customisation_online_designer,
                c.is_duplicate,c.duplicate_of, c.customisation_name, c.customisation_logo,c.stitch_count as old_stitch_count,
                c.artwork_file as old_artwork_file,c.artwork_file_2 as old_artwork_file_2,c.artwork_file_3 as old_artwork_file_3, c.artwork_file_4 as old_artwork_file_4,
                c.proof_file as old_proof_file,c.proof_file_2 as old_proof_file_2, c.proof_file_3 as old_proof_file_3
            FROM customisations AS c
            LEFT JOIN customisations_artwork AS ca ON (c.customisation_id = ca.customisation_id)
            WHERE c.customisation_id = '4620147'
            AND ca.deleted_at IS NULL
            ORDER BY ca.date_added DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT ca . *,
                c.is_duplicate_auto ,c.customisation_type,c.customisation_id as primary_customisations_id,
                c.customisation_font,c.customer_id,c.customisation_crop_applied,c.customisation_online_designer,
                c.is_duplicate,c.duplicate_of, c.customisation_name, c.customisation_logo,c.stitch_count as old_stitch_count,
                c.artwork_file as old_artwork_file,c.artwork_file_2 as old_artwork_file_2,c.artwork_file_3 as old_artwork_file_3, c.artwork_file_4 as old_artwork_file_4,
                c.proof_file as old_proof_file,c.proof_file_2 as old_proof_file_2, c.proof_file_3 as old_proof_file_3
            FROM customisations AS c
            LEFT JOIN customisations_artwork AS ca ON (c.customisation_id = ca.customisation_id)
            WHERE c.customisation_id = '481300'
            AND ca.deleted_at IS NULL
            ORDER BY ca.date_added DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT ca . *,
                c.is_duplicate_auto ,c.customisation_type,c.customisation_id as primary_customisations_id,
                c.customisation_font,c.customer_id,c.customisation_crop_applied,c.customisation_online_designer,
                c.is_duplicate,c.duplicate_of, c.customisation_name, c.customisation_logo,c.stitch_count as old_stitch_count,
                c.artwork_file as old_artwork_file,c.artwork_file_2 as old_artwork_file_2,c.artwork_file_3 as old_artwork_file_3, c.artwork_file_4 as old_artwork_file_4,
                c.proof_file as old_proof_file,c.proof_file_2 as old_proof_file_2, c.proof_file_3 as old_proof_file_3
            FROM customisations AS c
            LEFT JOIN customisations_artwork AS ca ON (c.customisation_id = ca.customisation_id)
            WHERE c.customisation_id = '481348'
            AND ca.deleted_at IS NULL
            ORDER BY ca.date_added DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT ca . *,
                c.is_duplicate_auto ,c.customisation_type,c.customisation_id as primary_customisations_id,
                c.customisation_font,c.customer_id,c.customisation_crop_applied,c.customisation_online_designer,
                c.is_duplicate,c.duplicate_of, c.customisation_name, c.customisation_logo,c.stitch_count as old_stitch_count,
                c.artwork_file as old_artwork_file,c.artwork_file_2 as old_artwork_file_2,c.artwork_file_3 as old_artwork_file_3, c.artwork_file_4 as old_artwork_file_4,
                c.proof_file as old_proof_file,c.proof_file_2 as old_proof_file_2, c.proof_file_3 as old_proof_file_3
            FROM customisations AS c
            LEFT JOIN customisations_artwork AS ca ON (c.customisation_id = ca.customisation_id)
            WHERE c.customisation_id = '481348'
            ORDER BY ca.date_added DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT ca . *,
                c.is_duplicate_auto ,c.customisation_type,c.customisation_id as primary_customisations_id,
                c.customisation_font,c.customer_id,c.customisation_crop_applied,c.customisation_online_designer,
                c.is_duplicate,c.duplicate_of, c.customisation_name, c.customisation_logo,c.stitch_count as old_stitch_count,
                c.artwork_file as old_artwork_file,c.artwork_file_2 as old_artwork_file_2,c.artwork_file_3 as old_artwork_file_3, c.artwork_file_4 as old_artwork_file_4,
                c.proof_file as old_proof_file,c.proof_file_2 as old_proof_file_2, c.proof_file_3 as old_proof_file_3
            FROM customisations AS c
            JOIN customisations_artwork AS ca ON (c.customisation_id = ca.customisation_id)
            WHERE c.customisation_id = '481348'
            ORDER BY ca.date_added DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT ca.*,
        (
            SELECT count(ca2.custom_art_id)
            FROM customisations_artwork AS ca2
            WHERE ca2.customisation_id = ca.customisation_id
            AND ca2.file_type = ca.file_type
            AND ca2.deleted_at IS NULL
        ) as versions
    	FROM customisations c, customisations_artwork ca
        WHERE c.customisation_id = '481348'
        AND ca.customisation_id = c.customisation_id
        AND ca.deleted_at IS NULL
        ORDER BY ca.file_type ASC, ca.date_added DESC;
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.staff_info where first_name = 'Magda';
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.staff_info where first_name = '%Magda%';
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.staff_info where first_name = '%Mag%';
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.staff_info where first_name like '%Mag%';
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.staff_info where first_name like 'Magda%';
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.staff_info where first_name like 'Magda%' and employed = 1;
;-- -. . -..- - / . -. - .-. -.--
select api_partner_id from orders where orders_id = 5401856;
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners_shipping_delivery_terms;
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners_shipping_info where api_partner_id = 1788;
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.staff_info where first_name like 'Daniel%' and employed = 1;