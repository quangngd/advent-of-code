select count(*) as num_product,
    count(
        case when unit_price < wholesale_cost then 1 end
    ) as num_discounted_product,
    *
from customers
    join orders o using (customerid)
    join orders_items oi using (orderid)
    join products p using (sku)
group by (customerid)
having sum(unit_price) < sum(wholesale_cost);