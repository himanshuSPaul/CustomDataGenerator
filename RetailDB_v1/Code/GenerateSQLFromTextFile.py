import csv
import argparse
import sys
import os



def sanitize_value(value):
    """Sanitizes input values by escaping single quotes and handling special characters."""
    return value.replace("'", " ").replace('"', '').strip()

def generate_sql_from_csv(txt_file,delimiter, table_name,single_sql_insert_stmt):
    try:
        with open(txt_file, "r", encoding="utf-8") as file:
            lines = file.readlines()

        if not lines:
            print("Error: Input file is empty.")
            sys.exit(1)

        # Extract column headers from the first line
        headers = [sanitize_value(col) for col in lines[0].strip().split(delimiter)]
        print("Headers: ",headers)

        # Generate CREATE TABLE statement
        create_table_stmt = f"CREATE TABLE {table_name} (\n"
        create_table_stmt += ",\n".join([f"    {col} VARCHAR2(255)" for col in headers])
        create_table_stmt += "\n);"
        # print("Table DDL :\n",create_table_stmt)

        values_list = []
        insert_statements = []
        for line in lines[1:]:  # Skip header line
            print("Row (Before Process) :",line)
            row = [sanitize_value(value) for value in line.strip().split(delimiter)]
            print("Row (After Process) :",row)
            values = "', '".join(row)
            
            if single_sql_insert_stmt:
                values_list.append(f"('{values}')")  # Collect for bulk insert
            else:
                insert_statements.append(f"INSERT INTO {table_name} ({', '.join(headers)}) VALUES ('{values}');")
        
        # Generate the appropriate INSERT statements
        if single_sql_insert_stmt:
            insert_stmt = f"INSERT INTO {table_name} ({', '.join(headers)}) VALUES\n" + ",\n".join(values_list) + ";"
        else:
            insert_stmt = "\n".join(insert_statements)

        return create_table_stmt, insert_stmt

    except FileNotFoundError:
        print(f"Error: File '{txt_file}' not found.")
        sys.exit(1)
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)


def main():
    # Set up argparse
    parser = argparse.ArgumentParser(description="Convert CSV to a single bulk INSERT SQL statement")
    parser.add_argument("-i", "--inputFile", help="Input Data File")
    parser.add_argument("-d", "--Filedelimiter", help="Input Data File delimited by")
    parser.add_argument("-t", "--tableName", help="Input Data File")
    parser.add_argument("-o", "--output", help="Output SQL file (default: output.sql)", default="output.sql")
    parser.add_argument("-s", "--singleSqlStmt", help="Input Data File")

    args = parser.parse_args()

    # Generate SQL statements
    create_table_sql, insert_sql_statement = generate_sql_from_csv(args.inputFile,args.Filedelimiter, args.tableName,args.singleSqlStmt)

    print("create_table_sql     :\n",create_table_sql)
    # print("insert_sql_statement :\n",insert_sql_statement)



    os.makedirs(output_dir, exist_ok=True)

    # Save file inside Output directory
    output_path = os.path.join(output_dir, args.output)

    # Save to the specified output file
    with open(output_path, "w", encoding="utf-8") as f:
        f.write(create_table_sql + "\n\n")
        f.write(insert_sql_statement)

    print(f"SQL statements generated successfully! Check '{output_path}' file.")

if __name__ == "__main__":
    output_dir = "Output"
    main()