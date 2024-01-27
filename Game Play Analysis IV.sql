# Write your MySQL query statement below

With t1 as (
    Select 
    player_id,
    min(event_date) as first_date    
    From Activity a1
    group by player_id
 )

Select 
round(count(distinct a2.player_id)/(select count(distinct player_id) from Activity),2) as fraction
from t1 
Left Join Activity a2
On date_add(t1.first_date, interval 1 day) = a2.event_date and t1.player_id = a2.player_id