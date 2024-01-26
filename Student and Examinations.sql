# LeetCode:1280. Students and ExaminationsWrite your MySQL query statement below

With t1 as (

Select *
from Students st
Cross join Subjects sj
),
t2 as (
Select Distinct 
*, 
Count(*) as c
From Examinations e
Group by e.student_id, e.subject_name
)

Select 
t1.student_id,
t1.student_name,
t1.subject_name,
ifnull(t2.c,0) as attended_exams
From t1 left join t2 on t1.student_id = t2.student_id and t1.subject_name = t2.subject_name
Order by t1.student_id, t1.subject_name ASC