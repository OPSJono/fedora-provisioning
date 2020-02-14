select pc.customers_id, pab.address_book_id
from polo_customers pc
join polo_address_book pab on pc.customers_id = pab.customers_id
where pc.customers_default_address_id = ''
group by pc.customers_id
;

select distinct pc.customers_id, pc.customers_firstname, pc.customers_lastname, pc.customers_email_address, count(pab.address_book_id) as address_count
from polo_customers pc
left join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname

where customers_default_address_id = ''
having address_count > 1
;

# 5655
select count(*) from polo_customers
where customers_default_address_id = ''
;

explain update polo_customers pc
join polo_address_book pab on pc.customers_id = pab.customers_id
set pc.customers_default_address_id = pab.address_book_id
where pc.customers_default_address_id = ''
;

select * from polo_customers where customers_default_address_id > '';
select * from polo_address_book;

select * from polo_address_book;
select * from

select * from orders where orders_id = '5176464';

select * from products where products_id = 765;

select
products_price1,
products_price2_qty, products_price2,
products_price3_qty, products_price3,
products_price4_qty, products_price4,
products_price5_qty, products_price5,
products_price6_qty, products_price6,
products_price7_qty, products_price7
from products where products_id = '765';

desc products;

select * from customers_basket_attributes
where customers_id = 5961034
and products_id = 765
limit 10;

select products_id, options_id, options_values_id, options_values_price, price_prefix
from products_attributes
where price_prefix > ''
  and options_values_price > 0.0000
;

select * from stock;


select * from customisation_files where id = 1875321;

select * from orders_customisations_types where emb_kingf > 0;

show create table customisation_files;
EXPLAIN SELECT customisation_id
FROM clothes2_osC.customisation_files AS cf
WHERE cf.customer_id <> 0 AND cf.file_type = 1
 AND (
    SELECT COUNT(*)
    FROM customisation_files AS cff
    WHERE cff.id <> cf.id AND cf.customer_id = cff.customer_id
        AND cff.created_at BETWEEN DATE_ADD(cf.created_at, INTERVAL 2 MINUTE ) AND DATE_ADD(cf.created_at, INTERVAL 1 HOUR)
        AND SUBSTRING_INDEX(cf.url, '.', -1) = SUBSTRING_INDEX(cff.url, '.', -1)
) <> 0
LIMIT 5000;

show full processlist;

select count(*) from customisation_files_perceptual_hashes;

# 143000 orders
select oc.customisation_id from orders o
join orders_customisations oc on oc.order_id = o.orders_id
where o.date_purchased > '2019-01-01 00:00:00'
order by orders_id desc;

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