# Write your MySQL query statement below
With daily_amount as (
    Select visited_on, sum(amount) as amount
    From Customer
    Group by visited_on
)

Select 
c1.visited_on
#,c1.amount
#,c2.visited_on
#,c2.amount
, round(sum(c2.amount),0) as amount
, round(avg(c2.amount),2) as average_amount
From daily_amount c1
Join daily_amount c2 
On c2.visited_on between Date_sub(c1.visited_on, interval 6 day) and c1.visited_on 
Group by c1.visited_on
Order by 1 ASC
Limit 999
Offset 6