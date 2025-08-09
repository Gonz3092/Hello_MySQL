# Notas – Módulo "We'll take the CASE"

## 1. Concepto principal
- **`CASE`** en SQL es una **expresión condicional** que permite devolver diferentes valores en función de condiciones específicas.
- Es el equivalente a un `IF...ELSE` en otros lenguajes de programación.
- Se puede usar en:
  - **SELECT** (para crear columnas calculadas)
  - **ORDER BY** (para ordenar según condiciones)
  - **WHERE** (para aplicar filtros condicionales)

---

## 2. Sintaxis básica
```sql
CASE
    WHEN condición_1 THEN resultado_1
    WHEN condición_2 THEN resultado_2
    ...
    ELSE resultado_por_defecto
END
```

**Ejemplo:**
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

## 3. Usos en el mundo real
- **Clasificar valores** (ej. productos baratos, medios, caros).
- **Convertir valores numéricos en categorías** (ej. puntaje en rango “Bajo”, “Medio”, “Alto”).
- **Agrupar lógicamente datos sin cambiar la tabla original**.
- **Definir reglas de negocio directamente en la consulta**.

---

## 4. Tips y errores comunes
✅ El orden de las condiciones **importa**: SQL evalúa de arriba hacia abajo y se detiene en la primera que cumple.  
✅ Siempre es buena práctica incluir un **`ELSE`** para manejar casos no contemplados.  
⚠ Si no pones `ELSE` y ninguna condición se cumple, el valor será **NULL**.  
⚠ `CASE` no es una función, es una **expresión**, así que **no lleva paréntesis**.

---

## 5. Mini–ejercicio de práctica
Tienes la tabla `employees(employee_id, name, salary)`.  
Crea una consulta que muestre el nombre y una columna `salary_level` que diga:
- "Low" si el salario < 3000
- "Medium" si el salario está entre 3000 y 6000
- "High" si el salario > 6000

💡 **Pista**: usa `CASE` dentro del `SELECT`.
