SELECT c.customisation_id,
       c.customisation_name,
       c.customisation_type,
       c.is_high_stitch_count,
       c.customisation_comments,
       GREATEST(c.customisation_width, c.customisation_width_2, c.customisation_width_3) AS max_width,
       COUNT(DISTINCT oc.order_id) as orders_placed
FROM customisations c
LEFT JOIN orders_customisations oc on c.customisation_id = oc.customisation_id
WHERE c.api_partner_id = 6
AND c.customisation_id = 880456
GROUP BY c.customisation_id;

select * from customisations where customisation_id = 3750445;