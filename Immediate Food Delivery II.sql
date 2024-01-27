# Write your MySQL query statement below
with t as (   
    select 
    customer_id,
    min(order_date) as imd
    from Delivery
    group by customer_id 
 )

Select 
    round(100*sum(Case When t.imd = D.customer_pref_delivery_date Then 1 Else 0 End)/count(*),2) as immediate_percentage  
From t left join Delivery D on t.customer_ID = D.customer_ID and t.imd = D.order_date