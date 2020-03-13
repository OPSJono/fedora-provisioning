desc countries;

select * from countries where countries_iso_code_2 <> countries_iso_code_sagepay
order by countries_name asc;



select api_partner_id, date_purchased from orders where orders_id = 5189893;

api_partner_id = 1050;

select * from api_partners_log
where api_partner_id = 1050
and date_added between '2020-03-04 17:00:00' and '2020-03-04 18:00:00'
limit 10;


select * from countries
WHERE countries_iso_code_2 = 'NL'
OR countries_iso_code_3 = 'NL'
OR countries_iso_code_sagepay = 'NL'
;

UPDATE orders
SET delivery_country = 'Netherlands',
    customers_country = 'Netherlands',
    billing_country = 'Netherlands'
WHERE orders_id = 5189893;

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
and customers_id = 0
;





# Total order count: 557675
# 419 records grouped by (orders_id, custom_type, customisation_width)
# There are only 396 unique order numbers in the result set. :: 0.07% of ecom orders
# Orders with Duplicate Files
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
;
# List all files for an order id.
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

  and o.orders_id = 5174233
  and oc.custom_type like "%storm%"
  and c.customisation_width = "9"

order by o.orders_id desc
;

# 20 total files
# 12 emb, 8 print
# 4 print are dupes
# 4 emb are dupes
# 4 uniques

select * from orders where orders_status;

show full processlist;