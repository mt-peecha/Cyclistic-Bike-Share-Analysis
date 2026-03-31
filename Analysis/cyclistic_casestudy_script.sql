/*====================================================================
Bellabeat_Project — Daily Activity (Fitbit) — Analysis Script
 Dataset: dailyActivity_merged.csv imported into dbo.daily_activity
 Author: MT Peecha
 ====================================================================*/

select hour_of_day
from [dbo].[cyclistic_rides_raw]

select 
	hour_of_day, 
	count(*) as total_rides
from [dbo].[cyclistic_rides_raw]
group by hour_of_day
order by hour_of_day;


--CREATE ONE MASTER TABLE

select * 
into cyclistic_rides_raw
from rides_jan

union all
select * from rides_feb

union all
select * from rides_mar

union all
select * from rides_apr

union all
select * from rides_may

union all
select * from rides_jun

union all
select * from rides_jul

union all
select * from rides_aug

union all
select * from rides_sep

union all
select * from rides_oct

union all
select * from rides_nov

union all
select * from rides_dec


select count(ride_length_minutes)
from cyclistic_rides_raw
where ride_length_minutes > 1440

select count(ride_length_minutes)
from cyclistic_rides_raw
where ride_length_minutes < 1
	or ride_length_minutes > 1440;
   

/*=============================================
DATA CLEANING
=============================================*/

--1. CREATE RIDE DURATION (ride_length)

alter table cyclistic_rides_raw
add ride_length_minutes int;

update cyclistic_rides_raw
set ride_length_minutes =
datediff(
	minute,
	cast(started_at as datetime),
	cast(ended_at as datetime)
	)

--2.1 INSPEACT INVALID DATA (SHORTER THAN 1 MINUTE, LONGER THAN 1 DAY)

select count(ride_length_minutes)
from cyclistic_rides_raw
where ride_length_minutes < 1
	or ride_length_minutes > 1440;


--2.2 DELETE INVALID RIDES (SHORTER THAN 1 MINUTE, LONGER THAN 1 DAY)

delete from [dbo].[cyclistic_rides_raw]
where ride_length_minutes < 1
	or ride_length_minutes > 1440;


/*================================================================
DATA PROCESSING
==================================================================*/

--1. CREATE DAY OF WEEK COLUMN
alter table [dbo].[cyclistic_rides_raw]
add day_of_week varchar(20)

update [dbo].[cyclistic_rides_raw]
set day_of_week = datename(weekday, [started_at])

select top 10
    started_at,
    day_of_week
from cyclistic_rides_raw;

--2. CREATE HOUR OF DAY COLUMN
alter table [dbo].[cyclistic_rides_raw]
add hour_of_day int;

update [dbo].[cyclistic_rides_raw]
set hour_of_day = datepart(hour, [started_at])

select 
	hour_of_day,
	[member_casual],
	count(*) as total_rides
from [dbo].[cyclistic_rides_raw]
group by hour_of_day, [member_casual]
order by total_rides desc, hour_of_day;

/*================================================================
ANAlYSIS
==================================================================*/

--1. TOTAL RIDERS BY RIDER TYPE

select 
	[member_casual],
	count(*) as ride_count,
	cast(
		round(count(*) * 100.0/ sum(count(*)) over(),2) 
		as decimal(5,2)
		) as percentage_share
from [dbo].[cyclistic_rides_raw]
group by [member_casual]
order by ride_count

--2. AVERAGE RIDE LENGTH BY RIDER TYPE

select 
	[member_casual],
	avg([ride_length_minutes]) as avg_ride_length_minutes
from [dbo].[cyclistic_rides_raw]
group by [member_casual]
order by avg_ride_length_minutes

--3. AVERAGE RIDE BY DAY_OF_WEEK

select 
	[day_of_week],
	[member_casual],
	count(*) as total_rides
from [dbo].[cyclistic_rides_raw]
group by [member_casual], [day_of_week]
order by total_rides desc, [member_casual] desc

--4. RIDES_BY_HOUR
select 
	hour_of_day,
	[member_casual],
	count(*) as total_rides_by_hour
from [dbo].[cyclistic_rides_raw]
group by hour_of_day, [member_casual]
order by total_rides_by_hour desc, hour_of_day;