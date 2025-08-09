-- COMMON TABLE EXPRESSION o EXPRESION DE TABLA COMUN
-- Es una tabla delcarada antes del query principal

WITH cte AS (
    SELECT col1, col2
    FROM table
)


-- Asi seria si haces un subq anidado en FROM

SELECT
    c.name AS country,
    COUNT(s.id) AS matches
FROM country AS c
INNER JOIN (
    SELECT country_id, id
    FROM match
    WHERE (home_goal + away_goal) >= 10) AS s
ON c.id = s.country_id
GROUP BY country;

-- para implementar un CTE empieza colocando el Subq al principio y completa de igual forma el resto de quesry

WITH s AS (
    SELECT country_id, id
    FROM match
    WHERE (home_goal + away_goal) >= 10
    )
SELECT
    c.name AS country,
    COUNT(s.id) AS matches
FROM country AS c
INNER JOIN s
ON c.id = s.country_id
GROUP BY country;

-- Puedes emplear multiples CTE

WITH s1 AS (
    SELECT country_id, id
    FROM match
    WHERE (home_goal + away_goal) >= 10),
s2 AS (
    SELECT country_id, id
    FROM match
    WHERE (home_goal + away_goal) <= 1
    )
SELECT
    c.name AS country,
    COUNT(s1.id) AS high_socre
    COUNT(s2.id) AS low_socre
FROM country AS c
INNER JOIN s1
ON c.id = s1.country_id
INNER JOIN s2
ON c.id = s2.country_id
GROUP BY country;

-- EJEMPLO 

WITH match_list AS (   -- Set up your CTE
    SELECT          -- Select the league, date, home, and away goals
  		l.name AS league, 
     	m.date, 
  		m.home_goal, 
  		m.away_goal,
       (m.home_goal + m.away_goal) AS total_goals
    FROM match AS m
    LEFT JOIN league as l ON m.country_id = l.id)
SELECT league, date, home_goal, away_goal   -- Select the league, date, home, and away goals from the CTE
FROM match_list
WHERE total_goals >= 10;  -- Filter by total goals

