/*

Samantha interviews many candidates from different colleges using coding challenges and contests. Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are .

Note: A specific contest can be used to screen candidates at more than one college, but each college only holds  screening contest.

*/



with 
sum_views as (
    select 
    col.contest_id,
    sum(v.total_views) as total_views,
    sum(v.total_unique_views) as total_unique_views
    from view_stats v
    left join challenges ch on v.challenge_id = ch.challenge_id
    left join colleges col on ch.college_id = col.college_id
    group by col.contest_id
),
sum_sub as (
    select 
    col.contest_id,
    sum(s.total_submissions) as total_submissions,
    sum(s.total_accepted_submissions) as total_accepted_submissions
    from Submission_Stats s
    left join challenges ch on s.challenge_id = ch.challenge_id
    left join colleges col on ch.college_id = col.college_id
    group by col.contest_id
)
select 
    sv.contest_id, 
    c.hacker_id, 
    c.name,
    ss.total_submissions,
    ss.total_accepted_submissions,
    sv.total_views,
    sv.total_unique_views
from sum_views sv full join sum_sub ss on sv.contest_id = ss.contest_id
left join contests c on sv.contest_id = c.contest_id
where ss.total_submissions + ss.total_accepted_submissions + sv.total_views + sv.total_unique_views > 0
order by contest_id;