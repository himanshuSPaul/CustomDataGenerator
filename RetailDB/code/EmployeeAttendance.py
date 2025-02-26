"""
CREATE OR REPLACE TABLE BRONZE_EmployeeAttendance (
    AttendanceID VARCHAR(255) PRIMARY KEY,  -- Unique identifier for each attendance entry
    EmployeeID VARCHAR(255),                -- Employee identifier (linked to Employees table)
    StoreID VARCHAR(255),                   -- Store identifier (linked to Stores table)
    AttendanceDate DATE,                     -- Date of attendance
    CheckInTime TIMESTAMP,                   -- Time the employee checked in
    CheckOutTime TIMESTAMP,                  -- Time the employee checked out
    WorkHours DECIMAL(5,2),                  -- Total hours worked (computed as CheckOutTime - CheckInTime)
    Status ENUM('Present', 'Absent', 'Late', 'Half-Day', 'On Leave'),  -- Employee attendance status
    LateMinutes INT DEFAULT 0,               -- Number of minutes late (if applicable)
    LeaveType ENUM('Sick Leave', 'Vacation', 'Unpaid Leave', 'Maternity Leave', 'None') DEFAULT 'None', -- If leave taken
    OvertimeHours DECIMAL(5,2) DEFAULT 0,     -- Overtime hours worked
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Last update timestamp
);
"""

from DataGenerator import *
from PostgresCon import get_connection, close_connection
import random
from datetime import datetime, timedelta
import configparser,argparse
import pandas as pd
# import argparse


INPUT_DATE_STR ='2024-06-02'
TABLE_NAME = "EMPLOYEE_TIMESHEET"

def random_timestamp(start_time, end_time):
    """Generate a random timestamp between two datetime objects."""
    time_diff = end_time - start_time
    random_seconds = random.randint(0, int(time_diff.total_seconds()))  # Random offset in seconds
    return start_time + timedelta(seconds=random_seconds)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Employee Attendance Tracker")
    parser.add_argument("-d", "--swipe_date", type=str, required=False, help="Share The Date For Which You want to generate Employees Swipe In data")
    args = parser.parse_args()
    
    config = configparser.ConfigParser()    
    config.read("config.ini")
    emp_in_start_hr = int(config["configs"]["emp_in_start_hr"])
    emp_in_end_hr = int(config["configs"]["emp_in_end_hr"])
    emp_out_start_hr = int(config["configs"]["emp_out_start_hr"])
    emp_out_end_hr = int(config["configs"]["emp_out_end_hr"])

    x =DataGenerator()
    conn = get_connection()
    # if not conn:
    #     return -1 # Exit if connection fails

    if args.swipe_date: 
        date_str = str(args.swipe_date).replace("_","-")
    else :
        date_str =INPUT_DATE_STR

    # Entry Time is between 8:00AM 12:00PM
    entry_start = datetime.strptime(date_str, "%Y-%m-%d").replace(hour=emp_in_start_hr, minute=0, second=0)
    entry_end = datetime.strptime(date_str, "%Y-%m-%d").replace(hour=emp_in_end_hr, minute=0, second=0)

    # Exit Time is between 18:00AM 21:00PM
    exit_start = datetime.strptime(date_str, "%Y-%m-%d").replace(hour=emp_out_start_hr, minute=0, second=0)
    exit_end = datetime.strptime(date_str, "%Y-%m-%d").replace(hour=emp_out_end_hr, minute=0, second=0)
    # Generate random timestamps
    entry_time = random_timestamp(entry_start, entry_end)
    exit_time = random_timestamp(exit_start, exit_end)
    attendance_date = datetime.strptime(date_str, "%Y-%m-%d").strftime("%Y%m%d")
    print("attendance_date :",attendance_date)
    
    employee_attendance=  []
    try:
        cursor = conn.cursor()
        query = "SELECT StoreID,EmployeeID FROM Employees"  # Modify with your table
        print("Query :",query)
        cursor.execute(query)
        rows = cursor.fetchall()

        for row in rows:
            attendance_row =(datetime.strptime(date_str, "%Y-%m-%d").strftime("%Y%m%d")+'_'+row[1].replace('EMP',""),
                                        # attendance_date+'_'+row[1].replace('EMP',""),
                                        row[1],
                                        row[0],
                                        datetime.strptime(date_str, "%Y-%m-%d"),
                                        random_timestamp(entry_start, entry_end),
                                        random_timestamp(exit_start, exit_end),
            )
            print("Data To Be Inserted :",attendance_row)


            employee_attendance.append(attendance_row)
            
        # Convert to a DataFrame for better visualization
        df = pd.DataFrame(employee_attendance, columns=["AttendanceID","EmployeeID","StoreID","AttendanceDate","CheckInTime","CheckOutTime"])

        table_ddl = f"""CREATE TABLE IF NOT EXISTS {TABLE_NAME} (
                        AttendanceID TEXT PRIMARY KEY,  
                        EmployeeID TEXT,              
                        StoreID TEXT, 
                        AttendanceDate TEXT,
                        CheckInTime TIMESTAMP,
                        CheckOutTime TIMESTAMP
                        );
                    """
        print("Query :",table_ddl)
        cursor.execute(table_ddl)
        conn.commit()

        # cursor.execute(f'truncate table {TABLE_NAME}')
        conn.commit()

        insert_query = f"""INSERT INTO {TABLE_NAME} (AttendanceID,EmployeeID,StoreID,AttendanceDate,CheckInTime,CheckOutTime)
                            VALUES (%s, %s, %s,%s,%s,%s)"""
        data_to_insert = [tuple(row) for row in df.values]
        cursor.executemany(insert_query, data_to_insert)
        conn.commit()
        print(f"Successfully inserted {len(data_to_insert)} records into {TABLE_NAME}")

    except Exception as e:
        print("Error fetching data:", e)
    

