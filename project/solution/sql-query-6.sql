with

cr_completed as (
	select member_id
			,canceled
			,reserved_for
			,signed_in_at
			 from clubready_reservations
			 
	where reserved_for between '2018-02-01 00:00:00' and '2018-02-28 23:59:59'
),

mb_completed as (
	select member_id
			,canceled_at
			,reserved_at
			,checked_in_at
	from mindbody_reservations
	
	where reserved_at between '2018-02-01 00:00:00' and '2018-02-28 23:59:59'
),

cr_mb_union as (
	select cr_completed.member_id
			,cr_completed.canceled
			,cr_completed.reserved_for
			,cr_completed.signed_in_at
	from cr_completed
	
	union all
	
	select mb_completed.member_id
			,mb_completed.canceled_at
			,mb_completed.reserved_at
			,mb_completed.checked_in_at
	from mb_completed
),

most_reserved_feb as (
	select member_id
			,count(member_id) as member_count
	from cr_mb_union
	
	group by member_id
	
	order by member_count desc
	
	limit 1
),

most_reserved_feb_member as (
	select most_reserved_feb.member_id
	from most_reserved_feb
)

select count(cr_mb_union.member_id) as answer_6
from cr_mb_union

inner join most_reserved_feb_member
	on most_reserved_feb_member.member_id = cr_mb_union.member_id
	
where (canceled = 'f' or isnull(canceled)) and
		signed_in_at is not null;