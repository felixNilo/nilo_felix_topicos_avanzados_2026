# Revisión Prueba 1 - Johann Cortés

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Relación Muchos a Muchos (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Define correctamente que "múltiples registros en una tabla pueden estar relacionados con múltiples registros en otra tabla" (3/3 definición).
- Explica que se usa una tabla intermedia con claves foráneas que referencian a las tablas principales (3/3 implementación).
- Muestra la tabla Asignaciones como ejemplo con sus FK, aunque copia la estructura de la tabla en vez de explicar con sus propias palabras (2/3 ejemplo).
- Redacción clara y técnica (1/1 precisión).

---

### Pregunta 2 - Vistas (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Define correctamente como "tabla virtual basada en el resultado de una consulta SQL" que no almacena datos. Menciona usos como simplificar consultas y mejorar seguridad (3/3 definición).
- Describe su uso para visualizar datos (1/2 uso - no menciona cómo consultarla después).
- La consulta es correcta: usa CREATE VIEW, JOIN entre Incidentes y Asignaciones, SUM(Horas), GROUP BY con las columnas correctas. Incluye IncidenteID que no se pedía pero no afecta (4/4 consulta).
- Redacción clara (1/1 precisión).

---

### Pregunta 3 - Excepciones Predefinidas (10 pts)
**Puntaje: 4/10**

**Retroalimentación:**
- Define correctamente que es una excepción definida por el sistema que se activa automáticamente (3/3 definición).
- No describe cuándo se lanza NO_DATA_FOUND específicamente (0/2 uso NO_DATA_FOUND).
- No entrega un ejemplo de código PL/SQL (0/4 ejemplo).
- Redacción clara pero respuesta incompleta (1/1 precisión).

Nota: La pregunta pedía explícitamente un ejemplo de código para manejar NO_DATA_FOUND.

---

### Pregunta 4 - Cursores Explícitos (10 pts)
**Puntaje: 4/10**

**Retroalimentación:**
- Define correctamente que es un cursor que el programador define y controla manualmente para manejar múltiples filas (3/3 definición).
- No describe los pasos de uso (OPEN, FETCH, CLOSE) (0/3 uso).
- No menciona atributos de cursor con su propósito (0/3 atributos).
- Redacción clara pero respuesta muy incompleta (1/1 precisión).

Nota: La pregunta pedía explícitamente mencionar al menos dos atributos de cursor.

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Cursor con Promedio > 30 (20 pts)
**Puntaje: 20/20**

**Retroalimentación:**
- Cursor correctamente definido con JOIN entre Agentes y Asignaciones, GROUP BY Especialidad, HAVING AVG > 30 (5/5 definición cursor).
- Manejo manual correcto: OPEN, FETCH, EXIT WHEN %NOTFOUND, CLOSE (5/5 uso cursor).
- Salida correcta con DBMS_OUTPUT mostrando especialidad y promedio redondeado (5/5 salida).
- Código bien estructurado y funcional (5/5 estructura).

---

### Ejercicio 2 - Cursor FOR UPDATE (20 pts)
**Puntaje: 20/20**

**Retroalimentación:**
- Cursor correctamente definido con JOIN a Incidentes, WHERE Severidad = 'Critical', FOR UPDATE OF a.Horas (5/5 definición cursor).
- Manejo manual correcto: OPEN, FETCH, EXIT WHEN %NOTFOUND, CLOSE (5/5 uso cursor).
- Actualización correcta con WHERE CURRENT OF, suma Horas + 10 (5/5 actualización).
- Maneja excepciones con WHEN OTHERS, verifica %ISOPEN para cerrar cursor, incluye COMMIT (3/3 excepciones).
- Código funcional y bien estructurado (2/2 estructura).

---

### Ejercicio 3 - Tipo de Objeto (20 pts)
**Puntaje: 20/20**

**Retroalimentación:**
- Crea tipo incidente_obj con AS OBJECT, atributos correctos y método get_reporte. Body implementa correctamente el método con RETURN usando self (5/5 tipo).
- Crea tabla OF incidente_obj, incluye DROP previo para evitar errores (3/3 tabla).
- Transfiere datos con INSERT SELECT usando constructor del tipo, incluye COMMIT (4/4 transferencia).
- Cursor con SELECT VALUE(t), FETCH, EXIT WHEN %NOTFOUND, llama get_reporte() (5/5 cursor).
- Código completamente funcional y bien estructurado (3/3 estructura).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Muchos a Muchos | 9/10 |
| P2 Teórica - Vistas | 9/10 |
| P3 Teórica - Excepciones | 4/10 |
| P4 Teórica - Cursores | 4/10 |
| E1 Práctica - Cursor Promedio | 20/20 |
| E2 Práctica - FOR UPDATE | 20/20 |
| E3 Práctica - Tipo Objeto | 20/20 |
| **TOTAL** | **86/100** |
