select *,
    cast(substr(birthdate, 1, 4) as int) as dob_y,
    (2018 - cast(substr(birthdate, 1, 4) as int)) % 12
from customers
where '03-21' <= substr(birthdate, 6)
    and substr(birthdate, 6) <= '04-19'
    and (2018 - cast(substr(birthdate, 1, 4) as int)) % 12 = 0
    and citystatezip = 'South Ozone Park, NY 11420';

-- citystatezip of the result of 2.sql