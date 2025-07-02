-- Esta sentencia permite ordenar la consulta en base a un creiterio selccionado
SELECT * FROM users ORDER BY age

-- ordenado de forma ascendente
SELECT * FROM users ORDER BY age ASC;

-- ordenado de forma descendente
SELECT * FROM users ORDER BY age DESC;

SELECT name FROM users WHERE age='30' ORDER BY email DESC