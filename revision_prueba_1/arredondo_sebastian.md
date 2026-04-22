# Revisión Prueba 1 - Sebastián Arredondo

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Relación Muchos a Muchos (10 pts)
**Puntaje: 7/10**

**Retroalimentación:**
- La definición es algo confusa en la redacción, pero se entiende la idea de que ambos lados pueden tener múltiples relaciones (2/3 definición).
- No menciona explícitamente la tabla intermedia ni claves foráneas (1/3 implementación).
- Identifica la relación entre Agentes e Incidentes del esquema. El ejemplo del supermercado es adicional y válido (3/3 ejemplo).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 2 - Vistas (10 pts)
**Puntaje: 6/10**

**Retroalimentación:**
- Define la vista como tabla basada en consultas existentes para visualizar datos de forma legible, correcto en esencia (2/3 definición).
- Describe su aplicación para datos con identificadores relacionales (1/2 uso).
- La consulta tiene JOIN y GROUP BY correctos con SUM(Horas). Usa `FROM` en vez de `AS` y falta Severidad en el SELECT, pero la lógica de agregación es correcta (2/4 consulta).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 3 - Excepciones Predefinidas (10 pts)
**Puntaje: 7/10**

**Retroalimentación:**
- Define las excepciones como condicionales estándar para identificar conflictos, parcialmente correcto (2/3 definición).
- Menciona error de dato, tipo y falta de existencia como casos (1/2 uso NO_DATA_FOUND).
- El ejemplo usa un PROCEDURE con SELECT INTO y EXCEPTION WHEN NO_DATA_FOUND con DBMS_OUTPUT. La estructura es correcta y demuestra comprensión del manejo de la excepción, aunque falta END y declaración de variable (3/4 ejemplo).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 4 - Cursores Explícitos (10 pts)
**Puntaje: 7/10**

**Retroalimentación:**
- Define el cursor como mecanismo para iterar y almacenar datos, correcto en esencia (2/3 definición).
- Menciona que almacena info para consultas complejas sin errores de row multiple (1/3 uso).
- Menciona %NOTFOUND y %ISOPEN con propósitos correctos (3/3 atributos).
- Redacción clara (1/1 precisión).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Cursor con Promedio > 30 (20 pts)
**Puntaje: 5/20**

**Retroalimentación:**
- Envuelve en PROCEDURE innecesariamente. El cursor tiene JOINs correctos entre Asignaciones, Incidentes y Agentes, pero selecciona Horas individuales sin AVG ni GROUP BY por Especialidad (2/5 definición cursor).
- Usa OPEN y LOOP pero falta EXIT WHEN %NOTFOUND (1/5 uso cursor).
- La salida con DBMS_OUTPUT está presente pero no muestra especialidad ni promedio (1/5 salida).
- Código no funcional pero demuestra intento con JOINs correctos (1/5 estructura).

---

### Ejercicio 2 - Cursor FOR UPDATE (20 pts)
**Puntaje: 11/20**

**Retroalimentación:**
- El cursor tiene JOIN correcto con Incidentes, WHERE Severidad, FOR UPDATE. Comillas dobles es error menor bajo presión (3/5 definición cursor).
- Usa OPEN, FETCH, EXIT WHEN %NOTFOUND correctamente. Tiene CLOSE (4/5 uso cursor).
- Usa WHERE CURRENT OF correctamente. Calcula `* 1.10` (10%) en vez de `+ 10`, error de interpretación pero demuestra comprensión del mecanismo de actualización con cursor (2/5 actualización).
- Incluye COMMIT pero no tiene bloque EXCEPTION formal (1/3 excepciones).
- Estructura parcial (1/2 estructura).

---

### Ejercicio 3 - Tipo de Objeto (20 pts)
**Puntaje: 16/20**

**Retroalimentación:**
- Crea el tipo con atributos y método get_reporte. Typo en `objet` es error menor. El body retorna solo incidente_id (incompleto, debería incluir descripcion), pero la estructura tipo + body es correcta (3/5 tipo).
- Crea la tabla con OF incidente_obj, correcto (3/3 tabla).
- Transfiere datos con INSERT SELECT usando constructor del tipo, correcto (4/4 transferencia).
- Cursor con SELECT VALUE(i), OPEN, FETCH, EXIT WHEN %NOTFOUND, CLOSE, llama get_reporte(). Bien implementado (4/5 cursor).
- Código mayormente funcional, buen trabajo (2/3 estructura).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Muchos a Muchos | 7/10 |
| P2 Teórica - Vistas | 6/10 |
| P3 Teórica - Excepciones | 7/10 |
| P4 Teórica - Cursores | 7/10 |
| E1 Práctica - Cursor Promedio | 5/20 |
| E2 Práctica - FOR UPDATE | 11/20 |
| E3 Práctica - Tipo Objeto | 16/20 |
| **TOTAL** | **59/100** |
