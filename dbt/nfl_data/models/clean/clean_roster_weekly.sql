{{
    config(
        materialized='table'
    )
}}

WITH source as (
    SELECT * FROM {{ source('nfldata','source_roster_weekly') }}
)

SELECT
    season,
    team,
    position,
    depth_chart_position,
    jersey_number,
    status,
    full_name,
    first_name,
    last_name,
    birth_date,
    height,
    weight,
    college,
    gsis_id as player_key,
    espn_id,
    sportradar_id,
    yahoo_id,
    rotowire_id,
    pff_id,
    pfr_id,
    fantasy_data_id,
    sleeper_id,
    years_exp,
    headshot_url,
    ngs_position,
    week,
    game_type,
    status_description_abbr,
    football_name,
    esb_id,
    gsis_it_id,
    smart_id,
    entry_year,
    rookie_year,
    draft_club,
    draft_number,
FROM source
