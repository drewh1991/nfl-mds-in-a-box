{{
    config(
        materialized='table'
    )
}}

WITH source AS (
    SELECT * FROM {{ source('nfldata', 'source_ngs_receiving') }}
)

SELECT
    season,
    season_type,
    week,
    player_display_name as display_name,
    player_position as position,
    team_abbr,
    avg_cushion,
    avg_separation,
    avg_intended_air_yards,
    percent_share_of_intended_air_yards,
    receptions,
    targets,
    catch_percentage,
    yards,
    rec_touchdowns,
    avg_yac,
    avg_expected_yac,
    avg_yac_above_expectation,
    player_gsis_id as player_key,
    player_first_name as first_name,
    player_last_name as last_name,
    player_jersey_number as jersey_number,
    player_short_name as short_name
FROM source
