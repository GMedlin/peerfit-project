with

sq1 as (
	select count(id) as clubready_abandoned
	from clubready_reservations
	where canceled = 'f' and isnull(signed_in_at)
),

sq2 as (
	select count(id) as mindbody_abandoned
	from mindbody_reservations
	where isnull(canceled_at) and isnull(checked_in_at)
)

select case 
		 when mindbody_abandoned > clubready_abandoned then 'mindbody' 
		 else 'clubready' 
		 end as most_abandoned
from sq1, sq2;