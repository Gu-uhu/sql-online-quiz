# Write your MySQL query statement below
# This solution will still work if Customers bought other products not in Product table. 
with t1 as (
    Select 
    c.customer_id,
    p.product_key
    From product p
    cross join (select distinct customer_id from customer) c 
),

t2 as (
    Select distinct
        t1.customer_id       
    From t1 left join customer c2 on t1.customer_id = c2.customer_id and t1.product_key = c2.product_key
    Where c2.customer_id is null
)

Select distinct customer_id from Customer 
Where customer_id NOT IN (SELECT customer_id FROM t2)