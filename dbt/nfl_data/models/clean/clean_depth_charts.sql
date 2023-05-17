WITH source AS (
    SELECT * FROM {{ source('nfldata', 'source_depth_charts') }}
)

SELECT
    season,
    club_code,
    week,
    game_type,
    depth_team,
    last_name,
    first_name,
    football_name,
    formation,
    gsis_id,
    jersey_number,
    position,
    elias_id,
    depth_position,
    full_name
FROM source