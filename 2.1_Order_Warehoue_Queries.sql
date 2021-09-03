SELECT *
FROM Orders;

SELECT *
FROM Warehouse;


-- Find how many orders are placed for each warehouse

SELECT w.warehouse_id, CONCAT(state,', ',warehouse_alias) AS warehouse_name, COUNT(DISTINCT order_id) AS number_of_orders 
FROM Orders o
RIGHT JOIN Warehouse w -- to show all the warehouse even the one has no order
	ON o.warehouse_id = w.warehouse_id
GROUP BY w.warehouse_id, CONCAT(state,', ',warehouse_alias);

-- Find  which warehouse delivered the most orders per total
SELECT w.warehouse_id, CONCAT(state,', ',w.warehouse_alias) AS warehouse_name, COUNT( o.order_id) AS number_of_orders, (SELECT COUNT(*) FROM Orders)  as total_order,
	CASE 
		WHEN Cast(COUNT(order_id) as float) /Cast((SELECT COUNT(*) FROM Orders) as float) <= 0.20 
			THEN 'fulfilled 0-20% orders'
		WHEN Cast(COUNT(order_id) as float) /Cast((SELECT COUNT(*) FROM Orders) as float) >  0.20 AND Cast(COUNT(order_id) as float) /Cast((SELECT COUNT(*) FROM Orders) as float)  <= 0.6
			THEN 'fulfilled 21-60% orders'
		ELSE 'fulfilled more than 60% orders' 
	END  AS fulfill_summary
FROM Orders o
RIGHT JOIN Warehouse w -- to show all the warehouse even the one has no order
	ON o.warehouse_id = w.warehouse_id
GROUP BY w.warehouse_id, CONCAT( state ,', ',warehouse_alias)
HAVING COUNT( o.order_id) > 0 ; -- only show warehouse with orders

