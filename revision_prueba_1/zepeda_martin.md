# Revisión Prueba 1 - Martín Zepeda

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Relación Muchos a Muchos (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Define que "dos entidades tienen una relación mayor a uno", se entiende el concepto. Usa ejemplo de estudiante-profesor para ilustrar (2/3 definición).
- Menciona que se debe crear una "base intermediaria" con las primary keys de cada tabla, correcto (3/3 implementación).
- Identifica correctamente Agentes e Incidentes a través de Asignaciones (3/3 ejemplo).
- Errores ortográficos ("reación", "estudainets") (0/1 precisión).

---

### Pregunta 2 - Vistas (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Define como "consulta que se guarda con un nombre y se puede usar como tabla", correcto. Menciona que simplifica consultas complejas (3/3 definición).
- Describe que crearía vista con Incidentes y Asignaciones (1/2 uso).
- La consulta es correcta: CREATE OR REPLACE VIEW con JOIN, SUM(Horas), GROUP BY con columnas correctas (4/4 consulta).
- Redacción clara (1/1 precisión).

---

### Pregunta 3 - Excepciones Predefinidas (10 pts)
**Puntaje: 5/10**

**Retroalimentación:**
- Define correctamente como "error definido por el sistema para evitar que el programa se detenga abruptamente" (3/3 definición).
- Describe que NO_DATA_FOUND se activa cuando no se obtiene nada en una consulta (1/2 uso NO_DATA_FOUND).
- No entrega ejemplo de código PL/SQL (0/4 ejemplo).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 4 - Cursores Explícitos (10 pts)
**Puntaje: 7/10**

**Retroalimentación:**
- Define como "herramienta para recorrer resultados de una consulta", correcto. Menciona declarar, abrir y recorrer con bucle (2/3 definición).
- Describe parcialmente el uso, no menciona CLOSE (2/3 uso).
- Menciona %NOTFOUND y %ROWCOUNT con propósitos correctos (3/3 atributos).
- Typo "crusor" (0/1 precisión).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Cursor con Promedio > 30 (20 pts)
**Puntaje: 15/20**

**Retroalimentación:**
- Cursor correctamente definido con JOIN, GROUP BY Especialidad, HAVING AVG > 30 (5/5 definición cursor).
- Usa FOR ... LOOP en vez de manejo manual. Válido pero se esperaba manejo manual (-2 pts) (3/5 uso cursor).
- Salida correcta con DBMS_OUTPUT mostrando especialidad y promedio (5/5 salida).
- Tiene EXCEPTION con WHEN OTHERS. Código funcional (2/5 estructura).

---

### Ejercicio 2 - Cursor FOR UPDATE (20 pts)
**Puntaje: 14/20**

**Retroalimentación:**
- Cursor con JOIN a Incidentes, WHERE Severidad = 'Critical', FOR UPDATE. Correcto (5/5 definición cursor).
- Usa FOR ... LOOP. El CLOSE después del FOR LOOP es innecesario pero no grave (3/5 uso cursor).
- Actualización correcta con WHERE CURRENT OF, SET Horas = Horas + 10 (5/5 actualización).
- Tiene EXCEPTION con WHEN OTHERS, falta ROLLBACK (1/3 excepciones).
- Código funcional (0/2 estructura).

---

### Ejercicio 3 - Tipo de Objeto (20 pts)
**Puntaje: 4/20**

**Retroalimentación:**
- Intenta declarar TYPE dentro de DECLARE (no válido en Oracle, debe ser CREATE TYPE). No implementa body de get_reporte (1/5 tipo).
- No crea tabla basada en el tipo (0/3 tabla).
- No transfiere datos (0/4 transferencia).
- El cursor selecciona de Incidentes directamente, no de tabla de objetos. FETCH incorrecto (1/5 cursor).
- Demuestra intento pero con errores conceptuales (2/3 estructura).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Muchos a Muchos | 8/10 |
| P2 Teórica - Vistas | 9/10 |
| P3 Teórica - Excepciones | 5/10 |
| P4 Teórica - Cursores | 7/10 |
| E1 Práctica - Cursor Promedio | 15/20 |
| E2 Práctica - FOR UPDATE | 14/20 |
| E3 Práctica - Tipo Objeto | 4/20 |
| **TOTAL** | **62/100** |
