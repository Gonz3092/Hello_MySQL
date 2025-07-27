/*
Una subconsulta en la cláusula SELECT se conoce como subconsulta escalar. 
Debe devolver un único valor para cada fila de la consulta principal. 
Si devuelve más de un valor o ningún valor, se producirá un error (o un NULL, dependiendo del caso). 
Su propósito es recuperar un valor relacionado de otra tabla para cada fila de la consulta principal.

Caracteristicas:

Valor Único: Siempre debe devolver un único valor.
Columna Adicional: Añade una columna a los resultados de la consulta principal.
Rendimiento: Puede afectar el rendimiento si la subconsulta es compleja y se ejecuta para cada fila de la consulta principal.
Correlacionada: A menudo son subconsultas correlacionadas, ya que el valor que devuelve depende de la fila actual de la consulta externa.

Considera que su hay un filtro en el query tambien tiene que filtrar el subquery en SELECT
*/


-- Ejemplo
-- Quieres ver como un puntaje se desvia del total general

SELECT COUNT(id) FROM match; -- conteo total de juegos

-- podemos agregar el numero direactamente
SELECT
    season,
    COUNT(id) AS matches
    12837 AS total_matches
FROM match
GROUP BY season;


-- o podemos agrerar el query dentro del SELECT

SELECT
    season,
    COUNT(id) AS matches
    (SELECT COUNT(id) FROM match) AS total_matches
FROM match
GROUP BY season;
