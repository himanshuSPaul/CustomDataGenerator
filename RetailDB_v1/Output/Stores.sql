CREATE TABLE Stores (
    Store_ID VARCHAR2(255),
    Store_Address VARCHAR2(255),
    Employee_Strength VARCHAR2(255),
    Store_Contact VARCHAR2(255),
    Geo_Location VARCHAR2(255),
    Store_Manager_ID VARCHAR2(255)
);

INSERT INTO Stores (Store_ID, Store_Address, Employee_Strength, Store_Contact, Geo_Location, Store_Manager_ID) VALUES
('ST_123', 'MG Road, Bangalore, Karnataka - 560001', '12', '080-23456789', '12.9716,77.5946', 'MGR_9001'),
('ST_456', 'Connaught Place, New Delhi - 110001', '8', '011-22334455', '28.6342,77.2205', 'MGR_9023'),
('ST_789', 'Park Street, Kolkata, West Bengal - 700016', '10', '033-44556677', '22.5523,88.3539', 'MGR_9105'),
('ST_234', 'Anna Salai, Chennai, Tamil Nadu - 600002', '15', '044-55667788', '13.0604,80.2496', 'MGR_9150'),
('ST_567', 'FC Road, Pune, Maharashtra - 411004', '6', '020-66778899', '18.5204,73.8567', 'MGR_9202'),
('ST_890', 'Banjara Hills, Hyderabad, Telangana - 500034', '9', '040-77889900', '17.3850,78.4867', 'MGR_9301'),
('ST_345', 'MG Road, Ernakulam, Kerala - 682035', '11', '0484-99001122', '9.9816,76.2999', 'MGR_9408'),
('ST_678', 'Lalbagh, Lucknow, Uttar Pradesh - 226001', '7', '0522-88990011', '26.8467,80.9462', 'MGR_9503'),
('ST_901', 'Gandhi Road, Ahmedabad, Gujarat - 380009', '5', '079-66778899', '23.0225,72.5714', 'MGR_9605'),
('ST_112', 'Hazratganj, Lucknow, Uttar Pradesh - 226001', '14', '0522-55667788', '26.8500,80.9497', 'MGR_9702');