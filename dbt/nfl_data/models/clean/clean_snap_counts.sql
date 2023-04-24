WITH source AS (
    SELECT * FROM {{ source('nfldata', 'source_snap_counts') }}
)

SELECT
    game_id,
    pfr_game_id,
    season,
    game_type,
    week,
    player,
    pfr_player_id,
    position,
    team,
    opponent,
    offense_snaps,
    offense_pct,
    defense_snaps,
    defense_pct,
    st_snaps,
    st_pct
FROM source