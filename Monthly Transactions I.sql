# Write your MySQL query statement below
Select 
substring(trans_date,1,length(trans_date)-3) as month,
country,
count(*) as trans_count,
sum(Case when state = 'approved' Then 1 Else 0 End) as approved_count,
sum(amount) as trans_total_amount,
sum(Case when state = 'approved' Then amount Else 0 End) as approved_total_amount
From Transactions
Group by Year(trans_date), Month(trans_date), country