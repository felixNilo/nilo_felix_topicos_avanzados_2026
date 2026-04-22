# Revisión Prueba 1 - Gabriel Jorquera

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Relación Muchos a Muchos (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Define correctamente que "registros de una tabla A están relacionados a muchos registros de una tabla B y viceversa" (3/3 definición).
- Explica que se emplea una tabla intermedia con relaciones uno a muchos a ambas tablas (3/3 implementación).
- No usa un ejemplo específico del esquema de la prueba, pero la explicación es sólida (2/3 ejemplo).
- Redacción técnica y clara (1/1 precisión).

---

### Pregunta 2 - Vistas (10 pts)
**Puntaje: 6/10**

**Retroalimentación:**
- Define como "respuesta de una consulta almacenada con un nombre", correcto (2/3 definición).
- Describe que usaría un JOIN entre Incidentes y Asignaciones (1/2 uso).
- La consulta usa CREATE OR REPLACE VIEW y LEFT JOIN, pero no usa SUM ni GROUP BY para calcular el total (2/4 consulta).
- Redacción clara (1/1 precisión).

---

### Pregunta 3 - Excepciones Predefinidas (10 pts)
**Puntaje: 7/10**

**Retroalimentación:**
- Define correctamente como "bloque controlado por el motor para controlar el flujo cuando un error surge" (3/3 definición).
- Describe que se maneja atrapando el error en EXCEPTION (1/2 uso NO_DATA_FOUND).
- El ejemplo muestra el bloque EXCEPTION con WHEN NO_DATA_FOUND. No es un bloque completo pero la sintaxis es correcta (2/4 ejemplo).
- Redacción clara (1/1 precisión).

---

### Pregunta 4 - Cursores Explícitos (10 pts)
**Puntaje: 7/10**

**Retroalimentación:**
- Define como "puntero que procesa cada registro de una tabla", correcto. Menciona DECLARE y LOOP (2/3 definición).
- Menciona que se necesita cerrar el cursor, pero no describe OPEN y FETCH explícitamente (2/3 uso).
- Menciona %NOTFOUND correctamente. FOR UPDATE no es un atributo de cursor sino una cláusula, pero demuestra conocimiento de su uso con cursores (2/3 atributos).
- Redacción clara (1/1 precisión).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Cursor con Promedio > 30 (20 pts)
**Puntaje: 7/20**

**Retroalimentación:**
- El cursor tiene INNER JOIN correcto y calcula AVG. Usa HAVING SUM en vez de HAVING AVG, y el GROUP BY está después del HAVING (orden incorrecto). Usa `AS` en vez de `IS` (2/5 definición cursor).
- Usa OPEN y FETCH pero no tiene LOOP ni EXIT WHEN %NOTFOUND dentro de un loop. No cierra el cursor (2/5 uso cursor).
- La salida con DBMS_OUTPUT está presente pero incompleta (1/5 salida).
- Tiene bloque EXCEPTION. Código parcialmente funcional (2/5 estructura).

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
| P1 Teórica - Muchos a Muchos | 9/10 |
| P2 Teórica - Vistas | 6/10 |
| P3 Teórica - Excepciones | 7/10 |
| P4 Teórica - Cursores | 7/10 |
| E1 Práctica - Cursor Promedio | 7/20 |
| E2 Práctica - FOR UPDATE | 0/20 |
| E3 Práctica - Tipo Objeto | 0/20 |
| **TOTAL** | **36/100** |
