-- Determine the distribution of orders by hour of the day.
select hour(order_time) as hours, count(order_id) as count from orders group by hour(order_time) order by count  desc;