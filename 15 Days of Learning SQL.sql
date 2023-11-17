/*

Julia conducted a  days of learning SQL contest. The start date of the contest was March 01, 2016 and the end date was March 15, 2016.

Write a query to print total number of unique hackers who made at least  submission each day (starting on the first day of the contest), and find the hacker_id and name of the hacker who made maximum number of submissions each day. If more than one such hacker has a maximum number of submissions, print the lowest hacker_id. The query should print this information for each day of the contest, sorted by the date.

*/




declare @consistent_hackers table
(hacker_id int,
 submission_date date
);
declare @sdate date;
declare @rdate date;
set @sdate = '2016-03-01';
set @rdate = '2016-03-01';

insert into @consistent_hackers
select 
    hacker_id,
    submission_date
from submissions 
where submission_date = '2016-03-01';

While @rdate < '2016-03-15'
Begin
    set @sdate = dateadd(day,1,@sdate);
    insert into @consistent_hackers
    select 
        s.hacker_id,
        s.submission_date
    from submissions s
    join @consistent_hackers ch on ch.hacker_id = s.hacker_id And ch.submission_date = @rdate
    where s.submission_date = @sdate;
set @rdate = dateadd(day,1,@rdate);
End;

with 
t1 as (
    select 
        submission_date,
        count(distinct hacker_id) as cons
    from @consistent_hackers
    group by submission_date    
),

t23 as (
    select
    sdates,
    t.hacker_id as hacker_id,
    hackers.name as name
    from 
    (     SELECT
            submission_date AS sdates,
            hacker_id,
            COUNT(hacker_id) AS cnt,
            ROW_NUMBER() OVER (PARTITION BY submission_date ORDER BY COUNT(hacker_id) DESC, hacker_id ASC) AS row_num
        FROM submissions
        GROUP BY submission_date, hacker_id
    ) t
    join hackers on t.hacker_id = hackers.hacker_id
    where row_num = 1
)

select t1.submission_date, t1.cons, t23.hacker_id, t23.name
from t1 join t23 on t1.submission_date = t23.sdates
order by t1.submission_date;
