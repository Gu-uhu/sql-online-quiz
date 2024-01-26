# Write your MySQL query statement below
With t as
(
    Select 
        u.product_id,
        u.units,
        p.price
    From UnitsSold u
    right Join Prices p on u.product_id = p.product_id
    Where u.purchase_date >= start_date and u.purchase_date <= end_date
)

Select
product_id,
round(sum(price*units)/sum(units),2) as average_price
from t
group by product_id
Union 
Select 
product_id,
0
From Prices
Where product_id not in (select product_id from UnitsSold)