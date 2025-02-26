"""
CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_Procurement.Suppliers (
SupplierID VARCHAR(255) PRIMARY KEY 
,SupplierName VARCHAR(100) NOT NULL
,SupplierContactPerson VARCHAR(100)
,SupplierContactNumber VARCHAR(20)
,SupplierContactEmail VARCHAR(100) 
,Address  VARCHAR(255) 
,City VARCHAR(255) 
,State VARCHAR(255) 
,ZipCode VARCHAR(255) 
,Country VARCHAR(255) 
);

"""


from DataGenerator import *
from PostgresCon import get_connection, close_connection
import pandas as pd


TABLE_NAME = "Suppliers"

if __name__ == '__main__':
    x =DataGenerator()
    conn = get_connection()
    cursor = conn.cursor()
    supplier_rows = []
    supplier_names = x.get_suppliers_name()

    for i in range(len(supplier_names)):
        sup_id = 'SUP_'+str(i).zfill(2)
        sup_name = supplier_names[i]

        sup_contact_person =  x.generate_name()
        sup_contact_number = x.generate_store_phone_number()
        sup_email = sup_contact_person.strip().replace(" ",".")+"@"+ supplier_names[i].replace(" ","").lower()+".com"
        sup_email = random.choice(['retail.sales','sales','customer.sales','keyaccounts']) +"@"+ supplier_names[i].replace(" ","").lower()+".com"

        sup_address = x.generate_address()
        sup_city ="Banglore"
        sup_state= "KARNATAKA"
        sup_zipcode = str(random.choice(range(560100,562000)))
        sup_country = "INDIA"
        sup_row = (sup_id,sup_name,sup_contact_person,sup_contact_number,sup_email,sup_address,sup_city,sup_state,sup_zipcode,sup_country)
        print("Supplier Data :",sup_row)
        supplier_rows.append(sup_row)
    
    df = pd.DataFrame(supplier_rows, columns=["SupplierID","SupplierName","SupplierContactPerson","SupplierContactNumber","SupplierContactEmail","Address","City","State","ZipCode","Country"])
    
    create_table_query = f"""
                            CREATE TABLE IF NOT EXISTS {TABLE_NAME} (
                            SupplierID VARCHAR(255) PRIMARY KEY 
                            ,SupplierName VARCHAR(100) NOT NULL
                            ,SupplierContactPerson VARCHAR(100)
                            ,SupplierContactNumber VARCHAR(20)
                            ,SupplierContactEmail VARCHAR(100) 
                            ,Address  VARCHAR(255) 
                            ,City VARCHAR(255) 
                            ,State VARCHAR(255) 
                            ,ZipCode VARCHAR(255) 
                            ,Country VARCHAR(255)
                            );
                    """
    cursor.execute(create_table_query)
    conn.commit()

    insert_query = f"""INSERT INTO {TABLE_NAME} (SupplierID,SupplierName,SupplierContactPerson,SupplierContactNumber,SupplierContactEmail,Address,City,State,ZipCode,Country)
                        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"""
    data_to_insert = [tuple(row) for row in df.values]
    print("data_to_insert :",data_to_insert)
    cursor.executemany(insert_query, data_to_insert)
    conn.commit()
    print(f"Successfully inserted {len(data_to_insert)} records into {TABLE_NAME}")






    # print("Supplier Name:",supplier_names)

    # print(supplier_names[0])
    # print(supplier_names[1])

    # try:

    # catch:

    # finally:

