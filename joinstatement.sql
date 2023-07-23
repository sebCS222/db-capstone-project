SELECT customer_id, name, order_id, total_cost, cuisine, item
FROM orders
LEFT JOIN customers ON orders.customer_customer_id = customers.customer_id
LEFT JOIN menu ON orders.menu_menu_id = menu.menu_id
WHERE total_cost > 150
ORDER BY total_cost ASC