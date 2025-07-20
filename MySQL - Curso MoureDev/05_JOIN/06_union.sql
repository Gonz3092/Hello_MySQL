-- UNION toma dos tablas y uno todos los registros de ambas tablas
-- SI un registro se repite, UNION solo trea un registro

SELECT *
FROM left_table
UNION
SELECT *
FROM right_table;

-- UNION ALL si trea los registos, aunque esten repetidos

SELECT *
FROM left_table
UNION ALL
SELECT *
FROM right_table;.

-- La diferencia con el JOIN es que no se comprar un PK para la fusion. Se amontonan todos los registros

-- EJEMPLO 
/* 
You are a school teacher teaching multiple classes.
You would like to combine the grades of all
students into one consolidated sheet.
*/
