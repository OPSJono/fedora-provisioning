show create table customisations;

select * from tep_mail_sent order by id desc;

SELECT o.orders_id, o.orders_status, o.customers_email_address, o.blank_order, o.delivery_country, o.delivery_postcode, o.collection_selected, o.shipping_type, c.customers_firstname, c.customers_lastname
							FROM orders o, customers c
							WHERE o.orders_status = 2
							AND o.order_accepted = 0
							AND o.date_first_processing > DATE_SUB(NOW() , INTERVAL 30 DAY)
							AND o.pick_complete =1
							AND o.payment_method NOT IN ('API','Replacement','Telephone Pre Order')
							AND c.customers_id = o.customers_id
							AND (	SELECT COUNT(oie.id)
									FROM orders_issue_escalation AS oie
									WHERE o.orders_id = oie.orders_id
									  AND oie.end_date = '0000-00-00 00:00:00'
								) = 0
							GROUP BY o.orders_id;

select * from orders where orders_id = 5179007;