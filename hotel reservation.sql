create database hotel;
use hotel;

/* 1. What is the total number of reservations in the dataset? */
select count(*) as Total_Reservations 
from hotel_reservation;

/* 2. Which meal plan is the most popular among guests? */
select type_of_meal_plan,count(*) as total_meal_plan
from hotel_reservation
group by type_of_meal_plan 
order by count(*) desc
limit 1; 

/* 3. What is the average price per room for reservations involving children? */
select room_type_reserved, avg(avg_price_per_room) as avg_price
from hotel_reservation
where no_of_children>0
group by room_type_reserved;

/* 4. How many reservations were made for the year 20XX (replace XX with the desired year)?  */
select count(*) as total_reservation
from hotel_reservation
where arrival_date like '%2018';

/* 5. What is the most commonly booked room type? */
select room_type_reserved,count(*) as total_booking
from hotel_reservation
group by room_type_reserved
order by count(*) desc
limit 1; 

/* 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)? */
select count(*) as weekend_nights
from hotel_reservation
where no_of_weekend_nights > 0;

/* 7. What is the highest and lowest lead time for reservations? */
select max(lead_time) as highest_lead_time,
min(lead_time) as lowest_lead_time
from hotel_reservation;

/* 8. What is the most common market segment type for reservations? */
select market_segment_type,count(*) as total_market_segment_type
from hotel_reservation
group by market_segment_type
order by count(*) desc
limit 1; 

/* 9. How many reservations have a booking status of "Confirmed"? */
select count(*) as confirmed_booking
from hotel_reservation
where booking_status = 'Not_Canceled';

/* 10. What is the total number of adults and children across all reservations? */
select sum(no_of_adults) as total_adults, 
sum(no_of_children) as total_children
from hotel_reservation;

/* 11. What is the average number of weekend nights for reservations involving children? */
select avg(no_of_weekend_nights) as avg_weekend_nights_with_children
from hotel_reservation
where no_of_children>0;

/* 12. How many reservations were made in each month of the year? */
select count(*) as no_of_reservation,
month(str_to_date(arrival_date,'%d-%m-%Y')) as month,
year(str_to_date(arrival_date,'%d-%m-%Y')) as year
from hotel_reservation
group by month(str_to_date(arrival_date,'%d-%m-%Y')), year(str_to_date(arrival_date,'%d-%m-%Y'))
order by month asc;

/* 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type? */
select room_type_reserved, 
avg(no_of_weekend_nights + no_of_week_nights) as avg_nights
from hotel_reservation
group by room_type_reserved
order by room_type_reserved;

/* 14. For reservations involving children, what is the most common room type, and what is the average price for that room type? */
select room_type_reserved,avg(avg_price_per_room) as avg_price
from hotel_reservation
where no_of_children>0
group by room_type_reserved
order by count(*) desc
limit 1;  

/*15. Find the market segment type that generates the highest average price per room. */
select market_segment_type,round(avg(avg_price_per_room),3) as avg_price
from hotel_reservation
group by market_segment_type
order by market_segment_type desc;