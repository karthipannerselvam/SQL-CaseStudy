-- Analyze the cumulative revenue generated over time.
select order_date, sum(sum) over(order by order_date) as cum from
(select a.order_date,round(sum(b.quantity*c.price),2) as sum from orders a join order_details b on a.order_id=b.order_id
join pizzas c on c.pizza_id=b.pizza_id group by a.order_date) as sales;