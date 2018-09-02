select member_id
		,studio_key
		,class_tag
		,reserved_for
		,canceled
		,signed_in_at
from clubready_reservations

union all

select member_id
		,studio_key
		,class_tag
		,reserved_at
		,case canceled_at
		 when null then 'f' else 't'
		 end as canceled
		,checked_in_at
from mindbody_reservations;