# Write your MySQL query statement below
Select 
*
From Users
Where Regexp_like(mail, '^[a-zA-Z]{1}[a-zA-Z0-9_.-]*@leetcode\.com$') and right(mail,13) = '@leetcode.com'