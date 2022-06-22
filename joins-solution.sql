
-- ## Tasks
SELECT * FROM customers;
SELECT * FROM addresses;
SELECT * FROM orders;
SELECT * FROM line_items;
SELECT * FROM warehouse;
SELECT * FROM products;


-- 1. Get all customers and their addresses.
SELECT *
	FROM customers
	JOIN addresses
	ON customers.id = addresses.customer_id;


-- 2. Get all orders and their line items (orders, quantity and product).
SELECT orders.id AS order_id,
	   orders.order_date, 
	   line_items.quantity, 
	   products.description
	FROM line_items
	JOIN orders
	ON orders.id = line_items.order_id
	JOIN products 
	ON line_items.product_id = products.id
	ORDER BY orders.id;
	

-- 3. Which warehouses have cheetos?
SELECT products.description, 
	   warehouse.warehouse
	FROM warehouse_product
	JOIN products
	ON warehouse_product.product_id = products.id
	JOIN warehouse 
	ON warehouse.id = warehouse_product.warehouse_id
	WHERE products.description = 'cheetos';
	
-- 4. Which warehouses have diet pepsi?
SELECT products.description, 
	   warehouse.warehouse
	FROM warehouse_product
	JOIN products
	ON warehouse_product.product_id = products.id
	JOIN warehouse 
	ON warehouse.id = warehouse_product.warehouse_id
	WHERE products.description = 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT * 
	FROM customers
	JOIN addresses
	ON customers.id = addresses.customer_id
	JOIN orders
	ON addresses.id = orders.address_id
	JOIN line_items 
	ON line_items.order_id = orders.id;

-- 6. How many customers do we have?
SELECT count(*) FROM customers;

-- 7. How many products do we carry?
SELECT count(*) FROM warehouse;

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT products.description, 
	   warehouse_product.on_hand
	FROM products
	JOIN warehouse_product
	ON products.id = warehouse_product.product_id;
