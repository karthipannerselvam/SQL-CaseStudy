-- List the top 5 most ordered pizza types along with their quantities.

-- with cte as(select pizza_id,count(quantity) as quantity from order_details group by pizza_id order by quantity desc ),
-- 	cte1 as(select a.pizza_id,a.pizza_type_id,b.quantity from pizzas a join cte b on a.pizza_id=b.pizza_id) 

-- select a.name,b.quantity from pizza_types a join cte1 b on a.pizza_type_id=b.pizza_type_id limit 5;

select a.name, count(c.quantity) as quantity from pizza_types a join pizzas b on a.pizza_type_id=b.pizza_type_id 
join order_details c on b.pizza_id=c.pizza_id group by a.name order by quantity desc limit 5;
