import requests
import logging
import os
from dotenv import load_dotenv

load_dotenv()

project_root = os.getenv('PROJECT_ROOT')

logging.basicConfig(
  format='%(asctime)s %(levelname)-8s %(message)s',
  filename='getdata.log', 
  encoding='utf-8', 
  datefmt='%Y-%m-%d %H:%M:%S')

reports = {
   'depth_charts': 'depth_charts',
   'injuries': 'injuries',
   'depth_charts': 'depth_charts',
   'ngs_receiving': 'nextgen_stats',
   'ngs_rushing': 'nextgen_stats',
   'play_by_play': 'pbp',
   'ngs_rushing': 'nextgen_stats',
   'player_stats': 'player_stats',
   'roster': 'rosters',
   'snap_counts': 'snap_counts',
   'officials': 'officials',
   'pbp_participation': 'pbp_participation',
   'players': 'players',
   'roster_weekly': 'weekly_rosters',
}


def getReport(subdirectory, report_name, year = '2022'):

  file_url = f'https://github.com/nflverse/nflverse-data/releases/download/{subdirectory}/{report_name}_{year}.csv'
  try:
    r = requests.get(file_url)
  except requests.exceptions.ConnectionError as connErr:
    logging.error(f'Connection error: {connErr}')
  except requests.exceptions.HTTPError as httpErr:
    logging.error(f'Http error: {httpErr}')
  
  try:
    with open(f'{project_root}/data/{report_name}_{year}.csv', 'wb') as file:
      file.write(r.content)
  except IOError as fileErr:
    logging.error(f'Error writing file: {fileErr}')


for subdirectory, report_name in reports.items():
   getReport(subdirectory, report_name)

