CREATE VIEW faturamento_atual AS
SELECT
ROUND(MIN(p.plan_price), 2) AS faturamento_minimo,
ROUND(MAX(p.plan_price), 2) AS faturamento_maximo,
ROUND(AVG(plan_price), 2) AS faturamento_medio,
ROUND(SUM(p.plan_price), 2) AS faturamento_total
FROM SpotifyClone.user AS u
INNER JOIN SpotifyClone.plan AS p
ON p.plan_id = u.plan_id;
