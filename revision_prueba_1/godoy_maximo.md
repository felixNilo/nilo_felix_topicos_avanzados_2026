# Revisión Prueba 1 - Máximo Godoy

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Relación Muchos a Muchos (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Define correctamente que una tabla puede tener conexión con otra, y que un agente puede estar en más de un incidente y viceversa (3/3 definición).
- No menciona explícitamente la tabla intermedia ni claves foráneas (1/3 implementación).
- Identifica correctamente Agentes, Incidentes y Asignaciones (3/3 ejemplo).
- Redacción clara (1/1 precisión).

---

### Pregunta 2 - Vistas (10 pts)
**Puntaje: 3/10**

**Retroalimentación:**
- Define como "esquema más ordenado de los datos", parcialmente correcto (1/3 definición).
- Menciona que evita ejecutar la tabla completa (1/2 uso).
- La consulta tiene sintaxis errónea y no usa JOIN, SUM ni GROUP BY (0/4 consulta).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 3 - Excepciones Predefinidas (10 pts)
**Puntaje: 7/10**

**Retroalimentación:**
- Define como "determinación de errores en el código", parcialmente correcto (2/3 definición).
- Describe que se usa cuando un dato no es encontrado (1/2 uso NO_DATA_FOUND).
- El ejemplo tiene un bloque PL/SQL completo con DECLARE, BEGIN, SELECT INTO, EXCEPTION WHEN NO_DATA_FOUND. Tiene errores menores de sintaxis (falta `||`) pero la estructura es correcta y demuestra comprensión (3/4 ejemplo).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 4 - Cursores Explícitos (10 pts)
**Puntaje: 5/10**

**Retroalimentación:**
- Define como "forma de unir tablas y variables", no es la definición más precisa pero entiende que procesa información (1/3 definición).
- No describe los pasos de uso (0/3 uso).
- Menciona %NOTFOUND y %ISOPEN con propósitos correctos (3/3 atributos).
- Redacción aceptable (1/1 precisión).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Cursor con Promedio > 30 (20 pts)
**Puntaje: 5/20**

**Retroalimentación:**
- El cursor no hace JOIN con Agentes, no calcula AVG, no usa GROUP BY ni HAVING (1/5 definición cursor).
- Usa OPEN y LOOP pero FETCH está invertido y usa `%NO_DATA_FOUND` que no existe (debería ser `%NOTFOUND`) (2/5 uso cursor).
- La salida muestra AgenteID y Horas en vez de Especialidad y Promedio (1/5 salida).
- Tiene bloque EXCEPTION. Código no funcional pero demuestra intento (1/5 estructura).

---

### Ejercicio 2 - Cursor FOR UPDATE (20 pts)
**Puntaje: 6/20**

**Retroalimentación:**
- Incluye FOR UPDATE pero no hace JOIN con Incidentes ni filtra por Severidad = 'Critical' (1/5 definición cursor).
- Mismos errores de FETCH que el ejercicio anterior (1/5 uso cursor).
- Intenta actualizar con WHERE CURRENT OF, pero calcula *1.10 en vez de +10 y `UPDATE Horas` es incorrecto (2/5 actualización).
- Tiene EXCEPTION con WHEN OTHERS y verifica %ISOPEN, bien (1/3 excepciones).
- Código no funcional pero demuestra comprensión parcial del patrón (1/2 estructura).

---

### Ejercicio 3 - Tipo de Objeto (20 pts)
**Puntaje: 7/20**

**Retroalimentación:**
- Crea el tipo con CREATE OR REPLACE TYPE, MEMBER FUNCTION y body con get_reporte. Tiene typos en atributos (`indicente_id`, `depcipcion`) pero la estructura es correcta (3/5 tipo).
- No crea tabla basada en el tipo (0/3 tabla).
- No transfiere datos (0/4 transferencia).
- El cursor no usa la tabla de objetos ni SELECT VALUE. Intenta llamar get_reporte() (2/5 cursor).
- Estructura parcial (2/3 estructura).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Muchos a Muchos | 8/10 |
| P2 Teórica - Vistas | 3/10 |
| P3 Teórica - Excepciones | 7/10 |
| P4 Teórica - Cursores | 5/10 |
| E1 Práctica - Cursor Promedio | 5/20 |
| E2 Práctica - FOR UPDATE | 6/20 |
| E3 Práctica - Tipo Objeto | 7/20 |
| **TOTAL** | **41/100** |
