use clothes2_osC;
;-- -. . -..- - / . -. - .-. -.--
select * from customers;
;-- -. . -..- - / . -. - .-. -.--
select * from customisations;
;-- -. . -..- - / . -. - .-. -.--
select * from customisations
join customers on customisations.customer_id = customers.customers_id;
;-- -. . -..- - / . -. - .-. -.--
select
c2.customers_id, c1.customisation_id
from customisations c1
join customers c2 on c1.customer_id = c2.customers_id;
;-- -. . -..- - / . -. - .-. -.--
select
c2.customers_id, concat(c1.customisation_id)
from customisations c1
join customers c2 on c1.customer_id = c2.customers_id
group by c2.customers_id;
;-- -. . -..- - / . -. - .-. -.--
select
c2.customers_id, count(c1.customisation_id)
from customisations c1
join customers c2 on c1.customer_id = c2.customers_id
group by c2.customers_id;
;-- -. . -..- - / . -. - .-. -.--
select
c2.customers_id, count(c1.customisation_id)
from customisations c1
join customers c2 on c1.customer_id = c2.customers_id
group by c2.customers_id
having count(c1.customisation_id) > 1;
;-- -. . -..- - / . -. - .-. -.--
select
c2.customers_id, c1.customisation_id
from customisations c1
join customers c2 on c1.customer_id = c2.customers_id
group by c2.customers_id
having count(c1.customisation_id) > 1;
;-- -. . -..- - / . -. - .-. -.--
select
c2.customers_id, concat_ws(", ", c1.customisation_id)
from customisations c1
join customers c2 on c1.customer_id = c2.customers_id
group by c2.customers_id
having count(c1.customisation_id) > 1;
;-- -. . -..- - / . -. - .-. -.--
select
c2.customers_id, GROUP_CONCAT(", ", c1.customisation_id)
from customisations c1
join customers c2 on c1.customer_id = c2.customers_id
group by c2.customers_id
having count(c1.customisation_id) > 1;
;-- -. . -..- - / . -. - .-. -.--
select
c2.customers_id, GROUP_CONCAT(", " c1.customisation_id)
from customisations c1
join customers c2 on c1.customer_id = c2.customers_id
group by c2.customers_id
having count(c1.customisation_id) > 1;
;-- -. . -..- - / . -. - .-. -.--
select
c2.customers_id, GROUP_CONCAT(c1.customisation_id)
from customisations c1
join customers c2 on c1.customer_id = c2.customers_id
group by c2.customers_id
having count(c1.customisation_id) > 1;
;-- -. . -..- - / . -. - .-. -.--
select
c2.customers_id, GROUP_CONCAT(c1.customisation_id) as customisation_ids
from customisations c1
join customers c2 on c1.customer_id = c2.customers_id
group by c2.customers_id
having count(c1.customisation_id) > 1;
;-- -. . -..- - / . -. - .-. -.--
select
    c2.customers_id,
    GROUP_CONCAT(c1.customisation_id) as customisation_ids,
    GROUP_CONCAT(c1.customisation_type) as customisation_types
from customisations c1
join customers c2 on c1.customer_id = c2.customers_id
group by c2.customers_id
having count(c1.customisation_id) > 1;
;-- -. . -..- - / . -. - .-. -.--
select * from custom_positions;
;-- -. . -..- - / . -. - .-. -.--
select * from custom_names;