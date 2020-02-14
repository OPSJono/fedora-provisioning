update orders set credit_reminder_sent = 0 where orders_id = 5160885;
;-- -. . -..- - / . -. - .-. -.--
select orders_id, credit_reminder_sent from orders where orders_id = 5160885;
;-- -. . -..- - / . -. - .-. -.--
update orders set credit_reminder_sent = 1 where orders_id = 5160885;
;-- -. . -..- - / . -. - .-. -.--
select * from staff_info;
;-- -. . -..- - / . -. - .-. -.--
select * from staff_info where first_name like "%onathan%";
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_users;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_users where shop like "%work%";
;-- -. . -..- - / . -. - .-. -.--
select * from categories_description;
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, shopify_user)
VALUES (
        "category",
        122,
        96
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "category",
        122,
       null,
        96
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "category",
        122,
        0,
        96
       );
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_user_options where parent_value < 1;
;-- -. . -..- - / . -. - .-. -.--
select distinct value_type from shopify_user_options;
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        1055,
        122,
        96
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        3389, # Product ID
        106, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        1674, # Product ID
        17, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        929, # Product ID
        14, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        1757, # Product ID
        17, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        3390, # Product ID
        106, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        2635, # Product ID
        18, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        1191, # Product ID
        18, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
select * from categories_description where categories_name = 'softshell-jackets';
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        3069, # Product ID
        122, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_user_options where shopify_user = 96;
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        3094, # Product ID
        18, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        3104, # Product ID
        14, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        3105, # Product ID
        14, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        3106, # Product ID
        103, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        3098, # Product ID
        87, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
select * from categories_description where categories_name = 'fleeces';
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "category",
        121,
        0,
        96
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        3099, # Product ID
        121, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        3102, # Product ID
        14, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        2958, # Product ID
        18, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        1675, # Product ID
        17, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        1756, # Product ID
        17, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        3103, # Product ID
        14, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        3101, # Product ID
        87, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        1193, # Product ID
        18, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        2181, # Product ID
        21, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        1280, # Product ID
        21, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        1459, # Product ID
        30, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        3100, # Product ID
        30, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        2321, # Product ID
        30, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        2979, # Product ID
        133, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        2655, # Product ID
        103, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_user_options where shopify_user = 96 order by custom_value_id desc;
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        1593, # Product ID
        29, # Category ID
        96 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_users where id = 96;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_users where shopify_user like "%work%";
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_users where shopify_user like "%AFE2U%";
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_users where shopify_user like "%WorkWearPortal%";
;-- -. . -..- - / . -. - .-. -.--
select * from categories_description where categories_name = 'caps & hats';
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_user_options where value = 29 or parent_value = 29;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_user_options where value = 29 or parent_value = 29 and shopify_user = 96;
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES ("category",
        29, # Category Id
        0, # always 0
        96 # User ID
        );
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_user_options where (value = 29 or parent_value = 29) and shopify_user = 96;
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.staff_info;
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.staff_info where first_name like "%oppy%";
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_user_options where (value = 2655 ) and shopify_user = 96;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_user_options where (value = 2655) and shopify_user = 96;
;-- -. . -..- - / . -. - .-. -.--
select * from categories_description where categories_name = 'hi visibility workwear';
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_user_options where (value = 29) and shopify_user = 96;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_users where shop like "%WorkWearPortal%";
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_users where shopify_user = 97;
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES ("category",
        29, # Category Id
        0, # always 0
        97 # User ID
        );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        1593, # Product ID
        29, # Category ID
        97 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        2655, # Product ID
        29, # Category ID
        97 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_user_options where (value = 2655) and shopify_user = 97;
;-- -. . -..- - / . -. - .-. -.--
select * from categories_description where categories_name = 'on-demand';
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        3390, # Product ID
        106, # Category ID
        97 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
update orders set credit_reminder_sent = 0 where orders_id = 5176037;
;-- -. . -..- - / . -. - .-. -.--
select orders_id, credit_reminder_sent from orders where orders_id = 5176037;
;-- -. . -..- - / . -. - .-. -.--
update orders set credit_reminder_sent = 0 where orders_id = 5176401;
;-- -. . -..- - / . -. - .-. -.--
select orders_id, credit_reminder_sent from orders where orders_id = 5176401;
;-- -. . -..- - / . -. - .-. -.--
update orders set credit_reminder_sent = 1 where orders_id = 5176037;
;-- -. . -..- - / . -. - .-. -.--
update orders set credit_reminder_sent = 1 where orders_id = 5176401;
;-- -. . -..- - / . -. - .-. -.--
update poloshir_osC.products_stock_allocated set vendor_email_sent = 'Y' where order_id = 5181442 and allocated_site = 'c2o';
;-- -. . -..- - / . -. - .-. -.--
select * from poloshir_osC.products_stock_allocated where order_id = 5181442 and allocated_site = 'c2o';
;-- -. . -..- - / . -. - .-. -.--
select * from staff_info where first_name like "%ayne%";
;-- -. . -..- - / . -. - .-. -.--
select * from staff_permissions;
;-- -. . -..- - / . -. - .-. -.--
select * from logins_passwords;
;-- -. . -..- - / . -. - .-. -.--
select * from password_resets;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_users where shop like "%Cosmic%";
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_users where shopify_user = 107;
;-- -. . -..- - / . -. - .-. -.--
select * from categories_description where categories_name = 'personalised hoodies';
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        1070, # Product ID
        32, # Category ID
        107 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        1081, # Product ID
        82, # Category ID
        107 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        2324, # Product ID
        30, # Category ID
        107 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
select * from categories_description where categories_name = 'beanies';
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES ("category",
        129, # Category Id
        0, # always 0
        107 # User ID
        );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        3309, # Product ID
        129, # Category ID
        107 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
select * from categories_description where categories_name = 'scarves';
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES ("category",
        132, # Category Id
        0, # always 0
        107 # User ID
        );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        2971, # Product ID
        132, # Category ID
        107 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        3110, # Product ID
        14, # Category ID
        107 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
VALUES (
        "product",
        3005, # Product ID
        16, # Category ID
        107 # User ID
       );
;-- -. . -..- - / . -. - .-. -.--
explain update polo_customers pc
join polo_address_book pab on pc.customers_firstname = pab.entry_firstname and pc.customers_lastname = pab.entry_lastname
set pc.customers_default_address_id = pab.address_book_id
where pc.customers_default_address_id = '';
;-- -. . -..- - / . -. - .-. -.--
explain update polo_customers pc
join polo_address_book pab on pc.customers_id = pab.customers_id
set pc.customers_default_address_id = pab.address_book_id
where pc.customers_default_address_id = '';
;-- -. . -..- - / . -. - .-. -.--
update polo_customers pc
join polo_address_book pab on pc.customers_id = pab.customers_id
set pc.customers_default_address_id = pab.address_book_id
where pc.customers_default_address_id = '';