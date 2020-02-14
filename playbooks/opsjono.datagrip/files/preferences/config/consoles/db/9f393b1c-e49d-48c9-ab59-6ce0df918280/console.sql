select orders_id, credit_reminder_sent from orders where orders_id = 5176037;
update orders set credit_reminder_sent = 1 where orders_id = 5176037;

select orders_id, credit_reminder_sent from orders where orders_id = 5176401;
update orders set credit_reminder_sent = 1 where orders_id = 5176401;


explain update polo_customers pc
join polo_address_book pab on pc.customers_id = pab.customers_id
set pc.customers_default_address_id = pab.address_book_id
where pc.customers_default_address_id = ''
;



select * from poloshir_osC.products_stock_allocated where order_id = 5181442 and allocated_site = 'c2o';
update poloshir_osC.products_stock_allocated set vendor_email_sent = 'Y' where order_id = 5181442 and allocated_site = 'c2o';

select * from quaysidg_news.staff_info where first_name like "%oppy%";

select * from staff_info where first_name like "%ayne%";

# workwearportal

# First find the id of the shopify store:
select * from shopify_users where shop like "%Cosmic%";
select * from shopify_users where shopify_user = 107;

# Then find the product in question on the live site:
# https://www.clothes2order.com/advanced_search_result.php?searchwords=knitted+hat
# Result:
# https://www.clothes2order.com/caps+%26+hats/Beechfield+Knitted+Hat
# "View Page Source" of the result.
# You'll see a `window.dataLayer.push({`
# Within that, there are two fields we're interested in:
# `productProductID` - in this case: '1459'
# and `ecommerce.details.products.category` - in this case: 'caps & hats'

# We need to convert the text of the category into an id:
select * from categories_description where categories_name = 'scarves';

select * from shopify_user_options where (value = 2655) and shopify_user = 107;
select * from shopify_user_options where (value = 29) and shopify_user = 107;

# Now we need to make sure the shopify user has that category:
# IMPORTANT: We DO NOT need to do this if it is a "default" category.
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES ("category",
        132, # Category Id
        0, # always 0
        107 # User ID
        );

# Once the user has the category (or if it's a default category)
# We can insert the product to tha shop.
# Repeat this step for each missing product.
# Remember to get the product ID and Category name from the website, and convert the category name to the ID.
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        3005, # Product ID
        16, # Category ID
        107 # User ID
       );


select * from shopify_user_options where shopify_user = 96;
select * from categories_description where categories_name = 'hi visibility workwear';
#Product: 1055 - Category id: 122


select * from shopify_user_options where shopify_user = 96 order by custom_value_id desc;

# Category insert
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "category",
        121,
        0,
        96
       );

# Product Insert
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        1593, # Product ID
        29, # Category ID
        96 # User ID
       );

# Product Insert
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        3390, # Product ID
        106, # On-Demand Category ID
        96 # User ID
       );

select distinct value_type from shopify_user_options;

# no products found for 'CR006'

