select customer_id from customisations;
;-- -. . -..- - / . -. - .-. -.--
select customer_id, api_partner_id from customisations;
;-- -. . -..- - / . -. - .-. -.--
select customer_id, api_partner_id, * from customisations;
;-- -. . -..- - / . -. - .-. -.--
select customer_id, api_partner_id, date_added, * from customisations;
;-- -. . -..- - / . -. - .-. -.--
select
customer_id,
api_partner_id,
customisation_trans,
customisation_crop_applied,
customisation_name,
customisation_colour,
customisation_rotated,
customisation_logo,
redraw_service,
date_added,
customisation_width,
customisation_type
from customisations;
;-- -. . -..- - / . -. - .-. -.--
select
customisation_id,
customer_id,
api_partner_id,
customisation_trans,
customisation_crop_applied,
customisation_name,
customisation_colour,
customisation_rotated,
customisation_logo,
redraw_service,
date_added,
customisation_width,
customisation_type
from customisations;
;-- -. . -..- - / . -. - .-. -.--
select
customisation_id,
customer_id,
api_partner_id,
customisation_trans,
customisation_crop_applied,
customisation_name,
customisation_colour,
customisation_rotated,
customisation_logo,
date_added,
customisation_width,
customisation_type
from customisations;
;-- -. . -..- - / . -. - .-. -.--
select * from api_partners;
;-- -. . -..- - / . -. - .-. -.--
select * from custom_colours;
;-- -. . -..- - / . -. - .-. -.--
select custom_colours_id, custom_colours_name, madera_thread_code from custom_colours where madera_thread_code <> '';
;-- -. . -..- - / . -. - .-. -.--
select * from customisations_artwork;
;-- -. . -..- - / . -. - .-. -.--
select * from customisations;