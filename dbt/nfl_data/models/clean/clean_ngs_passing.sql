WITH source AS (
    SELECT * FROM {{ source('nfldata', 'source_ngs_passing') }}
)

SELECT
    season,
    season_type,
    week,
    player_display_name,
    player_position,
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
    player_gsis_id,
    player_first_name,
    player_last_name,
    player_jersey_number,
    player_short_name
FROM source