select * from `clothes2_osC`.`customisations` where customisation_id = 4452703;

use clothes2_osC;
select * from customisations_artwork;


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

select * from custom_positions;

select * from clothes2_osC.pulse_queue;
select * from customisations_artwork_file_types;

select * from customers_basket;

select * from configuration where configuration_key like "%MAIL%";

select * from tep_mail_sent order by id desc;


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