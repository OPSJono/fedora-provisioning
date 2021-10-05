select * from customers where customers_email_address = 'Jonathan.Marshall@c2o.com';
select * from customers_basket where customers_id = 5956235;


SELECT oc.*,
       IF((o.staff_name != '' OR o.pre_order_id > 0), 'ACCMAN',
          IF(o.payment_method = 'API', IF(o.ms_store_id > 0, 'MERCH', 'API'),
             IF(o.payment_method = 'Replacement', 'REPLACE', 'ECOM')))              as channel,
       (ott.value + ots.value)                                                      AS net,
       (SELECT ci.customers_info_source_id
        FROM orders o,
             customers_info ci
        WHERE o.orders_id = oc.orders_id
          AND ci.customers_info_id = o.customers_id)                                AS customer_type,
       (SELECT o2.pc_order_type FROM orders o2 WHERE o2.orders_id = oc.orders_id)   AS order_type,
       (SELECT orders.staff_name FROM orders WHERE orders.orders_id = oc.orders_id) AS account_manager
FROM orders_cancellations oc
    JOIN orders o on oc.orders_id = o.orders_id
         LEFT JOIN orders_total ott ON oc.orders_id = ott.orders_id AND ott.class = 'ot_subtotal'
         LEFT JOIN orders_total ots ON oc.orders_id = ots.orders_id AND ots.class = 'ot_shipping'
WHERE oc.date BETWEEN '2021-07-27 00:00:00' AND '2021-07-28 00:00:00'
  AND oc.type = '6';