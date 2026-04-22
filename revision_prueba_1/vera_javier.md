# Revisión Prueba 1 - Javier Vera

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Relación Muchos a Muchos (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Define correctamente que "dos tablas al interactuar, ambas pueden tener un valor de 1 a muchos" con ejemplos claros (3/3 definición).
- Explica que se necesita una tabla puente para romper la relación M:N (3/3 implementación).
- Usa ejemplos genéricos (estanterías/libros) en vez del esquema de la prueba (1/3 ejemplo).
- Redacción clara (1/1 precisión).

---

### Pregunta 2 - Vistas (10 pts)
**Puntaje: 4/10**

**Retroalimentación:**
- Define como "forma de hacer zoom a tablas, tomando solo información visible", parcialmente correcto (2/3 definición).
- No describe cómo consultarla (0/2 uso).
- La consulta usa CREATE VIEW con JOIN, pero no usa SUM ni GROUP BY. Selecciona `inc.Horas` que no existe en Incidentes. No incluye Descripcion (1/4 consulta).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 3 - Excepciones Predefinidas (10 pts)
**Puntaje: 0/10**

**Retroalimentación:**
- No entregó respuesta.

---

### Pregunta 4 - Cursores Explícitos (10 pts)
**Puntaje: 0/10**

**Retroalimentación:**
- No entregó respuesta.

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Cursor con Promedio > 30 (20 pts)
**Puntaje: 8/20**

**Retroalimentación:**
- El cursor tiene JOIN entre Agentes, Asignaciones e Incidentes. Filtra por Horas > 30 individual en vez de AVG con GROUP BY/HAVING, pero demuestra comprensión del JOIN (2/5 definición cursor).
- Manejo manual correcto: OPEN, FETCH, EXIT WHEN %NOTFOUND, CLOSE (5/5 uso cursor).
- La salida muestra nombre y horas, no especialidad ni promedio (0/5 salida).
- Código funcional en estructura aunque no resuelve exactamente lo pedido (1/5 estructura).

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
| P2 Teórica - Vistas | 4/10 |
| P3 Teórica - Excepciones | 0/10 |
| P4 Teórica - Cursores | 0/10 |
| E1 Práctica - Cursor Promedio | 8/20 |
| E2 Práctica - FOR UPDATE | 0/20 |
| E3 Práctica - Tipo Objeto | 0/20 |
| **TOTAL** | **20/100** |
