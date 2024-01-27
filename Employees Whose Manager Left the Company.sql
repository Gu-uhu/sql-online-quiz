Select 
    employee_id
From Employees
Where Salary <30000 and manager_id is not null and manager_id not in (Select distinct employee_id from Employees)
Order by 1 Asc