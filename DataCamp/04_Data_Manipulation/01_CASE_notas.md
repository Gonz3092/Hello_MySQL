# Apuntes SQL – Uso de CASE

## 1. CASE básico
El `CASE` en SQL es una expresión condicional que permite devolver diferentes valores según condiciones específicas.
Se puede usar en:
- SELECT (para crear columnas calculadas)
- ORDER BY (para ordenar según condiciones)
- WHERE (para filtrar de forma condicional)

### Sintaxis básica
```sql
CASE
    WHEN condición_1 THEN resultado_1
    WHEN condición_2 THEN resultado_2
    ELSE resultado_por_defecto
END
```

### Ejemplo
```sql
SELECT 
    name,
    CASE
        WHEN price < 10 THEN 'Barato'
        WHEN price BETWEEN 10 AND 20 THEN 'Medio'
        ELSE 'Caro'
    END AS categoria_precio
FROM products;
```

---

## 2. CASE con funciones de agregación
El `CASE` puede ir dentro de funciones como SUM, COUNT o AVG para aplicar cálculos condicionales.

### Ejemplo – Conteo condicional
```sql
SELECT 
    COUNT(CASE WHEN status = 'Completed' THEN 1 END) AS count_completed,
    COUNT(CASE WHEN status = 'Pending' THEN 1 END) AS count_pending,
    COUNT(CASE WHEN status = 'Cancelled' THEN 1 END) AS count_cancelled
FROM orders;
```

### Ejemplo – Suma condicional
```sql
SELECT
    SUM(CASE WHEN status = 'Completed' THEN amount ELSE 0 END) AS total_completed,
    SUM(CASE WHEN status = 'Pending' THEN amount ELSE 0 END) AS total_pending,
    SUM(CASE WHEN status = 'Cancelled' THEN amount ELSE 0 END) AS total_cancelled
FROM orders;
```

---

## 3. CASE con ORDER BY
Permite definir un orden personalizado de filas.

### Ejemplo
```sql
SELECT
    customer_id,
    name,
    region
FROM customers
ORDER BY 
    CASE region
        WHEN 'North' THEN 1
        WHEN 'East' THEN 2
        WHEN 'West' THEN 3
        WHEN 'South' THEN 4
        ELSE 5
    END,
    name ASC;
```

---

## 4. CASE en WHERE
Se puede usar para filtros condicionales, aunque normalmente es más claro usar OR/AND.

### Opción 1 – Usando OR/AND
```sql
SELECT *
FROM employees
WHERE 
    (department = 'IT' AND salary > 5000)
    OR (department = 'HR' AND salary > 3000)
    OR (department NOT IN ('IT', 'HR') AND salary > 2000);
```

### Opción 2 – Usando CASE
```sql
SELECT *
FROM employees
WHERE 
    CASE 
        WHEN department = 'IT' AND salary > 5000 THEN 1
        WHEN department = 'HR' AND salary > 3000 THEN 1
        WHEN department NOT IN ('IT', 'HR') AND salary > 2000 THEN 1
        ELSE 0
    END = 1;
```

---

## 5. Ejercicios de práctica
1. **Clasificar productos por precio**:  
   Tabla `products(product_id, name, price)`  
   - Low si < 20, Medium si entre 20 y 50, High si > 50.

```sql
SELECT
    product_id,
    name,
    CASE
        WHEN price < 20 THEN 'Low'
        WHEN price BETWEEN 20 AND 50 THEN 'Medium'
        ELSE 'High'
    END AS price_category
FROM products;
```

2. **Contar órdenes por estado**:  
   Tabla `orders(order_id, status)`  
   - Count Completed, Pending, Cancelled.

``` sql
SELECT 
    COUNT(CASE WHEN status='Completed' THEN 1 END) AS count_completed,
    COUNT(CASE WHEN status='Pending' THEN 1 END) AS count_pending,
    COUNT(CASE WHEN status='Cancelled' THEN 1 END) AS count_cancelled
FROM orders;
```

3. **Ventas mensuales por tipo de cliente**:  
   Tabla `sales(order_id, customer_type, total_amount, order_date)`  
   - Sumar por mes clientes New y Returning.

```sql
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(CASE WHEN customer_type = 'New' THEN total_amount ELSE 0 END) AS new_clients,
    SUM(CASE WHEN customer_type = 'Returning' THEN total_amount ELSE 0 END) AS returning_clients
FROM sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;
```


4. **Ordenar regiones de forma personalizada**:  
   Tabla `customers(customer_id, name, region)`  
   - Orden: North, East, West, South y luego por nombre.

```sql
SELECT *
FROM customers
ORDER BY CASE region
            WHEN 'North' THEN 1
            WHEN 'East' THEN 2
            WHEN 'South' THEN 3
            WHEN 'West' THEN 4
            ELSE 5
        END,
    name ASC;            
```

5. **Filtrar empleados según reglas por departamento**:  
   Tabla `employees(employee_id, department, salary)`  
   - IT > 5000, HR > 3000, otros > 2000.

```sql
SELECT *
FROM employees
WHERE
    CASE
        WHEN department = 'IT' AND salary > 5000 THEN 1
        WHEN department = 'HR' AND salary > 3000 THEN 1
        WHEN department NOT IN ('IT', 'HR') AND salary > 2000 THEN 1
        ELSE 0
    END=1;
```