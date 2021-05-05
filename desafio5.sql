-- 5 - Estamos fazendo um estudo das músicas mais tocadas e precisamos saber quais são as duas músicas
-- mais tocadas no momento. Crie uma VIEW chamada top_2_hits_do_momento que possua duas colunas:
-- 		a) A primeira coluna deve possuir o alias "cancao" e exibir o nome da canção.
-- 		b) A segunda coluna deve possuir o alias "reproducoes" e exibir a quantidade de pessoas que já
-- 		escutaram a canção em questão.
-- 		c) Seu resultado deve estar ordenado em ordem decrescente, baseando-se no número de reproduções.
-- 		Em caso de empate, ordene os resultados pelo nome da canção em ordem alfabética.
-- 		Queremos apenas o top 2 de músicas mais tocadas.
-- 	Sua VIEW deve retornar a seguinte informação, ao ser consultada:
-- 	O que será verificado:
-- 		Será validado se existe uma VIEW chamada top_2_hits_do_momento, que exibe os dados corretos
-- 		nas colunas cancao e reproducoes".
-- 		Será validado se as colunas estão ordenadas de forma correta.
CREATE VIEW top_2_hits_do_momento AS
SELECT s.Title AS 'cancao', COUNT(h.SingleID) AS 'reproducoes'
FROM SpotifyClone.Single AS s
INNER JOIN SpotifyClone.Historic AS h ON s.SingleID = h.SingleID
GROUP BY h.SingleID
ORDER BY 'reproducoes', 'cancao' DESC
LIMIT 2;
