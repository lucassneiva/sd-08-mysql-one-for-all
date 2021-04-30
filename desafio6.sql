CREATE VIEW faturamento_atual as
SELECT 
FORMAT(MIN(preco), 2) AS 'faturamento_minimo',
FORMAT(MAX(preco), 2) AS 'faturamento_maximo',
FORMAT(AVG(preco), 2) AS 'faturamento_medio',
FORMAT(SUM(preco), 2) AS "faturamento_total"
FROM
SpotifyClone.plano AS p
INNER JOIN
SpotifyClone.usuario AS u ON p.plano_id = u.plano_id;
--https://www.w3schools.com/sql/func_sqlserver_format.asp
