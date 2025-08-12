-- SELF JOIN uno las tablas consigo mismo
-- Se usa para comprarar diferentes secciones de la misma tabla

SELECT 
    p1.country AS country1
    p2.country AS country2
    p1.continent
FROM prime_minister AS p1
INNER JOIN prime_minister AS p2
ON p1.continent = p2.continent
    AND p1.continent <> p2.continent -- para que no se combinen los mismos resultados
LIMIT 10;

SELECT 
	p1.country_code, 
    p1.size AS size2010, 
    p2.size AS size2015
FROM populations AS p1
INNER JOIN populations AS p2
ON p1.country_code = p2.country_code
WHERE p1.year = 2010
-- Filter such that p1.year is always five years before p2.year
    AND p1.year = p2.year - 5 
    -- se filtra para retornar solo la combinacion 
    -- donde size2010 sea la info del 2010 y size2015 la del 2015