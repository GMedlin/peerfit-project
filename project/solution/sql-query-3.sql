with

cr_completed as (
	select id
			 ,class_tag
			 from clubready_reservations
	where canceled = 'f' and signed_in_at is not null and
			signed_in_at between '2018-02-01 00:00:00' and '2018-02-28 23:59:59'
),

mb_completed as (
	select id
			 ,class_tag
	from mindbody_reservations
	where isnull(canceled_at) and checked_in_at is not null and
			checked_in_at between '2018-02-01 00:00:00' and '2018-02-28 23:59:59'
),

cr_mb_union as (
	select cr_completed.id
			,cr_completed.class_tag
	from cr_completed
	
	union all
	
	select mb_completed.id
			,mb_completed.class_tag
	from mb_completed
),

classes_completed as (
	select count(cr_mb_union.id) as completed_count
			,cr_mb_union.class_tag
	from cr_mb_union
	group by class_tag
	order by completed_count desc
),

max_class_completed as (
	select max(classes_completed.completed_count) as max_class_completed_count
			,class_tag
	from classes_completed
)

select max_class_completed.class_tag
from max_class_completed;