{{
    config(
        materialized='table'
    )
}}

WITH source AS (
    SELECT * FROM {{ source('nfldata', 'source_snap_counts') }}
)

SELECT
    game_id,
    pfr_game_id,
    season,
    game_type,
    week,
    player as player_name,
    pfr_player_id as pfr_id,
    position as position_played,
    team,
    opponent,
    offense_snaps,
    offense_pct,
    defense_snaps,
    defense_pct,
    st_snaps as special_teams_snaps,
    st_pct as special_teams_pct
FROM source
