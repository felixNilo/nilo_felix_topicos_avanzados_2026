# Revisión Prueba 1 - Matías Valencia

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Relación Muchos a Muchos (10 pts)
**Puntaje: 5/10**

**Retroalimentación:**
- Define que "permite relacionar un dato con una serie de datos de otra tabla y viceversa", parcialmente correcto (2/3 definición).
- Menciona "llaves foráneas" pero no explica la tabla intermedia (1/3 implementación).
- Usa ejemplo genérico (pedidos/productos) en vez del esquema de la prueba (1/3 ejemplo).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 2 - Vistas (10 pts)
**Puntaje: 5/10**

**Retroalimentación:**
- Define como "tabla creada para mostrar ciertos elementos y agilizar consultas", correcto (2/3 definición).
- No describe cómo consultarla (0/2 uso).
- La consulta usa CREATE OR REPLACE VIEW con JOIN y SUM/GROUP BY, pero tiene un JOIN innecesario con Agentes y condición incorrecta. Demuestra comprensión parcial (2/4 consulta).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 3 - Excepciones Predefinidas (10 pts)
**Puntaje: 5/10**

**Retroalimentación:**
- Define como "manera de mostrar errores en pantalla", parcialmente correcto (1/3 definición).
- Menciona NO_DATA_FOUND (1/2 uso NO_DATA_FOUND).
- El ejemplo muestra EXCEPTION WHEN NO_DATA_FOUND, correcto en sintaxis aunque no es bloque completo. Comillas dobles es error menor (2/4 ejemplo).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 4 - Cursores Explícitos (10 pts)
**Puntaje: 6/10**

**Retroalimentación:**
- Define como "procedimiento que recoge datos y los ejecuta en un bucle", parcialmente correcto (2/3 definición).
- No describe los pasos de uso (0/3 uso).
- Menciona %NOTFOUND y %ISOPEN con propósitos correctos (3/3 atributos).
- Redacción clara (1/1 precisión).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Cursor con Promedio > 30 (20 pts)
**Puntaje: 10/20**

**Retroalimentación:**
- El cursor tiene JOIN correcto, GROUP BY Especialidad, calcula AVG. Usa WHERE en vez de HAVING pero la intención es correcta (3/5 definición cursor).
- Usa OPEN, LOOP, FETCH, EXIT WHEN %NOTFOUND, CLOSE. Usa `ON` en vez de `INTO` en FETCH, error menor (4/5 uso cursor).
- Salida correcta con DBMS_OUTPUT (3/5 salida).
- Código no funcional por errores de sintaxis pero demuestra comprensión (0/5 estructura).

---

### Ejercicio 2 - Cursor FOR UPDATE (20 pts)
**Puntaje: 8/20**

**Retroalimentación:**
- Cursor con JOIN a Incidentes, WHERE Severidad, FOR UPDATE. Comillas dobles y `ON` en vez de `OF` son errores menores (3/5 definición cursor).
- Usa OPEN, LOOP, FETCH, EXIT WHEN. `ON` en vez de `INTO`, referencia cursor equivocado en EXIT WHEN (2/5 uso cursor).
- Usa UPDATE con SET Horas + 10, pero `FOR CURRENT OF` en vez de `WHERE CURRENT OF` (1/5 actualización).
- Tiene EXCEPTION WHEN NO_DATA_FOUND (1/3 excepciones).
- Código demuestra comprensión parcial (1/2 estructura).

---

### Ejercicio 3 - Tipo de Objeto (20 pts)
**Puntaje: 5/20**

**Retroalimentación:**
- Intenta crear el tipo pero usa sintaxis incorrecta (`METHOD FUNCTION`, `;` entre atributos). Demuestra que conoce el concepto (1/5 tipo).
- Crea tabla con sintaxis incorrecta (1/3 tabla).
- Inserta datos manualmente en vez de transferir con INSERT SELECT (1/4 transferencia).
- El cursor tiene errores de nombres inconsistentes y `ON` en vez de `INTO` (1/5 cursor).
- Código demuestra intento (1/3 estructura).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Muchos a Muchos | 5/10 |
| P2 Teórica - Vistas | 5/10 |
| P3 Teórica - Excepciones | 5/10 |
| P4 Teórica - Cursores | 6/10 |
| E1 Práctica - Cursor Promedio | 10/20 |
| E2 Práctica - FOR UPDATE | 8/20 |
| E3 Práctica - Tipo Objeto | 5/20 |
| **TOTAL** | **44/100** |
