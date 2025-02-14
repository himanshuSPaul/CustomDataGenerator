# CSV To SQL Generator

Generate sample data for practicing database operations

# Project Directory Structure

![screenshot](./RetailDB_v1/Assets/DirectoryStructure.PNG)

# Execution

```bash
cd .\RetailDB_v1\
python .\Code\GenerateSQLFromTextFile.py -i .\Input\Products.csv -d ',' -t Products -o Products.sql -s Yes

```

Where
`-i `  : Input Csv File Path
`-d `  : File Delimeter
`-t `  : Target table Name
`-o `  : Output SQL File Path
`-s `  : Single Insert Statement. Supported Value True or False

![alt text](.\RetailDB_v1\Assets\ExeccuteTheCode.PNG)

.

# Data To SQL Conversion Preview

![screenshot](./RetailDB_v1/Assets/Conversion.PNG)
