from dotenv import load_dotenv
import os
import duckdb

load_dotenv()

# replace with the filepath to your db (dbname.db)
db_directory = os.getenv('DB_DIR')

db = duckdb.connect(f'{db_directory}/nfldata.db')

# Only need to run this once
query = db.sql(
    """
    SELECT
    *
    FROM clean_play_by_play

    """
    )

print(query)

