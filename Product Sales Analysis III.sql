# Write your MySQL query statement below
With t1 as (
    Select 
    product_id,
    min(year) as first_year      
    from Sales group by product_id 
)

Select 
    t1.product_id,
    t1.first_year,
    s.quantity,
    s.price
From 
    t1 left join Sales s 
    on t1.product_id = s.product_id and t1.first_year = s.year 