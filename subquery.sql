SELECT item
FROM menu
WHERE menu_id IN
(SELECT menu_menu_id FROM orders WHERE quantity > 2);