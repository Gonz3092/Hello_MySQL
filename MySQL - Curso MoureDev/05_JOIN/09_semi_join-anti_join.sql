-- Es cuando realziamos JOIN sin el uso explicito de la palabra reservada
-- SEMI JOIN selecciona registros de la primera tabla cuando una condicion se cumpla en la segunda tabla
-- query para filtrar los codigos de los paises de medio oriente

SELECT code
FROM countries
WHERE region = 'Middle East'

-- query para traer registros unicos de los lenguajes
SELECT DISTINCT name
FROM languages
ORDER BY name ASC;


-- Termina el SEMI JOIN incorporando la clausula realizada dentro del WHERE y seleccionando el sub con la palabra reservada IN
SELECT DISTINCT name
FROM languages
WHERE code IN
    (SELECT code
    FROM countries
    WHERE region = 'Middle East')
ORDER BY name;

-- ANTI JOIN selecciona registros de la primera tabla cuando una condicion NO se cumpla en la segunda tabla

SELECT code, name
FROM countries
WHERE continent = 'Oceania'
-- Filter for countries not included in the bracketed subquery
  AND code NOT IN
      (SELECT code
      FROM currencies);