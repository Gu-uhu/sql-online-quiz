# Write your MySQL query statement below
With Category as (
    Select 'Low Salary' as Category
    Union 
    Select 'High Salary' as Category
    Union
    Select 'Average Salary' as Category
),
t as (
    Select 
    #account_id,
    Case 
        When income < 20000 Then 'Low Salary' 
        When income > 50000 Then 'High Salary'
        Else 'Average Salary' End as Category
    From Accounts   
), 

t2 as (
    Select 
    category, 
    Count(*) as accounts_count
    From t
    Group by Category
)

Select c.Category, 
Ifnull(t2.accounts_count,0) as accounts_count
From Category c left join t2 on c.Category = t2.Category 
