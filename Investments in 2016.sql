# Write your MySQL query statement below
With t1 As (
    Select 
        tiv_2015
    From Insurance
    Group by tiv_2015
    Having Count(*) > 1
),

t2 as (
    Select Concat (lat, ' - ' , lon) as location
    From Insurance
    Group by Concat (lat, ' - ', lon)
    Having Count(*) > 1
)

Select 
    round(sum(tiv_2016),2) as tiv_2016
From Insurance 
Where tiv_2015 in (select * from t1) and Concat (lat, ' - ' , lon) not in (select * from t2)