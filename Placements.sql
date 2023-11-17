/*

You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.

*/




select 
s.Name
from Friends f
left join Packages p1 on f.ID = p1.ID
left join packages p2 on f.Friend_ID = p2.ID
left join Students s on f.ID = s.ID
where p2.salary > p1.salary
order by p2.salary