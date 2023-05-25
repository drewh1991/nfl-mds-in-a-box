{{
    config(
        materialized='table'
    )
}}

WITH source AS (
    SELECT * FROM {{ source('nfldata', 'source_officials') }}
)

SELECT
    game_id,
    game_key,
    official_name,
    position as official_position,
    jersey_number,
    official_id,
    season,
    season_type,
    week
FROM source
