with details as (
    select *
    from customers
        join orders o using (customerid)
        join orders_items oi using (orderid)
        join products p using (sku)
)
select a.name,
    a.shipped,
    b.shipped,
    a.desc,
    b.desc,
    b.name,
    b.phone
from details a
    join details b
where a.customerid != b.customerid
    and a.customerid = 8342
    and a.desc regexp '.+ \(.+\)'
    and b.desc regexp '.+ \(.+\)'
    and substr(a.shipped, 1, 10) = substr(b.shipped, 1, 10)
    and substr(a.desc, 1, instr(a.desc, '(')) = substr(b.desc, 1, instr(a.desc, '('))
    and substr(a.desc, instr(a.desc, '(')) != substr(b.desc, instr(a.desc, '('))