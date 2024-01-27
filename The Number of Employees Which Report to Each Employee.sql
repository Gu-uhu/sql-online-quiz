# Write your MySQL query statement below
With t as (
    Select 
    reports_to as employee_id,
    count(employee_id) as reports_count,
    round(avg(age),0) as average_age
    From Employees
    Group by reports_to
    having reports_to is not null
)

Select 
    t.employee_id,
    t1.name,
    reports_count,
    average_age
From t left join Employees t1 on t.employee_id = t1.employee_id
Order by employee_id asc
