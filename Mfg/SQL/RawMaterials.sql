CREATE OR REPLACE TABLE VISK_INDUS_PVT_LTD.RAW.RawMaterials (
    MaterialID VARCHAR
    ,MaterialName VARCHAR(255) NOT NULL
	,MaterialDescription VARCHAR(255)
    ,UnitOfMeasure VARCHAR(50)
	,MaterialType VARCHAR(50)
    ,UnitPrice DECIMAL(10, 2)
    ,SupplierID VARCHAR(50)
	,Quantity INT
    --FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)  -- Foreign key constraint
);


-- Example INSERT statements for VISK_INDUS_PVT_LTD.RAW.RawMaterials (keeping Raw_Products in mind)
INSERT INTO VISK_INDUS_PVT_LTD.RAW.RawMaterials 
(MaterialID, MaterialName, MaterialDescription, UnitOfMeasure, MaterialType, UnitPrice, SupplierID, Quantity)
VALUES ('M001', 'Steel', 'High-strength steel', 'kg', 'Metal', 5.00, 'SUP001', 1),  -- 1 kg of steel
('M002', 'Plastic', 'Durable plastic', 'kg', 'Plastic', 2.00, 'SUP002', 1),  -- 1 kg of plastic
('M003', 'Electronics', 'Electronic components', 'units', 'Electronics', 10.00, 'SUP003', 1),  -- 1 unit of electronics
('M004', 'Fabric', 'Cotton fabric', 'meters', 'Textile', 3.00, 'SUP001', 1),  -- 1 meter of fabric
('M005', 'Wood', 'Various types of wood', 'kg', 'Wood', 4.00, 'SUP002', 1),  -- 1 kg of wood
('M006', 'Coffee Beans', 'Arabica coffee beans', 'kg', 'Food', 15.00, 'SUP001', 1),  -- 1 kg of coffee beans
('M007', 'Tea Leaves', 'Organic tea leaves', 'kg', 'Food', 12.00, 'SUP002', 1),  -- 1 kg of tea leaves
('M008', 'Cocoa Beans', 'Raw cocoa beans', 'kg', 'Food', 10.00, 'SUP003', 1),  -- 1 kg of cocoa beans
('M009', 'Milk', 'Fresh cow milk', 'liter', 'Food', 2.00, 'SUP001', 1),  -- 1 liter of milk
('M010', 'Grapes', 'Variety of wine grapes', 'kg', 'Food', 8.00, 'SUP002', 1),  -- 1 kg of grapes
('M011', 'Barley', 'Malted barley', 'kg', 'Food', 5.00, 'SUP003', 1),  -- 1 kg of barley
('M012', 'Olives', 'Ripe olives', 'kg', 'Food', 7.00, 'SUP001', 1),  -- 1 kg of olives
('M013', 'Grapes', 'Variety of grapes', 'kg', 'Food', 8.00, 'SUP002', 1),  -- 1 kg of grapes
('M014', 'Various Spices', 'Assorted spices', 'kg', 'Food', 20.00, 'SUP003', 1),  -- 1 kg of spices
('M015', 'Various Items', 'Assorted gift basket items', 'units', 'Various', 30.00, 'SUP001', 1),  -- 1 unit of assorted items
('M016', 'Glass', 'Various types of glass', 'sq meter', 'Material', 6.00, 'SUP002', 1),  -- 1 sq meter of glass
('M017', 'Metal', 'Various types of metal', 'kg', 'Metal', 8.00, 'SUP003', 1),  -- 1 kg of metal
('M018', 'Ceramic', 'Ceramic materials', 'kg', 'Material', 7.00, 'SUP001', 1),  -- 1 kg of ceramic
('M019', 'Leather', 'Animal leather', 'sq foot', 'Material', 12.00, 'SUP002', 1),  -- 1 sq foot of leather
('M020', 'Rubber', 'Synthetic rubber', 'kg', 'Material', 3.00, 'SUP003', 1),  -- 1 kg of rubber
('M021', 'Paper', 'Various types of paper', 'kg', 'Material', 1.00, 'SUP001', 1),  -- 1 kg of paper
('M022', 'Ink', 'Printing ink', 'liter', 'Material', 5.00, 'SUP002', 1),  -- 1 liter of ink
('M023', 'Adhesive', 'Various types of adhesive', 'kg', 'Material', 4.00, 'SUP003', 1),  -- 1 kg of adhesive
('M024', 'Packaging Material', 'Various packaging materials', 'units', 'Material', 2.00, 'SUP001', 1),  -- 1 unit of packaging material
('M025', 'Batteries', 'Various types of batteries', 'units', 'Electronics', 8.00, 'SUP002', 1),  -- 1 unit of batteries
('M026', 'Cables', 'Various types of cables', 'meters', 'Electronics', 6.00, 'SUP003', 1),  -- 1 meter of cable
('M027', 'Microchips', 'Microchips and integrated circuits', 'units', 'Electronics', 15.00, 'SUP001', 1),  -- 1 microchip
('M028', 'Displays', 'Display screens', 'units', 'Electronics', 20.00, 'SUP002', 1),  -- 1 display
('M029', 'Sensors', 'Various types of sensors', 'units', 'Electronics', 10.00, 'SUP003', 1),  -- 1 sensor
('M030', 'Software', 'Software licenses', 'units', 'Software', 100.00, 'SUP001', 1),  -- 1 software license
('M031', 'Hardware', 'Computer hardware components', 'units', 'Electronics', 50.00, 'SUP002', 1),  -- 1 hardware component
('M032', 'Tools', 'Various tools', 'units', 'Tools', 25.00, 'SUP003', 1),  -- 1 tool
('M033', 'Equipment', 'Manufacturing equipment', 'units', 'Equipment', 1000.00, 'SUP001', 1),  -- 1 piece of equipment
('M034', 'Chemicals', 'Various chemicals', 'liter', 'Chemicals', 30.00, 'SUP002', 1),  -- 1 liter of chemical
('M035', 'Dyes', 'Various dyes', 'liter', 'Chemicals', 20.00, 'SUP003', 1);  -- 1 liter of dye