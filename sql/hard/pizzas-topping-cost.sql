-- https://datalemur.com/questions/pizzas-topping-cost
SELECT
  CONCAT_WS(',', p.topping_name, pp.topping_name, ppp.topping_name) AS pizza
  , p.ingredient_cost
  + pp.ingredient_cost
  + ppp.ingredient_cost AS total_cost
FROM pizza_toppings p
CROSS JOIN pizza_toppings pp
CROSS JOIN pizza_toppings ppp
WHERE p.topping_name < pp.topping_name
  AND pp.topping_name < ppp.topping_name
ORDER BY total_cost DESC, pizza ASC
;
