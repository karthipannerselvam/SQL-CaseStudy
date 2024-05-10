-- Group the orders by date and calculate the average number of pizzas ordered per day.
select avg(quantity) from
(select a.order_date,sum(b.quantity) as quantity from orders a join order_details b on a.order_id=b.order_id  group by a.order_date) as average;
