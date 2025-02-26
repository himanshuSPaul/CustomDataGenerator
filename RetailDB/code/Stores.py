from DataGenerator import *
from PostgresCon import get_connection, close_connection
import pandas as pd

"""
CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_HR.Stores (
StoreID VARCHAR(255) PRIMARY KEY 
,StoreName VARCHAR(100) NOT NULL
,Location VARCHAR(255) NOT NULL
,ContactNumber VARCHAR(20)
,ManagerID VARCHAR(255)
--,FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

"""

TABLE_NAME = "Stores"

if __name__ == '__main__':
    x =DataGenerator()
    conn = get_connection()
    cursor = conn.cursor()
    stores_rows = []

    try:
        query = "SELECT StoreID,EmployeeID,count(1) FROM Employees where JobTitle='Store Manager' group by StoreID,EmployeeID "  # Modify with your table
        cursor.execute(query)
        rows = cursor.fetchall()

        for row in rows:
            stores_rows.append((row[0],'YourChoiceMart',x.generate_address(),x.generate_store_phone_number(),row[1]))
        df = pd.DataFrame(stores_rows, columns=["StoreID","StoreName","Location","ContactNumber","ManagerID"])

        create_table_query = f"""
                            CREATE TABLE IF NOT EXISTS {TABLE_NAME} (
                            StoreID VARCHAR(255) PRIMARY KEY 
                            ,StoreName VARCHAR(100) NOT NULL
                            ,Location VARCHAR(255) NOT NULL
                            ,ContactNumber VARCHAR(20)
                            ,ManagerID VARCHAR(255)
                            );
                    """
        cursor.execute(create_table_query)
        conn.commit()

        insert_query = f"""INSERT INTO {TABLE_NAME} (StoreID,StoreName,Location,ContactNumber,ManagerID)
                            VALUES (%s, %s, %s,%s,%s)"""
        data_to_insert = [tuple(row) for row in df.values]
        print("data_to_insert :",data_to_insert)
        # cursor.executemany(insert_query, data_to_insert)
        # conn.commit()
        # print(f"Successfully inserted {len(data_to_insert)} records into {TABLE_NAME}")


    except Exception as e:
        print("Error fetching data:", e)
    
    finally:
        close_connection(conn, cursor)  # Ensure connection is closed

