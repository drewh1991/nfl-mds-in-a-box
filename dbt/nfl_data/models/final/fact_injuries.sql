{{
    config(
        materialized='table'
    )
}}

WITH source AS (
    SELECT * FROM {{ ref('clean_injuries') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['player_key']) }} AS player_id,

    week,
    team,
    report_primary_injury,
    report_secondary_injury,
    report_status,
    practice_primary_injury,
    practice_secondary_injury,
    practice_status,
    date_modified
FROM source
