/*

You are given a table, Functions, containing two columns: X and Y.



Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.

Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.*/




select 
*
from
(
select 
x,y
from Functions
where x = y
group by x,y
having count(*)>1
union
select
f1.x,f1.y 
from functions f1, functions f2
where f1.x < f1.y and f1.x = f2.y and f1.y=f2.x
) t
order by x