use clothes2_osC;
select * from orders where payment_method = 'api'
and orders_status = '7'
order by date_first_processing desc;

select * from shopify_customisations where shopify_user = 1 order by customisation_id desc;

select * from categories_description where categories_description like "%caps%";

insert into shopify_user_options (value_type, value, parent_value, shopify_user) values
('category', 30, 0, 1),
('product', 751, 30, 1)
;

select * from shopify_user_options where shopify_user = 1;

select * from api_partners;

select * from api_partners_shipping_delivery_terms;

select * from api_customisation_files;
select * from custom_order_data;
select * from custom_order_data where orders_id = 5353114;
select * from orders_total where orders_id = 5353114;

select * from qtagcom_osC.polo_customers where customers_email_address = 'rU9NidJKVPmUBnag@c2o.com';
select * from qtagcom_osC.polo_address_book where customers_id = 83427;