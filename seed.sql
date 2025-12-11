-- Restaurants table
CREATE TABLE restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255)
);

-- Menu items table
CREATE TABLE menu_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT,
    name VARCHAR(255),
    price INT,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)
);

-- Orders table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    menu_item_id INT,
    order_date DATETIME,
    FOREIGN KEY (menu_item_id) REFERENCES menu_items(id)
);

-- Seed restaurants (12)
INSERT INTO restaurants (name, city) VALUES
('Hyderabadi Spice House', 'Hyderabad'),
('Biryani Lovers', 'Hyderabad'),
('Royal Biryani', 'Hyderabad'),
('Biryani King', 'Hyderabad'),
('Nawabi Biryani', 'Hyderabad'),
('Spice Villa', 'Hyderabad'),
('Biryani Express', 'Hyderabad'),
('Royal Feast', 'Hyderabad'),
('Biryani Hub', 'Hyderabad'),
('Tandoori Biryani', 'Hyderabad'),
('Magic Biryani', 'Hyderabad'),
('Biryani House', 'Hyderabad');

-- Seed menu items (all Chicken Biryani)
INSERT INTO menu_items (restaurant_id, name, price) VALUES
(1, 'Chicken Biryani', 220),
(2, 'Chicken Biryani', 250),
(3, 'Chicken Biryani', 180),
(4, 'Chicken Biryani', 210),
(5, 'Chicken Biryani', 230),
(6, 'Chicken Biryani', 200),
(7, 'Chicken Biryani', 240),
(8, 'Chicken Biryani', 225),
(9, 'Chicken Biryani', 210),
(10, 'Chicken Biryani', 215),
(11, 'Chicken Biryani', 205),
(12, 'Chicken Biryani', 220);

-- Seed orders (different counts to test top 10)
INSERT INTO orders (menu_item_id, order_date) VALUES
-- Hyderabadi Spice House: 15 orders
(1, NOW()),(1, NOW()),(1, NOW()),(1, NOW()),(1, NOW()),
(1, NOW()),(1, NOW()),(1, NOW()),(1, NOW()),(1, NOW()),
(1, NOW()),(1, NOW()),(1, NOW()),(1, NOW()),(1, NOW()),
-- Biryani Lovers: 12 orders
(2, NOW()),(2, NOW()),(2, NOW()),(2, NOW()),(2, NOW()),
(2, NOW()),(2, NOW()),(2, NOW()),(2, NOW()),(2, NOW()),
(2, NOW()),(2, NOW()),
-- Royal Biryani: 10 orders
(3, NOW()),(3, NOW()),(3, NOW()),(3, NOW()),(3, NOW()),
(3, NOW()),(3, NOW()),(3, NOW()),(3, NOW()),(3, NOW()),
-- Biryani King: 9 orders
(4, NOW()),(4, NOW()),(4, NOW()),(4, NOW()),(4, NOW()),
(4, NOW()),(4, NOW()),(4, NOW()),(4, NOW()),
-- Nawabi Biryani: 8 orders
(5, NOW()),(5, NOW()),(5, NOW()),(5, NOW()),(5, NOW()),
(5, NOW()),(5, NOW()),(5, NOW()),
-- Spice Villa: 7 orders
(6, NOW()),(6, NOW()),(6, NOW()),(6, NOW()),(6, NOW()),
(6, NOW()),(6, NOW()),
-- Biryani Express: 6 orders
(7, NOW()),(7, NOW()),(7, NOW()),(7, NOW()),(7, NOW()),(7, NOW()),
-- Royal Feast: 5 orders
(8, NOW()),(8, NOW()),(8, NOW()),(8, NOW()),(8, NOW()),
-- Biryani Hub: 4 orders
(9, NOW()),(9, NOW()),(9, NOW()),(9, NOW()),
-- Tandoori Biryani: 3 orders
(10, NOW()),(10, NOW()),(10, NOW()),
-- Magic Biryani: 2 orders
(11, NOW()),(11, NOW()),
-- Biryani House: 1 order
(12, NOW());
