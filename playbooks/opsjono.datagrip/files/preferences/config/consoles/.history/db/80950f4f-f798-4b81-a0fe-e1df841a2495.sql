SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    COUNT(distinct cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) as unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, oc.custom_type, c.customisation_width, cf.file_type

HAVING unique_files_on_order < possible_dup_files_on_order
   and possible_dup_files_on_order > file_types_count
   and possible_dup_files_on_order > file_types_count
   and width_count > unique_width_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    COUNT(distinct cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) as unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, oc.custom_type, c.customisation_width, cf.file_type

HAVING unique_files_on_order < possible_dup_files_on_order
   and possible_dup_files_on_order > file_types_count
   and c.customisation_width <> c.customisation_width;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    COUNT(distinct cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) as unique_width_count,
    c.customisation_width
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, oc.custom_type, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and possible_dup_files_on_order > file_types_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    cf.file_type,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) as unique_width_count,
    c.customisation_width
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, oc.custom_type, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    cf.file_type,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) as unique_width_count,
    c.customisation_width
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, oc.custom_type, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
#    and possible_dup_files_on_order > file_types_count
   and c.customisation_width = c.customisation_width;
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and cf.file_type > 1

and o.orders_id = 5063801

  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    cf.file_type,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) as unique_width_count,
    oc.custom_type,
    c.customisation_width
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
#    and possible_dup_files_on_order > file_types_count
   and c.customisation_width = c.customisation_width;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) as unique_width_count,
    oc.custom_type,
    c.customisation_width
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
#    and possible_dup_files_on_order > file_types_count
   and c.customisation_width = c.customisation_width;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) as unique_width_count,
    count(oc.custom_type),
    count(c.customisation_width)
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
#    and possible_dup_files_on_order > file_types_count
   and c.customisation_width = c.customisation_width;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) as unique_width_count,
    count(oc.custom_type),
    count(c.customisation_width)
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
#    and possible_dup_files_on_order > file_types_count
   and c.customisation_width = c.customisation_width;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) as unique_width_count,
    count(oc.custom_type),
    count(c.customisation_width)
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) as unique_width_count,
    count(distinct oc.custom_type) as unique_custom_types,
    count(distinct c.customisation_width) as unique_custom_widths
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct oc.custom_type) as unique_custom_types,
    count(distinct c.customisation_width) as unique_custom_widths
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and possible_dup_files_on_order > file_types_count
   and unique_custom_widths > unique_custom_types;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct oc.custom_type) as unique_custom_types,
    count(distinct c.customisation_width) as unique_custom_widths
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
#    and possible_dup_files_on_order > file_types_count
   and unique_custom_widths > unique_custom_types;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     count(c.customisation_width) as width_count,
#     count(distinct oc.custom_type) as unique_custom_types,
#     count(distinct c.customisation_width) as unique_custom_widths
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     count(c.customisation_width) as width_count,
#     count(distinct oc.custom_type) as unique_custom_types,
#     count(distinct c.customisation_width) as unique_custom_widths
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
    and possible_dup_files_on_order > file_types_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     count(c.customisation_width) as width_count,
#     count(distinct oc.custom_type) as unique_custom_types,
#     count(distinct c.customisation_width) as unique_custom_widths
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
    and possible_dup_files_on_order > file_types_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct oc.custom_type) as unique_custom_types,
    count(distinct c.customisation_width) as unique_custom_widths
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
    and possible_dup_files_on_order > file_types_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct oc.custom_type) as unique_custom_types,
    count(distinct c.customisation_width) as unique_custom_widths
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
       , c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
    and possible_dup_files_on_order > file_types_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct oc.custom_type) as unique_custom_types,
    count(distinct c.customisation_width) as unique_custom_widths
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and possible_dup_files_on_order > file_types_count
   and unique_custom_widths > unique_custom_types;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct oc.custom_type) as unique_custom_types,
    count(distinct c.customisation_width) as unique_custom_widths
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and possible_dup_files_on_order > file_types_count
   and unique_custom_widths > unique_custom_types
   and width_count > unique_custom_widths;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct oc.custom_type) as unique_custom_types,
    count(distinct c.customisation_width) as unique_custom_widths
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and possible_dup_files_on_order > file_types_count
   and unique_custom_widths > unique_custom_types
   and width_count > (unique_custom_widths * file_types_count);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct oc.custom_type) as unique_custom_types,
    count(distinct c.customisation_width) as unique_custom_widths,
    (count(distinct c.customisation_width) * count(distinct cf.file_type))
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and possible_dup_files_on_order > file_types_count
   and unique_custom_widths > unique_custom_types
   and width_count > (unique_custom_widths * file_types_count);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct oc.custom_type) as unique_types,
    count(distinct c.customisation_width) as unique_widths,
    (count(distinct c.customisation_width) * count(distinct cf.file_type)) as 'unique_widths * files_types'
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and possible_dup_files_on_order > file_types_count
   and unique_widths > unique_types;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct oc.custom_type) as unique_types,
    count(distinct c.customisation_width) as unique_widths,
    (count(distinct c.customisation_width) * count(distinct cf.file_type)) as 'unique_widths * files_types'
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and possible_dup_files_on_order > file_types_count
   and unique_widths > unique_types
   and width_count > (unique_widths * unique_types);
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

and o.orders_id = 5145230

  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct oc.custom_type) as unique_types,
    count(distinct c.customisation_width) as unique_widths,
    (count(distinct c.customisation_width) * count(distinct cf.file_type)) as 'unique_widths * files_types'
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and possible_dup_files_on_order > file_types_count
   and unique_widths > unique_types
   and width_count > (unique_widths * file_types_count);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct oc.custom_type) as unique_types,
    count(distinct c.customisation_width) as unique_widths,
    (count(distinct c.customisation_width) * count(distinct cf.file_type)) as 'unique_widths * files_types'
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, c.customisation_width
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and possible_dup_files_on_order > file_types_count
   and unique_widths > unique_types
   and width_count > (unique_widths * file_types_count);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct oc.custom_type) as unique_types,
    count(distinct c.customisation_width) as unique_widths,
    (count(distinct c.customisation_width) * count(distinct cf.file_type)) as 'unique_widths * files_types'
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, c.customisation_width
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and possible_dup_files_on_order > file_types_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct oc.custom_type) as unique_types,
    count(distinct c.customisation_width) as unique_widths,
    (count(distinct c.customisation_width) * count(distinct cf.file_type)) as 'unique_widths * files_types'
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, oc.custom_type, c.customisation_width
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and possible_dup_files_on_order > file_types_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct oc.custom_type) as unique_types,
    count(distinct c.customisation_width) as unique_widths,
    (count(distinct c.customisation_width) * count(distinct cf.file_type)) as 'unique_widths * files_types'
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, oc.custom_type, c.customisation_width, cf.file_type
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and possible_dup_files_on_order > file_types_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, oc.custom_type, c.customisation_width, cf.file_type
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and possible_dup_files_on_order > file_types_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type,
    count(distinct cf.file_type) as file_types_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, oc.custom_type, c.customisation_width, cf.file_type
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and possible_dup_files_on_order > file_types_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type,
    cf.file_type,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, oc.custom_type, c.customisation_width, cf.file_type
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and possible_dup_files_on_order > file_types_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type,
    cf.file_type,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, oc.custom_type, c.customisation_width, cf.file_type
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type,
    cf.file_type,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, oc.custom_type, c.customisation_width, cf.file_type
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
#    and possible_dup_files_on_order > file_types_count
#    and unique_widths > unique_types
   and width_count > unique_width_count;
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

and o.orders_id = 5063801

  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type,
    cf.file_type,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, oc.custom_type, c.customisation_width, cf.file_type
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and width_count > unique_width_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type,
    cf.file_type,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5063801
#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, oc.custom_type, c.customisation_width, cf.file_type
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and width_count > unique_width_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type,
    cf.file_type,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5063801
#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, c.customisation_width, cf.file_type
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and width_count > unique_width_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type,
    cf.file_type,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5063801
#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, c.customisation_width,
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and width_count > unique_width_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type,
    cf.file_type,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5063801
#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, c.customisation_width
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and width_count > unique_width_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type,
    cf.file_type,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5063801
#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id,
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and width_count > unique_width_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type,
    cf.file_type,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5063801
#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and width_count > unique_width_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type,
    cf.file_type,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5063801
#   and cf.file_type > 1

GROUP BY o.customers_name, o.orders_id, oc.custom_type, o.customers_name, o.customers_email_address, o.orders_id, o.customers_id, cf.file_type
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and width_count > unique_width_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type,
    cf.file_type,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5063801
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type,
    cf.file_type
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and width_count > unique_width_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type,
    cf.file_type,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5063801
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type,
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and width_count > unique_width_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type,
    cf.file_type,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5063801
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and width_count > unique_width_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type,
    cf.file_type,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5063801
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and width_count > unique_width_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5063801
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and width_count > unique_width_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5063801
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and width_count > unique_width_count;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5063801
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and width_count > unique_width_count
   and width_count > (file_type_count * unique_width_count);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5063801
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and width_count > (file_type_count * unique_width_count);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and o.orders_id = 5063801
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and width_count > (file_type_count * unique_width_count)
    or unique_width_count = 1;
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

and o.orders_id = 4448523

  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

and o.orders_id = 5170051

  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS possible_dup_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and o.orders_id = 5063801
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING possible_dup_files_on_order > unique_files_on_order
   and width_count > (file_type_count * unique_width_count);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and o.orders_id = 5063801
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING total_files_on_order > unique_files_on_order
   and width_count > (file_type_count * unique_width_count);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count,
    count(distinct oc.custom_type) custom_type_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and o.orders_id = 5063801
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING total_files_on_order > unique_files_on_order
   and width_count > (file_type_count * unique_width_count);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count,
    count(distinct oc.custom_type) custom_type_count
FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5170051
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING total_files_on_order > unique_files_on_order
   and width_count > (file_type_count * unique_width_count);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count,
    count(distinct oc.custom_type) custom_type_count,
                   oc.custom_type

FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5170051
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING total_files_on_order > unique_files_on_order
   and width_count > (file_type_count * unique_width_count);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count,
    count(distinct oc.custom_type) custom_type_count,
                   oc.custom_type

FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5170051
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING total_files_on_order > unique_files_on_order;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count,
    count(distinct oc.custom_type) custom_type_count,
                   oc.custom_type

FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5170051
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING total_files_on_order > unique_files_on_order;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count,
    count(distinct oc.custom_type) custom_type_count,
                   oc.custom_type

FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5170051
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING total_files_on_order > unique_files_on_order;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count,
    count(oc.custom_type) custom_type_count,
    count(distinct oc.custom_type) unique_custom_type_count

FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5170051
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING total_files_on_order > unique_files_on_order;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count,
    count(oc.custom_type) custom_type_count,
    count(distinct oc.custom_type) unique_custom_type_count

FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and o.orders_id = 5170051
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING total_files_on_order > unique_files_on_order;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count,
    count(oc.custom_type) custom_type_count,
    count(distinct oc.custom_type) unique_custom_type_count

FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and o.orders_id = 5170051
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING total_files_on_order > unique_files_on_order
   and width_count > (file_type_count * unique_width_count * unique_custom_type_count);
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

and o.orders_id = 4923203

  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count,
    count(oc.custom_type) custom_type_count,
    count(distinct oc.custom_type) unique_custom_type_count

FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and o.orders_id = 5170051
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING total_files_on_order > unique_files_on_order
   and width_count > (file_type_count * unique_width_count)
   and total_files_on_order <> (duplicate_files_on_order * unique_custom_type_count);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count,
    count(oc.custom_type) custom_type_count,
    count(distinct oc.custom_type) unique_custom_type_count

FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and o.orders_id = 5170051
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING total_files_on_order > unique_files_on_order
   and width_count > (file_type_count * unique_width_count);
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count,
    count(oc.custom_type) custom_type_count,
    count(distinct oc.custom_type) unique_custom_type_count

FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and o.orders_id = 5170051
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING total_files_on_order > unique_files_on_order
   and width_count > (file_type_count * (unique_width_count * unique_custom_type_count));
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

and o.orders_id = 5181123

  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count,
    count(oc.custom_type) custom_type_count,
    count(distinct oc.custom_type) unique_custom_type_count

FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

  and o.orders_id = 5181123
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING total_files_on_order > unique_files_on_order
   and width_count > (file_type_count * (unique_width_count * unique_custom_type_count));
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count,
    count(oc.custom_type) custom_type_count,
    count(distinct oc.custom_type) unique_custom_type_count

FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and o.orders_id = 5181123
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING total_files_on_order > unique_files_on_order
   and width_count > (file_type_count * (unique_width_count * unique_custom_type_count));
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

and o.orders_id = 5026520

  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    count(distinct cf.file_type) as file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    count(c.customisation_width) as width_count,
    count(distinct c.customisation_width) unique_width_count,
    count(oc.custom_type) custom_type_count,
    count(distinct oc.custom_type) unique_custom_type_count

FROM customisation_files_perceptual_hashes as cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and o.orders_id = 5181123
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING total_files_on_order > unique_files_on_order
   and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))
#    and total_files_on_order > file_types_count
#    and unique_widths > unique_types

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    COUNT(c.customisation_width) AS width_count,
    COUNT(distinct c.customisation_width) AS unique_width_count,
    COUNT(oc.custom_type) AS custom_type_count,
    COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

#   and o.orders_id = 5181123
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id
#     oc.custom_type
#     cf.file_type
       #, c.customisation_width, cf.file_type

HAVING total_files_on_order > unique_files_on_order
   and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))
#    and total_files_on_order > file_types_count
#    and unique_widths > unique_types

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

and o.orders_id = 4805412

  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    COUNT(c.customisation_width) AS width_count,
    COUNT(distinct c.customisation_width) AS unique_width_count,
    COUNT(oc.custom_type) AS custom_type_count,
    COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

#   and o.orders_id = 5181123
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id

HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    COUNT(c.customisation_width) AS width_count,
    COUNT(distinct c.customisation_width) AS unique_width_count,
    COUNT(oc.custom_type) AS custom_type_count,
    COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

#   and o.orders_id = 5181123
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id

HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

and o.orders_id = 4588941

  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    COUNT(c.customisation_width) AS width_count,
    COUNT(distinct c.customisation_width) AS unique_width_count,
    COUNT(oc.custom_type) AS custom_type_count,
    COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

#   and o.orders_id = 5181123
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width

HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

#   and o.orders_id = 5181123
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width

HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''

#   and cf.file_type > 1

and o.orders_id = 4735045

  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

#   and o.orders_id = 5181123
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width

HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY o.orders_id,
               oc.custom_type,
               c.customisation_width

HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY #o.orders_id,
               oc.custom_type,
               c.customisation_width

HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY #o.orders_id,
               oc.custom_type,
               #c.customisation_width

HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY #o.orders_id,
               oc.custom_type
               #c.customisation_width

HAVING total_files_on_order > unique_files_on_order;
;-- -. . -..- - / . -. - .-. -.--
SELECT
#     o.customers_id, o.customers_name, o.customers_email_address,
#     o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY #o.orders_id,
               oc.custom_type
               #c.customisation_width

HAVING total_files_on_order > unique_files_on_order;
;-- -. . -..- - / . -. - .-. -.--
SELECT
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width

HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(select oc.custom_type, c.customisation_width),
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width

HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)),
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width

HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)),
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

# GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
#     o.orders_id,
#                oc.custom_type,
#                c.customisation_width

HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)),
#     o.customers_id, o.customers_name, o.customers_email_address,
#     o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

# GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
#     o.orders_id,
#                oc.custom_type,
#                c.customisation_width

HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)),
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

# GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
#     o.orders_id,
#                oc.custom_type,
#                c.customisation_width

# HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)),
#     o.customers_id, o.customers_name, o.customers_email_address,
#     o.orders_id,
#                oc.custom_type,
#                c.customisation_width,
#     COUNT(distinct cf.file_type) AS file_type_count,
#     COUNT(cf.perceptual_hash) AS total_files_on_order,
# 	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
# 	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

# GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
#     o.orders_id,
#                oc.custom_type,
#                c.customisation_width

# HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width))
#     o.customers_id, o.customers_name, o.customers_email_address,
#     o.orders_id,
#                oc.custom_type,
#                c.customisation_width,
#     COUNT(distinct cf.file_type) AS file_type_count,
#     COUNT(cf.perceptual_hash) AS total_files_on_order,
# 	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
# 	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

# GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
#     o.orders_id,
#                oc.custom_type,
#                c.customisation_width

# HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)),
    o.customers_id, o.customers_name, o.customers_email_address,
#     o.orders_id,
#                oc.custom_type,
#                c.customisation_width,
#     COUNT(distinct cf.file_type) AS file_type_count,
#     COUNT(cf.perceptual_hash) AS total_files_on_order,
# 	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
# 	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

# GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
#     o.orders_id,
#                oc.custom_type,
#                c.customisation_width

# HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)),
    o.customers_id, o.customers_name, o.customers_email_address
#     o.orders_id,
#                oc.custom_type,
#                c.customisation_width,
#     COUNT(distinct cf.file_type) AS file_type_count,
#     COUNT(cf.perceptual_hash) AS total_files_on_order,
# 	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
# 	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

# GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
#     o.orders_id,
#                oc.custom_type,
#                c.customisation_width

# HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)),
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order
# 	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
# 	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

# GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
#     o.orders_id,
#                oc.custom_type,
#                c.customisation_width

# HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)),
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
#     COUNT(distinct cf.file_type) AS file_type_count,
#     COUNT(cf.perceptual_hash) AS total_files_on_order,
# 	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
# 	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
    COUNT(c.customisation_width) AS width_count,
    COUNT(distinct c.customisation_width) AS unique_width_count,
    COUNT(oc.custom_type) AS custom_type_count,
    COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

# GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
#     o.orders_id,
#                oc.custom_type,
#                c.customisation_width

# HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)),
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
#     COUNT(distinct cf.file_type) AS file_type_count,
#     COUNT(cf.perceptual_hash) AS total_files_on_order,
# 	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
# 	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
    COUNT(oc.custom_type) AS custom_type_count,
    COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

# GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
#     o.orders_id,
#                oc.custom_type,
#                c.customisation_width

# HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)),
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
#     COUNT(distinct cf.file_type) AS file_type_count,
#     COUNT(cf.perceptual_hash) AS total_files_on_order,
# 	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
# 	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

# GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
#     o.orders_id,
#                oc.custom_type,
#                c.customisation_width

# HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)),
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width
#     COUNT(distinct cf.file_type) AS file_type_count,
#     COUNT(cf.perceptual_hash) AS total_files_on_order,
# 	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
# 	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

# GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
#     o.orders_id,
#                oc.custom_type,
#                c.customisation_width

# HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)) as "unique",
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width
#     COUNT(distinct cf.file_type) AS file_type_count,
#     COUNT(cf.perceptual_hash) AS total_files_on_order,
# 	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
# 	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY o.customers_id, o.customers_name, o.customers_email_address,
#     o.orders_id,
#                oc.custom_type,
#                c.customisation_width

# HAVING total_files_on_order > unique_files_on_order
#    and width_count > (file_type_count * (unique_width_count * unique_custom_type_count))

order by "unique";
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)) as "unique",
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width
#     COUNT(distinct cf.file_type) AS file_type_count,
#     COUNT(cf.perceptual_hash) AS total_files_on_order,
# 	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
# 	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY "unique";
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)) as "unique",
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width
#     COUNT(distinct cf.file_type) AS file_type_count,
#     COUNT(cf.perceptual_hash) AS total_files_on_order,
# 	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
# 	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)) as "unique",
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width
#     COUNT(distinct cf.file_type) AS file_type_count,
#     COUNT(cf.perceptual_hash) AS total_files_on_order,
# 	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
# 	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045

GROUP BY "unique";
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045

GROUP BY `unique`;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width
#     COUNT(distinct cf.file_type) AS file_type_count,
#     COUNT(cf.perceptual_hash) AS total_files_on_order,
# 	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
# 	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
#     COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY `unique`;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
# 	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
# 	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
    COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY `unique`;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
# 	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
# 	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order
#     COUNT(c.customisation_width) AS width_count,
#     COUNT(distinct c.customisation_width) AS unique_width_count,
#     COUNT(oc.custom_type) AS custom_type_count,
    COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY `unique`;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    COUNT(c.customisation_width) AS width_count,
    COUNT(distinct c.customisation_width) AS unique_width_count,
    COUNT(oc.custom_type) AS custom_type_count,
    COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY `unique`;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width, o.orders_id)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    COUNT(c.customisation_width) AS width_count,
    COUNT(distinct c.customisation_width) AS unique_width_count,
    COUNT(oc.custom_type) AS custom_type_count,
    COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY `unique`;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(o.orders_id, '-', oc.custom_type, '-', c.customisation_width)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    COUNT(c.customisation_width) AS width_count,
    COUNT(distinct c.customisation_width) AS unique_width_count,
    COUNT(oc.custom_type) AS custom_type_count,
    COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY `unique`
#     o.orders_id,
#                oc.custom_type,
#                c.customisation_width

HAVING total_files_on_order > unique_files_on_order;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(o.orders_id, '-', oc.custom_type, '-', c.customisation_width)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    COUNT(c.customisation_width) AS width_count,
    COUNT(distinct c.customisation_width) AS unique_width_count,
    COUNT(oc.custom_type) AS custom_type_count,
    COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY `unique`;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(o.orders_id, '-', oc.custom_type, '-', c.customisation_width)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    COUNT(c.customisation_width) AS width_count,
    COUNT(distinct c.customisation_width) AS unique_width_count,
    COUNT(oc.custom_type) AS custom_type_count,
    COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY `unique`
HAVING total_files_on_order > unique_files_on_order;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(o.orders_id, '-', oc.custom_type, '-', c.customisation_width)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    COUNT(c.customisation_width) AS width_count,
    COUNT(distinct c.customisation_width) AS unique_width_count,
    COUNT(oc.custom_type) AS custom_type_count,
    COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY `unique`, o.orders_id, o.customers_id
# HAVING total_files_on_order > unique_files_on_order

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''
  and c.customisation_width = '30'

#   and cf.file_type > 1

and o.orders_id = 4735045

  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''
  and c.customisation_width = '10'

#   and cf.file_type > 1

and o.orders_id = 4735045

  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(o.orders_id, '-', oc.custom_type, '-', c.customisation_width)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    COUNT(c.customisation_width) AS width_count,
    COUNT(distinct c.customisation_width) AS unique_width_count,
    COUNT(oc.custom_type) AS custom_type_count,
    COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

#   and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY `unique`, o.orders_id, o.customers_id
# HAVING total_files_on_order > unique_files_on_order

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(o.orders_id, '-', oc.custom_type, '-', c.customisation_width)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
    COUNT(c.customisation_width) AS width_count,
    COUNT(distinct c.customisation_width) AS unique_width_count,
    COUNT(oc.custom_type) AS custom_type_count,
    COUNT(distinct oc.custom_type) AS unique_custom_type_count

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

#   and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY `unique`, o.orders_id, o.customers_id
HAVING total_files_on_order > unique_files_on_order

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''
  and c.customisation_width = '10'

#   and cf.file_type > 1

and o.orders_id = 4105854
# and o.orders_id = 4735045


  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(oc.custom_type, c.customisation_width)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

  and o.orders_id = 4105854

GROUP BY `unique`;
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''
#   and c.customisation_width = '10'

#   and cf.file_type > 1

and o.orders_id = 4105854
# and o.orders_id = 4735045


  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
#   and cf.perceptual_hash > ''
#   and c.customisation_width = '10'

#   and cf.file_type > 1

and o.orders_id = 4105854
# and o.orders_id = 4735045


  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
#   and o.customers_id > 0
#   and o.staff_name = ''
#   and o.payment_method <> 'replacement'
#   and oc.customisation_id > 0
#   and cf.perceptual_hash > ''
#   and c.customisation_width = '10'

#   and cf.file_type > 1

and o.orders_id = 4105854
# and o.orders_id = 4735045


  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''
#   and c.customisation_width = '10'

#   and cf.file_type > 1

and o.orders_id = 4735045


  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''
#   and c.customisation_width = '10'

#   and cf.file_type > 1

and o.orders_id = 4691691


  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(o.orders_id, '-', oc.custom_type, '-', c.customisation_width)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
	((COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) / COUNT(distinct cf.file_type)) AS actual_duplicate_files_on_order

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

#   and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY `unique`, o.orders_id, o.customers_id
HAVING total_files_on_order > unique_files_on_order

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(o.orders_id, '-', oc.custom_type, '-', c.customisation_width)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,
	((COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) / COUNT(distinct cf.file_type)) AS actual_duplicate_files_on_order

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

#   and o.orders_id = 4735045
  and cf.file_type > 1

GROUP BY `unique`, o.orders_id, o.customers_id
HAVING total_files_on_order > unique_files_on_order

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(o.orders_id, '-', oc.custom_type, '-', c.customisation_width)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order,

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

#   and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY `unique`, o.orders_id, o.customers_id
HAVING total_files_on_order > unique_files_on_order

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(o.orders_id, '-', oc.custom_type, '-', c.customisation_width)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

#   and o.orders_id = 4735045
#   and cf.file_type > 1

GROUP BY `unique`, o.orders_id, o.customers_id
HAVING total_files_on_order > unique_files_on_order

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''
#   and c.customisation_width = '10'

#   and cf.file_type > 1

and o.orders_id = 5174233


  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select cf.id, cf.file_type, cf.perceptual_hash,
    o.orders_id, o.orders_status, o.customers_name, o.customers_email_address,
    oc.custom_type, oc.application_count, oc.primary_type,
    c.customisation_width
from orders o
     join orders_customisations oc on oc.order_id = o.orders_id
     join customisations c on oc.customisation_id = c.customisation_id
     join customisation_files_perceptual_hashes cf on cf.customisation_id = oc.customisation_id
where o.mobile_order = 0
  and o.customers_id > 0
  and o.staff_name = ''
  and o.payment_method <> 'replacement'
  and oc.customisation_id > 0
  and cf.perceptual_hash > ''
#   and c.customisation_width = '10'

#   and cf.file_type > 1

and o.orders_id = 5174233
and oc.custom_type like "%storm%"
and c.customisation_width = "9"


  order by o.orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from orders
where orders_status = 0;
;-- -. . -..- - / . -. - .-. -.--
SELECT
   DISTINCT(concat(o.orders_id, '-', oc.custom_type, '-', c.customisation_width)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

GROUP BY `unique`, o.orders_id, o.customers_id
HAVING total_files_on_order > unique_files_on_order

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
select count(distinct orders_id) from (
    
    SELECT
   DISTINCT(concat(o.orders_id, '-', oc.custom_type, '-', c.customisation_width)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

GROUP BY `unique`, o.orders_id, o.customers_id
HAVING total_files_on_order > unique_files_on_order

order by o.customers_id, o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
select count(distinct orders_id) from (

    SELECT
   DISTINCT(concat(o.orders_id, '-', oc.custom_type, '-', c.customisation_width)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

GROUP BY `unique`, o.orders_id, o.customers_id
HAVING total_files_on_order > unique_files_on_order

order by o.customers_id, o.orders_id

    ));
;-- -. . -..- - / . -. - .-. -.--
select count(distinct orders_id) from (

    SELECT
   DISTINCT(concat(o.orders_id, '-', oc.custom_type, '-', c.customisation_width)) as `unique`,
    o.customers_id, o.customers_name, o.customers_email_address,
    o.orders_id,
               oc.custom_type,
               c.customisation_width,
    COUNT(distinct cf.file_type) AS file_type_count,
    COUNT(cf.perceptual_hash) AS total_files_on_order,
	COUNT(DISTINCT cf.perceptual_hash) AS unique_files_on_order,
	(COUNT(cf.perceptual_hash) - COUNT(DISTINCT cf.perceptual_hash)) AS duplicate_files_on_order

FROM customisation_files_perceptual_hashes AS cf
LEFT JOIN orders_customisations oc ON oc.customisation_id = cf.customisation_id
LEFT JOIN customisations c on oc.customisation_id = c.customisation_id
LEFT JOIN orders o ON oc.order_id = o.orders_id
WHERE o.mobile_order = 0
  AND o.customers_id > 0
  AND o.staff_name = ''
  AND o.payment_method <> 'replacement'
  AND oc.customisation_id > 0
  AND cf.perceptual_hash > ''

GROUP BY `unique`, o.orders_id, o.customers_id
HAVING total_files_on_order > unique_files_on_order

order by o.customers_id, o.orders_id

    ) x;
;-- -. . -..- - / . -. - .-. -.--
desc orders;
;-- -. . -..- - / . -. - .-. -.--
select * from orders order by orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select count(*) from orders where date_purchased > '2019-01-01 00:00:00'

order by orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from orders where date_purchased > '2019-01-01 00:00:00'

order by orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select cf.* from orders o
join orders_customisations oc on oc.order_id = o.orders_id
join customisation_files cf on oc.customisation_id = cf.customisation_id
where date_purchased > '2019-01-01 00:00:00'
order by orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
show full processlist;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files limit 10;
;-- -. . -..- - / . -. - .-. -.--
select oc.customisation_id from orders o
join orders_customisations oc on oc.order_id = o.orders_id
where o.date_purchased > '2019-01-01 00:00:00'
order by orders_id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files where customisation_id in
;-- -. . -..- - / . -. - .-. -.--
select * from polo_customers;
;-- -. . -..- - / . -. - .-. -.--
select * from polo_customers where customers_default_address_id is null;
;-- -. . -..- - / . -. - .-. -.--
select * from polo_customers where customers_default_address_id < '';
;-- -. . -..- - / . -. - .-. -.--
select * from polo_address_format;
;-- -. . -..- - / . -. - .-. -.--
select * from polo_customers where customers_default_address_id > '';
;-- -. . -..- - / . -. - .-. -.--
select * from polo_customers_info;
;-- -. . -..- - / . -. - .-. -.--
select * from customers_magento_customers;
;-- -. . -..- - / . -. - .-. -.--
select * from polo_address_book;
;-- -. . -..- - / . -. - .-. -.--
select * from polo_customers where customers_default_address_id = '';
;-- -. . -..- - / . -. - .-. -.--
select pc.customers_id, pc.customers_firstname, pc.customers_lastname, pc.customers_gender, pc.customers_email_address
from polo_customers pc
join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname

where customers_default_address_id = '';
;-- -. . -..- - / . -. - .-. -.--
select pc.customers_id, pc.customers_firstname, pc.customers_lastname, pc.customers_gender, pc.customers_email_address, count(pab.address_book_id) as address_count
from polo_customers pc
join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname

where customers_default_address_id = ''
having address_count > 1;
;-- -. . -..- - / . -. - .-. -.--
select pc.customers_id, pc.customers_firstname, pc.customers_lastname, pc.customers_gender, pc.customers_email_address, count(pab.address_book_id) as address_count
from polo_customers pc
left join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname

where customers_default_address_id = ''
having address_count > 1;
;-- -. . -..- - / . -. - .-. -.--
explain update polo_customers pc
inner join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname
set pc.customers_default_address_id = pab.address_book_id
where pc.customers_default_address_id = '';
;-- -. . -..- - / . -. - .-. -.--
select pc.customers_id, pc.customers_firstname, pc.customers_lastname, pc.customers_gender, pc.customers_email_address
from polo_customers pc
inner join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname

where customers_default_address_id = '';
;-- -. . -..- - / . -. - .-. -.--
select pc.customers_id, pc.customers_firstname, pc.customers_lastname, pc.customers_gender, pc.customers_email_address, pab.address_book_id
from polo_customers pc
inner join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname

where customers_default_address_id = '';
;-- -. . -..- - / . -. - .-. -.--
select count(*) from polo_customers
where customers_default_address_id = '';
;-- -. . -..- - / . -. - .-. -.--
select count(*)
from polo_customers pc
inner join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname

where customers_default_address_id = '';
;-- -. . -..- - / . -. - .-. -.--
select count(pab.*)
from polo_customers pc
join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname

where customers_default_address_id = '';
;-- -. . -..- - / . -. - .-. -.--
select count(pab.entry_firstname)
from polo_customers pc
join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname

where customers_default_address_id = '';
;-- -. . -..- - / . -. - .-. -.--
select pc.customers_id, pc.customers_firstname, pc.customers_lastname, pc.customers_email_address, count(pab.address_book_id) as address_count
from polo_customers pc
left join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname

where customers_default_address_id = ''
having address_count > 1;
;-- -. . -..- - / . -. - .-. -.--
select distinct(pc.customers_id, pc.customers_firstname, pc.customers_lastname, pc.customers_email_address), count(pab.address_book_id) as address_count
from polo_customers pc
left join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname

where customers_default_address_id = ''
having address_count > 1;
;-- -. . -..- - / . -. - .-. -.--
select distinct pc.customers_id, pc.customers_firstname, pc.customers_lastname, pc.customers_email_address, count(pab.address_book_id) as address_count
from polo_customers pc
left join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname

where customers_default_address_id = ''
having address_count > 1;
;-- -. . -..- - / . -. - .-. -.--
select DISTINCT(concat(pc.customers_id, '-', pc.customers_firstname, '-', pc.customers_lastname)) as `unique`, count(pab.address_book_id) as address_count
from polo_customers pc
left join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname
where pc.customers_default_address_id = ''
group by `unique`
having address_count > 1;
;-- -. . -..- - / . -. - .-. -.--
select DISTINCT(concat(pc.customers_id, '-', pc.customers_firstname, '-', pc.customers_lastname)) as `unique`, pab.address_book_id
from polo_customers pc
left join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname
where pc.customers_default_address_id = ''
group by `unique`;
;-- -. . -..- - / . -. - .-. -.--
select DISTINCT(concat(pc.customers_id, '-', pc.customers_firstname, '-', pc.customers_lastname)) as `unique`, pab.address_book_id
from polo_customers pc
join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname
where pc.customers_default_address_id = ''
group by `unique`;
;-- -. . -..- - / . -. - .-. -.--
select pc.customers_id as `unique`, pab.address_book_id
from polo_customers pc
join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname
where pc.customers_default_address_id = ''
group by `unique`;
;-- -. . -..- - / . -. - .-. -.--
select pc.customers_id, pab.address_book_id
from polo_customers pc
join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname
where pc.customers_default_address_id = ''
group by pc.customers_id;
;-- -. . -..- - / . -. - .-. -.--
select count(*)
from polo_customers pc
join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname
where pc.customers_default_address_id = ''
group by pc.customers_id;
;-- -. . -..- - / . -. - .-. -.--
select count(pc.customers_id)
from polo_customers pc
join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname
where pc.customers_default_address_id = ''
group by pc.customers_id;
;-- -. . -..- - / . -. - .-. -.--
select count(distinct pc.customers_id)
from polo_customers pc
join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname
where pc.customers_default_address_id = ''
group by pc.customers_id;
;-- -. . -..- - / . -. - .-. -.--
select sum(distinct pc.customers_id)
from polo_customers pc
join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname
where pc.customers_default_address_id = ''
group by pc.customers_id;
;-- -. . -..- - / . -. - .-. -.--
select pc.customers_id, pab.address_book_id
from polo_customers pc
join polo_address_book pab on pc.customers_id = pab.customers_id
where pc.customers_default_address_id = ''
group by pc.customers_id;
;-- -. . -..- - / . -. - .-. -.--
select * from staff_info where first_name like "%Joseph%";
;-- -. . -..- - / . -. - .-. -.--
select * from staff_info where last_name like "%homas%";
;-- -. . -..- - / . -. - .-. -.--
select * from staff_info where last_name like "%marsh%";
;-- -. . -..- - / . -. - .-. -.--
select * from staff_info where last_name like "%Rebecca%";
;-- -. . -..- - / . -. - .-. -.--
Thomas;
;-- -. . -..- - / . -. - .-. -.--
select * from staff_info where last_name like "%Thomas%";
;-- -. . -..- - / . -. - .-. -.--
select * from products;
;-- -. . -..- - / . -. - .-. -.--
desc products;
;-- -. . -..- - / . -. - .-. -.--
select * from products where products_id = 3245;
;-- -. . -..- - / . -. - .-. -.--
desc manufacturers;
;-- -. . -..- - / . -. - .-. -.--
select * from staff_info where first_name like "%Rebecca%";
;-- -. . -..- - / . -. - .-. -.--
select staff_id, concat_ws(" ", first_name, last_name) from staff_info where first_name like "%Rebecca%";
;-- -. . -..- - / . -. - .-. -.--
select staff_id, concat_ws(" ", first_name, last_name) as full_name from staff_info where first_name like "%Rebecca%";
;-- -. . -..- - / . -. - .-. -.--
select * from brands;
;-- -. . -..- - / . -. - .-. -.--
select * from vendors;
;-- -. . -..- - / . -. - .-. -.--
select * from manufacturers_info;
;-- -. . -..- - / . -. - .-. -.--
select * from manufacturers;
;-- -. . -..- - / . -. - .-. -.--
select * from logins_users;
;-- -. . -..- - / . -. - .-. -.--
select * from logins_users where fullname like "%Rachel%";
;-- -. . -..- - / . -. - .-. -.--
select * from logins_users where fullname like "%Rachael%";
;-- -. . -..- - / . -. - .-. -.--
select * from logins_users WHERE fullname != '' AND department = 1 and fullname like "%Rachael%";
;-- -. . -..- - / . -. - .-. -.--
select * from logins_users WHERE fullname != '' AND department = 1;
;-- -. . -..- - / . -. - .-. -.--
select * from staff_info where first_name like "Wilkinson";
;-- -. . -..- - / . -. - .-. -.--
select * from staff_info where first_name like "Rachel";
;-- -. . -..- - / . -. - .-. -.--
select * from orders where orders_id = 5187206;
;-- -. . -..- - / . -. - .-. -.--
select * from products where products_id = 58093;
;-- -. . -..- - / . -. - .-. -.--
SELECT customisation_id
FROM customisations
WHERE customer_id = '4785037'
AND customisation_name = 'FrontTheodora (Print Logo)';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM ms_products_to_categories WHERE category_id = '28389' AND store_id = '19374';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM ms_products_to_categories WHERE categories_id = '28389' AND store_id = '19374';
;-- -. . -..- - / . -. - .-. -.--
desc ms_products_to_categories;
;-- -. . -..- - / . -. - .-. -.--
SELECT customisation_id
FROM customisations
WHERE customer_id = '4545785037'
AND customisation_name = 'FrontTheodora (Print Logo)';
;-- -. . -..- - / . -. - .-. -.--
select * from cron_log;
;-- -. . -..- - / . -. - .-. -.--
select * from cron_log where cron_name = 'artwork_auto_assign';
;-- -. . -..- - / . -. - .-. -.--
SELECT o.orders_id, o.shipping_type, o.grouped_orders, o.staff_name, c.account_manager
            FROM orders o
            LEFT JOIN customers c ON o.customers_id = c.customers_id
            WHERE o.date_first_processing > DATE_SUB(now(), INTERVAL 2 HOUR)
            AND o.orders_status IN (2, 12, 16)
            GROUP BY o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT GROUP_CONCAT(DISTINCT(custom_id)) AS oc_id
                FROM orders_customisations
                WHERE order_id = '5189215'
                AND assigned_artworker = ''
                HAVING oc_id IS NOT NULL;
;-- -. . -..- - / . -. - .-. -.--
SELECT GROUP_CONCAT(DISTINCT(custom_id)) AS oc_id
                FROM orders_customisations
                WHERE
#                       order_id = '5189215'
                assigned_artworker = ''
                HAVING oc_id IS NOT NULL;
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(orders_id) AS oc_id
                FROM orders_customisations
                WHERE
#                       order_id = '5189215'
                assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(order_id) AS oc_id
                FROM orders_customisations
                WHERE
#                       order_id = '5189215'
                assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(order_id), * AS oc_id
                FROM orders_customisations
                WHERE
#                       order_id = '5189215'
                assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(order_id), *
                FROM orders_customisations
                WHERE
#                       order_id = '5189215'
                assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(order_id), custom_type
                FROM orders_customisations
                WHERE
#                       order_id = '5189215'
                assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(order_id), custom_type, assigned_artworker, assigned_artworker_date
                FROM orders_customisations
                WHERE
#                       order_id = '5189215'
                assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT assigned_artworker, assigned_artworker_date, custom_id, order_id, custom_type, application_count, primary_type
                FROM orders_customisations
                WHERE
#                       order_id = '5189215'
                assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT assigned_artworker, assigned_artworker_date, order_id, custom_type
                FROM orders_customisations
                WHERE
#                       order_id = '5189215'
                assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(oc.order_id), oc.custom_type, oc.assigned_artworker, oc.assigned_artworker_date, o.date_purchased
    FROM orders_customisations oc
    JOIN orders o on oc.order_id = o.orders_id
    WHERE o.date_purchased < date_sub(now(), INTERVAL 4 HOUR)
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(oc.order_id), oc.custom_type, oc.assigned_artworker, oc.assigned_artworker_date, o.date_purchased
    FROM orders_customisations oc
    JOIN orders o on oc.order_id = o.orders_id
    WHERE o.date_purchased BETWEEN (date_sub(now(), INTERVAL 4 HOUR), date_sub(now(), INTERVAL 4 WEEK))
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(oc.order_id), oc.custom_type, oc.assigned_artworker, oc.assigned_artworker_date, o.date_purchased
    FROM orders_customisations oc
    JOIN orders o on oc.order_id = o.orders_id
    WHERE o.date_purchased BETWEEN date_sub(now(), INTERVAL 4 HOUR) AND date_sub(now(), INTERVAL 4 WEEK)
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(oc.order_id), oc.custom_type, oc.assigned_artworker, oc.assigned_artworker_date, o.date_purchased
    FROM orders_customisations oc
    JOIN orders o on oc.order_id = o.orders_id
    WHERE o.date_purchased BETWEEN date_sub(now(), INTERVAL 4 HOUR) AND date_sub(now(), INTERVAL 4 DAY)
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(oc.order_id), oc.custom_type, oc.assigned_artworker, oc.assigned_artworker_date, o.date_purchased
    FROM orders_customisations oc
    JOIN orders o on oc.order_id = o.orders_id
    WHERE o.date_purchased < date_sub(now(), INTERVAL 4 HOUR)
    AND o.date_purchased > date_sub(now(), INTERVAL 4 YEAR)
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(oc.order_id), oc.custom_type, oc.assigned_artworker, oc.assigned_artworker_date, o.date_purchased
    FROM orders_customisations oc
    JOIN orders o on oc.order_id = o.orders_id
    WHERE o.date_purchased < date_sub(now(), INTERVAL 4 HOUR)
    AND o.date_purchased > date_sub(now(), INTERVAL 4 MONTH)
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(oc.order_id), oc.custom_type, oc.assigned_artworker, oc.assigned_artworker_date, o.date_purchased
    FROM orders_customisations oc
    JOIN orders o on oc.order_id = o.orders_id
    WHERE o.date_purchased < date_sub(now(), INTERVAL 4 HOUR)
    AND o.date_purchased > date_sub(now(), INTERVAL 4 WEEK)
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(oc.order_id), oc.custom_type, oc.assigned_artworker, oc.assigned_artworker_date, o.date_purchased
    FROM orders_customisations oc
    JOIN orders o on oc.order_id = o.orders_id
    WHERE o.date_purchased < date_sub(now(), INTERVAL 4 HOUR)
    AND o.date_purchased > date_sub(now(), INTERVAL 4 DAY)
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(oc.order_id), oc.custom_type, oc.assigned_artworker, oc.assigned_artworker_date, o.date_purchased
    FROM orders_customisations oc
    JOIN orders o on oc.order_id = o.orders_id
    WHERE o.date_purchased < date_sub(now(), INTERVAL 1 DAY)
    AND o.date_purchased > date_sub(now(), INTERVAL 4 DAY)
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(oc.order_id), oc.custom_type, oc.assigned_artworker, oc.assigned_artworker_date, o.date_purchased
    FROM orders_customisations oc
    JOIN orders o on oc.order_id = o.orders_id
    WHERE o.date_purchased < date_sub(now(), INTERVAL 1 DAY)
    AND o.date_purchased > date_sub(now(), INTERVAL 4 DAY)
    AND o.orders_status IN (2, 12)
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(oc.order_id), oc.custom_type, oc.assigned_artworker, oc.assigned_artworker_date, o.date_purchased
    FROM orders_customisations oc
    JOIN orders o on oc.order_id = o.orders_id
    WHERE o.date_purchased < date_sub(now(), INTERVAL 1 DAY)
    AND o.date_purchased > date_sub(now(), INTERVAL 4 DAY)
    AND o.orders_status IN (2, 12, 16)
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(oc.order_id), oc.custom_type, oc.assigned_artworker, oc.assigned_artworker_date, o.date_purchased
    FROM orders_customisations oc
    JOIN orders o on oc.order_id = o.orders_id
    WHERE o.date_purchased < date_sub(now(), INTERVAL 1 DAY)
    AND o.date_purchased > date_sub(now(), INTERVAL 4 WEEK)
    AND o.orders_status IN (2, 12, 16)
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(oc.order_id), oc.custom_type, oc.assigned_artworker, oc.assigned_artworker_date, o.date_purchased
    FROM orders_customisations oc
    JOIN orders o on oc.order_id = o.orders_id
    WHERE o.date_purchased < date_sub(now(), INTERVAL 1 DAY)
    AND o.date_purchased > date_sub(now(), INTERVAL 4 MONTH)
    AND o.orders_status IN (2, 12, 16)
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(oc.order_id), oc.custom_type, oc.assigned_artworker, oc.assigned_artworker_date, o.date_purchased
    FROM orders_customisations oc
    JOIN orders o on oc.order_id = o.orders_id
    WHERE o.date_purchased < date_sub(now(), INTERVAL 1 DAY)
    AND o.date_purchased > date_sub(now(), INTERVAL 4 YEAR)
    AND o.orders_status IN (2, 12, 16)
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
select * from orders_status;
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(oc.order_id), oc.custom_type, oc.assigned_artworker, oc.assigned_artworker_date, o.date_purchased, o.orders_status
    FROM orders_customisations oc
    JOIN orders o on oc.order_id = o.orders_id
    WHERE o.date_purchased < date_sub(now(), INTERVAL 1 DAY)
    AND o.date_purchased > date_sub(now(), INTERVAL 4 YEAR)
    AND o.orders_status IN (2, 12, 16)
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(oc.order_id), oc.custom_type, oc.assigned_artworker, oc.assigned_artworker_date, o.date_purchased, o.orders_status
    FROM orders_customisations oc
    JOIN orders o on oc.order_id = o.orders_id
    WHERE o.date_purchased < date_sub(now(), INTERVAL 4 HOUR)
    AND o.date_purchased > date_sub(now(), INTERVAL 4 YEAR)
    AND o.orders_status IN (2, 12, 16)
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT DISTINCT(oc.order_id), oc.custom_type, oc.assigned_artworker, oc.assigned_artworker_date, o.date_purchased, o.orders_status
    FROM orders_customisations oc
    JOIN orders o on oc.order_id = o.orders_id
    WHERE o.date_purchased < date_sub(now(), INTERVAL 1 HOUR)
    AND o.date_purchased > date_sub(now(), INTERVAL 4 YEAR)
    AND o.orders_status IN (2, 12, 16)
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
select distinct subject from tep_mail_sent;
;-- -. . -..- - / . -. - .-. -.--
select * from tep_mail_sent;
;-- -. . -..- - / . -. - .-. -.--
select * from integrity_check_notification;
;-- -. . -..- - / . -. - .-. -.--
select * from integrity_check_notification where check_id in (4, 24);
;-- -. . -..- - / . -. - .-. -.--
select * from integrity_check_notification where check_id in (4, 24) and active = 1;
;-- -. . -..- - / . -. - .-. -.--
select * from integrity_check_notification icn
join staff_info si on icn.staff_id = si.staff_id
where check_id in (4, 24) and active = 0;
;-- -. . -..- - / . -. - .-. -.--
desc integrity_check_notification;
;-- -. . -..- - / . -. - .-. -.--
select * from staff_info where first_name like "Maria";
;-- -. . -..- - / . -. - .-. -.--
select * from staff_info where first_name like "Jonathan";
;-- -. . -..- - / . -. - .-. -.--
select si.quayside_email from integrity_check_notification icn
join staff_info si on icn.staff_id = si.staff_id
where check_id in (4, 24) and active = 1;
;-- -. . -..- - / . -. - .-. -.--
select distinct si.quayside_email from integrity_check_notification icn
join staff_info si on icn.staff_id = si.staff_id
where check_id in (4, 24) and active = 1;
;-- -. . -..- - / . -. - .-. -.--
select * from integrity_check_result where check_id in (4, 24);
;-- -. . -..- - / . -. - .-. -.--
select * from integrity_check_result where check_id in (4, 24) order by date desc;
;-- -. . -..- - / . -. - .-. -.--
select * from integrity_check_result
where check_id in (4, 24)
and details like "%5184110%"
order by date desc;
;-- -. . -..- - / . -. - .-. -.--
select * from integrity_check_result
where check_id in (4, 24)
and actual_value > 0
# and details like "%5184110%"
order by date desc;
;-- -. . -..- - / . -. - .-. -.--
select * from clothes2_osC.orders where orders_id = 5184110;
;-- -. . -..- - / . -. - .-. -.--
select date_purchased from clothes2_osC.orders where orders_id = 5184110;
;-- -. . -..- - / . -. - .-. -.--
select * from integrity_check_result
where check_id in (4, 24)
and actual_value > 0
and date > '2020-02-16 11:20:00'
and date < '2020-02-26 11:20:00'
# and details like "%5184110%"
order by date desc;
;-- -. . -..- - / . -. - .-. -.--
select * from integrity_check_result
# where check_id in (4, 24)
where check_id in (24)
and actual_value > 0
and date > '2020-02-16 11:20:00'
and date < '2020-02-26 11:20:00'
# and details like "%5184110%"
order by date desc;
;-- -. . -..- - / . -. - .-. -.--
SELECT o.orders_id, o.date_first_processing, o.shipping_type
    FROM orders o, orders_customisations oc
    WHERE o.date_first_processing BETWEEN DATE_SUB(now(), INTERVAL 7 DAY) AND DATE_SUB(now(), INTERVAL 3 HOUR)
    AND o.orders_status = 2
    AND oc.order_id = o.orders_id
    AND oc.assigned_artworker_date = '0000-00-00 00:00:00';
;-- -. . -..- - / . -. - .-. -.--
SELECT o.orders_id, o.date_first_processing, o.shipping_type
    FROM orders o, orders_customisations oc
    WHERE o.date_first_processing BETWEEN DATE_SUB(now(), INTERVAL 7 DAY) AND DATE_SUB(now(), INTERVAL 1 MINUTE)
    AND o.orders_status = 2
    AND oc.order_id = o.orders_id
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT o.orders_id, o.date_first_processing, o.shipping_type
    FROM orders o, orders_customisations oc
    WHERE o.date_first_processing BETWEEN DATE_SUB(now(), INTERVAL 7 DAY) AND DATE_SUB(now(), INTERVAL 3 HOUR)
    AND o.orders_status = 2
    AND oc.order_id = o.orders_id
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT o.orders_id, o.date_first_processing, o.shipping_type
    FROM orders o, orders_customisations oc
    WHERE o.date_first_processing BETWEEN DATE_SUB(now(), INTERVAL 7 DAY) AND DATE_SUB(now(), INTERVAL 3 HOUR)
    AND o.orders_status = 2
    AND oc.order_id = o.orders_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT o.orders_id, o.date_first_processing, o.shipping_type
    FROM orders o, orders_customisations oc
    WHERE o.date_first_processing BETWEEN DATE_SUB(now(), INTERVAL 7 DAY) AND DATE_SUB(now(), INTERVAL 3 HOUR)
    AND o.orders_status = 2
    AND oc.order_id = o.orders_id
    AND o.orders_id =     5184110;
;-- -. . -..- - / . -. - .-. -.--
SELECT o.orders_id, o.date_first_processing, o.shipping_type, oc.assigned_artworker
    FROM orders o, orders_customisations oc
    WHERE o.date_first_processing BETWEEN DATE_SUB(now(), INTERVAL 7 DAY) AND DATE_SUB(now(), INTERVAL 3 HOUR)
    AND o.orders_status = 2
    AND oc.order_id = o.orders_id
    AND o.orders_id =     5184110;
;-- -. . -..- - / . -. - .-. -.--
SELECT o.orders_id, o.date_first_processing, o.shipping_type, oc.assigned_artworker
    FROM orders o, orders_customisations oc
    WHERE o.date_first_processing BETWEEN DATE_SUB(now(), INTERVAL 7 WEEK) AND DATE_SUB(now(), INTERVAL 3 HOUR)
    AND o.orders_status = 2
    AND oc.order_id = o.orders_id
    AND o.orders_id =     5184110;
;-- -. . -..- - / . -. - .-. -.--
SELECT o.orders_id, o.date_first_processing, o.shipping_type, oc.assigned_artworker
    FROM orders o, orders_customisations oc
    WHERE o.date_first_processing BETWEEN DATE_SUB(now(), INTERVAL 7 WEEK) AND DATE_SUB(now(), INTERVAL 3 HOUR)
    AND o.orders_status = 2
    AND oc.order_id = o.orders_id
#     AND o.orders_id =     5184110
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT o.orders_id, o.date_first_processing, o.shipping_type, oc.assigned_artworker
    FROM orders o, orders_customisations oc
    WHERE o.date_first_processing BETWEEN DATE_SUB(now(), INTERVAL 7 WEEK) AND DATE_SUB(now(), INTERVAL 3 HOUR)
    AND o.orders_status = 2
    AND oc.order_id = o.orders_id
    AND oc.assigned_artworker = '';
;-- -. . -..- - / . -. - .-. -.--
SELECT o.orders_id, o.date_first_processing, o.shipping_type, oc.assigned_artworker
    FROM orders o, orders_customisations oc
    WHERE o.date_first_processing BETWEEN DATE_SUB(now(), INTERVAL 7 WEEK) AND DATE_SUB(now(), INTERVAL 3 HOUR)
    AND o.orders_status = 2
    AND oc.order_id = o.orders_id
    AND oc.assigned_artworker_date = '0000-00-00 00:00:00';
;-- -. . -..- - / . -. - .-. -.--
select * from integrity_check_notification icn
join staff_info si on icn.staff_id = si.staff_id
where check_id in (4, 24) and active = 1;
;-- -. . -..- - / . -. - .-. -.--
select * from integrity_check_result
# where check_id in (4, 24)
where check_id in (24)
and actual_value > 0
and date > '2020-02-16 11:20:00'
# and details like "%5184110%"
order by date desc;
;-- -. . -..- - / . -. - .-. -.--
select * from integrity_check_result
# where check_id in (4, 24)
where check_id in (4,24)
and actual_value > 0
and date > '2020-02-16 11:20:00'
# and details like "%5184110%"
order by date desc;
;-- -. . -..- - / . -. - .-. -.--
select * from staff_info where first_name like "Sally";
;-- -. . -..- - / . -. - .-. -.--
select * from staff_info where first_name like "Artur";
;-- -. . -..- - / . -. - .-. -.--
select * from staff_info where first_name like "Kirsty";
;-- -. . -..- - / . -. - .-. -.--
SELECT colour_id, image_small FROM ms_product_images WHERE view_id = '1' AND product_id = '58093' AND colour_id is not null LIMIT 0,1;
;-- -. . -..- - / . -. - .-. -.--
SELECT colour_id, image_small FROM ms_product_images WHERE view_id = '1' AND product_id = '58093' LIMIT 0,1;
;-- -. . -..- - / . -. - .-. -.--
desc countries;
;-- -. . -..- - / . -. - .-. -.--
select * from countries where countries_iso_code_2 not in (
'AF',
'AX',
'AL',
'DZ',
'AS',
'AD',
'AO',
'AI',
'AQ',
'AG',
'AR',
'AM',
'AW',
'AU',
'AT',
'AZ',
'BH',
'BS',
'BD',
'BB',
'BY',
'BE',
'BZ',
'BJ',
'BM',
'BT',
'BO',
'BQ',
'BA',
'BW',
'BV',
'BR',
'IO',
'BN',
'BG',
'BF',
'BI',
'KH',
'CM',
'CA',
'CV',
'KY',
'CF',
'TD',
'CL',
'CN',
'CX',
'CC',
'CO',
'KM',
'CG',
'CD',
'CK',
'CR',
'CI',
'HR',
'CU',
'CW',
'CY',
'CZ',
'DK',
'DJ',
'DM',
'DO',
'EC',
'EG',
'SV',
'GQ',
'ER',
'EE',
'ET',
'FK',
'FO',
'FJ',
'FI',
'FR',
'GF',
'PF',
'TF',
'GA',
'GM',
'GE',
'DE',
'GH',
'GI',
'GR',
'GL',
'GD',
'GP',
'GU',
'GT',
'GG',
'GN',
'GW',
'GY',
'HT',
'HM',
'VA',
'HN',
'HK',
'HU',
'IS',
'IN',
'ID',
'IR',
'IQ',
'IE',
'IM',
'IL',
'IT',
'JM',
'JP',
'JE',
'JO',
'KZ',
'KE',
'KI',
'KP',
'KR',
'KW',
'KG',
'LA',
'LV',
'LB',
'LS',
'LR',
'LY',
'LI',
'LT',
'LU',
'MO',
'MK',
'MG',
'MW',
'MY',
'MV',
'ML',
'MT',
'MH',
'MQ',
'MR',
'MU',
'YT',
'MX',
'FM',
'MD',
'MC',
'MN',
'ME',
'MS',
'MA',
'MZ',
'MM',
'NA',
'NR',
'NP',
'NL',
'NC',
'NZ',
'NI',
'NE',
'NG',
'NU',
'NF',
'MP',
'NO',
'OM',
'PK',
'PW',
'PS',
'PA',
'PG',
'PY',
'PE',
'PH',
'PN',
'PL',
'PT',
'PR',
'QA',
'RE',
'RO',
'RU',
'RW',
'BL',
'SH',
'KN',
'LC',
'MF',
'PM',
'VC',
'WS',
'SM',
'ST',
'SA',
'SN',
'RS',
'SC',
'SL',
'SG',
'SX',
'SK',
'SI',
'SB',
'SO',
'ZA',
'GS',
'SS',
'ES',
'LK',
'SD',
'SR',
'SJ',
'SZ',
'SE',
'CH',
'SY',
'TW',
'TJ',
'TZ',
'TH',
'TL',
'TG',
'TK',
'TO',
'TT',
'TN',
'TR',
'TM',
'TC',
'TV',
'UG',
'UA',
'AE',
'GB',
'US',
'UM',
'UY',
'UZ',
'VU',
'VE',
'VN',
'VG',
'VI',
'WF',
'EH',
'YE',
'ZM',
'ZW'

    );
;-- -. . -..- - / . -. - .-. -.--
select * from countries where countries_iso_code_2 <> countries_iso_code_sagepay;
;-- -. . -..- - / . -. - .-. -.--
select * from countries where countries_iso_code_sagepay not in (
'AF',
'AX',
'AL',
'DZ',
'AS',
'AD',
'AO',
'AI',
'AQ',
'AG',
'AR',
'AM',
'AW',
'AU',
'AT',
'AZ',
'BH',
'BS',
'BD',
'BB',
'BY',
'BE',
'BZ',
'BJ',
'BM',
'BT',
'BO',
'BQ',
'BA',
'BW',
'BV',
'BR',
'IO',
'BN',
'BG',
'BF',
'BI',
'KH',
'CM',
'CA',
'CV',
'KY',
'CF',
'TD',
'CL',
'CN',
'CX',
'CC',
'CO',
'KM',
'CG',
'CD',
'CK',
'CR',
'CI',
'HR',
'CU',
'CW',
'CY',
'CZ',
'DK',
'DJ',
'DM',
'DO',
'EC',
'EG',
'SV',
'GQ',
'ER',
'EE',
'ET',
'FK',
'FO',
'FJ',
'FI',
'FR',
'GF',
'PF',
'TF',
'GA',
'GM',
'GE',
'DE',
'GH',
'GI',
'GR',
'GL',
'GD',
'GP',
'GU',
'GT',
'GG',
'GN',
'GW',
'GY',
'HT',
'HM',
'VA',
'HN',
'HK',
'HU',
'IS',
'IN',
'ID',
'IR',
'IQ',
'IE',
'IM',
'IL',
'IT',
'JM',
'JP',
'JE',
'JO',
'KZ',
'KE',
'KI',
'KP',
'KR',
'KW',
'KG',
'LA',
'LV',
'LB',
'LS',
'LR',
'LY',
'LI',
'LT',
'LU',
'MO',
'MK',
'MG',
'MW',
'MY',
'MV',
'ML',
'MT',
'MH',
'MQ',
'MR',
'MU',
'YT',
'MX',
'FM',
'MD',
'MC',
'MN',
'ME',
'MS',
'MA',
'MZ',
'MM',
'NA',
'NR',
'NP',
'NL',
'NC',
'NZ',
'NI',
'NE',
'NG',
'NU',
'NF',
'MP',
'NO',
'OM',
'PK',
'PW',
'PS',
'PA',
'PG',
'PY',
'PE',
'PH',
'PN',
'PL',
'PT',
'PR',
'QA',
'RE',
'RO',
'RU',
'RW',
'BL',
'SH',
'KN',
'LC',
'MF',
'PM',
'VC',
'WS',
'SM',
'ST',
'SA',
'SN',
'RS',
'SC',
'SL',
'SG',
'SX',
'SK',
'SI',
'SB',
'SO',
'ZA',
'GS',
'SS',
'ES',
'LK',
'SD',
'SR',
'SJ',
'SZ',
'SE',
'CH',
'SY',
'TW',
'TJ',
'TZ',
'TH',
'TL',
'TG',
'TK',
'TO',
'TT',
'TN',
'TR',
'TM',
'TC',
'TV',
'UG',
'UA',
'AE',
'GB',
'US',
'UM',
'UY',
'UZ',
'VU',
'VE',
'VN',
'VG',
'VI',
'WF',
'EH',
'YE',
'ZM',
'ZW'
);
;-- -. . -..- - / . -. - .-. -.--
select * from customers where customers_lastname like "hopwood";
;-- -. . -..- - / . -. - .-. -.--
show create table relative_config;
;-- -. . -..- - / . -. - .-. -.--
select * from relative_config;
;-- -. . -..- - / . -. - .-. -.--
select * from orders where orders_id = 5189893;
;-- -. . -..- - / . -. - .-. -.--
select api_partner_id from orders where orders_id = 5189893;
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners_log where api_partner_id = 1050 limit 10;
;-- -. . -..- - / . -. - .-. -.--
select api_partner_id, date_purchased from orders where orders_id = 5189893;
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners_log
where api_partner_id = 1050
and date_added between '2020-03-04 17:00:00' and '2020-03-04 18:00:00'
limit 10;
;-- -. . -..- - / . -. - .-. -.--
select * from countries
WHERE countries_iso_code_2 <> countries_iso_code_sagepay;
;-- -. . -..- - / . -. - .-. -.--
select * from countries
WHERE countries_iso_code_2 = 'NL'
OR countries_iso_code_3 = 'NL'
OR countries_iso_code_sagepay = 'NL';
;-- -. . -..- - / . -. - .-. -.--
select countries_iso_code_sagepay from countries
WHERE countries_iso_code_2 <> countries_iso_code_sagepay;
;-- -. . -..- - / . -. - .-. -.--
select countries_iso_code_sagepay from countries
WHERE countries_iso_code_2 != countries_iso_code_sagepay;
;-- -. . -..- - / . -. - .-. -.--
select * from orders where delivery_country in (
    select countries_iso_code_sagepay from countries
    WHERE countries_iso_code_2 <> countries_iso_code_sagepay
)
and customers_id = 0;
;-- -. . -..- - / . -. - .-. -.--
select * from orders
where delivery_country in (
    select countries_iso_code_sagepay from countries
    WHERE countries_iso_code_2 <> countries_iso_code_sagepay
)
or customers_country in (
    select countries_iso_code_sagepay from countries
    WHERE countries_iso_code_2 <> countries_iso_code_sagepay
)
or billing_country in (
    select countries_iso_code_sagepay from countries
    WHERE countries_iso_code_2 <> countries_iso_code_sagepay
)
and customers_id = 0;
;-- -. . -..- - / . -. - .-. -.--
select * from countries where countries_iso_code_2 <> countries_iso_code_sagepay
order by countries_name asc;