CREATE VIEW estatisticas_musicais AS
SELECT 
( SELECT COUNT(*) FROM SpotifyClone.songs ) AS 'cancoes', 
( SELECT COUNT(*) FROM SpotifyClone.artistas ) AS 'artistas',
( SELECT COUNT(*) FROM SpotifyClone.albuns ) AS 'albuns';
