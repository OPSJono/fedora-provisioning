SELECT
  `c`.`customers_firstname`,
  `c`.`customers_lastname`,
  `c`.`customers_id`,
  `c`.`customers_email_address`,
  `c`.`customers_telephone`,
  `c`.`customers_mobile`,
  `c`.`customers_newsletter`,
  `c`.`api_partner_id`,
  `c`.`api_partner_customer_id`,
  `c`.`account_manager`,
  `ci`.`customers_info_date_account_created`,
  SUM (`ot`.`value`) AS `ordersum`,
  COUNT (`o`.`orders_id`) AS `ordernum`,
  `ci`.`customers_info_source_id`,
  `ab`.`entry_company`,
  `ab`.`entry_street_address`,
  `ab`.`entry_suburb`,
  `ab`.`entry_city`,
  `ab`.`entry_state`,
  `ab`.`entry_postcode`,
  `c`.`do_not_postal_mail`
FROM
  `customers` AS `c`
  JOIN `orders` AS `o` ON `c`.`customers_id` = `o`.`customers_id`
  JOIN `orders_total` AS `ot` ON `o`.`orders_id` = `ot`.`orders_id`
  JOIN `customers_info` AS `ci` ON `c`.`customers_id` = `ci`.`customers_info_id`
  JOIN `address_book` AS `ab` ON `c`.`customers_default_address_id` = `ab`.`address_book_id`;

use clothes2_osC;
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