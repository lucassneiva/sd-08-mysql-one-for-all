CREATE VIEW faturamento_atual AS
SELECT
ROUND(MIN(p.`valor_plano`), 2) AS `faturamento_minimo`,
ROUND(MAX(p.`valor_plano`), 2) AS `faturamento_maximo`,
ROUND(AVG(`valor_plano`), 2) AS `faturamento_medio`,
ROUND(SUM(p.`valor_plano`), 2) AS `faturamento_total`
FROM SpotifyClone.Usuarios AS u
INNER JOIN SpotifyClone.Planos AS p
ON p.plano_id = u.plano_id;
