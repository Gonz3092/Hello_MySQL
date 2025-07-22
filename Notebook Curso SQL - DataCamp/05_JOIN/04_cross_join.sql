-- CROSS JOIN crea todas las posibles combinaciones de dos tablas

SELECT prime_minister, president
FROM primer¿_minister AS p1 
CROSS JOIN presidents as p2 
WHERE p1.continent IN ('Asia')
    AND p2.continent IN ('South America')