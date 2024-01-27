# Write your MySQL query statement below
WITH t1 AS (
    SELECT Distinct
        product_id, 
        max(change_date) over (PARTITION BY product_id) as day_for_price
    FROM Products
    Where change_date <= '2019-08-16'
)

Select 
    t1.product_id,
    p.new_price as price
From t1
Left Join Products p on t1.product_id = p.product_id and t1.day_for_price = p.change_date 
Union
Select distinct
    p1.product_id,
    Case when change_date > '2019-08-16' Then 10 Else Null End as price
From Products p1
Left join t1 on t1.product_id = p1.product_id Where t1.product_id is null