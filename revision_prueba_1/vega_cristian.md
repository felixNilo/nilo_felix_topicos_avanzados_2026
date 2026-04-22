# Revisión Prueba 1 - Cristian Vega

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Relación Muchos a Muchos (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Define correctamente que se necesita tabla intermediaria con PRIMARY KEY de ambas tablas como FOREIGN KEY (3/3 definición).
- Explica la implementación con tabla intermedia y claves foráneas (3/3 implementación).
- Identifica correctamente Asignaciones entre Agentes e Incidentes con sus FK (3/3 ejemplo).
- Errores ortográficos menores (0/1 precisión).

---

### Pregunta 2 - Vistas (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Define como "forma de enseñar datos de manera eficiente y específica" y "resumir consultas", correcto (2/3 definición).
- Describe que no sería necesario generar la consulta cada vez (1/2 uso).
- La consulta usa CREATE VIEW con INNER JOIN y SUM(Horas), GROUP BY. La lógica SQL es correcta (4/4 consulta).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 3 - Excepciones Predefinidas (10 pts)
**Puntaje: 5/10**

**Retroalimentación:**
- Define como algo que "sirve para definir casos de errores", parcialmente correcto (1/3 definición).
- No describe específicamente NO_DATA_FOUND (0/2 uso NO_DATA_FOUND).
- El ejemplo muestra EXCEPTION con WHEN OTHERS y verifica %ISOPEN. No usa WHEN NO_DATA_FOUND como se pedía, pero demuestra manejo de excepciones (2/4 ejemplo).
- Redacción aceptable (1/1 precisión).

Nota: El ejemplo no maneja NO_DATA_FOUND sino WHEN OTHERS.

---

### Pregunta 4 - Cursores Explícitos (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Define que sirve para enseñar datos de una tabla, parcialmente correcto (2/3 definición).
- Incluye un ejemplo de código completo con DECLARE, OPEN, LOOP, FETCH, EXIT WHEN %NOTFOUND, CLOSE que demuestra uso completo (3/3 uso).
- Menciona %NOTFOUND como condición para cerrar el LOOP (2/3 atributos).
- Redacción aceptable (1/1 precisión).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Cursor con Promedio > 30 (20 pts)
**Puntaje: 15/20**

**Retroalimentación:**
- El cursor tiene JOIN correcto, GROUP BY con HAVING AVG > 30. Selecciona también Nombre y agrupa por agente individual en vez de solo por especialidad, pero la lógica de filtrado es correcta (4/5 definición cursor).
- Manejo manual correcto: OPEN, FETCH, EXIT WHEN %NOTFOUND, CLOSE (5/5 uso cursor).
- Salida muestra nombre, especialidad y promedio (3/5 salida).
- Tiene EXCEPTION con WHEN OTHERS y %ISOPEN. Código funcional (3/5 estructura).

---

### Ejercicio 2 - Cursor FOR UPDATE (20 pts)
**Puntaje: 16/20**

**Retroalimentación:**
- Cursor con JOIN a Incidentes, WHERE severidad = 'Critical', FOR UPDATE. Correcto (5/5 definición cursor).
- Manejo manual correcto: OPEN, FETCH, EXIT WHEN %NOTFOUND, CLOSE (5/5 uso cursor).
- Usa UPDATE con SET Horas + 10 y WHERE CURRENT OF. El nombre del cursor en WHERE CURRENT OF no coincide exactamente, error menor de tipeo (4/5 actualización).
- Tiene EXCEPTION con WHEN OTHERS y %ISOPEN, falta ROLLBACK (1/3 excepciones).
- Código mayormente funcional (1/2 estructura).

---

### Ejercicio 3 - Tipo de Objeto (20 pts)
**Puntaje: 0/20**

**Retroalimentación:**
- No entregó respuesta.

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Muchos a Muchos | 9/10 |
| P2 Teórica - Vistas | 8/10 |
| P3 Teórica - Excepciones | 5/10 |
| P4 Teórica - Cursores | 8/10 |
| E1 Práctica - Cursor Promedio | 15/20 |
| E2 Práctica - FOR UPDATE | 16/20 |
| E3 Práctica - Tipo Objeto | 0/20 |
| **TOTAL** | **61/100** |
