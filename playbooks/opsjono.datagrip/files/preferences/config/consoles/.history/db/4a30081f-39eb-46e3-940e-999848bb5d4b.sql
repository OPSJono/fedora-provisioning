select * from shopify_orders where shopify_id in (
    39774,
39816,
39828,
39832,
39834

    );
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_orders where shopify_orders_id in (
    39774,
39816,
39828,
39832,
39834

    );
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_orders where shopify_order_id in (
    39774,
39816,
39828,
39832,
39834

    );
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_orders where order_number = 'UFC39882';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5362474 where shopify_user = 51 and shopify_order_id = 'UFC39971';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5362225 where shopify_user = 51 and shopify_order_id = 'UFC39946';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5362220 where shopify_user = 51 and shopify_order_id = 'UFC39945';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5361984 where shopify_user = 51 and shopify_order_id = 'UFC39909';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5361777 where shopify_user = 51 and shopify_order_id = 'UFC39882';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5361559 where shopify_user = 51 and shopify_order_id = 'UFC39880';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5361551 where shopify_user = 51 and shopify_order_id = 'UFC39878';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5361543 where shopify_user = 51 and shopify_order_id = 'UFC39876';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5361482 where shopify_user = 51 and shopify_order_id = 'UFC39867';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5360996 where shopify_user = 51 and shopify_order_id = 'UFC39846';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5361850 where shopify_user = 19 and shopify_order_id = 'LFC35097';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5361850 where shopify_user = 19 and order_number = 'LFC35097';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5361850, order_status = 'in production' where shopify_user = 19 and order_number = 'LFC35097';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5362474, order_status = 'in production' where shopify_user = 51 and order_number = 'UFC39971';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5362225, order_status = 'in production' where shopify_user = 51 and order_number = 'UFC39946';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5362220, order_status = 'in production' where shopify_user = 51 and order_number = 'UFC39945';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5361984, order_status = 'in production' where shopify_user = 51 and order_number = 'UFC39909';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5361777, order_status = 'in production' where shopify_user = 51 and order_number = 'UFC39882';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5361559, order_status = 'in production' where shopify_user = 51 and order_number = 'UFC39880';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5361551, order_status = 'in production' where shopify_user = 51 and order_number = 'UFC39878';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5361543, order_status = 'in production' where shopify_user = 51 and order_number = 'UFC39876';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5361482, order_status = 'in production' where shopify_user = 51 and order_number = 'UFC39867';
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5360996, order_status = 'in production' where shopify_user = 51 and order_number = 'UFC39846';
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_orders where shopify_user = 51 and order_number in ('UFC39846', 'UFC39867');
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5363151, order_status = 'in production' where shopify_user = 19 and order_number in ('LFC35148');
;-- -. . -..- - / . -. - .-. -.--
update shopify_orders
    set c2o_order_id = 5362991, order_status = 'in production' where shopify_user = 19 and order_number in ('LFC35145');
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_users where shopify_user = 138;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_product_variant where shopify_variant_id = 33153918337133;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_products where shopify_product_id = 9583;
;-- -. . -..- - / . -. - .-. -.--
select * from products where products_id = 2486;
;-- -. . -..- - / . -. - .-. -.--
select * from poloshir_osC.products_stock where poloStockId = '3655-878-76';
;-- -. . -..- - / . -. - .-. -.--
select * from products_attributes where products_id = 2486;
;-- -. . -..- - / . -. - .-. -.--
select * from custom_positions_products where products_id = 2486;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_user_options where shopify_user = 138;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_user_options where shopify_user = 138 and value_type = 'position';
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_order_items where variant_id = 33161751724141;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_order_items where variant_id = 4739217195117;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_product_customisations where shopify_product_id = 4739217195117;
;-- -. . -..- - / . -. - .-. -.--
9583;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_customisations where customisation_id = 5028;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_product_variant where shopify_variant_id = 33161751724141;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_order_items where product_id = 4739217195117;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_order_items where shopify_order_id = 40036;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_product_customisations where shopify_product_id = 9583;
;-- -. . -..- - / . -. - .-. -.--
desc quaysidg_news.logins_users;
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.logins_users;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_orders where shopify_order_id = 40036;
;-- -. . -..- - / . -. - .-. -.--
select * from customisations_artwork;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation;
;-- -. . -..- - / . -. - .-. -.--
select * from customisations;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE api_partners ADD COLUMN custom_commercial_invoice_price TINYINT(1) DEFAULT 0 NOT NULL;
;-- -. . -..- - / . -. - .-. -.--
create table if not exists custom_order_data
(
	`id` int auto_increment,
	`orders_id` int not null,
	`currency` VARCHAR(10) not null,
	`discount` DECIMAL(10,2) null,
	`shipping` DECIMAL(10,2) not null,
	`tax` DECIMAL(10,2) null,
	`duty` DECIMAL(10,2) null,
	`total_value` DECIMAL(10,2) not null,
	constraint `custom_order_data_pk`
		primary key (id),
	KEY `ix_custom_order_data__orders_id` (`orders_id`)
);
;-- -. . -..- - / . -. - .-. -.--
create table if not exists custom_order_unit_data
(
	`id` int auto_increment,
    `order_products_id` int not null,
	`custom_order_data_id` int not null,
	`custom_unit_price` DECIMAL(10,2) null,
	constraint `custom_order_unit_data_pk`
		primary key (id),
	constraint custom_order_unit_data_custom_order_data_id_fk
		foreign key (`custom_order_data_id`) references custom_order_data (`id`)
			on delete cascade,
    KEY `ix_custom_order_unit_data__order_products_id` (`order_products_id`),
    KEY `ix_custom_order_unit_data__orders_id` (`custom_order_data_id`)
);
;-- -. . -..- - / . -. - .-. -.--
create table if not exists api_partners_shipping_delivery_terms
(
    `id` int auto_increment,
    `value` VARCHAR(20) not null ,
    constraint `api_partners_shipping_delivery_terms_pk`
        primary key (id)
);
;-- -. . -..- - / . -. - .-. -.--
create table if not exists api_partners_shipping_info
(
    `id` int auto_increment,
    `api_partner_id` int,
    `delivery_terms_id` int,
    `street_address_line_1` VARCHAR(255) not null ,
    `street_address_line_2` VARCHAR(255) null ,
    `street_address_line_3` VARCHAR(255) null ,
    `postcode` VARCHAR(10) not null,
    `city` VARCHAR(32) not null,
    `country` VARCHAR(32) not null,
    `contact_name` VARCHAR(50) not null,
    `contact_number` VARCHAR(20) not null,
    `eori` VARCHAR(120) null,
    `signatory_name` VARCHAR(64) not null,
    `signatory_position` VARCHAR(32) not null,
    `signatory_image_of_signature` text not null,
    constraint `api_partners_shipping_info_pk`
        primary key (id),
    KEY `ix_api_partners_shipping_info__api_partner_id` (`api_partner_id`),
    KEY `ix_api_partners_shipping_info__delivery_terms_id` (`delivery_terms_id`),
    CONSTRAINT `api_partners_shipping_info_api_partners_id_fk`
        FOREIGN KEY (`api_partner_id`) REFERENCES `api_partners` (`id`),
    CONSTRAINT `api_partners_shipping_info_delivery_terms_id_fk`
        FOREIGN KEY (`delivery_terms_id`) REFERENCES `api_partners_shipping_delivery_terms` (`id`)
);
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO `api_partners_shipping_delivery_terms` (`id`,`value`) VALUES
    (1,'DAP'),
    (2,'DDP')
ON DUPLICATE KEY UPDATE value = value;
;-- -. . -..- - / . -. - .-. -.--
Select * from colours;
;-- -. . -..- - / . -. - .-. -.--
SELECT
                        pc.colour_id,
                        pc.brand_id,
                        man.manufacturers_name,
                        pc.products_colour_id,
                        pov.products_options_values_name,
                        pc.heather,
                        pc.CMYK,
                        pc.RGB,
                        pc.HEX,
                        pc.products_colour_value,
                        (
                            SELECT COUNT(*)
                            FROM products_attributes AS pa
                            JOIN products AS p ON p.products_id = pa.products_id
                            WHERE pa.options_values_id = pov.products_options_values_id
                                AND p.manufacturers_id = man.manufacturers_id
                        ) AS colour_cnt
                    FROM products_colours AS pc
                    JOIN manufacturers AS man ON pc.brand_id = man.manufacturers_id
                    JOIN products_options_values AS pov ON pov.products_options_values_id = pc.products_colour_id
                    ORDER BY man.manufacturers_name ASC,  pov.products_options_values_name ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT
                        pc.colour_id,
                        pc.brand_id,
                        man.manufacturers_name,
                        pc.products_colour_id,
                        pov.products_options_values_name,
                        pc.heather,
                        pc.CMYK,
                        pc.RGB,
                        pc.HEX,
                        pc.products_colour_value,
                        (
                            SELECT COUNT(*)
                            FROM products_attributes AS pa
                            JOIN products AS p ON p.products_id = pa.products_id
                            WHERE pa.options_values_id = pov.products_options_values_id
                                AND p.manufacturers_id = man.manufacturers_id
                        ) AS colour_cnt
                    FROM products_colours AS pc
                    JOIN manufacturers AS man ON pc.brand_id = man.manufacturers_id
                    JOIN products_options_values AS pov ON pov.products_options_values_id = pc.products_colour_id
where man.manufacturers_name = 'Westford Mill'

ORDER BY man.manufacturers_name ASC,  pov.products_options_values_name ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT
                        pc.colour_id,
                        pc.brand_id,
                        man.manufacturers_name,
                        pc.products_colour_id,
                        pov.products_options_values_name,
                        pc.heather,
                        pc.CMYK,
                        pc.RGB,
                        pc.HEX,
                        pc.products_colour_value,
                        (
                            SELECT COUNT(*)
                            FROM products_attributes AS pa
                            JOIN products AS p ON p.products_id = pa.products_id
                            WHERE pa.options_values_id = pov.products_options_values_id
                                AND p.manufacturers_id = man.manufacturers_id
                        ) AS colour_cnt
                    FROM products_colours AS pc
                    JOIN manufacturers AS man ON pc.brand_id = man.manufacturers_id
                    JOIN products_options_values AS pov ON pov.products_options_values_id = pc.products_colour_id
where man.manufacturers_name = 'Westford Mill'
and pov.products_options_values_name = 'Natural / Lime Green'

ORDER BY man.manufacturers_name ASC,  pov.products_options_values_name ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT
                        pc.colour_id,
                        pc.brand_id,
                        man.manufacturers_name,
                        pc.products_colour_id,
                        pov.products_options_values_name,
                        pc.heather,
                        pc.CMYK,
                        pc.RGB,
                        pc.HEX,
                        pc.products_colour_value,
                        (
                            SELECT COUNT(*)
                            FROM products_attributes AS pa
                            JOIN products AS p ON p.products_id = pa.products_id
                            WHERE pa.options_values_id = pov.products_options_values_id
                                AND p.manufacturers_id = man.manufacturers_id
                        ) AS colour_cnt
                    FROM products_colours AS pc
                    JOIN manufacturers AS man ON pc.brand_id = man.manufacturers_id
                    JOIN products_options_values AS pov ON pov.products_options_values_id = pc.products_colour_id
where man.manufacturers_name = 'Westford Mill'
and pov.products_options_values_name like '%Lime Green%'

ORDER BY man.manufacturers_name ASC,  pov.products_options_values_name ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT
                        pc.colour_id,
                        pc.brand_id,
                        man.manufacturers_name,
                        pc.products_colour_id,
                        pov.products_options_values_name,
                        pc.heather,
                        pc.CMYK,
                        pc.RGB,
                        pc.HEX,
                        pc.products_colour_value,
                        (
                            SELECT COUNT(*)
                            FROM products_attributes AS pa
                            JOIN products AS p ON p.products_id = pa.products_id
                            WHERE pa.options_values_id = pov.products_options_values_id
                                AND p.manufacturers_id = man.manufacturers_id
                        ) AS colour_cnt
                    FROM products_colours AS pc
                    JOIN manufacturers AS man ON pc.brand_id = man.manufacturers_id
                    JOIN products_options_values AS pov ON pov.products_options_values_id = pc.products_colour_id
where man.manufacturers_name = 'Westford Mill'
and pov.products_options_values_name like '%natural%'

ORDER BY man.manufacturers_name ASC,  pov.products_options_values_name ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT
                        pc.colour_id,
                        pc.brand_id,
                        man.manufacturers_name,
                        pc.products_colour_id,
                        pov.products_options_values_name,
                        pc.heather,
                        pc.CMYK,
                        pc.RGB,
                        pc.HEX,
                        pc.products_colour_value,
                        (
                            SELECT COUNT(*)
                            FROM products_attributes AS pa
                            JOIN products AS p ON p.products_id = pa.products_id
                            WHERE pa.options_values_id = pov.products_options_values_id
                                AND p.manufacturers_id = man.manufacturers_id
                        ) AS colour_cnt
                    FROM products_colours AS pc
                    JOIN manufacturers AS man ON pc.brand_id = man.manufacturers_id
                    JOIN products_options_values AS pov ON pov.products_options_values_id = pc.products_colour_id
where man.manufacturers_name = 'Westford Mill'
and pov.products_options_values_name like '%Natural/Surv Blue%'
and pc.products_colour_value like '%Natural / Lime Green%'

ORDER BY man.manufacturers_name ASC,  pov.products_options_values_name ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT
                        pc.colour_id,
                        pc.brand_id,
                        man.manufacturers_name,
                        pc.products_colour_id,
                        pov.products_options_values_name,
                        pc.heather,
                        pc.CMYK,
                        pc.RGB,
                        pc.HEX,
                        pc.products_colour_value,
                        (
                            SELECT COUNT(*)
                            FROM products_attributes AS pa
                            JOIN products AS p ON p.products_id = pa.products_id
                            WHERE pa.options_values_id = pov.products_options_values_id
                                AND p.manufacturers_id = man.manufacturers_id
                        ) AS colour_cnt
                    FROM products_colours AS pc
                    JOIN manufacturers AS man ON pc.brand_id = man.manufacturers_id
                    JOIN products_options_values AS pov ON pov.products_options_values_id = pc.products_colour_id
where man.manufacturers_name = 'Westford Mill'
and pov.products_options_values_name like '%Natural/Surv Blue%'
#and pc.products_colour_value like '%Natural / Lime Green%'

ORDER BY man.manufacturers_name ASC,  pov.products_options_values_name ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT
                        pc.colour_id,
                        pc.brand_id,
                        man.manufacturers_name,
                        pc.products_colour_id,
                        pov.products_options_values_name,
                        pc.heather,
                        pc.CMYK,
                        pc.RGB,
                        pc.HEX,
                        pc.products_colour_value,
                        (
                            SELECT COUNT(*)
                            FROM products_attributes AS pa
                            JOIN products AS p ON p.products_id = pa.products_id
                            WHERE pa.options_values_id = pov.products_options_values_id
                                AND p.manufacturers_id = man.manufacturers_id
                        ) AS colour_cnt
                    FROM products_colours AS pc
                    JOIN manufacturers AS man ON pc.brand_id = man.manufacturers_id
                    JOIN products_options_values AS pov ON pov.products_options_values_id = pc.products_colour_id
where man.manufacturers_name = 'Westford Mill'
and pov.products_options_values_name like '%Natural/Surf Blue%'
and pc.products_colour_value like '%Natural / Lime Green%'

ORDER BY man.manufacturers_name ASC,  pov.products_options_values_name ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT
                        pc.colour_id,
                        pc.brand_id,
                        man.manufacturers_name,
                        pc.products_colour_id,
                        pov.products_options_values_name,
                        pc.heather,
                        pc.CMYK,
                        pc.RGB,
                        pc.HEX,
                        pc.products_colour_value,
                        pc.products_colour_id,
                        (
                            SELECT COUNT(*)
                            FROM products_attributes AS pa
                            JOIN products AS p ON p.products_id = pa.products_id
                            WHERE pa.options_values_id = pov.products_options_values_id
                                AND p.manufacturers_id = man.manufacturers_id
                        ) AS colour_cnt
                    FROM products_colours AS pc
                    JOIN manufacturers AS man ON pc.brand_id = man.manufacturers_id
                    JOIN products_options_values AS pov ON pov.products_options_values_id = pc.products_colour_id
where man.manufacturers_name = 'Westford Mill'
and pov.products_options_values_name like '%Natural/Surf Blue%'
and pc.products_colour_value like '%Natural / Lime Green%'

ORDER BY man.manufacturers_name ASC,  pov.products_options_values_name ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT
                        pc.colour_id,
                        pc.brand_id,
                        man.manufacturers_name,
                        pc.products_colour_id,
                        pov.products_options_values_name,
                        pc.heather,
                        pc.CMYK,
                        pc.RGB,
                        pc.HEX,
                        pc.products_colour_value,
                        pc.products_colour_id,
                        pc.colour_id,
                        (
                            SELECT COUNT(*)
                            FROM products_attributes AS pa
                            JOIN products AS p ON p.products_id = pa.products_id
                            WHERE pa.options_values_id = pov.products_options_values_id
                                AND p.manufacturers_id = man.manufacturers_id
                        ) AS colour_cnt
                    FROM products_colours AS pc
                    JOIN manufacturers AS man ON pc.brand_id = man.manufacturers_id
                    JOIN products_options_values AS pov ON pov.products_options_values_id = pc.products_colour_id
where man.manufacturers_name = 'Westford Mill'
and pov.products_options_values_name like '%Natural/Surf Blue%'
and pc.products_colour_value like '%Natural / Lime Green%'

ORDER BY man.manufacturers_name ASC,  pov.products_options_values_name ASC;
;-- -. . -..- - / . -. - .-. -.--
select * from products_colours where products_colour_id = '2015';
;-- -. . -..- - / . -. - .-. -.--
select * from orders_customisations where customisation_id = 4500614;
;-- -. . -..- - / . -. - .-. -.--
select * from api_customisation_files where customisation_id = 4519460;
;-- -. . -..- - / . -. - .-. -.--
select * from api_customisation_files where customisation_id = 4519427;
;-- -. . -..- - / . -. - .-. -.--
select * from api_customisation_files where customisation_id in (4519427, 4519460);
;-- -. . -..- - / . -. - .-. -.--
select * from api_customisation_files where customisation_id in (4524946);
;-- -. . -..- - / . -. - .-. -.--
desc api_partners;
;-- -. . -..- - / . -. - .-. -.--
select * from customisations where customisation_id = 4527228;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files where customisation_id = 4527228;
;-- -. . -..- - / . -. - .-. -.--
select * from customisations_artwork where customisation_id = 4527228;
;-- -. . -..- - / . -. - .-. -.--
use ams;
;-- -. . -..- - / . -. - .-. -.--
select * from ams.production_file_attributes;
;-- -. . -..- - / . -. - .-. -.--
select * from ams.production_file_attribute_values;
;-- -. . -..- - / . -. - .-. -.--
select * from ams.production_file_attribute_values where attribute_id = 2;
;-- -. . -..- - / . -. - .-. -.--
delete from ams.production_file_attribute_values where attribute_id = 2 and id = 58;
;-- -. . -..- - / . -. - .-. -.--
select * from clothes2_osC.custom_colours where custom_colours_id = 58;
;-- -. . -..- - / . -. - .-. -.--
select * from clothes2_osC.custom_colours;
;-- -. . -..- - / . -. - .-. -.--
select * from ams.production_file_attribute_values where attribute_id = 2 and id = 58;
;-- -. . -..- - / . -. - .-. -.--
select * from ams.production_files where colour_id = 58;
;-- -. . -..- - / . -. - .-. -.--
select * from ams.production_files where customisation_id = 4527228;
;-- -. . -..- - / . -. - .-. -.--
select * from ams.production_file_attribute_values where  id = 58;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_customisations where orders_id = 5374394;
;-- -. . -..- - / . -. - .-. -.--
use clothes2_osC;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_customisations where order_id = 5374394;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products_customisations where orders_id = 5374394;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products_customisations where orders_id = 5374394 and customisation_id = 4524283;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_customisations where order_id = 5374394 and customisation_id = 4524283;
;-- -. . -..- - / . -. - .-. -.--
update orders_customisations set customisation_id = 4513305 where order_id = 5374394 and customisation_id = 4524283;
;-- -. . -..- - / . -. - .-. -.--
update orders_products_customisations set customisation_id = 4513305 where orders_id = 5374394 and customisation_id = 4524283;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products_customisations where orders_id = 5376197 and customisation_id = 4524283;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_customisations where order_id = 5376197 and customisation_id = 4524283;
;-- -. . -..- - / . -. - .-. -.--
update orders_products_customisations set customisation_id = 4513305 where orders_id = 5376197 and customisation_id = 4524283;
;-- -. . -..- - / . -. - .-. -.--
update orders_customisations set customisation_id = 4513305 where order_id = 5376197 and customisation_id = 4524283;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products_customisations where orders_id = 5376200 and customisation_id = 4524283;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_customisations where order_id = 5376200 and customisation_id = 4524283;
;-- -. . -..- - / . -. - .-. -.--
update orders_customisations set customisation_id = 4513305 where order_id = 5376200 and customisation_id = 4524283;
;-- -. . -..- - / . -. - .-. -.--
update orders_products_customisations set customisation_id = 4513305 where orders_id = 5376200 and customisation_id = 4524283;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products_customisations where orders_id = 5376199 and customisation_id = 4524283;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_customisations where order_id = 5376199 and customisation_id = 4524283;
;-- -. . -..- - / . -. - .-. -.--
update orders_customisations set customisation_id = 4513305 where order_id = 5376199 and customisation_id = 4524283;
;-- -. . -..- - / . -. - .-. -.--
update orders_products_customisations set customisation_id = 4513305 where orders_id = 5376199 and customisation_id = 4524283;
;-- -. . -..- - / . -. - .-. -.--
select * from custom_colours where madera_thread_code > "";
;-- -. . -..- - / . -. - .-. -.--
select custom_colours_id, custom_colours_name, madera_thread_code from custom_colours where madera_thread_code > "";
;-- -. . -..- - / . -. - .-. -.--
select custom_colours_id, custom_colours_name, madera_thread_code from custom_colours where madera_thread_code > '';
;-- -. . -..- - / . -. - .-. -.--
select custom_colours_id, custom_colours_name, madera_thread_code from custom_colours where madera_thread_code <> '';
;-- -. . -..- - / . -. - .-. -.--
select shopify_user, * from api_partners where partner_name like "%De Vries%";
;-- -. . -..- - / . -. - .-. -.--
select *, shopify_user from api_partners where partner_name like "%De Vries%";
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_user_options where value_type = 'position';
;-- -. . -..- - / . -. - .-. -.--
insert into shopify_user_options (value_type, value, parent_value, shopify_user)
values (
'position', 18, 0, 1179
);
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_user_options where value_type = 'position' and value = 18;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_total where orders_id = 5379627;
;-- -. . -..- - / . -. - .-. -.--
SET GLOBAL innodb_monitor_enable = all;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_user_options where shopify_user = 1179;
;-- -. . -..- - / . -. - .-. -.--
select *, shopify_user from api_partners where partner_name like "%Hally Designs%";
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_user_options where shopify_user = 900;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products where orders_id = 5381446;
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO clothes2_osC.orders_products (orders_products_id, orders_id, products_id, products_model, products_name, products_price, final_price, products_tax, products_quantity, products_stock_attributes, vendors_id, vendors_product_price, vendors_avg_product_price, returned_quantity, present_confirmation) VALUES (4548576, 5381446, 2, '', 'Origination Charge', 0.0000, 0.0000, 20.0000, 1, '', 28, 9.6900, 9.6900, 0, 0);
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products where orders_id = 5381446 and products_id = 2;
;-- -. . -..- - / . -. - .-. -.--
select * from customers where customers_email_address like "Data%";
;-- -. . -..- - / . -. - .-. -.--
select * from customers where customers_email_address like "%Data E%";
;-- -. . -..- - / . -. - .-. -.--
select * from customers where customers_email_address like "%DataE%";
;-- -. . -..- - / . -. - .-. -.--
select * from customers where customers_email_address = "dataerasure@c2o.com";
;-- -. . -..- - / . -. - .-. -.--
select * from qtagcom_osC.polo_customers where customers_email_address = "dataerasure@c2o.com";
;-- -. . -..- - / . -. - .-. -.--
select * from customers where customers_lastname like "%SUP%";
;-- -. . -..- - / . -. - .-. -.--
select * from customers where customers_lastname like "%SUP-%";
;-- -. . -..- - / . -. - .-. -.--
select * from customers where customers_email_address = "info@pjdlondon.co.uk";
;-- -. . -..- - / . -. - .-. -.--
select * from customers where customers_email_address like "%@pjdlondon.co.uk";
;-- -. . -..- - / . -. - .-. -.--
select * from orders_total where orders_id = 5379718;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_total where orders_id = 5381269;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_total where orders_id = 5362736;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE clothes2_osC.shopify_customisations
ADD KEY idx_shop_file(shopify_user, file_id),
ALGORITHM=INPLACE, LOCK=NONE;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE clothes2_osC.shopify_images
ADD KEY idx_user(shopify_user),
ALGORITHM=INPLACE, LOCK=NONE;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE poloshir_osC.staff_clocking
ADD KEY idx_clock_in(clock_in);
;-- -. . -..- - / . -. - .-. -.--
select * from orders_total where orders_id = 5384338;
;-- -. . -..- - / . -. - .-. -.--
select * from manufacturers_info;
;-- -. . -..- - / . -. - .-. -.--
select * from manufacturers;
;-- -. . -..- - / . -. - .-. -.--
select * from poloshir_osC.products_stock_warehousing_locations;
;-- -. . -..- - / . -. - .-. -.--
select * from poloshir_osC.products_stock_warehousing_locations_aliases;
;-- -. . -..- - / . -. - .-. -.--
select * from poloshir_osC.products_stock_warehousing_locations_aliases where location_alias like "%EMB%";
;-- -. . -..- - / . -. - .-. -.--
select * from poloshir_osC.products_stock_warehousing_locations_aliases where location_alias = "EMB Production Ready";
;-- -. . -..- - / . -. - .-. -.--
select * from relative_config;
;-- -. . -..- - / . -. - .-. -.--
select * from split_test;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_status_history;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_status_history order by id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_status_history order by orders_status_history_id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_orders where order_number = '#6122';
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners where shopify_user = 13;
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners_submission_log where api_partner_id = 575;
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners_submission_log where api_partner_id = 575 order by id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners_submission_log
where api_partner_id = 575
and input like "%6122%"
order by id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners_submission_log
where api_partner_id = 575
and input like "%#6122%"
order by id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_issues where shopify_user = 13;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_issues where shopify_user = 13 order by issue_id desc;
;-- -. . -..- - / . -. - .-. -.--
desc orders_total;
;-- -. . -..- - / . -. - .-. -.--
desc countries;
;-- -. . -..- - / . -. - .-. -.--
select * from custom_names where custom_order_id = 5386275;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_customisations where order_id = 5386275;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products where orders_id = 5386275;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_total where orders_id = 5386275;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products_customisations where orders_id = 5379511;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products where orders_id = 5379511;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products_customisations where orders_id = 5379511 and orders_products_id in (4539411,4539412);
;-- -. . -..- - / . -. - .-. -.--
select * from custom_positions;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products_customisations where orders_id = 5379511 and orders_products_id not in (4539411,4539412) and custom_positions_id = 5;
;-- -. . -..- - / . -. - .-. -.--
select * from customisations where customer_id = 5106130;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products_customisations where orders_id = 5379511 and orders_products_id in (4539411,4539412) and custom_positions_id = 5;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_customisations where orders_id = 5379511;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_customisations where order_id = 5379511;
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO clothes2_osC.orders_customisations (order_id, custom_type, application_count, primary_type, merch_product,
                                                customisation_id, app_in_progress, embroidery_application_time,
                                                embroidery_setups, names_numbers_file, completion_estimate,
                                                colour_checked, size_correct, position_correct, artwork_ok, garment_ok,
                                                preview_match, customisation_complete, applications_complete,
                                                artwork_upload, artwork_upload_count, digitizer_alert, staff_id,
                                                app_duration, assigned_artworker, assigned_artworker_date,
                                                vendor_artworker_received, artwork_api_processed, has_cmyk_file,
                                                has_rgb_file, custom_1, custom_2, custom_3, custom_4, custom_5,
                                                custom_6, custom_7, custom_8, custom_9, custom_10, custom_11, custom_12,
                                                custom_13)
VALUES (5379511, 'emb_qs', 0, '1', 0, 2603667, 0, 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00',
        '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00',
        '2021-07-21 11:07:57', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'Sonia Garcia',
        '2021-08-05 12:25:02', '0000-00-00 00:00:00', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00',
        '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00',
        '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00',
        '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
;-- -. . -..- - / . -. - .-. -.--
select * from customisations where customisation_name like "Logo shopify-138-5941%";
;-- -. . -..- - / . -. - .-. -.--
select * from orders_customisations where customisation_id = 4559113 and order_id = 5384811;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products_customisations where orders_id = 5384811 and customisation_id = 4559113;
;-- -. . -..- - / . -. - .-. -.--
select * From orders where orders_id = 5387544;
;-- -. . -..- - / . -. - .-. -.--
SELECT o.credit_reminder_sent,
       o.ms_store_id,
       p.id,
       p.partner_name,
       p.flat_rate_prices,
       p.price_break,
       p.price_break_per_off,
       p.price_break_val_off,
       p.price_break_aps,
       p.price_break_aps_per_off,
       p.price_break_aps_val_off,
       p.setup_charges,
       p.shipping_prices,
       p.auto_applied_customisations
FROM orders o,
     api_partners p
WHERE o.orders_id = 5387544
  AND p.id = o.api_partner_id;
;-- -. . -..- - / . -. - .-. -.--
select * from orders where orders_id in(5387544, 5387029);
;-- -. . -..- - / . -. - .-. -.--
desc orders;
;-- -. . -..- - / . -. - .-. -.--
desc orders_sales_admin;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_sales_admin;
;-- -. . -..- - / . -. - .-. -.--
select * from quaysidg_news.sales_data;
;-- -. . -..- - / . -. - .-. -.--
select *, shopify_user from api_partners where partner_name like "%Clubmate%";
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO shopify_queue (
  type, action, last_id, date_added, shopify_user, since, complete, date_last_run
) VALUES (
  'product', 'fetch', 6906249576638, now(), 1204, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'
);
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_issues where shopify_user = 1204 order by issue_id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_queue where shopify_user = 1204 order by queue_id desc;
;-- -. . -..- - / . -. - .-. -.--
select * from shopify_orders where order_status = 'failed';
;-- -. . -..- - / . -. - .-. -.--
select *, dispatch_days, dispatch_days_revised, dispatch_estimate, dispatch_eta, dispatch_target, dispatch_target2 from orders where orders_id = 5390656;
;-- -. . -..- - / . -. - .-. -.--
select orders_id, dispatch_days, dispatch_days_revised, dispatch_estimate, dispatch_eta, dispatch_target, dispatch_target2 from orders where orders_id = 5390656;
;-- -. . -..- - / . -. - .-. -.--
select orders_id, last_modified, dispatch_days, dispatch_days_revised, dispatch_estimate, dispatch_eta, dispatch_target, dispatch_target2 from orders where orders_id = 5390656;
;-- -. . -..- - / . -. - .-. -.--
select orders_id, last_modified, margin_status, dispatch_days, dispatch_days_revised, dispatch_estimate, dispatch_eta, dispatch_target, dispatch_target2 from orders where orders_id = 5390656;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_total where orders_id = 5395766;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products where orders_id = 5395766;
;-- -. . -..- - / . -. - .-. -.--
select *, customers_id from orders where orders_id = 5395980;
;-- -. . -..- - / . -. - .-. -.--
select * from address_book where customers_id = 6278630;
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products_customisations where orders_id = '5399757';
;-- -. . -..- - / . -. - .-. -.--
select * from orders_customisations where order_id = '5399757';
;-- -. . -..- - / . -. - .-. -.--
select * from orders_products_customisations where orders_id = '5399758';
;-- -. . -..- - / . -. - .-. -.--
select * from orders_customisations where order_id = '5399758';
;-- -. . -..- - / . -. - .-. -.--
SELECT custom_colours_name, custom_colours_image
                                                        FROM custom_colours
                                                        WHERE custom_colours_type = 0
                                                        AND display_on_frontend = 1
                                                        ORDER BY custom_colours_name;
;-- -. . -..- - / . -. - .-. -.--
select * from customisation_files where customisation_id = 481348;
;-- -. . -..- - / . -. - .-. -.--
select * from customisations_artwork where customisation_id = 481348;
;-- -. . -..- - / . -. - .-. -.--
select * from customisations where customisation_id = 481348;
;-- -. . -..- - / . -. - .-. -.--
update customisations set stitch_count = 0, is_duplicate = 0, is_duplicate_auto = 0, duplicate_of = 0 where customisation_id = 481348 limit 1;
;-- -. . -..- - / . -. - .-. -.--
update customisations set stitch_count = 12962, is_duplicate = 1, is_duplicate_auto = 1, duplicate_of = 481300 where customisation_id = 481348 limit 1;
;-- -. . -..- - / . -. - .-. -.--
SELECT customisation_id, artwork_file, artwork_file_2, proof_file, proof_file_2
FROM clothes2_osC.customisations
WHERE customisation_id = 481348;
;-- -. . -..- - / . -. - .-. -.--
SELECT customisation_id, artwork_file, artwork_file_2, artwork_file_3, artwork_file_4, proof_file, proof_file_2, proof_file_3
FROM clothes2_osC.customisations
WHERE customisation_id = 481348;
;-- -. . -..- - / . -. - .-. -.--
UPDATE clothes2_osC.customisations
SET proof_file_3   = ''
WHERE customisation_id = 481348
LIMIT 1;
;-- -. . -..- - / . -. - .-. -.--
delete from api_partners_shipping_info where api_partner_id = 1788 limit 1;
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners where id in (1922,
1926,
1830,
1853,
1910,
1148,
1927
);
;-- -. . -..- - / . -. - .-. -.--
delete from api_partners_shipping_info where api_partner_id in (
    1922,
    1926,
    1830,
    1853,
    1910,
    1148,
    1927
);
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners_shipping_info;