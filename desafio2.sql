CREATE VIEW SpotifyClone.estatisticas_musicais AS
SELECT
  COUNT(*) AS cancoes,
  (
    SELECT COUNT(*) FROM artists
  ) AS artistas,
  (
    SELECT COUNT(*) FROM albums
  ) AS albuns
FROM songs;
