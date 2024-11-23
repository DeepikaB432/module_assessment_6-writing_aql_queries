-- Populating data in all three tables

INSERT INTO shopping.product_categories (id, title) VALUES
(1, 'Electronics');
INSERT INTO shopping.product_categories (id, title) VALUES
(2, 'Clothing');
INSERT INTO shopping.product_categories (id, title) VALUES
(3, 'Home & Kitchen');
INSERT INTO shopping.product_categories (id, title) VALUES
(4, 'Food');

INSERT INTO shopping.products (id, title, description, product_category_id, price,quantity) VALUES
(1, 'Iphone 15', 'Iphone 15', 1, 1500,20);
INSERT INTO shopping.products (id, title, description, product_category_id, price,quantity) VALUES
(2, 'Charger', 'Charger', 1, 20,100);
INSERT INTO shopping.products (id, title, description, product_category_id, price,quantity) VALUES
(3, 'Tops', 'Women Tops', 2, 10,200);
INSERT INTO shopping.products (id, title, description, product_category_id, price,quantity) VALUES
(4, 'Clock', 'Clock', 3, 45,140);
INSERT INTO shopping.products (id, title, description, product_category_id, price,quantity) VALUES
(5, 'Pants', 'Women Pants', 2, 20,250)

INSERT INTO shopping.orders (id, product_id, name, email, order_date) VALUES
(2, 4, 'John', 'j@j.com', now())
INSERT INTO shopping.orders (id, product_id, name, email, order_date) VALUES
(1, 1, 'Carol', 'c@j.com', '2024-11-20 17:24:11');
INSERT INTO shopping.orders (id, product_id, name, email, order_date) VALUES
(3, 3, 'George', 'g@m.com', '2024-10-2 18:30:11');
INSERT INTO shopping.orders (id, product_id, name, email, order_date) VALUES
(4, 2, 'Robert', 'r@s.com', now());
INSERT INTO shopping.orders (id, product_id, name, email, order_date) VALUES
(5, 2, 'Deepika', 'd@b.com', now());

-- Get all orders from the most recent to the oldest.

SELECT * FROM shopping.orders
ORDER BY order_date DESC;

-- Get all products belonging to a particular category.

select * from shopping.products where product_category_id = 1;

-- Get the top three most expensive products in the products table.

select * from shopping.products order by price desc limit 3;

-- Get the total number of products under each product category.

SELECT pc.title, COUNT(p.product_category_id) AS total_products
FROM shopping.product_categories pc
LEFT JOIN shopping.products p ON pc.id = p.product_category_id
GROUP BY pc.title;

-- Get the top three selling products based on the number of orders.

SELECT p.id, p.title, COUNT(o.product_id) AS total_orders
FROM shopping.orders o
JOIN shopping.products p ON o.product_id = p.id
GROUP BY p.id
ORDER BY total_orders DESC
LIMIT 3;