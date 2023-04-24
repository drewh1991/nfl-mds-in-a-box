WITH source AS (
    SELECT * FROM {{ source('nfldata', 'source_ngs_rushing') }}
)

SELECT
    season,
    season_type,
    week,
    player_display_name,
    player_position,
    team_abbr,
    efficiency,
    percent_attempts_gte_eight_defenders,
    avg_time_to_los,
    rush_attempts,
    rush_yards,
    expected_rush_yards,
    rush_yards_over_expected,
    avg_rush_yards,
    rush_yards_over_expected_per_att,
    rush_pct_over_expected,
    rush_touchdowns,
    player_gsis_id,
    player_first_name,
    player_last_name,
    player_jersey_number,
    player_short_name
FROM source