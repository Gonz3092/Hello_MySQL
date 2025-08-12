-- Relacion 1 a n: Bibloiteca musical. 1 artista o banda puede hacer muchas canciones
-- Relacion 1 a 1: Un dedo solo tiene una unica huella dactilar
-- Relacion n a n: Idiomas y paises. un pais puede tener distintos idiomas oficiales y el mismo idioma puede ser el idioma oficiao en varios paises


-- JOIN multiple

SELECT 
    P2.country, 
    P2.continent, 
    prime_minister, 
    president
FROM presidents AS P1
INNER JOIN prime_minister as P2
USING (country)
INNER JOIN prime.minister_terms AS P3
USING(prime.minister);

-- Claves multiples: puedes unir por mas de 1 PK en comun con la palabra reservada AND

SELECT *
FROM left_table
INNER JOIN right_table
ON left_table.id = right_table.id
    AND left_table.date = right_table.date