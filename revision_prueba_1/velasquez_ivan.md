# Revisión Prueba 1 - Iván Velásquez

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Relación Muchos a Muchos (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Define correctamente que "N elementos de una tabla 1 tiene M elementos de una tabla 2, o viceversa" y que se necesita una tabla intermedia (3/3 definición).
- Explica que se necesita una tabla intermedia para realizarla (3/3 implementación).
- Identifica correctamente Asignaciones como tabla intermedia entre Agentes e Incidentes, con ejemplos específicos de datos (agente 101 en incidentes 201 y 204, incidente 201 con agentes 101, 102 y 104) (3/3 ejemplo).
- Redacción clara y técnica (1/1 precisión).

---

### Pregunta 2 - Vistas (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Define correctamente como "tipo de tabla que se crea en base a consultas/subconsultas de tablas ya existentes" para visualizar y filtrar datos (3/3 definición).
- Describe que permite visualizar horas totales por incidente sin repetir la consulta (2/2 uso).
- La consulta es correcta: CREATE OR REPLACE VIEW con JOIN entre Incidentes y Asignaciones, SUM(Horas) AS TotalHoras, GROUP BY con IncidenteID, Descripcion, Severidad (4/4 consulta).
- Redacción clara (1/1 precisión).

---

### Pregunta 3 - Excepciones Predefinidas (10 pts)
**Puntaje: 5/10**

**Retroalimentación:**
- Define como "funciones encargadas de señalar errores comunes ya instanciadas en PL/SQL", parcialmente correcto (2/3 definición).
- Describe que NO_DATA_FOUND señala que no se encontró un dato solicitado por una consulta (1/2 uso NO_DATA_FOUND).
- No entrega un ejemplo de código PL/SQL con bloque EXCEPTION (0/4 ejemplo).
- Redacción clara (1/1 precisión) pero falta el ejemplo que se pedía explícitamente.

Nota: La pregunta pedía explícitamente un ejemplo de código.

---

### Pregunta 4 - Cursores Explícitos (10 pts)
**Puntaje: 6/10**

**Retroalimentación:**
- Define como "tipo de puntero encargado de buscar y recorrer tablas de manera dinámica", correcto (2/3 definición).
- Menciona DECLARE, LOOP, FETCH, %NOTFOUND, CLOSE pero no menciona OPEN explícitamente (2/3 uso).
- Solo menciona %NOTFOUND como atributo. No menciona un segundo atributo con su propósito (1.5/3 atributos).
- Redacción clara (0.5/1 precisión).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Cursor con Promedio > 30 (20 pts)
**Puntaje: 16/20**

**Retroalimentación:**
- Cursor correctamente definido con JOIN entre Agentes y Asignaciones, GROUP BY Especialidad, HAVING AVG > 30 (5/5 definición cursor).
- Manejo manual correcto: OPEN, FETCH, EXIT WHEN %NOTFOUND, CLOSE (5/5 uso cursor).
- Salida correcta con DBMS_OUTPUT mostrando especialidad y promedio (5/5 salida).
- Tiene un error: después de CLOSE intenta usar `agentes_cursor%NOTFOUND` fuera del cursor (ya cerrado), lo cual generaría error. Tiene EXCEPTION con WHEN OTHERS y %ISOPEN (1/5 estructura).

---

### Ejercicio 2 - Cursor FOR UPDATE (20 pts)
**Puntaje: 16/20**

**Retroalimentación:**
- Cursor con JOIN a Incidentes, WHERE Severidad = 'Critical', FOR UPDATE. Correcto. Sin embargo, la variable `v_horas` está declarada dentro del cursor en vez de en la sección DECLARE (4/5 definición cursor).
- Manejo manual correcto: OPEN, FETCH, EXIT WHEN %NOTFOUND, CLOSE (5/5 uso cursor).
- Actualización correcta con WHERE CURRENT OF, suma v_horas + 10 (5/5 actualización).
- Tiene EXCEPTION con WHEN OTHERS y verifica %ISOPEN, pero no incluye ROLLBACK ni COMMIT (1/3 excepciones).
- Código mayormente funcional (1/2 estructura).

---

### Ejercicio 3 - Tipo de Objeto (20 pts)
**Puntaje: 19/20**

**Retroalimentación:**
- Crea tipo incidente_obj con AS OBJECT, atributos correctos y método get_reporte. Body implementa correctamente el método (5/5 tipo).
- Crea tabla OF incidente_obj con PRIMARY KEY (3/3 tabla).
- Transfiere datos con INSERT SELECT desde Incidentes (4/4 transferencia).
- Cursor con SELECT VALUE(i), FETCH, EXIT WHEN %NOTFOUND, llama get_reporte (sin paréntesis, pero funciona en Oracle). Tiene EXCEPTION (5/5 cursor).
- Código funcional y bien estructurado (2/3 estructura).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Muchos a Muchos | 10/10 |
| P2 Teórica - Vistas | 10/10 |
| P3 Teórica - Excepciones | 5/10 |
| P4 Teórica - Cursores | 6/10 |
| E1 Práctica - Cursor Promedio | 16/20 |
| E2 Práctica - FOR UPDATE | 16/20 |
| E3 Práctica - Tipo Objeto | 19/20 |
| **TOTAL** | **82/100** |
