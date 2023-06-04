WITH artist_by_top_n_daily_songs AS (
  SELECT
    a.artist_name
    , COUNT(*) FILTER (WHERE gbr.rank <= 10) AS top_n_daily_songs
  FROM artists a
  INNER JOIN songs s
    ON a.artist_id = s.artist_id
  INNER JOIN global_song_rank gbr
    ON gbr.song_id = s.song_id
  GROUP BY 1
)

, artist_by_top_n_daily_songs_rank AS (
  SELECT
    artist_name
    , DENSE_RANK() OVER (ORDER BY top_n_daily_songs DESC) AS artist_rank
  FROM artist_by_top_n_daily_songs
)

SELECT
  artist_name
  , artist_rank
FROM artist_by_top_n_daily_songs_rank
WHERE artist_rank <= 5
;
