-- Drop tables if they exist (optional, for clean seed)
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS items CASCADE;
DROP TABLE IF EXISTS facilities CASCADE;

-- Create facilities table
CREATE TABLE facilities (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Create items table
CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    "group" VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    default_unit VARCHAR(20) NOT NULL
);

-- Create users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(200) NOT NULL,
    role VARCHAR(50) NOT NULL
);

-- Seed data for facilities
INSERT INTO facilities (name) VALUES
('Heidelberg'),
('Sr-Leas'),
('Orchards');

-- Seed data for items
INSERT INTO items (name, "group", category, default_unit) VALUES
('Beef Mince', 'Frozen', 'Beef', 'kg'),
('Tomato Paste', 'Dry Shelf Products', 'Canned', 'g'),
('Onions', 'Fresh', 'Vegetables', 'kg'),
('Sunflower Oil', 'Dry Shelf Products', 'Oils', 'ml'),
('Surgical Gloves', 'Non-Food', 'Medical Supplies', 'box');

-- Seed data for users
-- Password hash is for 'admin123'
INSERT INTO users (email, password, role) VALUES
('admin@ops.com', '$2a$10$3PaIbzCrkPRTRI3JIQkl0Od6mnn4TPMRIMrlod3xRmGIDRZQEGGvq', 'admin'),
('stock@ops.com', '$2a$10$3PaIbzCrkPRTRI3JIQkl0Od6mnn4TPMRIMrlod3xRmGIDRZQEGGvq', 'stock_clerk');
