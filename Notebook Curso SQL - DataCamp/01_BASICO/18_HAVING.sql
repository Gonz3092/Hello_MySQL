-- Limitacion sobre una columna agregada

SELECT COUNT(age) FROM users HAVING COUNT(age) > 5