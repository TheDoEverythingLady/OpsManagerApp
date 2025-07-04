-- seed.sql
INSERT INTO facilities (name) VALUES ('Facility A'), ('Facility B'), ('Facility C');

INSERT INTO items (name, group, category, default_unit) VALUES
('Beef Mince', 'Frozen', 'Beef', 'kg'),
('Tomato Paste', 'Dry Shelf Products', 'Canned', 'g'),
('Onions', 'Fresh', 'Vegetables', 'kg'),
('Sunflower Oil', 'Dry Shelf Products', 'Oils', 'ml'),
('Surgical Gloves', 'Non-Food', 'Medical Supplies', 'box');

INSERT INTO users (email, password, role) VALUES
('admin@ops.com', '$2a$10$3PaIbzCrkPRTRI3JIQkl0Od6mnn4TPMRIMrlod3xRmGIDRZQEGGvq', 'admin'), -- Password: admin123
('stock@ops.com', '$2a$10$3PaIbzCrkPRTRI3JIQkl0Od6mnn4TPMRIMrlod3xRmGIDRZQEGGvq', 'stock_clerk'); -- Password: admin123
