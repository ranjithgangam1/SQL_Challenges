/* Write your PL/SQL query statement below */

select min(log_id) as start_id, max(log_id) as end_id
from
(select log_id,
log_id - row_number() over(order by log_id ) as row_id
from Logs) t
group by t.row_id
order by start_id
