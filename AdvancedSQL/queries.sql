-- 1. Mostrar o título e o nome do gênero de todas as séries.
SELECT s.title, g.name as Gênero FROM series s LEFT JOIN genres g ON s.genre_id = g.id;

-- 2. Mostrar o título dos episódios, o nome e sobrenome dos atores que trabalham em
-- cada um deles.
SELECT e.title, a.first_name, a.last_name FROM episodes e
    LEFT JOIN actor_episode ae on ae.episode_id = e.id
    LEFT JOIN actors a on a.id = ae.actor_id
ORDER BY title ASC;

-- 3. Mostrar o título de todas as séries e o número total de temporadas que cada uma
-- delas possui.
SELECT COUNT(*), series.title FROM series
    LEFT JOIN seasons ON seasons.serie_id = series.id
    GROUP BY series.title;

-- 4. Mostrar o nome de todos os gêneros e o número total de filmes de cada um, desde
-- que seja maior ou igual a 3.
SELECT name, COUNT(*) as Total FROM genres
    INNER JOIN movies on movies.genre_id = genres.id
    GROUP BY genres.name
    HAVING COUNT(*) >= 3;

-- 5. Mostrar apenas o nome e sobrenome dos atores que atuam em todos os filmes de
-- Star Wars e que estes não se repitam.
SELECT DISTINCT last_name FROM actors
WHERE actors.id in (
    SELECT actor_id FROM actor_movie WHERE actor_movie.movie_id in (
        SELECT id FROM movies WHERE title like '%Guerra nas Estrelas%')
    );
