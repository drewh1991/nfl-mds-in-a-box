{{
    config(
        materialized='table'
    )
}}

WITH source AS (
    SELECT * FROM {{ source('nfldata', 'source_players') }}
)

SELECT
    status,
    display_name,
    first_name,
    last_name,
    display_name as player_name,
    esb_id,
    gsis_id as player_key,
    suffix,
    birth_date,
    college_name,
    position_group,
    position,
    jersey_number,
    height,
    weight,
    team_abbr,
    team_seq,
    current_team_id,
    football_name,
    entry_year,
    rookie_year,
    draft_club,
    college_conference,
    status_description_abbr,
    status_short_description,
    gsis_it_id,
    short_name,
    smart_id,
    headshot,
    draft_number,
    uniform_number,
    draft_round,
    season
FROM source
