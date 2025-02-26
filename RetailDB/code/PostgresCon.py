import psycopg2
from psycopg2 import sql


# "dbname=postgres user=postgres password=postgres host=localhost")

# Database configuration (Modify as per your database)
DB_CONFIG = {
    "dbname": "postgres",
    "user": "postgres",
    "password": "postgres",
    "host": "localhost",  # Change if remote
    "port": "5432"  # Default PostgreSQL port
}

def get_connection():
    """Establishes and returns a database connection."""
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        return conn
    except Exception as e:
        print("Error connecting to the database:", e)
        return None

def close_connection(conn, cursor=None):
    """Closes the database connection and cursor safely."""
    if cursor:
        cursor.close()
    if conn:
        conn.close()
