with temp_st as 
(select log_id as start_id,
        lead(log_id, 1) over(order by log_id) as end_id
from Logs);

select start_id,
       case when end_id is not null then end_id 
                                    else start_id end as end_id
from temp_st
where start_id+1 !=  end_id or end_id is null
order by start_id
