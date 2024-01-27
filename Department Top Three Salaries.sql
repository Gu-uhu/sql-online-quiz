# Write your MySQL query statement below
With t as (
    Select 
    d.name as Department,
    e.name,
    e.Salary,
    Dense_RANK() over (
        PARTITION BY departmentID 
        order by salary Desc) as MyRank 
From Employee e
Left Join Department d
On e.departmentID = d.id
)

Select Department, name as Employee, Salary 
From t
Where MyRank < 4