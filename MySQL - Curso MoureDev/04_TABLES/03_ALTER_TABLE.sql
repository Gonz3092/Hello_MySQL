-- para agregar una nueva columna a una tabla excistente

ALTER TABLE persons8
ADD surname varchar(150)

-- para modificar un campo ya existente

ALTER TABLE persons8
RENAME COLUMN surname TO description;

-- MODIFICAR TIPO DE VARIABLE
ALTER TABLE persons8
MODIFY COLUMN description VARCHAR(250);

-- para eliminar una columna
ALTER TABLE persons8
DROP COLUMN description