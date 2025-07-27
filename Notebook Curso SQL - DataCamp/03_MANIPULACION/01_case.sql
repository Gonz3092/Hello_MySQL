-- La palabra reservada CASE es como el IF de SQL
-- Contiene una funacion WHEN, THEN, ELSE y finaliza con END

CASE WHEN x = 1 THEN 'a'
    WHEN x = 2 THEN 'b'
    ELSE 'c' END AS new_column


SELCT
    id,
    home_goal,
    away_goal,
    CASE home_goal > away_goal THEN 'HOME TEAM WINS'
        WHEN home_goal < away_goal THEN 'AWAY TEAM WINS'
        ELSE 'Tie' END AS outcome
FROM match
WHERE season = '2013/2014';


-- Puedes usar mas de un criterio en CASE con la funcion AND

SELECT 
    date,
    hometeam_id,
    awayteam_id,
    CASE
        WHEN hometeam_id = 8455 AND home_goal > away_goal THEN 'Chelsey Home Wins' -- Primer criterio es el ID del equipo
        WHEN awayteam_id = 8455 AND home_goal < away_goal THEN 'Chelsey Away Wins' -- y el segundo es el resultado del juego
        ELSE 'Loss or tie' END AS outcome
FROM match
WHERE hometown_id = 8455 OR awayteam_id = 8455 -- asegura filtrar correctamente al usar CASE. 
                                               -- Si no filtramos aca entonces todo partido que no sea de Chelsea sera 
                                               -- etiquetado como perdido o empatado

-- Tambien se puede filtrar los valores NULL con CASE

SELECT 
    date,
    season,
    CASE
        WHEN hometeam_id = 8455 AND home_goal > away_goal THEN 'Chelsey Home Wins'
        WHEN awayteam_id = 8455 AND home_goal < away_goal THEN 'Chelsey Away Wins'
        END AS outcome -- al no agregar la palabra ELSE cuando no se cumplan las condiciones se pondra NULL
FROM match
WHERE hometown_id = 8455 OR awayteam_id = 8455

-- Si quieres filtrar los valores NULL puedes agregar el CASE en la funcion WHERE sin el alias

SELECT 
    date,
    season,
    CASE
        WHEN hometeam_id = 8455 AND home_goal > away_goal THEN 'Chelsey Home Wins'
        WHEN hometeam_id = 8455 AND home_goal < away_goal THEN 'Chelsey Away Wins'
        END AS outcome -- al no agregar la palabra ELSE cuando no se cumplan las condiciones se pondra NULL
FROM match
WHERE CASE
    WHEN hometeam_id = 8455 AND home_goal > away_goal THEN 'Chelsey Home Wins'
    WHEN hometeam_id = 8455 AND home_goal < away_goal THEN 'Chelsey Away Wins'
    END IS NOT NULL -- Esto hara que se filtren y solo aparezcan los varlores que no sean NULL y no hay que filtrar por el tema ID

/* El CASE es bueno para
    - Crear nuevas columnas para categorizacion de data
    - Filtrar datos en la clausula WHERE
    - Tambien puedes agregar data basandonos en los resultados de una prueba logica
*/

SELECT
    season,
    COUNT(CASE
            WHEN hometeam_id = 8650 
            AND home_goal > away_goal 
            THEN id END) AS home_wins, -- Se coloca ID por que es el valor que se esta calculando con la funcion agregada. 
                                       --Es decir que contara los ID cuandos e cumpla la funcion CASE
    COUNT(CASE 
            WHEN awayteam_id = 8650 -- escribe un segundo CASE para las victorias en la carretera
            AND away_goal > home_goal
            THEN id END) AS away_wins
FROM match
GROUP BY season; -- Agrupa por temporada


-- Para la funcion SUM puedes hacer lo siguiente

SELECT
    season,
    SUM(CASE
            WHEN hometeam_id = 8650 
            THEN home_goal END) AS home_goals, -- Se coloca homa_goal en el THEN por que es el valor a calcular
    SUM(CASE 
            WHEN awayteam_id = 8650 
            THEN away_goal END) AS away_goals
FROM match
GROUP BY season;

-- Funciona igual para la funcion AVG

SELECT
    season,
    AVG(CASE
            WHEN hometeam_id = 8650 
            THEN home_goal END) AS avg_homegoals, 
    AVG(CASE 
            WHEN awayteam_id = 8650 
            THEN away_goal END) AS avg_awaygoals
FROM match
GROUP BY season;

-- Para usar ROUND colocalo antes de la funcion agregada

SELECT
    season,
    ROUND(AVG(CASE
            WHEN hometeam_id = 8650 
            THEN home_goal END),2) AS avg_homegoals, 
    ROUND(AVG(CASE 
            WHEN awayteam_id = 8650 
            THEN away_goal END),2) AS avg_awaygoals
FROM match
GROUP BY season;

-- Una buena funcion para USAR con AVG es para porcentajes

SELECT
    season,
    AVG(CASE 
            WHEN hometeam_id = 8650 AND home_goal > away_goal THEN 1
            WHEN hometeam_id = 8650 AND home_goal < away_goal THEN 0
            END) AS pct_homewins,
    AVG(CASE 
            WHEN awayteam_id = 8650 AND away_goal > home_goal THEN 1
            WHEN awayteam_id = 8650 AND away_goal < home_goal THEN 0
            END) AS pct_awaywins,
FROM match
GROUP BY season;