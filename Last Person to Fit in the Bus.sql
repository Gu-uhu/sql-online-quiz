# Write your MySQL query statement below

With t as (
    Select 
        #q1.Turn,
        #q1.person_id as ID,
        q1.Person_Name as Name,
        #q1.Weight,
        1000 - Sum(q2.Weight) as 'Remaining'
    From Queue q1
    join Queue q2 
    on q2.Turn <= q1.Turn
    Group by q1.turn
    
)

Select 
Name as person_name
From t
Where Remaining >=0
Order by Remaining ASC
Limit 1