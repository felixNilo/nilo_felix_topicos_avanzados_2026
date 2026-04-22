# Revisión Prueba 1 - Matías Olivares

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Relación Muchos a Muchos (10 pts)
**Puntaje: 0/10**

**Retroalimentación:**
- No entregó respuesta para la Pregunta 1. El archivo comienza desde la Pregunta 2 (Vistas).

Nota: El estudiante numeró sus preguntas teóricas como 1, 2, 3 pero corresponden a las preguntas 2, 3 y 4 de la prueba. No respondió la pregunta sobre relación muchos a muchos.

---

### Pregunta 2 - Vistas (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Define correctamente como "tabla virtual basada en el resultado de una consulta SQL" que "no almacena datos físicamente" (3/3 definición).
- Describe usos como simplificar consultas complejas y restringir acceso a datos sensibles (2/2 uso).
- La consulta usa CREATE OR REPLACE VIEW, JOIN entre Incidentes y Asignaciones, SUM(horas) y GROUP BY correctamente (4/4 consulta).
- Redacción clara (0/1 precisión).

---

### Pregunta 3 - Excepciones Predefinidas (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Define correctamente como "error común de Oracle que ya tiene un nombre asignado por el sistema" con ejemplos (3/3 definición).
- Describe que se manejan en el bloque EXCEPTION con WHEN nombre_excepcion THEN (2/2 uso NO_DATA_FOUND).
- El ejemplo es un bloque PL/SQL completo con DECLARE, BEGIN, SELECT INTO con ID inexistente, EXCEPTION WHEN NO_DATA_FOUND (3/4 ejemplo).
- Redacción clara (1/1 precisión).

---

### Pregunta 4 - Cursores Explícitos (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Define correctamente como "área de memoria nombrada que el programador controla manualmente para procesar consultas de múltiples filas" (3/3 definición).
- Describe los pasos: declarar (CURSOR), abrir (OPEN), leer fila por fila (FETCH), cerrar (CLOSE) (3/3 uso).
- Menciona %NOTFOUND y %ROWCOUNT con sus propósitos correctos (3/3 atributos).
- Redacción clara y bien estructurada (1/1 precisión).

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
**Puntaje: 18/20**

**Retroalimentación:**
- Cursor con JOIN a Incidentes, WHERE severidad = 'Critical', FOR UPDATE OF a.horas. Correcto (5/5 definición cursor).
- Manejo manual correcto: OPEN, FETCH, EXIT WHEN %NOTFOUND, CLOSE (5/5 uso cursor).
- Actualización correcta con WHERE CURRENT OF, suma horas + 10 (5/5 actualización).
- Maneja excepciones con WHEN OTHERS, ROLLBACK, incluye COMMIT (3/3 excepciones).
- Código funcional (0/2 estructura).

---

### Ejercicio 3 - Tipo de Objeto (20 pts)
**Puntaje: 20/20**

**Retroalimentación:**
- Crea tipo incidente_obj con AS OBJECT, atributos correctos y método get_reporte. Body implementa correctamente con SELF (5/5 tipo).
- Crea tabla OF incidente_obj (3/3 tabla).
- Transfiere datos con INSERT SELECT usando constructor del tipo, incluye COMMIT (4/4 transferencia).
- Cursor con SELECT VALUE(t), FETCH, EXIT WHEN %NOTFOUND, llama get_reporte() (5/5 cursor).
- Código funcional y bien estructurado (3/3 estructura).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Muchos a Muchos | 0/10 |
| P2 Teórica - Vistas | 9/10 |
| P3 Teórica - Excepciones | 9/10 |
| P4 Teórica - Cursores | 10/10 |
| E1 Práctica - Cursor Promedio | 20/20 |
| E2 Práctica - FOR UPDATE | 18/20 |
| E3 Práctica - Tipo Objeto | 20/20 |
| **TOTAL** | **86/100** |
