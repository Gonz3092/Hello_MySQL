-- Codigo utilizado para la union de dos tablas
-- Primero selecciona la tabla principal con FROM, 
-- luego con INNER JOIN selecciona la tabla a unir
-- cierra con ON para indicar las columnas de union indicando tabla.columna = tabla.columna
-- finalmente ingresa las tablas que quieres agregar
-- Utiliza el dformato tabla.columna si hay columnas con el mismo nombre en ambas tablas evitando errores

SELECT prime_minister.country, prime_minister.continent, prime_minister, president
FROM presidents
INNER JOIN prime_minister
ON presidents.country = prime_minister.country

-- Puedes utilizar alias en la funcion SELECT y en ON

SELECT P2.country, P2.continent, prime_minister, president
FROM presidents AS P1
INNER JOIN prime_minister as P2
ON P1.country = P2.country

-- Si el nombre de la columna es igual en ambas tablas podras utilizar USING() para hacer la union

SELECT P2.country, P2.continent, prime_minister, president
FROM presidents AS P1
INNER JOIN prime_minister as P2
USING (country)