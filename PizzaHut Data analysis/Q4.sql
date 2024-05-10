-- Join the necessary tables to find the total quantity of each pizza category ordered.	

select a.category, sum(c.quantity) as quantity from pizza_types a
 join pizzas b on a.pizza_type_id = b.pizza_type_id 
join order_details c on b.pizza_id = c.pizza_id 
group by a.category order by quantity desc;