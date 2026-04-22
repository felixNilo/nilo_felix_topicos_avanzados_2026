# Revisión Prueba 1 - Mario Yáñez

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Relación Muchos a Muchos (10 pts)
**Puntaje: 5/10**

**Retroalimentación:**
- Define que "un atributo se puede relacionar más de una vez con otro", parcialmente correcto pero confuso (1/3 definición).
- No menciona tabla intermedia ni claves foráneas (0/3 implementación).
- Usa el ejemplo de Asignaciones e Incidentes del esquema, correcto (3/3 ejemplo).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 2 - Vistas (10 pts)
**Puntaje: 3/10**

**Retroalimentación:**
- Define como "tabla para ver datos específicos sin SELECT *", parcialmente correcto (1/3 definición).
- Menciona que fusionaría Asignaciones con Incidentes, correcto conceptualmente (1/2 uso).
- No entrega la consulta SQL (0/4 consulta).
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
**Puntaje: 0/20**

**Retroalimentación:**
- No entregó respuesta. El archivo `repositorio/prueba_1.sql` es copia del script de creación de tablas.

---

### Ejercicio 2 - Cursor FOR UPDATE (20 pts)
**Puntaje: 4/20**

**Retroalimentación:**
- El cursor selecciona Severidad pero no hace JOIN con Asignaciones. Usa `==` en vez de `=`. No incluye FOR UPDATE correctamente (1/5 definición cursor).
- No usa LOOP, solo un FETCH individual (1/5 uso cursor).
- Intenta actualizar pero suma 10 a Severidad (VARCHAR, no NUMBER) y usa `=` en vez de `:=`. Usa WHERE CURRENT OF, lo cual es correcto en concepto (1/5 actualización).
- No tiene bloque EXCEPTION (0/3 excepciones).
- Código demuestra intento (1/2 estructura).

---

### Ejercicio 3 - Tipo de Objeto (20 pts)
**Puntaje: 0/20**

**Retroalimentación:**
- No entregó respuesta.

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Muchos a Muchos | 5/10 |
| P2 Teórica - Vistas | 3/10 |
| P3 Teórica - Excepciones | 0/10 |
| P4 Teórica - Cursores | 0/10 |
| E1 Práctica - Cursor Promedio | 0/20 |
| E2 Práctica - FOR UPDATE | 4/20 |
| E3 Práctica - Tipo Objeto | 0/20 |
| **TOTAL** | **12/100** |
