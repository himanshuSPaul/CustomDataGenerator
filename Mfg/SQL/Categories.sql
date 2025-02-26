CREATE OR REPLACE TABLE VISK_INDUS_PVT_LTD.RAW.Categories (
    CategoryID VARCHAR(255),  -- Snowflake uses IDENTITY for auto-increment
    CategoryName VARCHAR(255) NOT NULL
);


INSERT INTO VISK_INDUS_PVT_LTD.RAW.Categories (CategoryID, CategoryName) VALUES
('CAT001', 'Electronics'),
('CAT002', 'Apparel'),
('CAT003', 'Home & Furniture'),
('CAT004', 'Food & Beverage'),
('CAT005', 'Fitness & Sports'),
('CAT006', 'Books & Stationery'),
('CAT007', 'Toys & Games'),
('CAT008', 'Beauty & Personal Care'),
('CAT009', 'Health & Wellness'),
('CAT010', 'Outdoor & Travel');