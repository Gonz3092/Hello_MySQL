/*
una subconsulta anidada se refiere a una subconsulta que está contenida dentro de otra subconsulta. 
Es decir, tienes una consulta principal, dentro de ella una subconsulta, y dentro de esa subconsulta, 
otra subconsulta más. Esto crea múltiples niveles de anidamiento.

Supongamos que quieres encontrar el mes que tuvo el promedio de goles totales.

Esto podría requerir varios pasos:
2) Subconsulta intermedia: Agrupar esos totales de goles por país y por mes para obtener el promedio mensual por país.
3) Consulta externa: Encontrar el país con el promedio más alto de esos resultados intermedios.
*/

-- Subquery interno: Calcular el total de goles mensuales

SELECT  
    EXTRACT(MONTH from date) AS month,
    SUM(home_goal + away_goal) AS goals 
FROM match
GROUP BY month;

-- Subquery externo: calcula un escalar del promedio de goles mensuales del subquery interno

SELECT AVG(goals)
FROM (SELECT    
        EXTRACT(MONTH from date) AS month,
        SUM(home_goal + away_goal) AS goals 
    FROM match
    GROUP BY month)

-- Query externo: utiliza el escalar calculado en el subquery externo para calcular la difrencia entre el total de goles mensuales
-- con el promedio de goles de ese mes

SELECT 
    EXTRACT (MONTH FROM date) AS month
    SUM(m.home_goal + m.away_goal) AS total_goals
    SUM(m.home_goal + m.away_goal) -
        (SELECT AVG(goals)
        FROM (SELECT    
                EXTRACT(MONTH from date) AS month,
                SUM(home_goal + away_goal) AS goals 
            FROM match
            GROUP BY month) AS s) AS diff
FROM match AS m
GROUP BY month;