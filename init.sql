-- Create products table
CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 0,
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(100) NOT NULL DEFAULT 'General',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert seed data
INSERT INTO products (name, quantity, price, category) VALUES
    ('Laptop Dell XPS 13', 15, 1299.99, 'Electronics'),
    ('iPhone 15 Pro', 8, 999.99, 'Electronics'),
    ('Sony Headphones WH-1000XM5', 25, 349.99, 'Electronics'),
    ('Samsung 4K TV 55"', 5, 799.99, 'Electronics'),
    ('Mechanical Keyboard', 30, 129.99, 'Electronics'),
    ('Wireless Mouse', 50, 49.99, 'Electronics'),
    ('Men T-Shirt Blue', 7, 19.99, 'Clothing'),
    ('Women Jeans', 12, 59.99, 'Clothing'),
    ('Winter Jacket', 6, 89.99, 'Clothing'),
    ('Running Shoes', 20, 79.99, 'Clothing'),
    ('Organic Coffee Beans', 40, 14.99, 'Food'),
    ('Green Tea Box', 35, 9.99, 'Food'),
    ('Chocolate Box', 8, 12.99, 'Food'),
    ('Pasta Variety Pack', 28, 8.99, 'Food'),
    ('The Great Gatsby', 15, 12.99, 'Books'),
    ('Clean Code', 22, 39.99, 'Books'),
    ('Thinking Fast and Slow', 18, 17.99, 'Books'),
    ('LEGO Star Wars Set', 9, 79.99, 'Toys'),
    ('Board Game - Catan', 14, 44.99, 'Toys'),
    ('Action Figure Collection', 25, 24.99, 'Toys');

-- Create index for faster queries
CREATE INDEX idx_products_category ON products(category);
CREATE INDEX idx_products_quantity ON products(quantity);