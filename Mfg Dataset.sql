CREATE OR REPLACE TABLE VISK_INDUS_PVT_LTD.RAW.Products (
    ProductID VARCHAR(255)
    ,ProductName VARCHAR(255) NOT NULL
    ,Description TEXT
    ,UnitPrice DECIMAL(10, 2)
    ,CategoryID VARCHAR(255)
    ,SupplierID VARCHAR(255)
    --FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    --FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Example Data for Raw_Products (Corrected ProductIDs, realistic ProductNames, 50 rows)

INSERT INTO VISK_INDUS_PVT_LTD.RAW.Products (ProductID, ProductName, Description, UnitPrice, CategoryID, SupplierID) VALUES
('P001', 'Apex Smartphone', 'High-end smartphone with advanced camera', 799.00, 'CAT001', 'SUP001'),
('P002', 'Nova Laptop', 'Lightweight and powerful laptop for professionals', 1299.00, 'CAT001', 'SUP002'),
('P003', 'Zenith Tablet', 'Versatile tablet for entertainment and productivity', 399.00, 'CAT001', 'SUP001'),
('P004', 'Quantum Smartwatch', 'Feature-rich smartwatch with fitness tracking', 299.00, 'CAT001', 'SUP003'),
('P005', 'Echo Bluetooth Speaker', 'Portable Bluetooth speaker with high-quality sound', 149.00, 'CAT001', 'SUP001'),
('P006', 'Vision 4K TV', 'Immersive 4K television with HDR support', 999.00, 'CAT001', 'SUP002'),
('P007', 'Aura Headphones', 'Noise-canceling headphones for immersive audio', 199.00, 'CAT001', 'SUP003'),
('P008', 'Stellar Gaming PC', 'High-performance gaming PC with powerful graphics', 1999.00, 'CAT001', 'SUP001'),
('P009', 'Pulse Fitness Tracker', 'Essential fitness tracker for monitoring activity', 99.00, 'CAT001', 'SUP002'),
('P010', 'Horizon Projector', 'Portable projector for home theater and presentations', 499.00, 'CAT001', 'SUP003'),
('P011', 'Classic T-Shirt', 'Comfortable and stylish cotton t-shirt', 29.99, 'CAT002', 'SUP001'),
('P012', 'Denim Jeans', 'Durable and fashionable denim jeans', 79.99, 'CAT002', 'SUP002'),
('P013', 'Leather Jacket', 'Stylish leather jacket for a classic look', 199.99, 'CAT002', 'SUP003'),
('P014', 'Hoodie', 'Warm and comfortable hoodie for casual wear', 49.99, 'CAT002', 'SUP001'),
('P015', 'Sweater', 'Cozy sweater for colder weather', 59.99, 'CAT002', 'SUP002'),
('P016', 'Dress Pants', 'Formal dress pants for professional occasions', 89.99, 'CAT002', 'SUP003'),
('P017', 'Skirt', 'Elegant skirt for a feminine look', 69.99, 'CAT002', 'SUP001'),
('P018', 'Blouse', 'Stylish blouse for work or evenings', 59.99, 'CAT002', 'SUP002'),
('P019', 'Shoes', 'Comfortable and stylish shoes for everyday wear', 99.99, 'CAT002', 'SUP003'),
('P020', 'Boots', 'Durable and fashionable boots for all weather', 129.99, 'CAT002', 'SUP001'),
('P021', 'Cozy Blanket', 'Soft and warm blanket for relaxing', 39.99, 'CAT003', 'SUP001'),
('P022', 'Pillow Set', 'Comfortable pillow set for a good night''s sleep', 59.99, 'CAT003', 'SUP002'),
('P023', 'Coffee Table', 'Stylish coffee table for your living room', 149.99, 'CAT003', 'SUP003'),
('P024', 'Dining Chair', 'Comfortable dining chair for your dining room', 79.99, 'CAT003', 'SUP001'),
('P025', 'Sofa', 'Comfortable sofa for your living room', 799.99, 'CAT003', 'SUP002'),
('P026', 'Bed Frame', 'Sturdy bed frame for your bedroom', 299.99, 'CAT003', 'SUP003'),
('P027', 'Mattress', 'Comfortable mattress for a restful sleep', 599.99, 'CAT003', 'SUP001'),
('P028', 'Nightstand', 'Convenient nightstand for your bedroom', 99.99, 'CAT003', 'SUP002'),
('P029', 'Lamp', 'Stylish lamp for your living room or bedroom', 49.99, 'CAT003', 'SUP003'),
('P030', 'Rug', 'Decorative rug for your living room or bedroom', 199.99, 'CAT003', 'SUP001'),
('P031', 'Gourmet Coffee', 'Premium coffee beans from around the world', 19.99, 'CAT004', 'SUP001'),
('P032', 'Organic Tea', 'Selection of organic teas for relaxation', 14.99, 'CAT004', 'SUP002'),
('P033', 'Artisan Chocolate', 'Delicious artisan chocolate bars', 9.99, 'CAT004', 'SUP003'),
('P034', 'Gourmet Cheese', 'Selection of gourmet cheeses', 29.99, 'CAT004', 'SUP001'),
('P035', 'Fine Wine', 'Collection of fine wines from various regions', 49.99, 'CAT004', 'SUP002'),
('P036', 'Craft Beer', 'Selection of craft beers from local breweries', 12.99, 'CAT004', 'SUP003'),
('P037', 'Specialty Olive Oil', 'High-quality olive oil for cooking', 24.99, 'CAT004', 'SUP001'),
('P038', 'Balsamic Vinegar', 'Aged balsamic vinegar for salads and dressings', 19.99, 'CAT004', 'SUP002'),
('P039', 'Gourmet Spices', 'Selection of gourmet spices for cooking', 14.99, 'CAT004', 'SUP003'),
('P040', 'Gift Basket', 'Curated gift basket with gourmet treats', 79.99, 'CAT004', 'SUP001'),
('P041', 'Fitness Equipment', 'Home fitness equipment for workouts', 299.99, 'CAT005', 'SUP001'),
('P042', 'Yoga Mat', 'High-quality yoga mat for practice', 29.99, 'CAT005', 'SUP002'),
('P043', 'Dumbbell Set', 'Set of dumbbells for strength training', 79.99, 'CAT005', 'SUP003'),
('P044', 'Resistance Bands', 'Set of resistance bands for versatile workouts', 39.99, 'CAT005', 'SUP001'),
('P045', 'Exercise Bike', 'Indoor exercise bike for cardio workouts', 499.99, 'CAT005', 'SUP002'),
('P046', 'Treadmill', 'Electric treadmill for running and walking', 799.99, 'CAT005', 'SUP003'),
('P047', 'Weight Bench', 'Adjustable weight bench for strength training', 199.99, 'CAT005', 'SUP001'),
('P048', 'Jump Rope', 'Classic jump rope for cardio workouts', 19.99, 'CAT005', 'SUP002'),
('P049', 'Fitness Apparel', 'Performance fitness apparel for workouts', 49.99, 'CAT005', 'SUP003'),
('P050', 'Sports Shoes', 'High-performance sports shoes for various activities', 99.99, 'CAT005', 'SUP001');


