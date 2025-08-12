-- LEFT JOIN trea todos los registros de la tabla izquierda y los que coincidan de la tabla derecha

SELECT P2.country, P2.continent, prime_minister, president
FROM presidents AS P1
LEFT JOIN prime_minister as P2
USING (country);

-- RIGHT JOIN trea todos los registros de la tabla derecha y los que coincidan de la tabla izquierda
-- No es tan comun

SELECT P2.country, P2.continent, prime_minister, president
FROM presidents AS P1
RIGHT JOIN prime_minister as P2
USING (country);

-- FULL JOIN trae todos los valores de ambas tablas sin importar que tenga coincidencia o no

SELECT P2.country, P2.continent, prime_minister, president
FROM presidents AS P1
FULL JOIN prime_minister as P2
USING (country);
