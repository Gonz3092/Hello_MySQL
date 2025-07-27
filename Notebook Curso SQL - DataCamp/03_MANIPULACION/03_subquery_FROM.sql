/*
Una subconsulta en la cláusula FROM se conoce como tabla derivada o vista en línea. 
La subconsulta se ejecuta primero y su conjunto de resultados se trata como una tabla temporal sobre la cual se realiza la consulta principal. 
Es útil para simplificar consultas complejas, pre-agregar datos o aplicar filtrados antes de unirse con otras tablas.

Características:

Tabla Temporal: Actúa como una tabla temporal virtual que solo existe durante la ejecución de la consulta.
Alias Requerido: Es obligatorio asignarle un alias a la tabla derivada.
Pre-procesamiento: Permite realizar operaciones como agregaciones, filtrados o uniones complejas antes de que los datos se usen en la consulta principal.
Optimización: Puede mejorar la legibilidad y, en algunos casos, el rendimiento al reducir el número de filas o la complejidad antes de uniones mayores.
*/


-- este es el subquiery que filtra el promedio de goles como local y agrupa por equipo y filtra la temporada necesaria
SELECT
    t.team_long_name AS team,
    AVG(m.home_goal) AS home_avg
FROM match AS m
LEFT JOIN team AS t
ON m.hometeam_id = t.team_api_id
WHERE season = '2011/2012'
GROUP BY team;

-- luego agrega este query a la clausula FROM agregandole un alias al final 

SELECT team, home_avg 
FROM (SELECT
    t.team_long_name AS team,
    AVG(m.home_goal) AS home_avg
    FROM match AS m
    LEFT JOIN team AS t
    ON m.hometeam_id = t.team_api_id
    WHERE season = '2011/2012'
    GROUP BY team) AS subquery
ORDER BY home_avg DESC
LIMIT 3; -- esto trae a los top 3 equipos con el promedio de goles locales mas alto