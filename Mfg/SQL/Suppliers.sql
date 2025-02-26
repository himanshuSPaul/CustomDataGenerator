-- Suppliers
CREATE OR REPLACE TABLE VISK_INDUS_PVT_LTD.RAW.Suppliers (
    SupplierID VARCHAR(255),
    SupplierName VARCHAR(255) NOT NULL,
    ContactPerson VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(255),
    Address TEXT
);

-- Example INSERT statements for Raw_Suppliers (35 suppliers - you'll need to fill in the details)

INSERT INTO VISK_INDUS_PVT_LTD.RAW.Suppliers (SupplierID, SupplierName, ContactPerson, Phone, Email, Address) VALUES
('SUP001', 'Tech Innovations Inc.', 'John Smith', '555-123-4567', 'john.smith@techinnov.com', '123 Main St, Anytown'),
('SUP002', 'Global Manufacturing Co.', 'Jane Doe', '555-987-6543', 'jane.doe@globalmfg.com', '456 Oak Ave, Anytown'),
('SUP003', 'Quality Components Ltd.', 'David Lee', '555-555-5555', 'david.lee@qualitycomp.com', '789 Pine Ln, Anytown'),
('SUP004', 'Precision Engineering Corp.', 'Sarah Jones', '555-111-2222', 'sarah.jones@precisioneng.com', '101 Elm St, Anytown'),
('SUP005', 'Reliable Supply Solutions', 'Michael Brown', '555-333-4444', 'michael.brown@reliablesupply.com', '202 Maple Dr, Anytown'),
('SUP006', 'Innovative Materials Group', 'Emily Davis', '555-777-8888', 'emily.davis@innovativemat.com', '303 Cedar Ct, Anytown'),
('SUP007', 'Advanced Technology Partners', 'Christopher Wilson', '555-222-9999', 'christopher.wilson@advtech.com', '404 Birch Rd, Anytown'),
('SUP008', 'Streamline Logistics Inc.', 'Ashley Garcia', '555-666-0000', 'ashley.garcia@streamlinelog.com', '505 Willow Pl, Anytown'),
('SUP009', 'Prime Distribution Co.', 'Matthew Rodriguez', '555-444-1111', 'matthew.rodriguez@primedist.com', '606 Redwood Cir, Anytown'),
('SUP010', 'Summit Sourcing Ltd.', 'Kevin Martinez', '555-888-2222', 'kevin.martinez@summitsource.com', '707 Oakwood Way, Anytown'),
('SUP011', 'Acme Corporation', 'Maria Hernandez', '555-123-9876', 'maria.hernandez@acme.com', '123 Elm Street, Anytown'),
('SUP012', 'Beta Industries', 'Jose Perez', '555-555-1212', 'jose.perez@betaind.com', '456 Oak Avenue, Anytown'),
('SUP013', 'Gamma Solutions', 'Linda Williams', '555-987-4321', 'linda.williams@gammasol.com', '789 Pine Lane, Anytown'),
('SUP014', 'Delta Manufacturing', 'Robert Brown', '555-111-5555', 'robert.brown@deltamfg.com', '101 Maple Drive, Anytown'),
('SUP015', 'Epsilon Technologies', 'Patricia Davis', '555-333-9999', 'patricia.davis@epsilont.com', '202 Cedar Court, Anytown'),
('SUP016', 'Zeta Corporation', 'James Wilson', '555-777-1234', 'james.wilson@zetacorp.com', '303 Birch Road, Anytown'),
('SUP017', 'Eta Industries', 'Mary Garcia', '555-222-6789', 'mary.garcia@etaind.com', '404 Willow Place, Anytown'),
('SUP018', 'Theta Solutions', 'John Rodriguez', '555-666-3456', 'john.rodriguez@thetasol.com', '505 Redwood Circle, Anytown'),
('SUP019', 'Iota Manufacturing', 'Michael Martinez', '555-444-8901', 'michael.martinez@iotamfg.com', '606 Oakwood Way, Anytown'),
('SUP020', 'Kappa Technologies', 'Jennifer Anderson', '555-888-5678', 'jennifer.anderson@kappat.com', '707 Pine Street, Anytown'),
('SUP021', 'Lambda Corporation', 'David Thomas', '555-123-4567', 'david.thomas@lambdacorp.com', '123 Maple Dr, Anytown'),
('SUP022', 'Mu Industries', 'Sarah Jackson', '555-987-6543', 'sarah.jackson@muind.com', '456 Cedar Ct, Anytown'),
('SUP023', 'Nu Solutions', 'Christopher White', '555-555-5555', 'christopher.white@nusol.com', '789 Birch Rd, Anytown'),
('SUP024', 'Xi Manufacturing', 'Ashley Harris', '555-111-2222', 'ashley.harris@ximfg.com', '101 Willow Pl, Anytown'),
('SUP025', 'Omicron Technologies', 'Matthew Martin', '555-333-4444', 'matthew.martin@omicront.com', '202 Redwood Cir, Anytown'),
('SUP026', 'Pi Corporation', 'Kevin Thompson', '555-777-8888', 'kevin.thompson@picorp.com', '303 Oakwood Way, Anytown'),
('SUP027', 'Rho Industries', 'Jessica Perez', '555-222-9999', 'jessica.perez@rhoind.com', '404 Pine Street, Anytown'),
('SUP028', 'Sigma Solutions', 'William Wilson', '555-666-0000', 'william.wilson@sigmasol.com', '505 Maple Dr, Anytown'),
('SUP029', 'Tau Manufacturing', 'Elizabeth Garcia', '555-444-1111', 'elizabeth.garcia@taumfg.com', '606 Cedar Ct, Anytown'),
('SUP030', 'Upsilon Technologies', 'Andrew Rodriguez', '555-888-2222', 'andrew.rodriguez@upsilont.com', '707 Birch Rd, Anytown'),
('SUP031', 'Phi Corporation', 'Nancy Martinez', '555-123-7890', 'nancy.martinez@phicorp.com', '123 Willow Pl, Anytown'),
('SUP032', 'Chi Industries', 'Thomas Anderson', '555-987-3456', 'thomas.anderson@chiind.com', '456 Redwood Cir, Anytown'),
('SUP033', 'Psi Solutions', 'Margaret Jackson', '555-555-9012', 'margaret.jackson@psisol.com', '789 Oakwood Way, Anytown'),
('SUP034', 'Omega Manufacturing', 'Daniel White', '555-111-4567', 'daniel.white@omegamfg.com', '101 Pine Street, Anytown'),
('SUP035', 'Alpha Technologies', 'Ashley Harris', '555-333-0123', 'ashley.harris@alphat.com', '202 Maple Dr, Anytown');