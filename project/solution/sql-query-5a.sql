 with

cr_mb_booked as (
	select member_id
			,reserved_for as reserved_time
	from clubready_reservations
	
	union all
	
	select member_id
			,reserved_at as reserved_time
	from mindbody_reservations
),

booked_time_periods as (
	select cr_mb_booked.member_id
			,case when time(cr_mb_booked.reserved_time) between '07:00:00' and '11:00:00' then "Morning"
			 		when time(cr_mb_booked.reserved_time) between '12:00:00' and '16:00:00' then "Afternoon"
			 		when time(cr_mb_booked.reserved_time) between '17:00:00' and '22:00:00' then "Evening"
			 		else "Error"
			 end as booked_time_period
			/*
			Use the below if we wanted all time periods to be captured
			 
			,case when time(cr_mb_booked.reserved_time) between '07:00:00' and '11:59:59' then "Morning"
			 		when time(cr_mb_booked.reserved_time) between '12:00:00' and '16:59:59' then "Afternoon"
			 		when time(cr_mb_booked.reserved_time) between '17:00:00' and '23:59:59' then "Evening"
			 		else "Error"
			 end as booked_time_period
			 
			*/
			,cr_mb_booked.reserved_time
	from cr_mb_booked
),

booked_time_periods_count as (
	select count(booked_time_periods.member_id) as member_count
			,booked_time_periods.booked_time_period
	from booked_time_periods
	
	group by booked_time_periods.booked_time_period
),

select booked_time_periods_count.booked_time_period as most_popular_booked_time_period
from booked_time_periods_count

order by booked_time_periods_count.member_count desc

limit 1;