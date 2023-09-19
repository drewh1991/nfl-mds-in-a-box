This is a minimially viable "modern data stack in a box" inspired by the DuckDB blog post of the same name: https://duckdb.org/2022/10/12/modern-data-stack-in-a-box.html

It uses a basic python script leveraging DuckDB to download the parquet files, dbt to transform the raw data and Apache Superset to visualize it.

This project sources data from the nflverse github repo: https://github.com/nflverse/nflverse-data

The following should get you up and running:

1. Clone the repository
2. Create a python virtual environment in the cloned directory
```
python3 -m venv .venv
```
3. Activate the virtual environment
```
source ./.venv/bin/activate
```

4. Install requirements
```
pip install -r requirements.txt
```

6. Download and stage the data from NFLverse
```
python3 get_data.py
```

7. Run the dbt models
```
cd ./dbt/nfl_data

dbt run
```

4. Run Apache Superset Setup

```
export FLASK_APP=superset
export SECRET_KEY=`openssl rand -base64 42`
```

```
superset fab create-admin
```

```
superset init
```
```
superset run -h 0.0.0.0 -p 5000
```


