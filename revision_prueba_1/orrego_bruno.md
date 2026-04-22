# Revisión Prueba 1 - Bruno Orrego

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Relación Muchos a Muchos (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Define correctamente que "múltiples registros en una tabla se asocian a otros múltiples registros" (3/3 definición).
- Menciona tabla intermedia con claves foráneas de ambas, correcto (3/3 implementación).
- El ejemplo usa nombres propios (Trabajo_Incidente, Tecnicos) en vez de los del esquema, pero la pregunta pide ejemplo del esquema (1/3 ejemplo).
- Redacción clara (1/1 precisión).

---

### Pregunta 2 - Vistas (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Define como "tabla virtual", correcto (2/3 definición).
- Menciona que se usa para visualizar datos (1/2 uso).
- La consulta es correcta: CREATE VIEW con JOIN, SUM(horas), GROUP BY. Lógica SQL impecable (4/4 consulta).
- Redacción clara (1/1 precisión).

Nota: Usa nombres de tabla propios pero la lógica y estructura SQL son perfectas.

---

### Pregunta 3 - Excepciones Predefinidas (10 pts)
**Puntaje: 6/10**

**Retroalimentación:**
- Define como "errores de Oracle", correcto (2/3 definición).
- Menciona NO_DATA_FOUND y EXCEPTION para evitar caídas (1/2 uso NO_DATA_FOUND).
- El ejemplo es solo una línea de EXCEPTION, no es bloque completo pero la sintaxis es correcta (2/4 ejemplo).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 4 - Cursores Explícitos (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Define correctamente como "puntero en memoria para consultas de múltiples filas paso a paso" (3/3 definición).
- Menciona OPEN y FETCH (2/3 uso).
- Menciona %NOTFOUND y %ROWCOUNT con propósitos correctos (3/3 atributos).
- Falta mencionar CLOSE (0/1 precisión).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Cursor con Promedio > 30 (20 pts)
**Puntaje: 15/20**

**Retroalimentación:**
- Cursor correctamente definido con JOIN, GROUP BY Especialidad, HAVING AVG > 30 (5/5 definición cursor).
- Usa FOR ... LOOP en vez de manejo manual. Válido pero se esperaba manejo manual (-2 pts) (3/5 uso cursor).
- Salida correcta con DBMS_OUTPUT mostrando especialidad y promedio redondeado (5/5 salida).
- Código funcional, falta `/` al final (2/5 estructura).

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
| P1 Teórica - Muchos a Muchos | 8/10 |
| P2 Teórica - Vistas | 9/10 |
| P3 Teórica - Excepciones | 6/10 |
| P4 Teórica - Cursores | 8/10 |
| E1 Práctica - Cursor Promedio | 15/20 |
| E2 Práctica - FOR UPDATE | 0/20 |
| E3 Práctica - Tipo Objeto | 0/20 |
| **TOTAL** | **46/100** |
