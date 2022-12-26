select *
from customers
    join orders o on customers.customerid = o.customerid
    join orders_items oi on o.orderid = oi.orderid
    join products p on oi.sku = p.sku
where desc like '%cat%'
    and citystatezip like '%queens village%'