/*
Una función de ventana (o "window function" en inglés) es una herramienta muy poderosa en SQL 
que realiza cálculos sobre un conjunto de filas de la tabla que están relacionadas con la fila actual. 
Este conjunto de filas se conoce como la "ventana" o "marco de ventana".

La característica más importante de las funciones de ventana, y lo que las diferencia de las funciones 
de agregación tradicionales (como SUM(), AVG(), COUNT() con GROUP BY), es que no colapsan las filas. 
En lugar de reducir un grupo de filas a una sola fila de resumen, las funciones de ventana devuelven un valor 
agregado o un valor analítico para cada fila individual, manteniendo todos los detalles originales de la fila.
*/

-- Ejemplo

SELECT
    date,
    (home_goal + away_goal) AS goals
    (SELECT AVG(home_goal + away_goal)
    FROM match
    WHERE season = '2011/2012') AS overall_avg
FROM match
WHERE season ='2011/2012'

