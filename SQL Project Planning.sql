/*
HackerRank Challenge: Advanced Join - SQL Project Planning

You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.

If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.

Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. If there is more than one project that have the same number of completion days, then order by the start date of the project.

*/


select 
start_date, 
end_date
from
    (select 
    ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS number,
    a.end_date as end_date
    from projects a 
    left join projects b
    on a.end_date = b.start_date
    where b.start_date is null
    ) Ed,
    (select
     ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS number,
     b.start_date as start_date
     from projects a
     right join projects b
     on b.start_date = a.end_date
     where a.end_date is null
    ) Sd
    
where ed.number = sd.number
order by datediff(day, start_date,end_date), start_date 