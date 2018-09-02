with

sq1 as (
	select id
	from clubready_reservations
	  
	union all
	
	select id
	from mindbody_reservations
)

select count(id) as total_reserves
from sq1;