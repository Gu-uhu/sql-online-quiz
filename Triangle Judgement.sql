# Write your MySQL query statement below
Select 
*,
CASE when 
    x + y > z and
    y + z > x and
    x + z > y 
    Then 'Yes' Else 'No' End
    as triangle
From Triangle