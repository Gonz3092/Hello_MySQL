-- busqueda de los valores en una columna designada que sea nulos

SELECT * FROM users WHERE email IS NULL;

-- busqueda de los valores en una columna designada que no sea nulos

SELECT * FROM users WHERE email IS NOT NULL;

-- busqueda de valores en una columna desgnada que no sean nulos y con un criterio adicional

SELECT * FROM users WHERE email IS NOT NULL AND age=30;

SELECT *, IFNULL(email, 'none') AS email FROM users ;