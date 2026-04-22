# Revisión Prueba 1 - Dylan Hernández

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Relación Muchos a Muchos (10 pts)
**Puntaje: 7/10**

**Retroalimentación:**
- Define correctamente que "un tipo de tabla puede tener más de uno de otro tipo y viceversa" (2/3 definición).
- No menciona la tabla intermedia ni claves foráneas (0/3 implementación).
- Usa el ejemplo de Asignaciones y Agentes del esquema, correcto (3/3 ejemplo).
- Redacción clara y directa (1/1 precisión).

---

### Pregunta 2 - Vistas (10 pts)
**Puntaje: 6/10**

**Retroalimentación:**
- Define como "consulta a la cual se puede acceder fácilmente en cualquier momento", correcto (2/3 definición).
- Describe que es necesario juntar Incidentes y Asignaciones para obtener las horas, correcto conceptualmente (2/2 uso).
- No entrega la consulta SQL (0/4 consulta).
- Redacción clara (1/1 precisión).

---

### Pregunta 3 - Excepciones Predefinidas (10 pts)
**Puntaje: 6/10**

**Retroalimentación:**
- Define correctamente que son excepciones que pueden ocurrir y se manejan con WHEN (2/3 definición).
- Describe que NO_DATA_FOUND se maneja en la sección EXCEPTION con WHEN NO_DATA_FOUND y una acción como mensaje DBMS (2/2 uso NO_DATA_FOUND).
- No entrega ejemplo de código completo pero la descripción del manejo es correcta (1/4 ejemplo).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 4 - Cursores Explícitos (10 pts)
**Puntaje: 0/10**

**Retroalimentación:**
- No entregó respuesta.

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Cursor con Promedio > 30 (20 pts)
**Puntaje: 7/20**

**Retroalimentación:**
- El cursor tiene JOIN entre Agentes y Asignaciones, selecciona Nombre, Especialidad y Horas. Filtra por Horas > 30 individual en vez de AVG con GROUP BY/HAVING, pero demuestra comprensión del JOIN. `FOR UPDATE` está fuera del cursor (2/5 definición cursor).
- Usa OPEN, LOOP, FETCH, EXIT WHEN %NOTFOUND, CLOSE. Errores de sintaxis en FETCH (paréntesis, typo en variable) pero la estructura es correcta (3/5 uso cursor).
- La salida muestra agente y especialidad con DBMS_OUTPUT (1/5 salida).
- Código demuestra comprensión parcial (1/5 estructura).

---

### Ejercicio 2 - Cursor FOR UPDATE (20 pts)
**Puntaje: 0/20**

**Retroalimentación:**
- No entregó respuesta.

---

### Ejercicio 3 - Tipo de Objeto (20 pts)
**Puntaje: 0/20**

**Retroalimentación:**
- No entregó respuesta.

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Muchos a Muchos | 7/10 |
| P2 Teórica - Vistas | 6/10 |
| P3 Teórica - Excepciones | 6/10 |
| P4 Teórica - Cursores | 0/10 |
| E1 Práctica - Cursor Promedio | 7/20 |
| E2 Práctica - FOR UPDATE | 0/20 |
| E3 Práctica - Tipo Objeto | 0/20 |
| **TOTAL** | **26/100** |
