With tf as 
 (
    Select 
        Requester_id,
        Count(*) as c
    From RequestAccepted
    Group by requester_id

    Union ALL

    Select 
        accepter_id,
        Count(*) as c
    From RequestAccepted
    Group by accepter_id
)

Select 
    Requester_id as id,
    sum(c) as num
From tf
Group by Requester_id
Order by num Desc
Limit 1