with

sq1 as (
	select id
	from clubready_reservations
	where canceled = 'f' and signed_in_at is not null
	  
	union all
	
	select id
	from mindbody_reservations
	where isnull(canceled_at) and checked_in_at is not null
)

select count(id) as total_reserves
from sq1;