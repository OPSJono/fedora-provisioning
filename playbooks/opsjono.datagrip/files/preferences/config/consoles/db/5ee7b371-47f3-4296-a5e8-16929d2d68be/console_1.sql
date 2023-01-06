EXPLAIN 											SELECT COUNT(o.orders_id)
											FROM orders_customisations oc2, orders o
											WHERE oc2.customisation_id = oc.customisation_id
											AND o.orders_id = oc2.order_id
											AND o.orders_status = 2
											AND o.orders_id != oc.order_id
										 ) AS other_orders
										 FROM orders_customisations oc
										 WHERE oc.custom_id = 1493816;

SELECT GREATEST(customisation_width, customisation_width_2, customisation_width_3)
                                                        FROM customisations
                                                        WHERE customisation_id = 4384296
                                                        AND customer_id = 6394220
                                                     ) AS this_custom_width
                                                     FROM custom_positions_products cpp, custom_positions cp
                                                     WHERE cpp.products_id = '675'
                                                     AND cp.custom_positions_id = cpp.custom_positions_id
                                                      AND cp.publically_available = 1
                                                      HAVING cp.max_width_cm >= this_custom_width
                                                     ORDER BY cp.sort_ordering ASC, cp.custom_positions_id;

SELECT * FROM poloshir_osC.vendors_stock
WHERE ral_id > 0 OR ral_id is not '';

select * from ams.production_files where customisation_id = 4527228;
desc customisations;
select distinct customisation_type from customisations;

SELECT ps.poloMap AS SKU, cg.group_name AS CustomisationType, pco.customisation_status AS Suitable
FROM products p
JOIN products_stock ps ON ps.products_id = p.products_id
JOIN products_options_values ovc ON ovc.products_options_values_id = SUBSTR(ps.products_stock_attributes,
    LOCATE('-', ps.products_stock_attributes) + 1,
    (LOCATE(',', ps.products_stock_attributes) -
    (LOCATE('-', ps.products_stock_attributes) + 1)))
JOIN products_customisation_options pco ON (
    p.products_id = pco.products_id
    AND pco.colour_id = ovc.products_options_values_id
)
JOIN customisation_options co ON pco.customisation_type = co.custom_type
JOIN customisation_groups cg on co.group_id = cg.group_id
WHERE p.products_status = 1
  AND p.products_id NOT IN (2, 399, 421, 450, 427, 418, 1667, 937, 938, 1426, 1525, 1526, 3198)
  AND ps.poloMap > 0
GROUP BY ps.products_id, ps.poloMap, cg.group_name;

desc customisations;

SELECT c.customisation_id,
       c.customisation_name,
       c.customisation_type,
       c.is_high_stitch_count,
       c.customisation_comments,
       c.type,
       GREATEST(c.customisation_width, c.customisation_width_2, c.customisation_width_3) AS max_width,
       COUNT(DISTINCT oc.order_id) as orders_placed
FROM customisations c
JOIN orders_customisations oc on c.customisation_id = oc.customisation_id
WHERE c.api_partner_id = 6
AND c.customisation_id = '757170';
