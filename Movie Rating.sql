# Write your MySQL query statement below
With name as (
    Select 
    u.name    
    From MovieRating mr 
    Left Join Users u on mr.user_id = u.user_id
    Order by COUNT(*) OVER (PARTITION BY u.name) Desc, u.name ASC
    Limit 1
), 
title as (
    Select 
    m.title
    From MovieRating mr
    Left Join Movies m on mr.movie_id = m.movie_id
    Where Created_at between '2020-02-01' and '2020-02-29'
    Order by Avg(mr.rating) Over (PARTITION BY m.title) Desc, m.title ASC 
    Limit 1
)

Select name as results From name
Union ALL 
Select title as results  From title