# Write your MySQL query statement below

with t as (
    Select 
    t1.id,
    t1.num as n1,
    t2.num as n2,
    t3.num as n3
    from Logs t1 
    left join Logs t2 on t1.id = t2.id - 1
    left join Logs t3 on t1.id = t3.id - 2
)

Select distinct n1 as ConsecutiveNums 
from t 
where n1 - n2 = 0 and n2 - n3 = 0