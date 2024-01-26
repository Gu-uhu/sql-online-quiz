# Write your MySQL query statement below
With t as
(
    Select
    user_id,
    sum(Case When action = 'confirmed' Then 1 Else 0 End)/count(user_id) as c
    #avg(action = 'confirmed') as c
    From Confirmations 
    Group by user_id
)

Select s.user_id, 
round(ifnull(t.c,0),2) as confirmation_rate
From Signups s
Left Join t on s.user_id = t.user_id