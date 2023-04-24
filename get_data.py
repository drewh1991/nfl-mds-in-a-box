
from dotenv import load_dotenv
import duckdb
import logging
import os

load_dotenv()

# replace with the filepath to your db (dbname.db)
db_directory = os.getenv('DB_DIR')

logging.basicConfig(
  format='%(asctime)s %(levelname)-8s %(message)s',
  filename='getdata.log', 
  encoding='utf-8', 
  datefmt='%Y-%m-%d %H:%M:%S')

year = '2022'

reports = {
   'depth_charts': f'https://github.com/nflverse/nflverse-data/releases/download/depth_charts/depth_charts_{year}.parquet',
   'injuries': f'https://github.com/nflverse/nflverse-data/releases/download/injuries/injuries_{year}.parquet',
   'ngs_receiving': f'https://github.com/nflverse/nflverse-data/releases/download/nextgen_stats/ngs_receiving.parquet',
   'ngs_rushing': f'https://github.com/nflverse/nflverse-data/releases/download/nextgen_stats/ngs_rushing.parquet',
   'ngs_passing': f'https://github.com/nflverse/nflverse-data/releases/download/nextgen_stats/ngs_receiving.parquet',
   'play_by_play': f'https://github.com/nflverse/nflverse-data/releases/download/pbp/play_by_play_{year}.parquet',
   'player_stats': f'https://github.com/nflverse/nflverse-data/releases/download/player_stats/player_stats_{year}.parquet',
   'roster': f'https://github.com/nflverse/nflverse-data/releases/download/rosters/roster_{year}.parquet',
   'snap_counts': f'https://github.com/nflverse/nflverse-data/releases/download/snap_counts/snap_counts_{year}.parquet',
   'officials': f'https://github.com/nflverse/nflverse-data/releases/download/officials/officials.parquet',
   'pbp_participation': f'https://github.com/nflverse/nflverse-data/releases/download/pbp_participation/pbp_participation_{year}.parquet',
   'players': f'https://github.com/nflverse/nflverse-data/releases/download/players/players.parquet',
   'roster_weekly': f'https://github.com/nflverse/nflverse-data/releases/download/weekly_rosters/roster_weekly_{year}.parquet'
}

db = duckdb.connect(f'{db_directory}/nfldata.db')

# Only need to run this once
db.sql("INSTALL httpfs")

# Check to see if the data is available, if not, log it
def get_report(report_name, file_url):
    try:
        db.sql(
            f"""
            CREATE OR REPLACE TABLE source_{report_name} AS
            SELECT *
            FROM read_parquet('{file_url}') LIMIT 1
            """
        )
    except duckdb.IOException as fileErr:
        logging.error(f'Error querying {report_name}: {fileErr}')


for file_url, report_name in reports.items():
    # print(file_url, report_name)
    get_report(file_url, report_name)

