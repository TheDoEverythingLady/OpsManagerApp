-- Create Users Table
CREATE TABLE users (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  email TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  role TEXT DEFAULT 'stock_clerk',
  created_at TIMESTAMP DEFAULT now()
);

-- Create Items Table
CREATE TABLE items (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  category TEXT,
  "group" TEXT,
  unit TEXT,
  created_at TIMESTAMP DEFAULT now()
);

-- Create Recipes Table
CREATE TABLE recipes (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  total_cost NUMERIC,
  servings INTEGER,
  created_at TIMESTAMP DEFAULT now()
);

-- Create Recipe_Ingredients Join Table
CREATE TABLE recipe_ingredients (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  recipe_id UUID REFERENCES recipes(id),
  item_id UUID REFERENCES items(id),
  quantity NUMERIC,
  cost_per_unit NUMERIC,
  created_at TIMESTAMP DEFAULT now()
);

-- Seed Default Users
INSERT INTO users (email, password, role) VALUES
('admin@ops.com', '$2b$10$UJz8P7wh97aJZOCQklXJxO74lRM69gqs88gxU4ZCJfsdkEkKOtLfW', 'admin'),
('stock@ops.com', '$2b$10$UJz8P7wh97aJZOCQklXJxO74lRM69gqs88gxU4ZCJfsdkEkKOtLfW', 'stock_clerk');
