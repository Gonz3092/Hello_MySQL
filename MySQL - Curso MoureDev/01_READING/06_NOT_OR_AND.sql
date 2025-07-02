-- negacion de un creiterio especifico
SELECT * FROM users WHERE NOT email LIKE '%@gmail.com'

-- esta sentencia permite filtrar resultados que no coincidan con un patrón específico
SELECT * FROM users WHERE NOT email LIKE '%@gmail.com' AND age = 30

-- esta sentencia permite filtrar resultados que no coincidan con un patrón específico o cumplan con otra condición
SELECT * FROM users WHERE NOT email LIKE '%@gmail.com' or age = 30