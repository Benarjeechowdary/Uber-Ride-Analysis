use projects

select top 5 * from uber

--counting null values in booking_value column
select cast(count(*)-count(booking_value) as decimal(10,2))/count(*)
from uber


--updating null values in booking_value column with average of the column
update uber
set booking_value=(select avg(booking_value) from uber)
where booking_value is null


--counting null values in avg_ctat column
select cast(count(*)-count(avg_ctat) as decimal(10,2))/count(*)
from uber


--updating null values in avg_ctat column with average of the column
update uber
set avg_ctat=(select avg(avg_ctat) from uber)
where avg_ctat is null

--counting null values in cacelled_rides_by_drivers column
select cast(count(*)-count(cancelled_rides_by_driver) as decimal(10,2))/count(*)
from uber

--counting null values in ride_distance column
select cast(count(*)-count(ride_distance) as decimal(10,2))/count(*)
from uber

--updating null values in ride_distance column with average of the column
update uber
set ride_distance=(select avg(ride_distance) from uber)
where ride_distance is null

--count null values in driver_ratings
select cast(count(*)-count(driver_ratings) as decimal(10,2))/count(*)
from uber


--updating null values in driver_ratings column with average of the column
update uber
set driver_ratings=(select avg(driver_ratings) from uber)
where driver_ratings is null

--counting null values in customer_ratings column
select cast(count(*)-count(customer_rating) as decimal(10,2))/count(*)
from uber

--updating null values in ride_distance column with average of the column
update uber
set customer_rating=(select avg(customer_rating) from uber)
where customer_rating is null

--updating cancelledrides by customer column
 update uber
 set Cancelled_Rides_by_Customer=0 
 where Cancelled_Rides_by_Customer='null'

 --updating cancelled rides by driver column
 update uber 
 set Cancelled_Rides_by_Driver=0
 where Cancelled_Rides_by_Driver='null'





--analysing the data
select top 5 * from uber
--total number of rides
select count(booking_id) as total_rides from uber

--Total rides per day/week/month
select day(date),count(*) from uber
group by day(date)

select month(date),count(*) from uber
group by month(date)

select year(date),count(*) from uber
group by year(date)

--Total rides by vehicle type
select vehicle_type,count(*) from uber
group by vehicle_type

--Total revenue per day/week/month
select day(date),sum(booking_value)as total_revenue from uber
group by day(date)

select month(date),sum(booking_value) as total_revenue from uber
group by month(date)

select year(date),sum(booking_value) as total_Revenue from uber
group by year(date)


--Average fare per ride type
select vehicle_type,avg(booking_value) as average_fare
from uber
group by vehicle_type

--Peak hours of rides
select datepart(hour,time) as hour,count(*) as total_rides_in_that_hour
from uber
group by datepart(hour,time)
order by datepart(hour,time)



--Peak days of the week for rides
select top 1 datename(weekday,date) as day_name,count(*) as peak_day_of_week
from uber
group by datename(weekday,date)
order by count(*) desc



--Customer with highest number of rides
select top 1 customer_id,count(customer_id) as count_rides
from uber
group by customer_id
order by count(customer_id) desc


--Total rides by pickup location
select pickup_location,count(pickup_location) as count_pickuplocation
from uber
group by pickup_location
order by count(pickup_location) desc



--Total rides by drop-off location
select drop_location,count(drop_location) as count_dropofflocation
from uber
group by drop_location
order by count(drop_location) desc



--Average distance per ride_type
select vehicle_type,avg(ride_distance) as average_ride_distance
from uber
group by vehicle_type




--Distribution of payment types
select payment_method,count(payment_method) as count_payment_method
from uber
group by payment_method
order by count(payment_method) desc



--Top 10 revenue-generating rides/locations
select top 10 pickup_location,sum(booking_Value) as total_Revenue
from uber
group by pickup_location
order by sum(booking_Value)


--Cancellation Breakdown by Reason (Customer/Driver):
select reason_for_cancelling_by_customer ,count(reason_for_cancelling_by_customer) as count_Reason
from uber
where reason_for_cancelling_by_customer!='null'
group by Reason_for_cancelling_by_Customer
order by count(reason_for_cancelling_by_customer) desc


select driver_cancellation_reason,count(driver_cancellation_Reason) as cnt_reason
from uber 
where driver_cancellation_reason!='null'
group by driver_cancellation_reason
order by count(driver_cancellation_Reason) desc




 --What are the top 10 Pickup Locations with the highest average Avg VTAT (Vehicle To Arrival Time)

 select top 10 pickup_location,avg(avg_vtat) as average from uber
 where Booking_Status='Completed'
 group by pickup_location
 order by avg(avg_vtat) desc


 --Calculate the average revenue per kilometer (Booking Value / Ride Distance) for each Vehicle Type

 select vehicle_type,avg(booking_value/ride_distance) as average_Revenue from uber 
 group by vehicle_type
 order by average_revenue desc



 select * from uber



 



