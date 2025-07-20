-- los subqueries generalmente se usan en la clausula WHERE, 
-- pero tambien se pueden colocar en SELECT
-- esta consulta los registros unicos de la variable continente en la tabla states
SELECT DISTINCT continent
FROM states;

-- insertamos la consulta para traer los regitros unicos por contienentes donde se indique cuantos monarcas hay por contienente

SELECT DISTINCT continent,
    (SELECT COUNT(*)
    FROM monarchs
    WHERE states.continent = monarch.continent) AS monarch_count -- el subquieries siempre necesita un alias
FROM states;

-- POr ultimo tambien se pueden incorporar el subquery desde el FROM

-- Esta consulta trae los registros que coincidan en ambas tablas.
-- Trae los registros duplicados

SELECT left.table.id, right.table.id
FROM left_tble, right_table
WHERE left.table.id = right.table.id

-- Usando DISTINCT eliminas las ocurrencias regidtradas

SELECT DISTINCT left.table.id, right.table.id
FROM left_tble, right_table
WHERE left.table.id = right.table.id

-- EJEMPLO
SELECT DISTINCT monarchs.continent, sub.most_recent
FROM monarch
    (SELECT continent, MAX(indep_year) AS most_recent
    FROM states
    GROUP BY continent) AS sub
WHERE monarchs.continent = sub.continent
ORDER BY continent;

--EJEMPLO 2

SELECT countries.local_name, sub.lang_num
FROM countries,
  (SELECT code, COUNT(*) AS lang_num
  FROM languages
  GROUP BY code) AS sub
-- Where codes match
WHERE countries.code = sub.code
ORDER BY lang_num DESC;

/*The query starts by selecting specific fields from the cities table: name, country_code, city_proper_pop, and metroarea_pop.
It also calculates a new field, city_perc, which represents the proper population as a percentage of the metro area population. 
This is done using the formula city_proper_pop / metroarea_pop * 100.*/
SELECT 
	name, 
    country_code, 
    city_proper_pop, 
    metroarea_pop,
    city_proper_pop / metroarea_pop * 100 AS city_perc
FROM cities
/*The WHERE clause uses a subquery to filter the cities. It checks if the name of the city is in a list of capitals.
The subquery selects capital cities from the countries table where the continent is either 'Europe' or ends with 'America'. 
This is achieved using the condition (continent = 'Europe' OR continent LIKE '%America').*/
WHERE name IN
  (SELECT capital
   FROM countries
   WHERE (continent = 'Europe'
   OR continent LIKE '%America'))
/*The query includes a condition AND metroarea_pop IS NOT NULL to exclude any cities where the metroarea_pop is NULL. 
This ensures that the percentage calculation is valid and avoids division by NULL.*/
	  AND metroarea_pop IS NOT NULL
/*The results are ordered by city_perc in descending order using ORDER BY city_perc DESC. 
This means the cities with the highest percentage of proper population relative to their metro area population will appear first.
Finally, LIMIT 10 restricts the output to only the first 10 rows, as required by the exercise.*/
ORDER BY city_perc DESC
LIMIT 10;