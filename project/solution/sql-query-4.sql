 with

cr_completed as (
	select member_id
			,count(member_id) as completed_count
	from clubready_reservations
	
	where (canceled = 'f' and signed_in_at is not null and
			signed_in_at between '2018-01-01 00:00:00' and '2018-01-31 23:59:59')
			or 
			(canceled = 't' and reserved_for between '2018-01-01 00:00:00' and '2018-01-31 23:59:59')
			
	group by member_id
),

cr_canceled as (
	select member_id
			,count(member_id) as canceled_count
	from clubready_reservations
	
	where canceled = 't' and reserved_for between '2018-01-01 00:00:00' and '2018-01-31 23:59:59'
	
	group by member_id
),

mb_completed as (
	select member_id
			,count(member_id) as completed_count
	from mindbody_reservations
	
	where isnull(canceled_at) and checked_in_at is not null and
			checked_in_at between '2018-01-01 00:00:00' and '2018-01-31 23:59:59'
			
	group by member_id
),

mb_canceled as (
	select member_id
			,count(member_id) as canceled_count
	from mindbody_reservations
	
	where canceled_at between '2018-01-01 00:00:00' and '2018-01-31 23:59:59'
	
	group by member_id
),

cr_mb_completed_canceled as (
	select cr_completed.member_id
			,cr_completed.completed_count
			,null as canceled_count
	from cr_completed
	
	union all
	
	select mb_completed.member_id
			,mb_completed.completed_count
			,null as canceled_count
	from mb_completed
	
	union all
	
	select cr_canceled.member_id
			,null as completed_count
			,cr_canceled.canceled_count
	from cr_canceled
	
	union all
	
	select mb_canceled.member_id
			,null as completed_count
			,mb_canceled.canceled_count
	from mb_canceled
),

cr_mb_completed_canceled_limit as (
	select cr_mb_completed_canceled.member_id
			,sum(cr_mb_completed_canceled.completed_count) as member_completed_count
			,sum(cr_mb_completed_canceled.canceled_count) as member_canceled_count
	from cr_mb_completed_canceled
	
	group by cr_mb_completed_canceled.member_id
	
	having member_completed_count >= 1 and
			 (member_canceled_count <= 1 or isnull(member_canceled_count))
)

select count(cr_mb_completed_canceled_limit.member_id) as answer_4
from cr_mb_completed_canceled_limit;