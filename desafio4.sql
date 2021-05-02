CREATE VIEW top_3_artistas AS
SELECT a.artista_nome AS artista,
  COUNT(ua.usuario_id) AS seguidores
FROM usuario_artista AS ua
  INNER JOIN artistas AS a ON ua.artista_id = a.artista_id
GROUP BY ua.artista_id
ORDER BY seguidores DESC, artista ASC
LIMIT 3;
