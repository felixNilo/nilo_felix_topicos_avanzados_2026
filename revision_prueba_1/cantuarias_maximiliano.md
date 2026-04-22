# Revisión Prueba 1 - Maximiliano Cantuarias

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Relación Muchos a Muchos (10 pts)
**Puntaje: 7/10**

**Retroalimentación:**
- Define que "2 tablas se relacionan con 1 o más valores y se pueden repetir para ambas partes", se entiende el concepto (2/3 definición).
- No menciona explícitamente la tabla intermedia ni claves foráneas (0/3 implementación).
- Usa el ejemplo correcto de Incidentes y Agentes del esquema de la prueba (3/3 ejemplo).
- Redacción clara y directa (1/1 precisión).

Nota: Falta explicar cómo se implementa (tabla intermedia con FK).

---

### Pregunta 2 - Vistas (10 pts)
**Puntaje: 5/10**

**Retroalimentación:**
- Define la vista como "shortcut a una consulta" y "consulta almacenada a un nombre", correcto en esencia (2/3 definición).
- No describe cómo se usaría para consultar (0/2 uso).
- La consulta no usa CREATE VIEW, no usa SUM ni GROUP BY. Usa `RIGHT` incorrectamente en el JOIN (1/4 consulta).
- Redacción clara (1/1 precisión).

---

### Pregunta 3 - Excepciones Predefinidas (10 pts)
**Puntaje: 5/10**

**Retroalimentación:**
- Define como "error genérico definido de fábrica", parcialmente correcto (2/3 definición).
- Aclara que NO_DATA_FOUND no es lo mismo que NULL, lo cual muestra comprensión (2/2 uso NO_DATA_FOUND).
- No entrega ejemplo de código PL/SQL (0/4 ejemplo).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 4 - Cursores Explícitos (10 pts)
**Puntaje: 5/10**

**Retroalimentación:**
- Define que el cursor "apunta al valor que decidamos" y se crea con CURSOR asignando una consulta, correcto (2/3 definición).
- Menciona FETCH para iterar pero no el ciclo completo (1/3 uso).
- Menciona %NOTFOUND correctamente. %ROWTYPE no es atributo de cursor sino de tabla (1/3 atributos).
- Redacción aceptable (1/1 precisión).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Cursor con Promedio > 30 (20 pts)
**Puntaje: 3/20**

**Retroalimentación:**
- Archivo incompleto. Solo tiene una consulta SELECT y un cursor parcialmente declarado. Usa SUM en vez de AVG, agrupa por AgenteID en vez de Especialidad (1/5 definición cursor).
- No tiene bloque BEGIN/END ni manejo de cursor (0/5 uso cursor).
- No hay salida (0/5 salida).
- Código completamente incompleto (2/5 estructura - al menos intenta declarar el cursor).

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
| P2 Teórica - Vistas | 5/10 |
| P3 Teórica - Excepciones | 5/10 |
| P4 Teórica - Cursores | 5/10 |
| E1 Práctica - Cursor Promedio | 3/20 |
| E2 Práctica - FOR UPDATE | 0/20 |
| E3 Práctica - Tipo Objeto | 0/20 |
| **TOTAL** | **25/100** |
