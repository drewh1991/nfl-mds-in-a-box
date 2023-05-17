WITH source AS (
    SELECT * FROM {{ source('nfldata', 'source_pbp_participation') }}
)

SELECT
    nflverse_game_id,
    old_game_id,
    play_id,
    possession_team,
    offense_formation,
    offense_personnel,
    defenders_in_box,
    defense_personnel,
    number_of_pass_rushers,
    players_on_play,
    offense_players,
    defense_players,
    n_offense,
    n_defense
FROM source