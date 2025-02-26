-- Work Centers
CREATE OR REPLACE TABLE VISK_INDUS_PVT_LTD.RAW.WorkCenters (
    WorkCenterID VARCHAR(255)
    ,WorkCenterName VARCHAR(255) NOT NULL
    ,Description TEXT
);

INSERT INTO VISK_INDUS_PVT_LTD.RAW.WorkCenters 
(WorkCenterID, WorkCenterName, Description)
VALUES ('WC001', 'Assembly Line 1', 'Assembly of product components'), ('WC002', 'Painting Station', 'Painting and finishing products'), ('WC003', 'Packaging', 'Packaging products for shipment'), ('WC004', 'Quality Control', 'Quality inspection of finished products'), ('WC005', 'Testing Facility', 'Testing of product functionality'), ('WC006', 'Raw Material Storage', 'Storage of raw materials'), ('WC007', 'Finished Goods Warehouse', 'Storage of finished products'), ('WC008', 'Shipping Department', 'Shipping of products to customers'), ('WC009', 'Maintenance', 'Maintenance and repair of equipment'), ('WC010', 'Administration', 'Administrative tasks');