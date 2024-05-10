-- Calculate the percentage contribution of each pizza type to total revenue.
with cte as (select pizza_id,sum(quantity) as quantity from order_details group by pizza_id),

cte2 as(select a.pizza_type_id as pizza_type_id, sum(b.quantity*a.price) as sum from pizzas a join cte b on a.pizza_id = b.pizza_id group by a.pizza_type_id)

select a.category,
round((sum(b.sum)/(select round(sum(b.price * a.quantity),2) as total_revenue from order_details a left join pizzas b on a.pizza_id=b.pizza_id))*100,2)
as sum from pizza_types a join cte2 b on a.pizza_type_id=b.pizza_type_id group by a.category order by sum desc ;