use clothes2_osC;

select su.shopify_user, su.shop,
       so.shopify_order_id, so.order_number,
       so.cost_price, so.total_price,
       so.currency, so.financial_status,
       so.order_status, so.order_paid, so.email
from shopify_orders so
join shopify_users su on so.shopify_user = su.shopify_user
where so.order_status = 'failed'
order by su.shopify_user, so.shopify_order_id;

select * from api_partners where partner_name like "%Blended Trails%"; #  api_partner_id=1606 # shopify_user=535

# List of SKUs and their positions.
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


SELECT `input`
FROM api_partners_submission_log
WHERE orders_id > 0
AND request_type = 'post'
ORDER BY id DESC
LIMIT 500;

show create table clothes2_osC.orders_customisations_checkbox_audit;

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

SELECT * FROM customisations WHERE customisation_type IS NOT NULL ORDER BY customisation_type, customisation_name limit 500 offset 1000;

select * from customers where customers_email_address = 'tom.coad@c2o.com';

select * from qtagcom_osC.tep_mail_sent where customers_email_address like "finance.team@c2o.com";
select * from qtagcom_osC.polo_configuration where configuration_key = 'SEND_EMAILS';

select * from quaysidg_news.integrity_check;
select * from quaysidg_news.integrity_check_frequency;
select * from quaysidg_news.integrity_check_notification;
select * from quaysidg_news.integrity_check_result;
select * from clothes2_osC.customisations;

select * from configuration where configuration_key in (
    'COMPANY_PHONE_START',
    'COMPANY_PHONE_END',
    'COMPANY_PHONE_START_SHORT',
    'COMPANY_PHONE_END_SHORT'
);


select distinct customisation_department from customisation_options;

SELECT sum(products_quantity) AS app_count
            FROM orders_products op
                JOIN orders_customisations oc ON op.orders_id = oc.order_id
                JOIN customisation_options co ON co.custom_type = oc.custom_type
            WHERE
                co.customisation_department <> ''
            AND op.orders_id = 5390690
            AND op.products_id = 421
            #AND co.customisation_department = ". general::db_input($department)."
            GROUP BY op.products_id, co.customisation_department;

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
group by op.products_id
;

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
###########################################################
# SUP-710
###########################################################
select * from poloshir_osC.products_stock;
SELECT CONCAT('="', poloStockId, '"') AS poloStockId,
       btc_id,
       pc_id,
       uneek_id,
       ral_id,
       fruit_id
FROM poloshir_osC.vendors_stock
WHERE CONCAT(btc_id, pc_id, uneek_id, ral_id, fruit_id) <> '';

select * from products_options;

select * from quaysidg_news.dhl_invoices
where invoice_number = 'MANR004545440'
and shipper_reference = 'C2O5332880'
order by id desc;


select count(*) from orders o
join custom_names cn on o.orders_id = cn.custom_order_id
where mobile_order = 1
and date_purchased > DATE_SUB(now(), INTERVAL 1 YEAR)
;

# 16837 mobile orders in the past year
# 1408 of those had names and numbers records attached
# ~10%


SELECT CONCAT('="', vs.poloStockId, '"') AS poloStockId,
       btc_id,
       pc_id,
       uneek_id,
       ral_id,
       fruit_id
FROM poloshir_osC.vendors_stock vs
WHERE CONCAT(btc_id, pc_id, uneek_id, ral_id, fruit_id) <> ''
and vs.poloStockId like '4349%';

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

select * from quaysidg_news.staff_info where first_name like "%Daria%";

select * from orders_products where orders_id = 5398110;
select * from products_attributes;
SELECT t.*
              FROM poloshir_osC.vendors_stock t
              WHERE poloStockId="933-1-12";

select * from poloshir_osC.vendors_stock where poloStockId = '700-1-12';

# custom_colours
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
SELECT * FROM custom_colours ORDER BY custom_colours_name;

select * from customisation_files where customisation_id = 4612885;

select * from api_partners_ftp_gateway_accounts;

select poloMap from products_stock where poloMap <> '' and poloMap <> 0 order by products_stock_id desc limit 10 ;

select * from orders where customers_id is null;

select * from qtagcom_osC.polo_customers where customers_email_address = 'info@cowlardconstruction.com';
select * from qtagcom_osC.protx_direct where customer_id = 83168 order by id desc;
select * from custom_positions;

select * from quaysidg_news.staff_info where first_name like 'Daniel Gibson%' and employed = 1;