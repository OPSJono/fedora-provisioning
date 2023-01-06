SELECT ap.partner_name,
                            apsdt.value as delivery_terms,
                            apsi.street_address_line_1, apsi.street_address_line_2, apsi.street_address_line_3,
                            apsi.postcode, apsi.city, apsi.contact_name, apsi.contact_number, apsi.eori,
                            apsi.signatory_name, apsi.signatory_position, apsi.signatory_image_of_signature
                        FROM api_partners_shipping_info apsi
                        JOIN api_partners_shipping_delivery_terms apsdt on apsdt.id = apsi.delivery_terms_id
                        JOIN api_partners ap on ap.api_partner_id = apsi.api_partner_id
                        WHERE ap.api_partner_id = 6
                        ORDER BY apsi.id DESC
                        LIMIT 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT ap.partner_name,
                            apsdt.value as delivery_terms,
                            apsi.street_address_line_1, apsi.street_address_line_2, apsi.street_address_line_3,
                            apsi.postcode, apsi.city, apsi.contact_name, apsi.contact_number, apsi.eori,
                            apsi.signatory_name, apsi.signatory_position, apsi.signatory_image_of_signature
                        FROM api_partners_shipping_info apsi
                        JOIN api_partners_shipping_delivery_terms apsdt on apsdt.id = apsi.delivery_terms_id
                        JOIN api_partners ap on ap.id = apsi.api_partner_id
                        WHERE ap.id = 6
                        ORDER BY apsi.id DESC
                        LIMIT 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT ap.partner_name as shipper_name,
                            apsdt.value as delivery_terms,
                            apsi.street_address_line_1, apsi.street_address_line_2, apsi.street_address_line_3,
                            apsi.postcode, apsi.city, apsi.country, apsi.contact_name, apsi.contact_number, apsi.eori,
                            apsi.signatory_name, apsi.signatory_position, apsi.signatory_image_of_signature
                        FROM api_partners_shipping_info apsi
                        JOIN api_partners_shipping_delivery_terms apsdt on apsdt.id = apsi.delivery_terms_id
                        JOIN api_partners ap on ap.id = apsi.api_partner_id
                        WHERE ap.id = 6
                        ORDER BY apsi.id DESC
                        LIMIT 1;
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners_shipping_info;
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners where api_key = 'vn12QBAszCprh0QGooYBGXvsh99zLtYGRKg6FnnDtMOFQpdCIzTDHBfvgVvDh8vC';
;-- -. . -..- - / . -. - .-. -.--
SELECT ap.custom_commercial_invoice_price
                        FROM api_partners ap
                        WHERE ap.api_partners_id = "6"
                        LIMIT 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT ap.custom_commercial_invoice_price
                        FROM api_partners ap
                        WHERE ap.id = "6"
                        LIMIT 1;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products where orders_id = 5353114;
;-- -. . -..- - / . -. - .-. -.--
select * from custom_order_data;
;-- -. . -..- - / . -. - .-. -.--
insert into custom_order_unit_data (order_products_id, custom_order_data_id, custom_unit_price) VALUES
(4413821, 7, 10.00),
(4413822, 7, 10.00),
(4413823, 7, 10.00),
(4413824, 7, 10.00),
(4413825, 7, 10.00);
;-- -. . -..- - / . -. - .-. -.--
select * from custom_order_unit_data;
;-- -. . -..- - / . -. - .-. -.--
select * from custom_order_unit_data where custom_order_data_id = 7;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_total where orders_id = 5353114;
;-- -. . -..- - / . -. - .-. -.--
select * from custom_order_data where orders_id = 5353114;
;-- -. . -..- - / . -. - .-. -.--
desc staff_access_logs;
;-- -. . -..- - / . -. - .-. -.--
select * from staff_access_logs;
;-- -. . -..- - / . -. - .-. -.--
select count(*) from staff_access_logs;
;-- -. . -..- - / . -. - .-. -.--
show create table staff_access_logs;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_queue;
;-- -. . -..- - / . -. - .-. -.--
SELECT count(*) as count, max(queue_id) as queue_id
                        FROM shopify_queue limit 10;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_user_options where shopify_user = 1;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_users where shopify_user = 1;
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners where id = 6;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_orders where order_status = 'failed';
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_orders where order_status = 'queued';
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_queue where shopify_user = 1;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_queue where shopify_user = 1 and type = 'order';
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_issues where shopify_user = 1 order by issue_id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_issues where shopify_user = 1 order by shopify_order_id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_orders where order_status != 'queued';
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_orders where order_status != 'queued' order by shopify_order_id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_issues where shopify_user = 1 and shopify_order_id in (38873,38872);
;-- -. . -..- - / . -. - .-. -.--
select * from customers where customers_email_address = 'rU9NidJKVPmUBnag@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
select * from qtagcom_osC.polo_customers where customers_email_address = 'rU9NidJKVPmUBnag@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
select * from qtagcom_osC.polo_address_book where customers_id = 83427;
;-- -. . -..- - / . -. - .-. -.--
SET timestamp=1624519600;
;-- -. . -..- - / . -. - .-. -.--
SELECT o.orders_id, o.date_first_processing, o.due_by_date, o.dispatch_target, o.shipping_type, st.dispatch_name,os.orders_status_name, oc.custom_id, oc.custom_type, co.custom_name, co.customisation_department, oc.customisation_id, oc.assigned_artworker, art_file_ready.custom_box AS art_file_ready, art_file_sent_digi.custom_box AS file_sent_digi, MIN(cca.date) AS date_assigned,
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
SET timestamp=1624519648;
;-- -. . -..- - / . -. - .-. -.--
SELECT o.orders_id, o.date_first_processing, o.due_by_date, o.dispatch_target, o.shipping_type, st.dispatch_name,os.orders_status_name, oc.custom_id, oc.custom_type, co.custom_name, co.customisation_department, oc.customisation_id, oc.assigned_artworker, art_file_ready.custom_box AS art_file_ready, art_file_sent_digi.custom_box AS file_sent_digi, MIN(cca.date) AS date_assigned,
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
GROUP BY oc.custom_id
ORDER BY o.dispatch_target;
;-- -. . -..- - / . -. - .-. -.--
select * from `shipping_types` where `shipping_types`.`shipping_type` = 'threeday_threeday' limit 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT coc.custom_box, co.custom_type
                FROM customisation_options_checkboxes coc, customisation_options co
                WHERE coc.custom_class LIKE 'artwork_file_ready'
                AND co.id = coc.custom_options_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT o.orders_id, count(cn.custom_names_id) AS artwork_count,cn.custom_name,UNIX_TIMESTAMP(o.date_purchased) AS date_purchased_stamp,cn.artwork_done,UNIX_TIMESTAMP(cn.artwork_done) AS artwork_done_stamp
                                          FROM orders AS o, custom_names AS cn
                                          WHERE o.orders_id = cn.custom_order_id
                                          AND cn.custom_name != ''
                                          AND (o.orders_status = '2' OR o.orders_status = '12')
                                          AND cn.artwork_done = '0000-00-00 00:00:00'
                                          GROUP BY o.orders_id, cn.custom_name;
;-- -. . -..- - / . -. - .-. -.--
SET timestamp=1624872493;
;-- -. . -..- - / . -. - .-. -.--
SELECT
                (
                    SELECT SUM(occ.completed_apps) AS apps_complete
                    FROM clothes2_osC.orders_customisations_complete AS occ
                    WHERE occ.staff_id = 846 AND DATE_FORMAT( DATE_ADD( occ.date, INTERVAL 2 HOUR ), '%y-%m-%d') = CURDATE()
                ) AS apps_complete,
                (   SELECT SUM( poa.other_apps )
                    FROM clothes2_osC.production_other_apps AS poa
                    JOIN clothes2_osC.production_staff_actions AS psa ON poa.actions_id = psa.actions_id
                    WHERE psa.staff_id = 846 AND DATE_FORMAT( DATE_ADD( poa.other_apps_date, INTERVAL 2 HOUR ), '%y-%m-%d') = CURDATE()
                ) AS apps_weeded;
;-- -. . -..- - / . -. - .-. -.--
EXPLAIN SELECT
                (
                    SELECT SUM(occ.completed_apps) AS apps_complete
                    FROM clothes2_osC.orders_customisations_complete AS occ
                    WHERE occ.staff_id = 846 AND DATE_FORMAT( DATE_ADD( occ.date, INTERVAL 2 HOUR ), '%y-%m-%d') = CURDATE()
                ) AS apps_complete,
                (   SELECT SUM( poa.other_apps )
                    FROM clothes2_osC.production_other_apps AS poa
                    JOIN clothes2_osC.production_staff_actions AS psa ON poa.actions_id = psa.actions_id
                    WHERE psa.staff_id = 846 AND DATE_FORMAT( DATE_ADD( poa.other_apps_date, INTERVAL 2 HOUR ), '%y-%m-%d') = CURDATE()
                ) AS apps_weeded;
;-- -. . -..- - / . -. - .-. -.--
EXPLAIN SELECT
                (
                    SELECT SUM(occ.completed_apps) ASd apps_complete
                    FROM clothes2_osC.orders_customisations_complete AS occ
                    WHERE occ.staff_id = 846 AND DATE_FORMAT( DATE_ADD( occ.date, INTERVAL 2 HOUR ), '%y-%m-%d') = CURDATE()
                ) AS apps_complete,
                (   SELECT SUM( poa.other_apps )
                    FROM clothes2_osC.production_other_apps AS poa
                    JOIN clothes2_osC.production_staff_actions AS psa ON poa.actions_id = psa.actions_id
                    WHERE psa.staff_id = 846 AND DATE_FORMAT( DATE_ADD( poa.other_apps_date, INTERVAL 2 HOUR ), '%y-%m-%d') = CURDATE()
                ) AS apps_weeded;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM poloshir_osC.vendors_stock
WHERE ral_id > 0 OR ral_id is not '';
;-- -. . -..- - / . -. - .-. -.--
select * from ams.production_files where customisation_id = 4527228;
;-- -. . -..- - / . -. - .-. -.--
select customisation_type from customisations;
;-- -. . -..- - / . -. - .-. -.--
select distinct customisation_type from customisations;
;-- -. . -..- - / . -. - .-. -.--
SELECT CONCAT('="', ps.poloMap, '"') AS SKU, cg.group_name AS CustomisationType, pco.customisation_status AS Suitable
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
JOIN customisation_options co ON pco.customisation_type = co.custom_type
JOIN customisation_groups cg on co.group_id = cg.group_id
WHERE p.products_status = 1
  AND p.products_id NOT IN (2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526, 3198)
  AND ps.poloMap > 0
GROUP BY ps.products_id, ps.poloMap, cg.group_name;
;-- -. . -..- - / . -. - .-. -.--
SELECT CONCAT('"', ps.poloMap, '"') AS SKU, cg.group_name AS CustomisationType, pco.customisation_status AS Suitable
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
JOIN customisation_options co ON pco.customisation_type = co.custom_type
JOIN customisation_groups cg on co.group_id = cg.group_id
WHERE p.products_status = 1
  AND p.products_id NOT IN (2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526, 3198)
  AND ps.poloMap > 0
GROUP BY ps.products_id, ps.poloMap, cg.group_name;
;-- -. . -..- - / . -. - .-. -.--
SELECT ps.poloMap AS SKU, cg.group_name AS CustomisationType, pco.customisation_status AS Suitable
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
JOIN customisation_options co ON pco.customisation_type = co.custom_type
JOIN customisation_groups cg on co.group_id = cg.group_id
WHERE p.products_status = 1
  AND p.products_id NOT IN (2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526, 3198)
  AND ps.poloMap > 0
GROUP BY ps.products_id, ps.poloMap, cg.group_name;
;-- -. . -..- - / . -. - .-. -.--
desc customisations;
;-- -. . -..- - / . -. - .-. -.--
SELECT customisation_id, customisation_comments, customisation_name, customisation_type, is_high_stitch_count,
                                       GREATEST(customisation_width, customisation_width_2, customisation_width_3) AS max_width
#                                        type_group
                                FROM customisations
                                WHERE api_partner_id = 1
                                AND customisation_id > '';
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners;
;-- -. . -..- - / . -. - .-. -.--
SELECT customisation_id, customisation_comments, customisation_name, customisation_type, is_high_stitch_count,
                                       GREATEST(customisation_width, customisation_width_2, customisation_width_3) AS max_width
#                                        type_group
                                FROM customisations
                                WHERE api_partner_id = 6
                                AND customisation_id > '';
;-- -. . -..- - / . -. - .-. -.--
SELECT customisation_id, customisation_comments, customisation_name, customisation_type, is_high_stitch_count,
                                       GREATEST(customisation_width, customisation_width_2, customisation_width_3) AS max_width
#                                        type_group
                                FROM customisations
                                WHERE api_partner_id = 6
                                AND customisation_id = '757170';
;-- -. . -..- - / . -. - .-. -.--
SELECT customisation_id, customisation_comments, customisation_name, customisation_type, is_high_stitch_count,
                                       GREATEST(customisation_width, customisation_width_2, customisation_width_3) AS max_width,
                                       count(distinct oc.order_id) as orders_placed
                                FROM customisations
                                JOIN orders_customisations oc on customisations.customisation_id = oc.customisation_id
                                WHERE api_partner_id = 6
                                AND customisation_id = '757170';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customisation_id, c.customisation_comments, c.customisation_name, c.customisation_type, c.is_high_stitch_count,
                                       GREATEST(c.customisation_width, c.customisation_width_2, c.customisation_width_3) AS max_width,
                                       count(distinct oc.order_id) as orders_placed
                                FROM customisations c
                                JOIN orders_customisations oc on c.customisation_id = oc.customisation_id
                                WHERE api_partner_id = 6
                                AND customisation_id = '757170';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customisation_id, c.customisation_comments, c.customisation_name, c.customisation_type, c.is_high_stitch_count,
                                       GREATEST(c.customisation_width, c.customisation_width_2, c.customisation_width_3) AS max_width,
                                       count(distinct oc.order_id) as orders_placed
                                FROM customisations c
                                JOIN orders_customisations oc on c.customisation_id = oc.customisation_id
                                WHERE c.api_partner_id = 6
                                AND c.customisation_id = '757170';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customisation_id,
       c.customisation_name,
       c.customisation_type,
       c.is_high_stitch_count,
       c.customisation_comments,
       GREATEST(c.customisation_width, c.customisation_width_2, c.customisation_width_3) AS max_width,
       COUNT(DISTINCT oc.order_id) as orders_placed
                                FROM customisations c
                                JOIN orders_customisations oc on c.customisation_id = oc.customisation_id
                                WHERE c.api_partner_id = 6
                                AND c.customisation_id = '757170';
;-- -. . -..- - / . -. - .-. -.--
SELECT c.customisation_id,
       c.customisation_name,
       c.customisation_type,
       c.is_high_stitch_count,
       c.customisation_comments,
       c.artwork_file,
       GREATEST(c.customisation_width, c.customisation_width_2, c.customisation_width_3) AS max_width,
       COUNT(DISTINCT oc.order_id) as orders_placed
FROM customisations c
JOIN orders_customisations oc on c.customisation_id = oc.customisation_id
WHERE c.api_partner_id = 6
AND c.customisation_id = '757170';
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE IF EXISTS `clothes2_osC`.`application_count_data`;
;-- -. . -..- - / . -. - .-. -.--
desc `clothes2_osC`.`application_count_data`;
;-- -. . -..- - / . -. - .-. -.--
select * from `clothes2_osC`.`api_partners`;
;-- -. . -..- - / . -. - .-. -.--
select * from `clothes2_osC`.`customisations` where customisation_id = 4452703;
;-- -. . -..- - / . -. - .-. -.--
select * from customisations_artwork;
;-- -. . -..- - / . -. - .-. -.--
select * from products_options;
;-- -. . -..- - / . -. - .-. -.--
select * from products_options_values;
;-- -. . -..- - / . -. - .-. -.--
select * from custom_positions_products;
;-- -. . -..- - / . -. - .-. -.--
SELECT CONCAT('="', ps.poloMap, '"') AS SKU
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
WHERE p.products_status = 1
  AND p.products_id NOT IN (2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526, 3198)
  AND ps.poloMap > 0
GROUP BY ps.products_id, ps.poloMap, cpc.custom_positions_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT CONCAT('="', ps.poloMap, '"') AS SKU, cpc.custom_positions_id as Position
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
WHERE p.products_status = 1
  AND p.products_id NOT IN (2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526, 3198)
  AND ps.poloMap > 0
GROUP BY ps.products_id, ps.poloMap, cpc.custom_positions_id;
;-- -. . -..- - / . -. - .-. -.--
select * from custom_positions;
;-- -. . -..- - / . -. - .-. -.--
SELECT CONCAT('="', ps.poloMap, '"') AS SKU, cpc.custom_positions_id as PositionId, cp.short_name as PositionName
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
SELECT CONCAT('="', ps.poloMap, '"') AS SKU,
       cpc.custom_positions_id as PositionId,
       cp.short_name as PositionName,
       cp.max_width_cm
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
SELECT CONCAT('="', ps.poloMap, '"') AS SKU,
       cpc.custom_positions_id as PositionId,
       cp.short_name as PositionName,
       cp.max_width_cm as MaxCustomisationWidthInCM
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
SELECT CONCAT('="', ps.poloMap, '"') AS SKU,
       cpc.custom_positions_id as PositionId,
       cp.short_name as PositionName
#        cp.max_width_cm as MaxCustomisationWidthInCM
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
desc clothes2_osC.pulse_queue;
;-- -. . -..- - / . -. - .-. -.--
select distinct status_at_last_check from clothes2_osC.pulse_queue;
;-- -. . -..- - / . -. - .-. -.--
select * from customisations_artwork_file_types;
;-- -. . -..- - / . -. - .-. -.--
select distinct file_type_id from clothes2_osC.pulse_queue;
;-- -. . -..- - / . -. - .-. -.--
select * from clothes2_osC.pulse_queue;
;-- -. . -..- - / . -. - .-. -.--
select * from orders where orders_id = 5353177;
;-- -. . -..- - / . -. - .-. -.--
select * from customers_basket;
;-- -. . -..- - / . -. - .-. -.--
select * from configuration;
;-- -. . -..- - / . -. - .-. -.--
select * from configuration where configuration_key like "%MAIL%";
;-- -. . -..- - / . -. - .-. -.--
SELECT o.dispatch_days_revised,
                   o.orders_id,
                   o.date_purchased,
                   o.last_modified,
                   o.due_by_date,
                   o.shipping_type,
                   o.billing_company,
                   o.billing_street_address,
                   o.billing_suburb,
                   o.billing_city,
                   o.billing_postcode,
                   o.billing_country,
                   o.customers_name,
                   o.payment_method,
                   o.ms_store_id,
                   o.staff_name,
                   IF((o.staff_name != '' OR o.pre_order_id > 0), 'ACCMAN',
                        IF(o.payment_method = 'API',
                            IF(o.ms_store_id > 0, 'MERCH', 'API'),
                                IF(o.payment_method = 'Replacement', 'REPLACE', 'ECOM')
                            )
                        ) AS channel
                   oct.*,
                   (
                        SELECT date_added
                        FROM orders_status_history
                        WHERE orders_id = o.orders_id
                        AND orders_status_id = 3
                        ORDER BY date_added
                        LIMIT 0,1
                    ) AS date_dispatched, (
                        SELECT ocant.text
                        FROM orders_cancellations ocan, orders_cancellations_types ocant
                        WHERE ocan.orders_id = o.orders_id
                        AND ocant.id = ocan.type
                        ORDER BY ocan.id DESC
                        LIMIT 0,1
                    ) AS cancellation_text
                    FROM orders o, orders_customisations_types oct
                    WHERE o.orders_id = oct.orders_id

                    AND (oct.print_vinyl = 1 OR oct.print_dtg = 1 OR oct.print_breeze = 1 OR oct.print_storm = 1 OR oct.print_val = 1 OR (oct.emb = 1 OR oct.emb_sw = 1 OR oct.print_sw = 1 OR oct.print_pw = 1 OR oct.emb_kingf = 1 OR oct.print_ll = 1 OR oct.emb_ls = 1 OR oct.print_val_p = 1 OR oct.print_tp = 1 OR oct.print_klx = 1 OR oct.print_jq = 1) OR oct.emb_qs = 1 OR oct.print_versacamm = 1 OR oct.print_laser = 1)
                    AND o.orders_status = '3'
                    AND o.last_modified BETWEEN '2018-07-08 0:00:00' AND '2019-07-28 0:00:00'
                    GROUP BY o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT o.dispatch_days_revised,
                   o.orders_id,
                   o.date_purchased,
                   o.last_modified,
                   o.due_by_date,
                   o.shipping_type,
                   o.billing_company,
                   o.billing_street_address,
                   o.billing_suburb,
                   o.billing_city,
                   o.billing_postcode,
                   o.billing_country,
                   o.customers_name,
                   o.payment_method,
                   o.ms_store_id,
                   o.staff_name,
                   IF((o.staff_name != '' OR o.pre_order_id > 0), 'ACCMAN',
                        IF(o.payment_method = 'API',
                            IF(o.ms_store_id > 0, 'MERCH', 'API'),
                                IF(o.payment_method = 'Replacement', 'REPLACE', 'ECOM')
                            )
                        ) AS channel
                   oct.*
                   (
                        SELECT date_added
                        FROM orders_status_history
                        WHERE orders_id = o.orders_id
                        AND orders_status_id = 3
                        ORDER BY date_added
                        LIMIT 0,1
                    ) AS date_dispatched, (
                        SELECT ocant.text
                        FROM orders_cancellations ocan, orders_cancellations_types ocant
                        WHERE ocan.orders_id = o.orders_id
                        AND ocant.id = ocan.type
                        ORDER BY ocan.id DESC
                        LIMIT 0,1
                    ) AS cancellation_text
                    FROM orders o, orders_customisations_types oct
                    WHERE o.orders_id = oct.orders_id

                    AND (oct.print_vinyl = 1 OR oct.print_dtg = 1 OR oct.print_breeze = 1 OR oct.print_storm = 1 OR oct.print_val = 1 OR (oct.emb = 1 OR oct.emb_sw = 1 OR oct.print_sw = 1 OR oct.print_pw = 1 OR oct.emb_kingf = 1 OR oct.print_ll = 1 OR oct.emb_ls = 1 OR oct.print_val_p = 1 OR oct.print_tp = 1 OR oct.print_klx = 1 OR oct.print_jq = 1) OR oct.emb_qs = 1 OR oct.print_versacamm = 1 OR oct.print_laser = 1)
                    AND o.orders_status = '3'
                    AND o.last_modified BETWEEN '2018-07-08 0:00:00' AND '2019-07-28 0:00:00'
                    GROUP BY o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT o.dispatch_days_revised,
                   o.orders_id,
                   o.date_purchased,
                   o.last_modified,
                   o.due_by_date,
                   o.shipping_type,
                   o.billing_company,
                   o.billing_street_address,
                   o.billing_suburb,
                   o.billing_city,
                   o.billing_postcode,
                   o.billing_country,
                   o.customers_name,
                   o.payment_method,
                   o.ms_store_id,
                   o.staff_name,
                   IF((o.staff_name != '' OR o.pre_order_id > 0), 'ACCMAN',
                        IF(o.payment_method = 'API',
                            IF(o.ms_store_id > 0, 'MERCH', 'API'),
                                IF(o.payment_method = 'Replacement', 'REPLACE', 'ECOM')
                            )
                        ) AS channel,
                   oct.*
                   (
                        SELECT date_added
                        FROM orders_status_history
                        WHERE orders_id = o.orders_id
                        AND orders_status_id = 3
                        ORDER BY date_added
                        LIMIT 0,1
                    ) AS date_dispatched, (
                        SELECT ocant.text
                        FROM orders_cancellations ocan, orders_cancellations_types ocant
                        WHERE ocan.orders_id = o.orders_id
                        AND ocant.id = ocan.type
                        ORDER BY ocan.id DESC
                        LIMIT 0,1
                    ) AS cancellation_text
                    FROM orders o, orders_customisations_types oct
                    WHERE o.orders_id = oct.orders_id

                    AND (oct.print_vinyl = 1 OR oct.print_dtg = 1 OR oct.print_breeze = 1 OR oct.print_storm = 1 OR oct.print_val = 1 OR (oct.emb = 1 OR oct.emb_sw = 1 OR oct.print_sw = 1 OR oct.print_pw = 1 OR oct.emb_kingf = 1 OR oct.print_ll = 1 OR oct.emb_ls = 1 OR oct.print_val_p = 1 OR oct.print_tp = 1 OR oct.print_klx = 1 OR oct.print_jq = 1) OR oct.emb_qs = 1 OR oct.print_versacamm = 1 OR oct.print_laser = 1)
                    AND o.orders_status = '3'
                    AND o.last_modified BETWEEN '2018-07-08 0:00:00' AND '2019-07-28 0:00:00'
                    GROUP BY o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT o.dispatch_days_revised,
                   o.orders_id,
                   o.date_purchased,
                   o.last_modified,
                   o.due_by_date,
                   o.shipping_type,
                   o.billing_company,
                   o.billing_street_address,
                   o.billing_suburb,
                   o.billing_city,
                   o.billing_postcode,
                   o.billing_country,
                   o.customers_name,
                   o.payment_method,
                   o.ms_store_id,
                   o.staff_name,
                   IF((o.staff_name != '' OR o.pre_order_id > 0), 'ACCMAN',
                        IF(o.payment_method = 'API',
                            IF(o.ms_store_id > 0, 'MERCH', 'API'),
                                IF(o.payment_method = 'Replacement', 'REPLACE', 'ECOM')
                            )
                        ) AS channel,
                   oct.*,
                   (
                        SELECT date_added
                        FROM orders_status_history
                        WHERE orders_id = o.orders_id
                        AND orders_status_id = 3
                        ORDER BY date_added
                        LIMIT 0,1
                    ) AS date_dispatched, (
                        SELECT ocant.text
                        FROM orders_cancellations ocan, orders_cancellations_types ocant
                        WHERE ocan.orders_id = o.orders_id
                        AND ocant.id = ocan.type
                        ORDER BY ocan.id DESC
                        LIMIT 0,1
                    ) AS cancellation_text
                    FROM orders o, orders_customisations_types oct
                    WHERE o.orders_id = oct.orders_id

                    AND (oct.print_vinyl = 1 OR oct.print_dtg = 1 OR oct.print_breeze = 1 OR oct.print_storm = 1 OR oct.print_val = 1 OR (oct.emb = 1 OR oct.emb_sw = 1 OR oct.print_sw = 1 OR oct.print_pw = 1 OR oct.emb_kingf = 1 OR oct.print_ll = 1 OR oct.emb_ls = 1 OR oct.print_val_p = 1 OR oct.print_tp = 1 OR oct.print_klx = 1 OR oct.print_jq = 1) OR oct.emb_qs = 1 OR oct.print_versacamm = 1 OR oct.print_laser = 1)
                    AND o.orders_status = '3'
                    AND o.last_modified BETWEEN '2018-07-08 0:00:00' AND '2019-07-28 0:00:00'
                    GROUP BY o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
select * from tep_mail_sent;
;-- -. . -..- - / . -. - .-. -.--
select * from tep_mail_sent order by id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from tep_mail_sent customers_email_address = 'tom.coad@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
select * from tep_mail_sent where customers_email_address = 'tom.coad@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
select * from customers where customers_email_address = 'tom.coad@c2o.com';
;-- -. . -..- - / . -. - .-. -.--
select * from products where products_id = 427;
;-- -. . -..- - / . -. - .-. -.--
select * from products_description where products_id = 2;
;-- -. . -..- - / . -. - .-. -.--
select * from products_description where products_id = 937;
;-- -. . -..- - / . -. - .-. -.--
select * from products_description where products_id = 938;
;-- -. . -..- - / . -. - .-. -.--
select * from products_description where products_id = 427;
;-- -. . -..- - / . -. - .-. -.--
select * from products_description where products_id = 1525;
;-- -. . -..- - / . -. - .-. -.--
select * from products_description where products_id = 1526;
;-- -. . -..- - / . -. - .-. -.--
select * from pulse_queue;
;-- -. . -..- - / . -. - .-. -.--
select * from pulse_queue order by id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from pulse_queue where customisation_id = 4453291 order by id desc;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE clothes2_osC.shopify_customisations
ADD KEY idx_shop_file(shopify_user, file_id),
ALGORITHM=INPLACE, LOCK=NONE;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE clothes2_osC.shopify_images
ADD KEY idx_user(shopify_user),
ALGORITHM=INPLACE, LOCK=NONE;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE poloshir_osC.staff_clocking
ADD KEY idx_clock_in(clock_in);
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.*, o.orders_status AS real_status, ap.partner_name
                    FROM quaysidg_news.sales_data AS sd
                    LEFT JOIN clothes2_osC.orders AS o ON sd.orders_id = o.orders_id
                    LEFT JOIN clothes2_osC.api_partners AS ap ON ap.id = o.api_partner_id

                    WHERE (
                        (sd.date_dispatched BETWEEN '2021-04-01 00:00:00' AND '2021-08-20 00:00:00')
                        OR
                        (sd.date_purchased BETWEEN '2021-04-01 00:00:00' AND '2021-08-20 00:00:00')
                    )
                    AND sd.site = 'C2O'

                    ORDER BY orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.*, o.orders_status AS real_status, ap.partner_name
                    FROM quaysidg_news.sales_data AS sd
                    LEFT JOIN clothes2_osC.orders AS o ON sd.orders_id = o.orders_id
                    LEFT JOIN clothes2_osC.api_partners AS ap ON ap.id = o.api_partner_id

                    WHERE (
                        (sd.date_dispatched BETWEEN '2021-04-19 00:00:00' AND '2021-04-22 00:00:00')
                        OR
                        (sd.date_purchased BETWEEN '2021-04-19 00:00:00' AND '2021-04-22 00:00:00')
                    )
                    AND sd.site = 'C2O'

                    ORDER BY orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE quaysidg_news.sales_data ADD COLUMN dtg_apps int after category;
;-- -. . -..- - / . -. - .-. -.--
use clothes2_osC;
;-- -. . -..- - / . -. - .-. -.--
desc quaysidg_news.sales_data;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE quaysidg_news.sales_data ADD COLUMN emb_apps int after emb_apps, ALGORITHM=inplace LOCK=none;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE quaysidg_news.sales_data ADD COLUMN emb_apps int after emb_apps, ALGORITHM=inplace, LOCK=none;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE quaysidg_news.sales_data ADD COLUMN emb_apps int after dtg_apps, ALGORITHM=inplace, LOCK=none;
;-- -. . -..- - / . -. - .-. -.--
show processlist;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE quaysidg_news.sales_data ADD COLUMN trn_apps int after emb_apps, ALGORITHM=inplace, LOCK=none;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE quaysidg_news.sales_data ADD COLUMN nn_apps int after trn_apps, ALGORITHM=inplace, LOCK=none;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products_customisations order by orders_id desc limit 5;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products_customisations opc
WHERE opc.orders_id in (5356618,
5356618,
5356616,
5356615,
5356615)
order by orders_id desc limit 5;
;-- -. . -..- - / . -. - .-. -.--
select *
from orders_products_customisations opc
         join orders_products op on opc.orders_id = op.orders_id
WHERE opc.orders_id in (
        5356618,
        5356618,
        5356616,
        5356615,
        5356615
    );
;-- -. . -..- - / . -. - .-. -.--
select opc.*, count(op.orders_products_id)
from orders_products_customisations opc
         join orders_products op on opc.orders_id = op.orders_id
WHERE opc.orders_id in (
        5356618,
        5356618,
        5356616,
        5356615,
        5356615
    );
;-- -. . -..- - / . -. - .-. -.--
select opc.*, count(op.orders_products_id)
from orders_products_customisations opc
         join orders_products op on opc.orders_id = op.orders_id
WHERE opc.orders_id in (
        5356618,
        5356618,
        5356616,
        5356615,
        5356615
    )

group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select opc.*, count(op.orders_products_id) as apps_on_this_garment
from orders_products_customisations opc
         join orders_products op on opc.orders_id = op.orders_id
WHERE opc.orders_id in (
        5356618,
        5356618,
        5356616,
        5356615,
        5356615
    )

group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select opc.*, count(op.orders_products_id) as apps_on_this_garment
from orders_products_customisations opc
         join orders_products op on opc.orders_id = op.orders_id
WHERE opc.orders_id in (
        5356618,
        5356618,
        5356616,
        5356615,
        5356615
    )

group by op.products_id, opc.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
select opc.*, count(op.orders_products_id) as apps_on_this_garment
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join customisations c on opc.customisation_id = c.customisation_id

WHERE opc.orders_id in (
        5356618,
        5356618,
        5356616,
        5356615,
        5356615
    )

group by op.products_id, c.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
select opc.*,
       count(op.orders_products_id) as apps_on_this_garment,
       c.customisation_type
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join customisations c on opc.customisation_id = c.customisation_id

WHERE opc.orders_id in (
        5356618,
        5356618,
        5356616,
        5356615,
        5356615
    )

group by op.products_id, c.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
select opc.*,
       count(op.orders_products_id) as apps_on_this_garment,
       c.customisation_type,
       oc.custom_type,
       oc.primary_type
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join customisations c on opc.customisation_id = c.customisation_id
    join orders_customisations oc on c.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id

WHERE opc.orders_id in (
        5356618,
        5356618,
        5356616,
        5356615,
        5356615
    )

group by op.products_id, c.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
select opc.*,
       count(op.orders_products_id) as apps_on_this_garment,
       c.customisation_type,
       oc.custom_type,
       oc.custom_id, order_id, custom_type, application_count
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join customisations c on opc.customisation_id = c.customisation_id
    join orders_customisations oc on c.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id

WHERE opc.orders_id in (
        5356618,
        5356618,
        5356616,
        5356615,
        5356615
    )

group by op.products_id, c.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
select opc.*,
       count(op.orders_products_id) as apps_on_this_garment,
       c.customisation_type,
       oc.custom_type
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join customisations c on opc.customisation_id = c.customisation_id
    join orders_customisations oc on c.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id

WHERE opc.orders_id in (
        5356618,
        5356618,
        5356616,
        5356615,
        5356615
    )

group by op.products_id, c.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
select count(opc.orders_products_customisations_id),
       count(op.orders_products_id) as apps_on_this_garment,
       c.customisation_type,
       oc.custom_type
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join customisations c on opc.customisation_id = c.customisation_id
    join orders_customisations oc on c.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id

WHERE opc.orders_id in (
        5356618,
        5356618,
        5356616,
        5356615,
        5356615
    )

group by op.products_id, c.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
select oc.customisation_id,
       count(op.orders_products_id) as app_count,
       c.customisation_type,
       oc.custom_type
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join customisations c on opc.customisation_id = c.customisation_id
    join orders_customisations oc on c.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id

WHERE opc.orders_id in (
        5356618,
        5356618,
        5356616,
        5356615,
        5356615
    )

group by op.products_id, c.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
select oc.customisation_id,
       count(op.orders_products_id) as app_count,
       c.customisation_type,
       oc.custom_type
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join customisations c on opc.customisation_id = c.customisation_id
    join orders_customisations oc on c.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
WHERE opc.orders_id in (
    5356618,
    5356618
)
group by op.products_id, c.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
select oc.customisation_id,
       count(op.orders_products_id) as app_count,
       c.customisation_type,
       oc.custom_type
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join customisations c on opc.customisation_id = c.customisation_id
    join orders_customisations oc on c.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
WHERE opc.orders_id in (
    5356615
)
group by op.products_id, c.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
select oc.customisation_id,
       count(op.orders_products_id) as app_count,
       c.customisation_type,
       oc.custom_type
from orders_products_customisations opc
    join orders_products op on opc.orders_id = op.orders_id
    join customisations c on opc.customisation_id = c.customisation_id
    join orders_customisations oc on c.customisation_id = oc.customisation_id and opc.orders_id = oc.order_id
WHERE opc.orders_id in (
    5356618,
    5356616,
    5356615
)
group by op.products_id, c.customisation_id;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_applications;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_customisations_types;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_options;
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
select * from custom_names order by custom_order_id desc;
;-- -. . -..- - / . -. - .-. -.--
select count(op.orders_products_id) as app_count
from custom_names cn
    join orders_products op on cn.custom_order_id = op.orders_id
WHERE cn.custom_order_id in (
    5356597,
    5356594,
    5356592,
    5356583
)
group by op.products_id;
;-- -. . -..- - / . -. - .-. -.--
select count(op.orders_products_id) as app_count
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
select group_concat(cn.custom_order_id),
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
SELECT op.orders_id,
                       op.products_id,
                       count(op.products_quantity) AS nn_app_count
                FROM custom_names cn
                    JOIN orders_products op ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                                            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
                WHERE cn.custom_order_id = 5356597
                AND op.products_id = 432 # 432,765
                GROUP BY op.products_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT sum(products_quantity) AS app_count
            FROM orders_products op
                JOIN orders_customisations oc ON op.orders_id = oc.order_id
                JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE
                co.customisation_department <> ''
            AND op.orders_id = 5356597
            
            #AND co.customisation_department = ". general::db_input($department)."
            GROUP BY op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.products_id, sum(products_quantity) AS app_count
            FROM orders_products op
                JOIN orders_customisations oc ON op.orders_id = oc.order_id
                JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE
                co.customisation_department <> ''
            AND op.orders_id = 5356597

            #AND co.customisation_department = ". general::db_input($department)."
            GROUP BY op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT sum(products_quantity) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356481
  AND op.products_id = 700
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT count(products_quantity) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356481
  AND op.products_id = 700
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT sum(products_quantity) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356481
  AND op.products_id = 700
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.products_id, op.products_stock_attributes,sum(products_quantity) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356481
  AND op.products_id = 700
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT sum(products_quantity) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356481
  AND op.products_id = 700
  AND op.products_stock_attributes = '1-4,2-11'
  AND co.customisation_department = 'Embroidery'
GROUP BY co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
explain SELECT sum(products_quantity) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356481
  AND op.products_id = 700
  AND op.products_stock_attributes = '1-4,2-11'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT sum(products_quantity) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356481
  AND op.products_id = 700
  AND op.products_stock_attributes = '1-4,2-11'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT sum(products_quantity) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356481
  AND op.products_id = 700
  AND op.products_stock_attributes = '1-3,2-11'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT sum(products_quantity) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
  AND op.products_id = 700
  AND op.products_stock_attributes = '1-150,2-12'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT count(products_quantity) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
  AND op.products_id = 700
  AND op.products_stock_attributes = '1-150,2-12'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT products_quantity AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
  AND op.products_id = 700
  AND op.products_stock_attributes = '1-150,2-12'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT products_quantity AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
  AND op.products_id = 700
  #AND op.products_stock_attributes = '1-150,2-12'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT products_quantity AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
#   AND op.products_id = 700
  #AND op.products_stock_attributes = '1-150,2-12'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT products_quantity AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
  AND op.products_id = 700
  AND op.products_stock_attributes = '1-150,2-12'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT products_quantity AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
  AND op.products_id = 700
  #AND op.products_stock_attributes = '1-150,2-12'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
op.products_id,
op.products_stock_attributes,sum(products_quantity) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356481
  AND op.products_id = 700
  AND op.products_stock_attributes = '1-3,2-11'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT products_quantity AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356481
  AND op.products_id = 700
  #AND op.products_stock_attributes = '1-150,2-12'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
op.products_id,
op.products_stock_attributes,sum(products_quantity) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
  AND op.products_id = 700
  AND op.products_stock_attributes = '1-3,2-11'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
op.products_id,
op.products_stock_attributes,sum(products_quantity) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
  AND op.products_id = 700
#   AND op.products_stock_attributes = '1-3,2-11'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
op.products_id,
op.products_stock_attributes,sum(products_quantity) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
  AND op.products_id = 700
#   AND op.products_stock_attributes = '1-3,2-11'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
op.products_id,
op.products_stock_attributes,products_quantity AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
  AND op.products_id = 700
#   AND op.products_stock_attributes = '1-3,2-11'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       products_quantity AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
  AND op.products_id = 700
#   AND op.products_stock_attributes = '1-3,2-11'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT products_quantity AS app_count
            FROM orders_products op
                JOIN orders_customisations oc ON op.orders_id = oc.order_id
                JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE
                co.customisation_department <> ''
            AND op.orders_id = 5356597
            AND op.products_id = 700
#             AND op.products_stock_attributes = '". general::db_input($products_stock_attributes) ."'
            AND co.customisation_department = 'Embroidery'
            GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       products_quantity AS app_count
            FROM orders_products op
                JOIN orders_customisations oc ON op.orders_id = oc.order_id
                JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE
                co.customisation_department <> ''
            AND op.orders_id = 5356597
            AND op.products_id = 700
#             AND op.products_stock_attributes = '". general::db_input($products_stock_attributes) ."'
            AND co.customisation_department = 'Embroidery'
            GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products where orders_id = 5356597;
;-- -. . -..- - / . -. - .-. -.--
select * from poloshir_osC.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
select * from poloshir_osC.polo_products_options_values;
;-- -. . -..- - / . -. - .-. -.--
select * from poloshir_osC.polo_products_options_values_to_products_options;
;-- -. . -..- - / . -. - .-. -.--
select * from poloshir_osC.products_stock;
;-- -. . -..- - / . -. - .-. -.--
select * from poloshir_osC.products_stock where poloStockId = '933-434-12';
;-- -. . -..- - / . -. - .-. -.--
select * from clothes2_osC.products_stock;
;-- -. . -..- - / . -. - .-. -.--
select * from clothes2_osC.products_stock where poloMap = '933-434-12';
;-- -. . -..- - / . -. - .-. -.--
SELECT op.products_quantity AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
  AND op.products_id = 700
#   AND op.products_stock_attributes = '1-3,2-11'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.products_quantity AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
  AND op.products_id = 700
  AND op.products_stock_attributes = '1-3,2-11'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       op.products_quantity AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
  AND op.products_id = 700
#   AND op.products_stock_attributes = '1-3,2-11'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       op.products_quantity AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
  AND op.products_id = 700
  AND op.products_stock_attributes = '1-249,2-12'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.products_quantity AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
  AND op.products_id = 700
  AND op.products_stock_attributes = '1-249,2-12'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
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
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       group_concat(op.products_quantity) AS nn_app_count
FROM custom_names cn
    JOIN orders_products op ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
WHERE cn.custom_order_id = 5356597
# AND op.products_id = 432 # 432,765
# AND op.products_stock_attributes = '1-2,2-13' # '1-2,2-13','1-2,2-14'
GROUP BY op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       group_concat(op.products_quantity) AS nn_app_count
FROM custom_names cn
    JOIN orders_products op ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
WHERE cn.custom_order_id = 5356597
AND op.products_id = 630 # 630, 700
AND op.products_stock_attributes = '1-358,2-12' #'1-358,2-12' # '1-150,2-12','1-249,2-12'
GROUP BY op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       op.products_quantity AS nn_app_count
FROM custom_names cn
    JOIN orders_products op ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
WHERE cn.custom_order_id = 5356597
AND op.products_id = 630 # 630, 700
AND op.products_stock_attributes = '1-358,2-12' #'1-358,2-12' # '1-150,2-12','1-249,2-12'
GROUP BY op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       max(op.products_quantity) AS nn_app_count
FROM custom_names cn
    JOIN orders_products op ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
WHERE cn.custom_order_id = 5356597
AND op.products_id = 630 # 630, 700
AND op.products_stock_attributes = '1-358,2-12' #'1-358,2-12' # '1-150,2-12','1-249,2-12'
GROUP BY op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       count(cn.custom_names_id) AS nn_app_count
FROM custom_names cn
    JOIN orders_products op ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
WHERE cn.custom_order_id = 5356597
AND op.products_id = 630 # 630, 700
AND op.products_stock_attributes = '1-358,2-12' #'1-358,2-12' # '1-150,2-12','1-249,2-12'
GROUP BY op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.products_quantity AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
         JOIN orders_products_customisations opc on oc.customisation_id = opc.customisation_id
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
  AND op.products_id = 700
  AND op.products_stock_attributes = '1-249,2-12'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.products_quantity AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
         JOIN orders_products_customisations opc on oc.customisation_id = opc.customisation_id
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
  AND op.products_id = 700
#   AND op.products_stock_attributes = '1-249,2-12'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.products_quantity AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
         JOIN orders_products_customisations opc on oc.customisation_id = opc.customisation_id
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
#   AND op.products_id = 700
#   AND op.products_stock_attributes = '1-249,2-12'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       op.products_quantity AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
         JOIN orders_products_customisations opc on oc.customisation_id = opc.customisation_id
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
#   AND op.products_id = 700
#   AND op.products_stock_attributes = '1-249,2-12'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       group_concat(op.products_quantity) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
         JOIN orders_products_customisations opc on oc.customisation_id = opc.customisation_id
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
#   AND op.products_id = 700
#   AND op.products_stock_attributes = '1-249,2-12'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       group_concat(op.products_quantity) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
#          JOIN orders_products_customisations opc on oc.customisation_id = opc.customisation_id
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
#   AND op.products_id = 700
#   AND op.products_stock_attributes = '1-249,2-12'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       group_concat(op.products_quantity) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
#          JOIN orders_products_customisations opc on oc.customisation_id = opc.customisation_id
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
#   AND op.products_id = 700
#   AND op.products_stock_attributes = '1-249,2-12'
  AND co.customisation_department = 'Embroidery'
  AND op.products_stock_attributes <> ''
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       op.products_quantity AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
#          JOIN orders_products_customisations opc on oc.customisation_id = opc.customisation_id
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
#   AND op.products_id = 700
#   AND op.products_stock_attributes = '1-249,2-12'
  AND co.customisation_department = 'Embroidery'
  AND op.products_stock_attributes <> ''
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       sum(op.products_quantity) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
#          JOIN orders_products_customisations opc on oc.customisation_id = opc.customisation_id
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
#   AND op.products_id = 700
#   AND op.products_stock_attributes = '1-249,2-12'
  AND co.customisation_department = 'Embroidery'
  AND op.products_stock_attributes <> ''
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       op.products_quantity AS app_count,
       count(opc.orders_products_customisations_id) as customisation_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
         JOIN orders_products_customisations opc on oc.customisation_id = opc.customisation_id
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
#   AND op.products_id = 700
#   AND op.products_stock_attributes = '1-249,2-12'
  AND co.customisation_department = 'Embroidery'
  AND op.products_stock_attributes <> ''
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       op.products_quantity AS app_count,
       count(opc.customisation_id) as customisation_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
         JOIN orders_products_customisations opc on op.orders_products_id = opc.orders_products_id
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
#   AND op.products_id = 700
#   AND op.products_stock_attributes = '1-249,2-12'
  AND co.customisation_department = 'Embroidery'
  AND op.products_stock_attributes <> ''
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       op.products_quantity AS app_count,
       group_concat(opc.customisation_id) as customisation_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
         JOIN orders_products_customisations opc on op.orders_products_id = opc.orders_products_id
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
#   AND op.products_id = 700
#   AND op.products_stock_attributes = '1-249,2-12'
  AND co.customisation_department = 'Embroidery'
  AND op.products_stock_attributes <> ''
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       op.products_quantity AS app_count,
       count(distinct opc.customisation_id) as customisation_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
         JOIN orders_products_customisations opc on op.orders_products_id = opc.orders_products_id
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
#   AND op.products_id = 700
#   AND op.products_stock_attributes = '1-249,2-12'
  AND co.customisation_department = 'Embroidery'
  AND op.products_stock_attributes <> ''
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       op.products_quantity * count(distinct opc.customisation_id) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
         JOIN orders_products_customisations opc on op.orders_products_id = opc.orders_products_id
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
#   AND op.products_id = 700
#   AND op.products_stock_attributes = '1-249,2-12'
  AND co.customisation_department = 'Embroidery'
  AND op.products_stock_attributes <> ''
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       op.products_quantity * count(distinct opc.customisation_id) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
         JOIN orders_products_customisations opc on op.orders_products_id = opc.orders_products_id and oc.customisation_id = opc.customisation_id
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356597
#   AND op.products_id = 700
#   AND op.products_stock_attributes = '1-249,2-12'
  AND co.customisation_department = 'Embroidery'
  AND op.products_stock_attributes <> ''
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       op.products_quantity * count(distinct opc.customisation_id) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
         JOIN orders_products_customisations opc on op.orders_products_id = opc.orders_products_id and oc.customisation_id = opc.customisation_id
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356620
  AND op.products_id = 3735
  AND op.products_stock_attributes = '1-4,2-12'
  AND co.customisation_department = 'Embroidery'
  AND op.products_stock_attributes <> ''
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.products_quantity * count(distinct opc.customisation_id) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
         JOIN orders_products_customisations opc on op.orders_products_id = opc.orders_products_id and oc.customisation_id = opc.customisation_id
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356620
  AND op.products_id = 3735
  AND op.products_stock_attributes = '1-4,2-12'
  AND co.customisation_department = 'Embroidery'
  AND op.products_stock_attributes <> ''
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.products_quantity * count(distinct opc.customisation_id) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
         JOIN orders_products_customisations opc
              on op.orders_products_id = opc.orders_products_id and oc.customisation_id = opc.customisation_id
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356620
  AND op.products_id = 3735
  AND op.products_stock_attributes = '1-4,2-12'
  AND co.customisation_department = 'DTG'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.products_quantity * count(distinct opc.customisation_id) AS app_count
FROM orders_products op
         JOIN orders_customisations oc ON op.orders_id = oc.order_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
         JOIN orders_products_customisations opc
              on op.orders_products_id = opc.orders_products_id and oc.customisation_id = opc.customisation_id
WHERE co.customisation_department <> ''
  AND op.orders_id = 5356620
  AND op.products_id = 3735
  AND op.products_stock_attributes = '1-4,2-12'
  AND co.customisation_department = 'Embroidery'
GROUP BY op.products_id, op.products_stock_attributes, co.customisation_department;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_id,
       op.products_id,
       op.products_stock_attributes,
       count(cn.custom_names_id) AS nn_app_count
FROM custom_names cn
    JOIN orders_products op ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
WHERE cn.custom_order_id = 5356620
AND op.products_id = 3735 # 630, 700
AND op.products_stock_attributes = '1-4,2-12'
GROUP BY op.products_id, op.products_stock_attributes;
;-- -. . -..- - / . -. - .-. -.--
SELECT products_stock_attributes
                FROM clothes2_osC.products_stock
                WHERE poloMap = '4853-4-12';
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.*, o.orders_status AS real_status, ap.partner_name
                    FROM quaysidg_news.sales_data AS sd
                    LEFT JOIN clothes2_osC.orders AS o ON sd.orders_id = o.orders_id
                    LEFT JOIN clothes2_osC.api_partners AS ap ON ap.id = o.api_partner_id

                    WHERE (
                        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
                        OR
                        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
                    )
                    AND sd.site = 'C2O'

                    ORDER BY orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id, sd.products_id, (
    SELECT COUNT(*)
    FROM clothes2_osC.orders_products AS op
    JOIN clothes2_osC.products_stock AS ps ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
    WHERE op.orders_id = sd.orders_id AND ps.poloMap = sd.sku_id
) AS op_entry
FROM quaysidg_news.sales_data AS sd
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
ORDER BY orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.products_id, sd.sku_id, (
    SELECT op.products_quantity
    FROM clothes2_osC.orders_products AS op
    JOIN clothes2_osC.products_stock AS ps
        ON op.products_id = ps.products_id
        AND op.products_stock_attributes = ps.products_stock_attributes
    JOIN orders_customisations oc ON op.orders_id = oc.order_id
    JOIN orders_products_customisations opc
        ON op.orders_products_id = opc.orders_products_id
        AND oc.customisation_id = opc.customisation_id
    WHERE op.orders_id = sd.orders_id AND ps.poloMap = sd.sku_id
) AS op_entry
FROM quaysidg_news.sales_data AS sd
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
ORDER BY orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.products_id, sd.sku_id, (
    SELECT count(op.products_quantity)
    FROM clothes2_osC.orders_products AS op
    JOIN clothes2_osC.products_stock AS ps
        ON op.products_id = ps.products_id
        AND op.products_stock_attributes = ps.products_stock_attributes
    JOIN orders_customisations oc ON op.orders_id = oc.order_id
    JOIN orders_products_customisations opc
        ON op.orders_products_id = opc.orders_products_id
        AND oc.customisation_id = opc.customisation_id
    WHERE op.orders_id = sd.orders_id AND ps.poloMap = sd.sku_id
) AS op_entry
FROM quaysidg_news.sales_data AS sd
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
ORDER BY orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.products_id, sd.sku_id, (
    SELECT count(op.products_quantity)
    FROM clothes2_osC.orders_products AS op
    JOIN clothes2_osC.products_stock AS ps
        ON op.products_id = ps.products_id
        AND op.products_stock_attributes = ps.products_stock_attributes
    JOIN orders_customisations oc ON op.orders_id = oc.order_id
    JOIN orders_products_customisations opc
        ON op.orders_products_id = opc.orders_products_id
        AND oc.customisation_id = opc.customisation_id
    WHERE op.orders_id = sd.orders_id AND ps.poloMap = sd.sku_id
) AS op_entry
FROM quaysidg_news.sales_data AS sd
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
ORDER BY orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.products_id, sd.sku_id, count(op.orders_id)
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
    JOIN clothes2_osC.products_stock AS ps
        ON op.products_id = ps.products_id
        AND op.products_stock_attributes = ps.products_stock_attributes
        AND ps.poloMap = sd.sku_id
    JOIN orders_customisations oc ON op.orders_id = oc.order_id
    JOIN orders_products_customisations opc
        ON op.orders_products_id = opc.orders_products_id
        AND oc.customisation_id = opc.customisation_id
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
ORDER BY orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.products_id, sd.sku_id, count(op.orders_id)
FROM quaysidg_news.sales_data AS sd
LEFT JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
LEFT JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
LEFT JOIN orders_customisations oc ON op.orders_id = oc.order_id
LEFT JOIN orders_products_customisations opc
    ON op.orders_products_id = opc.orders_products_id
    AND oc.customisation_id = opc.customisation_id
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
ORDER BY orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.products_id, sd.sku_id
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc ON op.orders_id = oc.order_id
JOIN orders_products_customisations opc
    ON op.orders_products_id = opc.orders_products_id
    AND oc.customisation_id = opc.customisation_id
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
ORDER BY orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.products_id, sd.sku_id, op.products_quantity
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc ON op.orders_id = oc.order_id
JOIN orders_products_customisations opc
    ON op.orders_products_id = opc.orders_products_id
    AND oc.customisation_id = opc.customisation_id
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
ORDER BY orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.products_id, sd.sku_id, op.products_quantity
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc ON op.orders_id = oc.order_id
JOIN orders_products_customisations opc
    ON op.orders_products_id = opc.orders_products_id
    AND oc.customisation_id = opc.customisation_id
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY sd.products_id, sd.sku_id
ORDER BY orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.products_id, sd.sku_id, group_concat(op.products_quantity)
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc ON op.orders_id = oc.order_id
JOIN orders_products_customisations opc
    ON op.orders_products_id = opc.orders_products_id
    AND oc.customisation_id = opc.customisation_id
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY sd.products_id, sd.sku_id
ORDER BY orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap, op.products_id, ps.products_stock_attributes, group_concat(op.products_quantity)
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc ON op.orders_id = oc.order_id
JOIN orders_products_customisations opc
    ON op.orders_products_id = opc.orders_products_id
    AND oc.customisation_id = opc.customisation_id
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap, op.products_id, ps.products_stock_attributes, op.products_quantity * count(distinct opc.customisation_id) AS app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc ON op.orders_id = oc.order_id
JOIN orders_products_customisations opc
    ON op.orders_products_id = opc.orders_products_id
    AND oc.customisation_id = opc.customisation_id
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap, op.products_id, ps.products_stock_attributes,
       group_concat(distinct opc.customisation_id) AS customisation_ids,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * count(distinct opc.customisation_id) AS app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc ON op.orders_id = oc.order_id
JOIN orders_products_customisations opc
    ON op.orders_products_id = opc.orders_products_id
    AND oc.customisation_id = opc.customisation_id
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap, op.products_id, ps.products_stock_attributes,
       group_concat(distinct opc.customisation_id) AS customisation_ids,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * count(distinct opc.customisation_id) AS incorrect_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
       ) AS incorrect_app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc ON op.orders_id = oc.order_id
JOIN orders_products_customisations opc
    ON op.orders_products_id = opc.orders_products_id
    AND oc.customisation_id = opc.customisation_id
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap, op.products_id, ps.products_stock_attributes,
       group_concat(distinct opc.customisation_id) AS customisation_ids,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * count(distinct opc.customisation_id) AS incorrect_app_count,
       op.products_quantity * (
            SELECT count(distinct opc.customisation_id)
            FROM orders_products op
            JOIN orders_customisations oc ON op.orders_id = oc.order_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            JOIN orders_products_customisations opc
              on op.orders_products_id = opc.orders_products_id and oc.customisation_id = opc.customisation_id
            WHERE co.customisation_department <> ''

       ) AS new_app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc ON op.orders_id = oc.order_id
JOIN orders_products_customisations opc
    ON op.orders_products_id = opc.orders_products_id
    AND oc.customisation_id = opc.customisation_id
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap, op.products_id, ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
            SELECT count(distinct opc.customisation_id)
            FROM orders_products_customisations opc
            JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id and op.orders_products_id = opc.orders_products_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE co.customisation_department <> ''
       ) AS new_app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap, op.products_id, ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
            SELECT count(distinct opc.customisation_id)
            FROM orders_products_customisations opc
            JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE co.customisation_department <> ''
           AND op.orders_products_id = opc.orders_products_id
       ) AS new_app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap, op.products_id, ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
            SELECT count(distinct opc.customisation_id)
            FROM orders_products_customisations opc
            JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE co.customisation_department <> ''
            AND co.customisation_department = 'Embroidery'
            AND op.orders_products_id = opc.orders_products_id
       ) AS new_app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap, op.products_id, ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
            SELECT count(distinct opc.customisation_id)
            FROM orders_products_customisations opc
            WHERE co.customisation_department <> ''
            AND co.customisation_department = 'Embroidery'
            AND op.orders_products_id = opc.orders_products_id
       ) AS new_app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc on oc.order_id = sd.orders_id
JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap, op.products_id, ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
            SELECT count(distinct opc.customisation_id)
            FROM orders_products_customisations opc
            WHERE op.orders_products_id = opc.orders_products_id
       ) AS new_app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc on oc.order_id = sd.orders_id
JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap, op.products_id, ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
            SELECT count(distinct opc.customisation_id)
            FROM orders_products_customisations opc
            WHERE op.orders_products_id = opc.orders_products_id
            AND co.customisation_department <> ''
            AND co.customisation_department = 'Embroidery'
       ) AS new_app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc on oc.order_id = sd.orders_id
JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap, op.products_id, ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
            SELECT count(distinct opc.customisation_id)
            FROM orders_products_customisations opc
            WHERE op.orders_products_id = opc.orders_products_id
            AND co.customisation_department <> ''
       ) AS new_app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc on oc.order_id = sd.orders_id
JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap, op.products_id, ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
            SELECT count(distinct opc.customisation_id)
            FROM orders_products_customisations opc
            WHERE op.orders_products_id = opc.orders_products_id
            AND co.customisation_department <> ''
       ) AS new_app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc on oc.order_id = sd.orders_id
JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes, co.customisation_department
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap, op.products_id, ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
            SELECT count(distinct opc.customisation_id)
            FROM orders_products_customisations opc
            WHERE op.orders_products_id = opc.orders_products_id
            AND co.customisation_department = 'Embroidery'
       ) AS new_app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc on oc.order_id = sd.orders_id
JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap, op.products_id, ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
            SELECT count(distinct opc.customisation_id)
            FROM orders_products_customisations opc
            WHERE op.orders_products_id = opc.orders_products_id
            AND op.products_stock_attributes = ps.products_stock_attributes
            AND co.customisation_department = 'Embroidery'
       ) AS new_app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc on oc.order_id = sd.orders_id
JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap, op.products_id, ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
            SELECT count(distinct opc.customisation_id)
            FROM orders_products_customisations opc
            WHERE op.orders_products_id = opc.orders_products_id
            AND op.products_stock_attributes = ps.products_stock_attributes
            #AND co.customisation_department = 'Embroidery'
       ) AS new_app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc on oc.order_id = sd.orders_id
JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap, op.products_id, ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
            SELECT group_concat(co.customisation_department)
            FROM orders_products_customisations opc
            WHERE op.orders_products_id = opc.orders_products_id
            AND op.products_stock_attributes = ps.products_stock_attributes
            #AND co.customisation_department = 'Embroidery'
       ) AS new_app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc on oc.order_id = sd.orders_id
JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap, op.products_id, ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
            SELECT group_concat(co.customisation_department)
            FROM orders_products_customisations opc
            WHERE op.orders_products_id = opc.orders_products_id
            AND op.products_stock_attributes = ps.products_stock_attributes
            #AND co.customisation_department = 'Embroidery'
           LIMIT 1
       ) AS new_app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc on oc.order_id = sd.orders_id
JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap,
       op.products_id, op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
            SELECT group_concat(co.customisation_department)
            FROM orders_products_customisations opc
            WHERE op.orders_products_id = opc.orders_products_id
            #AND co.customisation_department = 'Embroidery'
           LIMIT 1
       ) AS new_app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc on oc.order_id = sd.orders_id
JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
            FROM orders_products_customisations opc
            WHERE opc.orders_products_id = '4426065';
;-- -. . -..- - / . -. - .-. -.--
SELECT opc.*, max(oc.custom_type)
            FROM orders_products_customisations opc
            JOIN customisations c on opc.customisation_id = c.customisation_id
            JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE opc.orders_products_id = '4426065';
;-- -. . -..- - / . -. - .-. -.--
SELECT opc.*
            FROM orders_products_customisations opc
            JOIN customisations c on opc.customisation_id = c.customisation_id
            JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE opc.orders_products_id = '4426065';
;-- -. . -..- - / . -. - .-. -.--
SELECT opc.*, oc.custom_type
            FROM orders_products_customisations opc
            JOIN customisations c on opc.customisation_id = c.customisation_id
            JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE opc.orders_products_id = '4426065';
;-- -. . -..- - / . -. - .-. -.--
SELECT opc.*, oc.custom_type
            FROM orders_products_customisations opc
            JOIN customisations c on opc.customisation_id = c.customisation_id
            JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE opc.orders_products_id = '4426065'
            AND co.customisation_department = 'Embroidery';
;-- -. . -..- - / . -. - .-. -.--
SELECT count(opc.customisation_id)
            FROM orders_products_customisations opc
            JOIN customisations c on opc.customisation_id = c.customisation_id
            JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE opc.orders_products_id = '4426065'
            AND co.customisation_department = 'Embroidery';
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap,
       op.products_id, op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
            SELECT count(opc.customisation_id)
            FROM orders_products_customisations opc
            JOIN customisations c on opc.customisation_id = c.customisation_id
            JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE opc.orders_products_id = '4426065'
            AND co.customisation_department = 'Embroidery'
       ) AS new_app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc on oc.order_id = sd.orders_id
JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap,
       op.products_id, op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
            SELECT count(opc.customisation_id)
            FROM orders_products_customisations opc
            JOIN customisations c on opc.customisation_id = c.customisation_id
            JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE opc.orders_products_id = '4426065'
            AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc on oc.order_id = sd.orders_id
JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap,
       op.products_id, op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
            SELECT count(opc.customisation_id)
            FROM orders_products_customisations opc
            JOIN customisations c on opc.customisation_id = c.customisation_id
            JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE opc.orders_products_id = '4426065'
            AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
            SELECT count(opc.customisation_id)
            FROM orders_products_customisations opc
            JOIN customisations c on opc.customisation_id = c.customisation_id
            JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE opc.orders_products_id = '4426065'
            AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
            SELECT count(opc.customisation_id)
            FROM orders_products_customisations opc
            JOIN customisations c on opc.customisation_id = c.customisation_id
            JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE opc.orders_products_id = '4426065'
            AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       op.products_quantity * (
            SELECT count(opc.customisation_id)
            FROM orders_products_customisations opc
            JOIN customisations c on opc.customisation_id = c.customisation_id
            JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE opc.orders_products_id = '4426065'
            AND co.customisation_department = 'NN'
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc on oc.order_id = sd.orders_id
JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site, sd.orders_id, sd.sku_id as poloMap,
       op.products_id, op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
            SELECT count(opc.customisation_id)
            FROM orders_products_customisations opc
            JOIN customisations c on opc.customisation_id = c.customisation_id
            JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE opc.orders_products_id = '4426065'
            AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
            SELECT count(opc.customisation_id)
            FROM orders_products_customisations opc
            JOIN customisations c on opc.customisation_id = c.customisation_id
            JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE opc.orders_products_id = '4426065'
            AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
            SELECT count(opc.customisation_id)
            FROM orders_products_customisations opc
            JOIN customisations c on opc.customisation_id = c.customisation_id
            JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE opc.orders_products_id = '4426065'
            AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       op.products_quantity * (
            SELECT        count(cn.custom_names_id) AS nn_app_count
FROM custom_names cn
    JOIN orders_products op ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
                            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
JOIN clothes2_osC.products_stock AS ps
    ON op.products_id = ps.products_id
    AND op.products_stock_attributes = ps.products_stock_attributes
    AND ps.poloMap = sd.sku_id
JOIN orders_customisations oc on oc.order_id = sd.orders_id
JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
    (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    OR
    (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
)
AND sd.site = 'C2O'
AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site,
       sd.orders_id,
       sd.sku_id AS poloMap,
       op.products_id,
       op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
           SELECT count(opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = '4426065'
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = '4426065'
             AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = '4426065'
             AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
         JOIN orders_customisations oc on oc.order_id = sd.orders_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
  AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site,
       sd.orders_id,
       sd.sku_id AS poloMap,
       op.products_id,
       op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
           SELECT count(opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
         JOIN orders_customisations oc on oc.order_id = sd.orders_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
  AND sd.orders_id = 5356620
  AND op.orders_products_id = '4426065'
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site,
       sd.orders_id,
       sd.sku_id AS poloMap,
       op.products_id,
       op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
           SELECT count(opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
         JOIN orders_customisations oc on oc.order_id = sd.orders_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
  AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site,
       sd.orders_id,
       sd.sku_id AS poloMap,
       op.products_id,
       op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
           SELECT count(opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
         JOIN orders_customisations oc on oc.order_id = sd.orders_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site,
       sd.orders_id,
       sd.sku_id AS poloMap,
       op.products_id,
       op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
           SELECT count(opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
         JOIN orders_customisations oc on oc.order_id = sd.orders_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
  AND sd.orders_id = 5356597
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site,
       sd.orders_id,
       sd.sku_id AS poloMap,
       op.products_id,
       op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
         JOIN orders_customisations oc on oc.order_id = sd.orders_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
  AND sd.orders_id = 5356597
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site,
       sd.orders_id,
       sd.sku_id AS poloMap,
       op.products_id,
       op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
         JOIN orders_customisations oc on oc.order_id = sd.orders_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site,
       sd.orders_id,
       sd.sku_id AS poloMap,
       op.products_id,
       op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
         JOIN orders_customisations oc on oc.order_id = sd.orders_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
GROUP BY op.orders_id, op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site,
       sd.orders_id,
       sd.sku_id AS poloMap,
       op.products_id,
       op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
         JOIN orders_customisations oc on oc.order_id = sd.orders_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.products_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site,
       sd.orders_id,
       sd.sku_id AS poloMap,
       op.products_id,
       op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
         JOIN orders_customisations oc on oc.order_id = sd.orders_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site,
       sd.orders_id,
       sd.sku_id AS poloMap,
       op.products_id,
       op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
         JOIN orders_customisations oc on oc.order_id = sd.orders_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.orders_id DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site,
       sd.orders_id,
       sd.sku_id AS poloMap,
       op.products_id,
       op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
         JOIN orders_customisations oc on oc.order_id = sd.orders_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
GROUP BY op.products_id, ps.products_stock_attributes, op.orders_id
ORDER BY op.orders_id DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.*, o.orders_status AS real_status, ap.partner_name, op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
                    FROM quaysidg_news.sales_data AS sd
                    LEFT JOIN clothes2_osC.orders AS o ON sd.orders_id = o.orders_id
                    LEFT JOIN clothes2_osC.api_partners AS ap ON ap.id = o.api_partner_id

                     JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
         JOIN orders_customisations oc on oc.order_id = sd.orders_id
         JOIN customisation_options co ON co.custom_type = oc.custom_type
                    WHERE (
                        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
                        OR
                        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
                    )
                    AND sd.site = 'C2O'

                     GROUP BY op.products_id, ps.products_stock_attributes, op.orders_id
                    ORDER BY op.orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site,
       sd.orders_id,
       sd.sku_id AS poloMap,
       op.products_id,
       op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
GROUP BY op.products_id, ps.products_stock_attributes, op.orders_id
ORDER BY op.orders_id DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site,
       sd.orders_id,
       sd.sku_id AS poloMap,
       op.products_id,
       op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND oc.order_id = sd.orders_id
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
GROUP BY op.products_id, ps.products_stock_attributes, op.orders_id
ORDER BY op.orders_id DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site,
       sd.orders_id,
       sd.sku_id AS poloMap,
       op.products_id,
       op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND oc.order_id = sd.orders_id
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
                AND oc.order_id = sd.orders_id
                AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
                AND oc.order_id = sd.orders_id
                AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
  AND sd.orders_id = 5356597
GROUP BY op.products_id, ps.products_stock_attributes, op.orders_id
ORDER BY op.orders_id DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = '4426065'
             AND oc.order_id = 5356620
             AND co.customisation_department = 'DTG';
;-- -. . -..- - / . -. - .-. -.--
SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = '4426065'
             AND oc.order_id = 5356620
             AND co.customisation_department = 'Embroidery';
;-- -. . -..- - / . -. - .-. -.--
SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = '4426065'
             AND oc.order_id = 5356620
             AND co.customisation_department = 'Vinyl';
;-- -. . -..- - / . -. - .-. -.--
SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE
                 oc.order_id = 5356620
             AND co.customisation_department = 'DTG';
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site,
       sd.orders_id,
       sd.sku_id AS poloMap,
       op.products_id,
       op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND oc.order_id = sd.orders_id
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
                AND oc.order_id = sd.orders_id
                AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
                AND oc.order_id = sd.orders_id
                AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
  AND sd.orders_id in (5356620, 5356620)
GROUP BY op.products_id, ps.products_stock_attributes, op.orders_id
ORDER BY op.orders_id DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site,
       sd.orders_id,
       sd.sku_id AS poloMap,
       op.products_id,
       op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND oc.order_id = sd.orders_id
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
                AND oc.order_id = sd.orders_id
                AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
                AND oc.order_id = sd.orders_id
                AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
  AND sd.orders_id in (5356620, 5356620)
GROUP BY op.products_id, ps.products_stock_attributes
ORDER BY op.orders_id DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site,
       sd.orders_id,
       sd.sku_id AS poloMap,
       op.products_id,
       op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND oc.order_id = sd.orders_id
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
                AND oc.order_id = sd.orders_id
                AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
                AND oc.order_id = sd.orders_id
                AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
GROUP BY op.products_id, ps.products_stock_attributes, op.orders_id
ORDER BY op.orders_id DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site,
       sd.orders_id,
       sd.sku_id AS poloMap,
       op.products_id,
       op.orders_products_id,
       ps.products_stock_attributes,
       group_concat(distinct op.products_quantity) AS product_quantity,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND oc.order_id = sd.orders_id
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
                AND oc.order_id = sd.orders_id
                AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
                AND oc.order_id = sd.orders_id
                AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
  AND sd.orders_id = 5356620
GROUP BY op.products_id, ps.products_stock_attributes, op.orders_id
ORDER BY op.orders_id DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.*, o.orders_status AS real_status, ap.partner_name, op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND oc.order_id = sd.orders_id
             AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
                AND oc.order_id = sd.orders_id
                AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN customisations c on opc.customisation_id = c.customisation_id
                    JOIN orders_customisations oc on oc.customisation_id = c.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
                AND oc.order_id = sd.orders_id
                AND co.customisation_department = 'Vinyl'
       ) AS vinyl_app_count,
       (
            SELECT count(cn.custom_names_id) AS nn_app_count
            FROM custom_names cn
            WHERE cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       ) AS nn_app_count
                    FROM quaysidg_news.sales_data AS sd
                    LEFT JOIN clothes2_osC.orders AS o ON sd.orders_id = o.orders_id
                    LEFT JOIN clothes2_osC.api_partners AS ap ON ap.id = o.api_partner_id

                     JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
                    WHERE (
                        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
                        OR
                        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
                    )
                    AND sd.site = 'C2O'

                     GROUP BY op.products_id, ps.products_stock_attributes, op.orders_id
                    ORDER BY op.orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_products_id, op.products_quantity, ps.products_stock_id, opc.orders_products_customisations_id, oc.custom_id
FROM clothes2_osC.orders_products AS op
JOIN clothes2_osC.products_stock AS ps ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
JOIN orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE op.orders_id = 5356620
    AND opc.customisation_id <> 0
    AND ps.poloMap = '4853-4-12'
    AND co.customisation_department = 'Embroidery';
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_products_id, op.products_quantity, ps.products_stock_id, opc.orders_products_customisations_id, oc.custom_id
FROM clothes2_osC.orders_products AS op
JOIN clothes2_osC.products_stock AS ps ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
JOIN orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE op.orders_id = 5356620
    AND opc.customisation_id <> 0
    AND ps.poloMap = '4853-4-12'
    AND co.customisation_department = 'DTG';
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_products_id, op.products_quantity, ps.products_stock_id, opc.orders_products_customisations_id, oc.custom_id
FROM clothes2_osC.orders_products AS op
JOIN clothes2_osC.products_stock AS ps ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
JOIN orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
JOIN customisation_options co ON co.custom_type = oc.custom_type
WHERE op.orders_id = 5356620
    AND opc.customisation_id <> 0
    AND ps.poloMap = '4853-4-12'
    AND co.customisation_department = 'Vinyl';
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.*,
       o.orders_status AS real_status,
       ap.partner_name,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND oc.order_id = op.orders_id
             AND co.customisation_department = 'DTG'
       )               AS dtg_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND oc.order_id = op.orders_id
             AND co.customisation_department = 'Embroidery'
       )               AS emb_app_count,
       op.products_quantity * (
           SELECT count(distinct opc.customisation_id)
           FROM orders_products_customisations opc
                    JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id
                    JOIN customisation_options co ON co.custom_type = oc.custom_type
           WHERE opc.orders_products_id = op.orders_products_id
             AND oc.order_id = op.orders_id
             AND co.customisation_department = 'Vinyl'
       )               AS vinyl_app_count,
       (
           SELECT count(cn.custom_names_id) AS nn_app_count
           FROM custom_names cn
           WHERE cn.custom_order_id = op.orders_id
             AND cn.custom_products_id = op.products_id
             AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
       )               AS nn_app_count
FROM quaysidg_news.sales_data AS sd
         LEFT JOIN clothes2_osC.orders AS o ON sd.orders_id = o.orders_id
         LEFT JOIN clothes2_osC.api_partners AS ap ON ap.id = o.api_partner_id

         JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
         JOIN clothes2_osC.products_stock AS ps
              ON op.products_id = ps.products_id
                  AND op.products_stock_attributes = ps.products_stock_attributes
                  AND ps.poloMap = sd.sku_id
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'

GROUP BY op.products_id, ps.products_stock_attributes, op.orders_id
ORDER BY op.orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.*,
o.orders_status AS real_status,
ap.partner_name,
op.products_quantity * (
   SELECT count(distinct opc.customisation_id)
   FROM orders_products_customisations opc
            JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
   WHERE opc.orders_products_id = op.orders_products_id
     AND oc.order_id = op.orders_id
     AND co.customisation_department = 'DTG'
) AS dtg_app_count,
op.products_quantity * (
   SELECT count(distinct opc.customisation_id)
   FROM orders_products_customisations opc
            JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
   WHERE opc.orders_products_id = op.orders_products_id
     AND oc.order_id = op.orders_id
     AND co.customisation_department = 'Embroidery'
) AS emb_app_count,
op.products_quantity * (
   SELECT count(distinct opc.customisation_id)
   FROM orders_products_customisations opc
            JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
   WHERE opc.orders_products_id = op.orders_products_id
     AND oc.order_id = op.orders_id
     AND co.customisation_department = 'Vinyl'
) AS vinyl_app_count,
(
   SELECT count(cn.custom_names_id) AS nn_app_count
   FROM custom_names cn
   WHERE cn.custom_order_id = op.orders_id
     AND cn.custom_products_id = op.products_id
     AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
     LEFT JOIN clothes2_osC.orders AS o ON sd.orders_id = o.orders_id
     LEFT JOIN clothes2_osC.api_partners AS ap ON ap.id = o.api_partner_id

     JOIN clothes2_osC.orders_products AS op ON op.orders_id = sd.orders_id
     JOIN clothes2_osC.products_stock AS ps
          ON op.products_id = ps.products_id
              AND op.products_stock_attributes = ps.products_stock_attributes
              AND ps.poloMap = sd.sku_id
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
GROUP BY op.products_id, ps.products_stock_attributes, op.orders_id
ORDER BY op.orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.site,
       sd.orders_id,
       sd.sku_id AS poloMap,
       (
            SELECT SUM(op.products_quantity)
            FROM clothes2_osC.orders_products AS op
            JOIN clothes2_osC.products_stock AS ps ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
            JOIN orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
            JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE op.orders_id = sd.orders_id
                AND opc.customisation_id <> 0
                AND ps.poloMap = sd.sku_id
                AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       (
            SELECT SUM(op.products_quantity)
            FROM clothes2_osC.orders_products AS op
            JOIN clothes2_osC.products_stock AS ps ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
            JOIN orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
            JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE op.orders_id = sd.orders_id
                AND opc.customisation_id <> 0
                AND ps.poloMap = sd.sku_id
                AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       (
            SELECT SUM(op.products_quantity)
            FROM clothes2_osC.orders_products AS op
            JOIN clothes2_osC.products_stock AS ps ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
            JOIN orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
            JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE op.orders_id = sd.orders_id
                AND opc.customisation_id <> 0
                AND ps.poloMap = sd.sku_id
                AND co.customisation_department = 'Vinyl'
       ) AS trn_app_count,
       (
            SELECT COUNT(*)
            FROM clothes2_osC.orders_products AS op
            JOIN clothes2_osC.custom_names AS cn ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            JOIN clothes2_osC.products_stock AS ps ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
            WHERE op.orders_id = sd.orders_id
                AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
                AND ps.poloMap = sd.sku_id
       ) AS nn_app_count
FROM quaysidg_news.sales_data AS sd
WHERE (
        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
        OR
        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
    )
  AND sd.site = 'C2O'
  AND sd.orders_id = 5356620
ORDER BY sd.orders_id DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.*, o.orders_status AS real_status, ap.partner_name, (
            SELECT SUM(op.products_quantity)
            FROM clothes2_osC.orders_products AS op
            JOIN clothes2_osC.products_stock AS ps ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
            JOIN orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
            JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE op.orders_id = sd.orders_id
                AND opc.customisation_id <> 0
                AND ps.poloMap = sd.sku_id
                AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       (
            SELECT SUM(op.products_quantity)
            FROM clothes2_osC.orders_products AS op
            JOIN clothes2_osC.products_stock AS ps ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
            JOIN orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
            JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE op.orders_id = sd.orders_id
                AND opc.customisation_id <> 0
                AND ps.poloMap = sd.sku_id
                AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       (
            SELECT SUM(op.products_quantity)
            FROM clothes2_osC.orders_products AS op
            JOIN clothes2_osC.products_stock AS ps ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
            JOIN orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
            JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE op.orders_id = sd.orders_id
                AND opc.customisation_id <> 0
                AND ps.poloMap = sd.sku_id
                AND co.customisation_department = 'Vinyl'
       ) AS trn_app_count,
       (
            SELECT COUNT(*)
            FROM clothes2_osC.orders_products AS op
            JOIN clothes2_osC.custom_names AS cn ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            JOIN clothes2_osC.products_stock AS ps ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
            WHERE op.orders_id = sd.orders_id
                AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
                AND ps.poloMap = sd.sku_id
       ) AS nn_app_count
                    FROM quaysidg_news.sales_data AS sd
                    LEFT JOIN clothes2_osC.orders AS o ON sd.orders_id = o.orders_id
                    LEFT JOIN clothes2_osC.api_partners AS ap ON ap.id = o.api_partner_id

                    WHERE (
                        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
                        OR
                        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
                    )
                    AND sd.site = 'C2O'

                    ORDER BY sd.orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.*, o.orders_status AS real_status, ap.partner_name, (
            SELECT SUM(op.products_quantity)
            FROM clothes2_osC.orders_products AS op
            JOIN clothes2_osC.products_stock AS ps ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
            JOIN orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
            JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE op.orders_id = sd.orders_id
                AND opc.customisation_id <> 0
                AND ps.poloMap = sd.sku_id
                AND co.customisation_department = 'DTG'
       ) AS dtg_app_count,
       (
            SELECT SUM(op.products_quantity)
            FROM clothes2_osC.orders_products AS op
            JOIN clothes2_osC.products_stock AS ps ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
            JOIN orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
            JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE op.orders_id = sd.orders_id
                AND opc.customisation_id <> 0
                AND ps.poloMap = sd.sku_id
                AND co.customisation_department = 'Embroidery'
       ) AS emb_app_count,
       (
            SELECT SUM(op.products_quantity)
            FROM clothes2_osC.orders_products AS op
            JOIN clothes2_osC.products_stock AS ps ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
            JOIN orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
            JOIN orders_customisations oc on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
            JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE op.orders_id = sd.orders_id
                AND opc.customisation_id <> 0
                AND ps.poloMap = sd.sku_id
                AND co.customisation_department = 'Vinyl'
       ) AS trn_app_count,
       (
            SELECT COUNT(*)
            FROM clothes2_osC.orders_products AS op
            JOIN clothes2_osC.custom_names AS cn ON cn.custom_order_id = op.orders_id AND cn.custom_products_id = op.products_id
            JOIN clothes2_osC.products_stock AS ps ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
            WHERE op.orders_id = sd.orders_id
                AND op.products_stock_attributes = concat('1-', cn.custom_products_colour, ',2-', cn.custom_products_size)
                AND ps.poloMap = sd.sku_id
       ) AS nn_app_count
                    FROM quaysidg_news.sales_data AS sd
                    LEFT JOIN clothes2_osC.orders AS o ON sd.orders_id = o.orders_id
                    LEFT JOIN clothes2_osC.api_partners AS ap ON ap.id = o.api_partner_id

                    WHERE (
                        (sd.date_dispatched BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
                        OR
                        (sd.date_purchased BETWEEN '2021-08-01 00:00:00' AND '2021-08-26 00:00:00')
                    )
                    AND sd.site = 'C2O'
                    ORDER BY sd.orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT op.orders_products_id,
       o.orders_id,
       o.customers_name,
       o.customers_telephone,
       IF((SELECT MIN(oo.orders_id)
           FROM clothes2_osC.orders AS oo
           WHERE oo.customers_id = o.customers_id
           GROUP BY oo.customers_id) = o.orders_id, 1, 0)                                                                  AS new_customer,
       o.date_purchased,
       o.date_first_processing                                                                                             AS date_processing,
       o.last_modified                                                                                                     AS date_dispatched,
       os.orders_status_name,
       op.products_id,
       op.products_name,
       op.vendors_id                                                                                                       AS supplier,
       op.products_quantity                                                                                                AS quantity,
       (op.final_price * op.products_quantity)                                                                             AS sale_price,
       (op.vendors_product_price * op.products_quantity)                                                                   AS cost_price,
       ((op.final_price * op.products_quantity) -
        (op.vendors_product_price * op.products_quantity))                                                                 AS margin_value,
       ((((op.final_price * op.products_quantity) - (op.vendors_product_price * op.products_quantity)) /
         (op.final_price * op.products_quantity)) *
        100)                                                                                                               AS margin_pc,
       o.delivery_country,
       o.payment_method,
       st.dispatch_name                                                                                                    AS dispatch_type,
       ot1.value                                                                                                           AS subtotal,
       ot3.value                                                                                                           AS tax,
       ot4.value                                                                                                           AS refund,
       ot5.value                                                                                                           AS credit,
       ot6.value                                                                                                           AS coupon,
       ot7.value                                                                                                           AS total,
       o.shipped_by,
       o.staff_name                                                                                                        AS account_manager,
       IF(op.products_id = '2', (SELECT opa.products_options_values_id
                                 FROM clothes2_osC.orders_products_attributes AS opa
                                 WHERE opa.orders_products_id = op.orders_products_id
                                   AND opa.products_options_id = '4'),
          'NA')                                                                                                            AS origination_type,
       IF(o.api_partner_id > 0, "API", IF(o.ms_store_id > 0, "Merch Store", IF(o.mobile_order > 0, "Mobile",
                                                                               IF(o.staff_name != "", "Acc Man", "Web")))) as order_method,
       ps.poloMap                                                                                                          as sku_id
FROM clothes2_osC.orders as o
         LEFT JOIN clothes2_osC.orders_products AS op ON (op.orders_id = o.orders_id)
         LEFT JOIN clothes2_osC.products_stock as ps
                   ON (op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes)
         LEFT JOIN clothes2_osC.orders_total AS ot1 ON (ot1.class = 'ot_subtotal' AND ot1.orders_id = o.orders_id)
         LEFT JOIN clothes2_osC.orders_total AS ot3 ON (ot3.class = 'ot_tax' AND ot3.orders_id = o.orders_id)
         LEFT JOIN clothes2_osC.orders_total AS ot4 ON (ot4.class = 'ot_custom' AND ot4.orders_id = o.orders_id)
         LEFT JOIN clothes2_osC.orders_total AS ot5 ON (ot5.class = 'ot_credit' AND ot5.orders_id = o.orders_id)
         LEFT JOIN clothes2_osC.orders_total AS ot6 ON (ot6.class = 'ot_coupon' AND ot6.orders_id = o.orders_id)
         LEFT JOIN clothes2_osC.orders_total AS ot7 ON (ot7.class = 'ot_total' AND ot7.orders_id = o.orders_id)
         LEFT JOIN clothes2_osC.orders_status AS os ON (o.orders_status = os.orders_status_id)
         LEFT JOIN clothes2_osC.shipping_types AS st ON (o.shipping_type = st.shipping_type)
WHERE o.orders_id = '5356620'
  AND op.products_id != '1526'
GROUP BY op.orders_products_id
ORDER BY o.orders_id ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.*,
       (SELECT SUM(op.products_quantity)
        FROM clothes2_osC.orders_products AS op
                 JOIN clothes2_osC.products_stock AS ps
                      ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
                 JOIN orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
                 JOIN orders_customisations oc
                      on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
                 JOIN customisation_options co ON co.custom_type = oc.custom_type
        WHERE op.orders_id = sd.orders_id
          AND opc.customisation_id <> 0
          AND ps.poloMap = sd.sku_id
          AND co.customisation_department = 'DTG')        AS dtg_app_count,
       (SELECT SUM(op.products_quantity)
        FROM clothes2_osC.orders_products AS op
                 JOIN clothes2_osC.products_stock AS ps
                      ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
                 JOIN orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
                 JOIN orders_customisations oc
                      on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
                 JOIN customisation_options co ON co.custom_type = oc.custom_type
        WHERE op.orders_id = sd.orders_id
          AND opc.customisation_id <> 0
          AND ps.poloMap = sd.sku_id
          AND co.customisation_department = 'Embroidery') AS emb_app_count,
       (SELECT SUM(op.products_quantity)
        FROM clothes2_osC.orders_products AS op
                 JOIN clothes2_osC.products_stock AS ps
                      ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
                 JOIN orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
                 JOIN orders_customisations oc
                      on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
                 JOIN customisation_options co ON co.custom_type = oc.custom_type
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
FROM quaysidg_news.sales_data sd
WHERE sd.orders_id = '5356620'
  AND sd.site = 'C2O';
;-- -. . -..- - / . -. - .-. -.--
SELECT sd.*,
       o.orders_status                                    AS real_status,
       ap.partner_name,
       (SELECT SUM(op.products_quantity)
        FROM clothes2_osC.orders_products AS op
                 JOIN clothes2_osC.products_stock AS ps
                      ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
                 JOIN orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
                 JOIN orders_customisations oc
                      on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
                 JOIN customisation_options co ON co.custom_type = oc.custom_type
        WHERE op.orders_id = sd.orders_id
          AND opc.customisation_id <> 0
          AND ps.poloMap = sd.sku_id
          AND co.customisation_department = 'DTG')        AS dtg_app_count,
       (SELECT SUM(op.products_quantity)
        FROM clothes2_osC.orders_products AS op
                 JOIN clothes2_osC.products_stock AS ps
                      ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
                 JOIN orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
                 JOIN orders_customisations oc
                      on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
                 JOIN customisation_options co ON co.custom_type = oc.custom_type
        WHERE op.orders_id = sd.orders_id
          AND opc.customisation_id <> 0
          AND ps.poloMap = sd.sku_id
          AND co.customisation_department = 'Embroidery') AS emb_app_count,
       (SELECT SUM(op.products_quantity)
        FROM clothes2_osC.orders_products AS op
                 JOIN clothes2_osC.products_stock AS ps
                      ON op.products_id = ps.products_id AND op.products_stock_attributes = ps.products_stock_attributes
                 JOIN orders_products_customisations opc ON opc.orders_products_id = op.orders_products_id
                 JOIN orders_customisations oc
                      on oc.customisation_id = opc.customisation_id AND oc.order_id = op.orders_id
                 JOIN customisation_options co ON co.custom_type = oc.custom_type
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
WHERE custom_colours_type = 0 and display_on_frontend = 1
ORDER BY custom_colours_name;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM custom_colours
WHERE custom_colours_type = 0 and display_on_frontend = 1
ORDER BY custom_colours_name;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM custom_colours
WHERE custom_colours_type = 0
ORDER BY custom_colours_name;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM custom_colours
WHERE custom_colours_type = 2
ORDER BY custom_colours_name;
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners_ftp_gateway_accounts;
;-- -. . -..- - / . -. - .-. -.--
select * from clothes2_osC.products_attributes WHERE products_attributes_id = 25927;
;-- -. . -..- - / . -. - .-. -.--
select * from api_customisation_files;
;-- -. . -..- - / . -. - .-. -.--
select * from orders where customers_id is null;
;-- -. . -..- - / . -. - .-. -.--
select * from orders where customers_id =< 0;
;-- -. . -..- - / . -. - .-. -.--
select * from orders where customers_id <= 0;