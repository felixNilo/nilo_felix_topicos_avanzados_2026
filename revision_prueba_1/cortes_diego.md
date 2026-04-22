# Revisión Prueba 1 - Diego Cortés

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Relación Muchos a Muchos (10 pts)
**Puntaje: 6/10**

**Retroalimentación:**
- Define parcialmente: "2 tablas se relacionan" con "muchos incidentes para muchos agentes", se entiende el concepto (2/3 definición).
- Menciona que se debe crear una tabla intermediaria, correcto (1/3 implementación).
- Intenta crear la tabla intermedia como ejemplo con FK, demuestra comprensión aunque tiene errores de sintaxis (`FOREING KEY`, nombres incorrectos) (2/3 ejemplo).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 2 - Vistas (10 pts)
**Puntaje: 2/10**

**Retroalimentación:**
- Define como "función para hacer interactuar tablas", muy vago (1/3 definición).
- No describe cómo se usaría (0/2 uso).
- La consulta tiene errores graves: `crate` en vez de `CREATE`, no hace JOIN con Asignaciones, no usa SUM ni GROUP BY (0/4 consulta).
- Redacción poco clara (1/1 precisión).

---

### Pregunta 3 - Excepciones Predefinidas (10 pts)
**Puntaje: 5/10**

**Retroalimentación:**
- Define como "excepción que ya viene integrada", correcto aunque breve (2/3 definición).
- Describe NO_DATA_FOUND de forma básica (1/2 uso NO_DATA_FOUND).
- Muestra WHEN NO_DATA_FOUND THEN con DBMS_OUTPUT, no es bloque completo pero demuestra la sintaxis (1/4 ejemplo).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 4 - Cursores Explícitos (10 pts)
**Puntaje: 3/10**

**Retroalimentación:**
- Define como "procedimiento que actualiza variables", incorrecto en esencia (1/3 definición).
- No describe los pasos de uso (0/3 uso).
- Menciona %NOTFOUND pero la explicación es confusa. FETCH no es un atributo de cursor (1/3 atributos).
- Redacción poco clara (1/1 precisión).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Cursor con Promedio > 30 (20 pts)
**Puntaje: 0/20**

**Retroalimentación:**
- No entregó respuesta.

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
| P1 Teórica - Muchos a Muchos | 6/10 |
| P2 Teórica - Vistas | 2/10 |
| P3 Teórica - Excepciones | 5/10 |
| P4 Teórica - Cursores | 3/10 |
| E1 Práctica - Cursor Promedio | 0/20 |
| E2 Práctica - FOR UPDATE | 0/20 |
| E3 Práctica - Tipo Objeto | 0/20 |
| **TOTAL** | **16/100** |
