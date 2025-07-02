-- creas una concdicional

SELECT * ,
CASE
	WHEN age > 30 THEN 'Treinton'
    ELSE 'menor'
END AS prueba
FROM users;