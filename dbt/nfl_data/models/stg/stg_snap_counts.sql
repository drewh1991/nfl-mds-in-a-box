WITH snap_counts AS (
    SELECT * FROM {{ ref('clean_snap_counts') }}
),

players AS (
    SELECT * FROM {{ ref('stg_dim_players') }}
)

SELECT
    snap_counts.*,
    players.player_key
FROM snap_counts
INNER JOIN players USING (pfr_id)
