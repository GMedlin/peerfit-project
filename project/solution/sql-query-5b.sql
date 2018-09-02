 with

cr_mb_attended as (
	select member_id
			,signed_in_at as attend_time
	from clubready_reservations
	
	where signed_in_at is not null
	
	union all
	
	select member_id
			,checked_in_at as attend_time
	from mindbody_reservations
	
	where checked_in_at is not null
),

attended_time_periods as (
	select cr_mb_attended.member_id
			,case when time(cr_mb_attended.attend_time) between '07:00:00' and '11:00:00' then "Morning"
			 		when time(cr_mb_attended.attend_time) between '12:00:00' and '16:00:00' then "Afternoon"
			 		when time(cr_mb_attended.attend_time) between '17:00:00' and '22:00:00' then "Evening"
			 		else "Error"
			 end as attended_time_period
			/*
			Use the below if we wanted all time periods to be captured
			 
			,case when time(cr_mb_attended.attend_time) between '07:00:00' and '11:59:59' then "Morning"
			 		when time(cr_mb_attended.attend_time) between '12:00:00' and '16:59:59' then "Afternoon"
			 		when time(cr_mb_attended.attend_time) between '17:00:00' and '23:59:59' then "Evening"
			 		else "Error"
			 end as attended_time_period
			*/
			,cr_mb_attended.attend_time
	from cr_mb_attended
),

attended_time_periods_count as (
	select count(attended_time_periods.member_id) as member_count
			,attended_time_periods.attended_time_period
	from attended_time_periods
	
	group by attended_time_periods.attended_time_period
)

select attended_time_periods_count.attended_time_period as most_popular_attended_time_period
from attended_time_periods_count

order by attended_time_periods_count.member_count desc

limit 1;