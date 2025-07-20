-- INTERSECT solo trae los registros que esten en ambas tablas
-- en el diagrama venn seria lo que estan dentro de las instersecciones de los circulos

SELECT id, val
FROM left_table
INTERSECT
SELECT id, val
FROM right_table;

-- Comparando esto con INNER JOIN, si escribimos el codigo con esta palabra, 
-- el resultado trae los registros repetidos, en cambio INTERSECT no

SELECT country AS intersect_country
FROM primer_ministers
INTERSECT
SELECT country
FROM presidents; -- la tabla resultando seria solo los registros con ambos presidente y primer ministro 


-- EJEMPLO 

/* 
A residence hall has asked students
to rank their preferences to be
assigned a room.
They now want to pair students
based on common preferences.
*/