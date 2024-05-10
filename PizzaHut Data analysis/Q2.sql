-- Identify the most common pizza size ordered.
select a.size,count(b.order_details_id) as No_of_orders from pizzas a join order_details b on a.pizza_id=b.pizza_id
group by a.size order by No_of_orders desc limit 1;