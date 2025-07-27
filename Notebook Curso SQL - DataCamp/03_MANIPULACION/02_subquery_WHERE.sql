/* 
- Un subquery es un query anidado dentro de otra query
- Puede estar en cualquier parte del query
- Puede devolver una variedad de datos, desde valores, una lista o una tabla completa
- Al procesar el query, primero se ejectuta el subquery y luego el query principal
*/

-- Subquery en la clausula WHERE

/*
Su propósito principal es filtrar filas basándose en un conjunto de resultados devueltos por la subconsulta. 
La subconsulta se ejecuta primero y su resultado se utiliza para evaluar la condición en la cláusula WHERE 
de la consulta principal.

Características:

-Filtrado: Se utiliza para filtrar las filas de la consulta principal.
-Resultados: La subconsulta generalmente devuelve un solo valor, una lista de valores o un conjunto de valores 
para comparación.
-Operadores: Se usa comúnmente con operadores como IN, NOT IN, =, !=, >, <, >=, <=, EXISTS, NOT EXISTS.
-Correlacionadas o No Correlacionadas: Pueden ser correlacionadas (dependen de la consulta externa) 
o no correlacionadas (independientes).
*/

--  EJEMPLO 
SELECT AVG(home_goal) FROM match -- haz el subquery que haga el calculo que requieres

SELECT date, hometeam_id, awayteam_id, home_goal, away_goal
FROM match
WHERE season = '2012/2013'
    AND home_goal > (SELECT AVG(home_goal) 
                    FROM match) -- ingresa el subquiery calculado antes

-- Tambien se puede utilizar para filtrar listas con IN

SELECT 
    team_long_name,
    team_short_name AS abbr
FROM team -- la tabla team no identifica el pais al que pertenece el equipo
WHERE
    team_api_id IN 
        (SELECT hometeam_id
        FROM match
        WHERE country_id = 15722); -- pero la tabla match tiene el codigo del equipo y el codigo del pais