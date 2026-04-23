-- SQL Setup for Neon Database

-- Create Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

-- Create Items table
CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Insert sample data (Password is 'password123')
INSERT INTO users (username, password) VALUES ('admin', '$2a$10$vI8tmv9ay6yVq.Zf7y6GbeKxZ8u/Uo7X4fQk3H6r8hW/pS0hY5Y8.');

INSERT INTO items (name, description) VALUES 
('Neon Starter', 'A lightweight item for the demo.'),
('Express Widget', 'Highly functional and scalable.'),
('Postgres Connector', 'Reliable database integration.');
