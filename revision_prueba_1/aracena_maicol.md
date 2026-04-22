# Revisión Prueba 1 - Maicol Aracena

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Relación Muchos a Muchos (10 pts)
**Puntaje: 7/10**

**Retroalimentación:**
- Entiende que se necesita una tabla intermediaria con PK propia y FK de ambas tablas, lo cual es correcto (3/3 implementación).
- La definición es algo confusa y la mención de "atomicidad" no es correcta en este contexto, pero se entiende la idea general (1/3 definición).
- Identifica la relación entre Agentes e Incidentes a través de Asignaciones (2/3 ejemplo).
- Redacción mejorable (1/1 precisión).

---

### Pregunta 2 - Vistas (10 pts)
**Puntaje: 5/10**

**Retroalimentación:**
- Define la vista como algo para simplificar el trabajo y evitar código redundante, parcialmente correcto (2/3 definición).
- No describe cómo consultarla después (0/2 uso).
- La consulta usa CREATE OR REPLACE VIEW y JOIN, lo cual muestra comprensión de la estructura. Sin embargo, `FROM * Asignaciones` es incorrecto y falta SUM/GROUP BY para el total de horas (2/4 consulta).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 3 - Excepciones Predefinidas (10 pts)
**Puntaje: 5/10**

**Retroalimentación:**
- Explica que es una parte del código que maneja errores, y que se usa en bloques anónimos. Parcialmente correcto (2/3 definición).
- Describe correctamente que NO_DATA_FOUND se activa cuando no se encuentra un dato buscado (2/2 uso de NO_DATA_FOUND).
- No entrega ejemplo de código, pero la explicación conceptual es aceptable (0/4 ejemplo).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 4 - Cursores Explícitos (10 pts)
**Puntaje: 5/10**

**Retroalimentación:**
- Menciona CURSOR y OPEN para iterar sobre datos de tablas, demuestra comprensión básica (2/3 definición).
- Describe parcialmente el uso pero no el ciclo completo (1/3 uso).
- Menciona %NOTFOUND correctamente con su sintaxis. UPDATE no es un atributo de cursor pero demuestra que entiende que se puede actualizar dentro de un cursor (1/3 atributos).
- Redacción aceptable (1/1 precisión).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Cursor con Promedio > 30 (20 pts)
**Puntaje: 12/20**

**Retroalimentación:**
- El cursor tiene JOIN correcto entre Agentes y Asignaciones, GROUP BY por Especialidad. Usa `SUM(AVG(...))` que es incorrecto (debería ser solo AVG) y WHERE en vez de HAVING, pero la intención es clara (3/5 definición cursor).
- Manejo manual correcto: OPEN, FETCH, EXIT WHEN %NOTFOUND, CLOSE. Bien estructurado (5/5 uso cursor).
- Salida correcta con DBMS_OUTPUT mostrando especialidad y horas (3/5 salida).
- Estructura general buena, errores de sintaxis menores bajo presión de prueba (1/5 estructura).

---

### Ejercicio 2 - Cursor FOR UPDATE (20 pts)
**Puntaje: 12/20**

**Retroalimentación:**
- El cursor tiene JOIN con Incidentes, filtra por Severidad, incluye FOR UPDATE (typo: UDPATE). Usa `AS` en vez de `IS` y comillas dobles, pero la lógica es correcta (3/5 definición cursor).
- Usa OPEN, FETCH, EXIT WHEN %NOTFOUND, CLOSE. Faltan `;` pero la estructura es correcta (4/5 uso cursor).
- Calcula v_horas + 10 y usa WHERE CURRENT OF, correcto. El `;=" es typo de ":=" (4/5 actualización).
- Maneja excepciones con WHEN OTHERS, verifica %ISOPEN. Tiene typos (`ENDI IF;;`) pero la intención es correcta. Falta ROLLBACK (1/3 excepciones).
- Código demuestra comprensión aunque tiene errores de sintaxis (0/2 estructura).

---

### Ejercicio 3 - Tipo de Objeto (20 pts)
**Puntaje: 1/20**

**Retroalimentación:**
- Solo escribe la línea de CREATE TYPE con paréntesis vacíos. No hay contenido real (1/20).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Muchos a Muchos | 7/10 |
| P2 Teórica - Vistas | 5/10 |
| P3 Teórica - Excepciones | 5/10 |
| P4 Teórica - Cursores | 5/10 |
| E1 Práctica - Cursor Promedio | 12/20 |
| E2 Práctica - FOR UPDATE | 12/20 |
| E3 Práctica - Tipo Objeto | 1/20 |
| **TOTAL** | **47/100** |
