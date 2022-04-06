-- 1. Adicione um filme à tabela de filmes.
INSERT INTO movies  (created_at, updated_at, title, rating, awards, release_date, length, genre_id)VALUES
    (CURRENT_TIMESTAMP, CURRENT_TIMESTAMP , 'Aliens documentary', 7.4, 0, '2022-03-27', 115,  4);

-- 2. Adicione um gênero à tabela de gêneros.
INSERT INTO genres (created_at, updated_at, name, ranking, active) VALUES
    (CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Documentary', 7, 1);

-- 3. Associe o filme do ponto 1. com o gênero criado no ponto 2.
UPDATE movies SET genre_id = (SELECT id FROM genres WHERE name = 'Documentary') WHERE title = 'Aliens documentary';

-- 4. Modifique a tabela de atores para que pelo menos um ator tenha o filme adicionado
-- no ponto 1 como favorito.
UPDATE actors SET favorite_movie = (SELECT id FROM movies WHERE title = 'Aliens documentary') WHERE id = 1;

-- 5. Crie uma tabela temporária da tabela filmes.
CREATE TEMPORARY TABLE temp_movies AS SELECT * FROM movies;

-- 6. Elimine dessa tabela temporária todos os filmes que ganharam menos de 5 prêmios.
DELETE FROM temp_movies WHERE awards < 5;

-- 7. Obtenha a lista de todos os gêneros que possuem pelo menos um filme.
SELECT * FROM genres
INNER JOIN movies on movies.genre_id = genres.id;

-- 8. Obtenha a lista de atores cujo filme favorito ganhou mais de 3 prêmios.
SELECT * FROM actors
LEFT JOIN movies on movies.id = actors.favorite_movie_id
WHERE movies.awards > 3;

-- 9. Crie um índice no nome na tabela de filmes.
CREATE INDEX ON movies (title);


-- 10. Verifique se o índice foi criado corretamente.
SELECT tablename, indexname, indexdef FROM pg_indexes WHERE schemaname = 'public';

-- 11. No banco de dados movies, haveria uma melhoria notável na criação de índices?
-- Analise e justifique a resposta.

-- Os únicos índices que foram criados , com exceção do último exercício, foram os de chave primaria, criados automaticamente pelo postgres, portanto
-- seria interessante criar mais índices para os campos mais procurados como nome e título dos items, também podendo criá-lo para facilitar a busca em
-- case sensitive, desta forma as consultas seriam mais performáticas e rápidas.

-- 12. Em que outra tabela você criaria um índice e por quê? Justifique a resposta
-- Actors, visto que com a inserção de mais atores, a tabela tente a crescer, e dificilmente iremos realizar uma consulta nesta tabela pelo id, e sim pelo nome.