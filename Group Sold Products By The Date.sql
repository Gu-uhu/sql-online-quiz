# Write your MySQL query statement below
With t1 as (
    Select 
        sell_date
        ,count(distinct product) as num_sold 
    From Activities
    Group by sell_date
    Order by sell_date ASC, product ASC
),
t2 as (
    Select distinct
        sell_date
        ,product
    From Activities
    Order by product asc
)
Select 
    t1.sell_date
    ,t1.num_sold
    ,group_concat(t2.product) as products
FRom t1 left join t2 on t1.sell_date = t2.sell_date
Group by t1.sell_date
