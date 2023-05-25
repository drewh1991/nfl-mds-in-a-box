{{
    config(
        materialized='table'
    )
}}

WITH source AS (
    SELECT * FROM {{ ref('stg_dim_players') }}
)

SELECT
    player_key,
    esb_id,
    espn_id,
    fantasy_data_id,
    gsis_it_id,
    pff_id,
    pfr_id,
    rotowire_id,
    sleeper_id,
    sportradar_id,
    yahoo_id,
    first_name,
    last_name,
    full_name,
    display_name,
    player_name,
    status,
    position_group,
    position,
    suffix,
    birth_date,
    college_name,
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
    short_name,
    smart_id,
    headshot,
    draft_number,
    uniform_number,
    draft_round,
    season
FROM source
