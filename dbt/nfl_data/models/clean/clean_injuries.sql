WITH source AS (
    SELECT * FROM {{ source('nfldata', 'source_injuries') }}
)

SELECT
    season,
    game_type,
    team,
    week,
    gsis_id,
    position,
    full_name,
    first_name,
    last_name,
    report_primary_injury,
    report_secondary_injury,
    report_status,
    practice_primary_injury,
    practice_secondary_injury,
    practice_status,
    date_modified
FROM source