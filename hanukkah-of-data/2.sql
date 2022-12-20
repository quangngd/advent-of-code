with interested_customers as (
    select substr(name, 1, 1) || substr(name, INSTR(name, ' ') + 1, 1) init,
        name,
        customerid,
        phone
    from customers
    where init = 'JD'
)
select *
from interested_customers
    join orders using (customerid)
    join orders_items oi on orders.orderid = oi.orderid
    join products p on oi.sku = p.sku
where desc like '%bagel%'
    and ordered like '2017-%'