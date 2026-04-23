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
INSERT INTO users (username, password) VALUES ('admin', '$2a$10$Yuj6lmXiTw081OFc.jjVjepr8b16J/iOdHsVKme5pjqVjQeJs/2Zi');

INSERT INTO items (name, description) VALUES 
('Neon Starter', 'A lightweight item for the demo.'),
('Express Widget', 'Highly functional and scalable.'),
('Postgres Connector', 'Reliable database integration.');
