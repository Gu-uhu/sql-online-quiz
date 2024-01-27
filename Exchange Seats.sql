# Write your MySQL query statement below
Select      
    Case 
        When id = (select max(id) from Seat s1) and id % 2 = 1 Then id
        When id % 2 = 0 Then id-1
        Else id + 1 
        End as id,
    student
From Seat
Order by id