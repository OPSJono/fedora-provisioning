explain SELECT o.orders_id, o.date_first_processing, o.due_by_date, o.dispatch_target, o.shipping_type, st.dispatch_name,os.orders_status_name, oc.custom_id, oc.custom_type, co.custom_name, co.customisation_department, oc.customisation_id, oc.assigned_artworker, art_file_ready.custom_box AS art_file_ready, art_file_sent_digi.custom_box AS file_sent_digi, MIN(cca.date) AS date_assigned,
(	SELECT COUNT(*)
    FROM clothes2_osC.orders_issue_escalation AS oie
    WHERE oie.orders_id = o.orders_id
        AND oie.custom_id = oc.custom_id
        AND oie.end_date = '0000-00-00 00:00:00'
) AS open_esc,
(	SELECT COUNT(*)
    FROM clothes2_osC.orders_issue_escalation AS oie
    WHERE oie.orders_id = o.orders_id
        AND oie.end_date = '0000-00-00 00:00:00'
) AS open_esc_order,
(	SELECT GROUP_CONCAT(DISTINCT oier.text)
    FROM clothes2_osC.orders_issue_escalation AS oie
    JOIN clothes2_osC.orders_issue_escalation_reasons AS oier ON oie.reason_id = oier.id
    WHERE oie.orders_id = o.orders_id
        AND oie.custom_id = oc.custom_id
) AS esc_types,
(	SELECT COUNT(so.orders_id)
    FROM clothes2_osC.orders_customisations soc, clothes2_osC.orders so
    WHERE soc.customisation_id = oc.customisation_id
    AND so.orders_id = soc.order_id
    AND so.date_purchased < o.date_purchased
    AND so.orders_id != oc.order_id
    AND so.orders_status IN (2,3,12)
) AS repeat_cust,
( SELECT GROUP_CONCAT(DISTINCT oier.notification)
    FROM clothes2_osC.orders_issue_escalation AS oie
    JOIN clothes2_osC.orders_issue_escalation_reasons AS oier
    WHERE oie.orders_id = o.orders_id
        AND oie.custom_id = oc.custom_id
) AS esc_class
, oc.custom_1, oc.custom_2, oc.custom_3, oc.custom_4, oc.custom_5, oc.custom_6, oc.custom_7, oc.custom_8, oc.custom_9, oc.custom_10, oc.custom_11, oc.custom_12
FROM clothes2_osC.orders AS o
JOIN clothes2_osC.orders_customisations AS oc ON o.orders_id = oc.order_id
JOIN clothes2_osC.customisation_options AS co ON oc.custom_type = co.custom_type
JOIN clothes2_osC.shipping_types AS st ON o.shipping_type = st.shipping_type
JOIN clothes2_osC.orders_status AS os ON os.orders_status_id = o.orders_status
LEFT JOIN clothes2_osC.orders_customisations_checkbox_audit AS cca ON
    cca.input_type = 'artworker' AND cca.input_value = oc.assigned_artworker AND cca.custom_id = oc.custom_id
LEFT JOIN clothes2_osC.customisation_options_checkboxes AS art_file_ready ON
    co.id = art_file_ready.custom_options_id AND art_file_ready.custom_class = 'artwork_file_ready'
LEFT JOIN clothes2_osC.customisation_options_checkboxes AS art_file_sent_digi ON
    co.id = art_file_sent_digi.custom_options_id AND art_file_sent_digi.custom_class = 'artwork_file_sent_digitiser'
WHERE o.orders_status IN (2,12)
GROUP BY oc.custom_id;