select * from orders where payment_method = 'api';

SELECT `oc`.`orders_id`, `op`.`products_name`, `op`.`products_id`, `op`.`products_quantity`, `op`.`orders_products_id`, GROUP_CONCAT(`c`.`customisation_name`) AS `customisation_name`, `opa`.`products_options_values` AS colour, `opa`.`products_options_values_id` AS colour_id, `opa2`.`products_options_values` AS size, `opa2`.`products_options_values_id` AS size_id, `ps`.`poloMap`, `o`.`api_partner_id`
                  FROM `orders_cancellations` AS `oc`
                  LEFT JOIN `orders` AS `o` ON `oc`.`orders_id` = `o`.`orders_id`
                  LEFT JOIN `orders_products` AS `op` ON `oc`.`orders_id` = `op`.`orders_id`
                  LEFT JOIN `orders_products_attributes` AS `opa` ON ( `op`.`orders_products_id` = `opa`.`orders_products_id` AND `opa`.`products_options` = 'Colour' )
                  LEFT JOIN `orders_products_attributes` AS `opa2` ON ( `op`.`orders_products_id` = `opa2`.`orders_products_id` AND `opa2`.`products_options` = 'Size' )
                  LEFT JOIN `products_stock` AS `ps` ON `op`.`products_stock_attributes` = `ps`.`products_stock_attributes` AND `op`.`products_id` = `ps`.`products_id`
                  LEFT JOIN `orders_products_customisations` AS `opc` ON `opc`.`orders_products_id` = `op`.`orders_products_id`
                  LEFT JOIN `customisations` AS `c` ON `c`.`customisation_id` = `opc`.`customisation_id`
                  WHERE `oc`.`orders_id` = '5179011' AND `oc`.`type` = 'Replacement' AND `o`.`api_partner_id` != '' AND `opa2`.`products_options_values` IS NOT NULL
                  GROUP BY `orders_products_id`;

select * from orders_cancellations oc
LEFT JOIN `orders` AS `o` ON `oc`.`orders_id` = `o`.`orders_id`
where oc.orders_id = '5179011'
and oc.type = 'Replacement'
AND `o`.`api_partner_id` != ''
;

SELECT id, customisation_id, file_url
            FROM api_customisation_files
            WHERE failed_attempt < 300;