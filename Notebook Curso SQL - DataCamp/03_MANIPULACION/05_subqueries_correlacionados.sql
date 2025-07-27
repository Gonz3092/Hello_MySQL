/*
- Usa valores del query exterior para generar un resultado
- El subqueri es ejecutado cada vez que una fila en generada en el set final de datos
- Es utilizado para JOIN avanzado, filtrado y evaluacion de data
*/

-- EJEMPLO
/*
Esta consulta busca todas las "etapas" (stages) de la temporada de fútbol 2012/2013 en las que 
el promedio de goles por partido fue superior al promedio de goles por partido de toda esa temporada. 
Para cada una de esas etapas, te mostrará el nombre de la etapa, su promedio de goles (redondeado) 
y el promedio general de goles de la temporada para que puedas comparar.
*/

SELECT
    s.stage,
    ROUND(s.avg_goals,2) AS avg_goal,
    (SELECT AVG(home_goal + away_goal) FROM match WHERE season = '2012/2013') AS overall_avg
FROM
    (SELECT
        stage,
        AVG(home_goal + away_goal) AS avg_goals
    FROM match
    WHERE season = '2012/2013'
    GROUP BY stage
    ) AS s
WHERE s.avg_goals > (SELECT AVG(home_goal + away_goal) 
                    FROM match 
                    WHERE season = '2012/2013');

-- Ahora esta conesulta es igual a execpcion de la clausula WHERE

SELECT
    s.stage,
    ROUND(s.avg_goals,2) AS avg_goal,
    (SELECT AVG(home_goal + away_goal) FROM match WHERE season = '2012/2013') AS overall_avg
FROM
    (SELECT
        stage,
        AVG(home_goal + away_goal) AS avg_goals
    FROM match
    WHERE season = '2012/2013'  
    GROUP BY stage
    ) AS s
WHERE s.avg_goals > (SELECT AVG(home_goal + away_goal)
                     FROM match AS m
                     WHERE s.stage > m.stage);

/* 
la cláusula WHERE filtra las etapas (s.stage) de la consulta principal de manera que solo 
se incluyen aquellas etapas cuyo promedio de goles (s.avg_goals) es mayor que el promedio 
de goles de todas las etapas anteriores (es decir, etapas con un número de stage menor).
*/