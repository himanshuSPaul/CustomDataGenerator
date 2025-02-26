from DataGenerator import *
from PostgresCon import get_connection, close_connection
import pandas as pd
import random

"""
CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_Sales.Customers (
CustomerID VARCHAR(255) PRIMARY KEY
,FirstName VARCHAR(50) NOT NULL
,LastName VARCHAR(50) NOT NULL
,Email VARCHAR(100) UNIQUE
,PhoneNumber VARCHAR(255)
,Address VARCHAR(255)
,City VARCHAR(255)
,State VARCHAR(255)
,ZipCode VARCHAR(255)
,Country VARCHAR(255)
);

"""


TABLE_NAME ="Customers"
no_of_customers = 100




if __name__ == '__main__':
    x =DataGenerator()
    conn = get_connection()
    cursor = conn.cursor()
    customers_rows = []

    for i in range(no_of_customers):
        cust_id = 'CUST_'+str(i).zfill(3)
        cust_f_name = x.generate_first_name()
        cust_l_name = x.generate_last_name()
        cust_email  = f"{cust_f_name}.{cust_l_name}@email.com"
        cust_phn_no = x.generate_phone_number()
        cust_address = x.generate_address()
        cust_city = 'Bangalore'
        cust_state = 'Karnataka'
        cust_zipcode = str(random.choice(range(560100,562000)))
        cust_country = 'INDIA'
        cust_row = (cust_id,cust_f_name,cust_l_name,cust_email,cust_phn_no,cust_address,cust_city,cust_state,cust_zipcode,cust_country)
        print(cust_row)
        customers_rows.append(cust_row)
    df = pd.DataFrame(customers_rows, columns=["CustomerID","FirstName","LastName","Email","PhoneNumber","Address","City","State","ZipCode","Country"])

    create_table_query = f"""
                            CREATE TABLE IF NOT EXISTS {TABLE_NAME} (
                            CustomerID VARCHAR(255) PRIMARY KEY
                            ,FirstName VARCHAR(50) NOT NULL
                            ,LastName VARCHAR(50) NOT NULL
                            ,Email VARCHAR(100) UNIQUE
                            ,PhoneNumber VARCHAR(255)
                            ,Address VARCHAR(255)
                            ,City VARCHAR(255)
                            ,State VARCHAR(255)
                            ,ZipCode VARCHAR(255)
                            ,Country VARCHAR(255)
                            );
                    """
    cursor.execute(create_table_query)
    conn.commit()

    insert_query = f"""INSERT INTO {TABLE_NAME} (CustomerID,FirstName,LastName,Email,PhoneNumber,Address,City,State,ZipCode,Country)
                        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"""
    data_to_insert = [tuple(row) for row in df.values]
    print("data_to_insert :",data_to_insert)
    cursor.executemany(insert_query, data_to_insert)
    conn.commit()
    print(f"Successfully inserted {len(data_to_insert)} records into {TABLE_NAME}")

