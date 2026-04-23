# Revisión Prueba 1 - Javier Carrasco

> **Nota:** Entrega fuera de plazo. Se otorgó plazo extraordinario (mismo día, hasta las 23:59). La nota máxima que puede obtener es **4.0**.

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Relación Muchos a Muchos (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Define correctamente que "múltiples registros de una tabla pueden estar relacionados con múltiples registros de otra tabla" (3/3 definición).
- Explica que se usa una tabla intermedia con foreign keys que referencian a las primary keys de ambas tablas (3/3 implementación).
- Identifica correctamente Asignaciones como tabla intermedia entre Agentes e Incidentes, mencionando AgenteID e IncidenteID como FK (3/3 ejemplo).
- Redacción clara y técnica (1/1 precisión).

---

### Pregunta 2 - Vistas (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Define correctamente como "tabla virtual que se genera por una consulta SQL". Menciona usos: simplificar consultas, mejorar seguridad y facilitar visualización (3/3 definición).
- Describe su utilidad (2/2 uso).
- La consulta es correcta: CREATE OR REPLACE VIEW con JOIN entre Incidentes y Asignaciones, SUM(horas) AS total_horas, GROUP BY Descripcion y Severidad (4/4 consulta).
- Redacción clara (1/1 precisión).

---

### Pregunta 3 - Excepciones Predefinidas (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Define correctamente como "error de Oracle que se activa cuando ocurre un problema durante la ejecución" y que manejarlas evita que el programa se caiga (3/3 definición).
- Describe correctamente el propósito de NO_DATA_FOUND (2/2 uso NO_DATA_FOUND).
- El ejemplo es un bloque PL/SQL completo con DECLARE, BEGIN, SELECT INTO con AgenteID = 999 (inexistente), EXCEPTION WHEN NO_DATA_FOUND con DBMS_OUTPUT. Correcto y funcional (4/4 ejemplo).
- Redacción clara (1/1 precisión).

---

### Pregunta 4 - Cursores Explícitos (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Define correctamente como "puntero de memoria que define el programador para procesar resultados fila por fila" (3/3 definición).
- No describe los pasos de uso (OPEN, FETCH, CLOSE) (0/3 uso).
- Menciona %NOTFOUND y %ROWCOUNT con propósitos correctos (3/3 atributos).
- Redacción clara y concisa (1/1 precisión).

Nota: Faltó describir cómo se usa (declarar, abrir, recorrer, cerrar).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Cursor con Promedio > 30 (20 pts)
**Puntaje: 17/20**

**Retroalimentación:**
- Cursor correctamente definido con JOIN entre Agentes y Asignaciones, GROUP BY Especialidad, HAVING AVG > 30 (5/5 definición cursor).
- Manejo manual correcto: OPEN, FETCH, EXIT WHEN %NOTFOUND, CLOSE (5/5 uso cursor).
- Salida con DBMS_OUTPUT mostrando especialidad y promedio redondeado. Faltan `||` de concatenación (error de sintaxis menor) (4/5 salida).
- Código bien estructurado, funcional salvo los `||` faltantes (3/5 estructura).

---

### Ejercicio 2 - Cursor FOR UPDATE (20 pts)
**Puntaje: 0/20**

**Retroalimentación:**
- No entregó respuesta para este ejercicio.

---

### Ejercicio 3 - Tipo de Objeto (20 pts)
**Puntaje: 15/20**

**Retroalimentación:**
- Crea tipo incidente_obj con AS OBJECT, atributos correctos y método get_reporte. Body implementa el método usando SELF, pero faltan `||` de concatenación en el RETURN (4/5 tipo).
- Crea tabla OF incidente_obj, correcto (3/3 tabla).
- Transfiere datos con INSERT SELECT usando constructor del tipo (4/4 transferencia).
- No incluye cursor explícito para listar con get_reporte, que era parte del enunciado (2/5 cursor).
- Estructura parcial, falta el cursor final (2/3 estructura).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Muchos a Muchos | 10/10 |
| P2 Teórica - Vistas | 10/10 |
| P3 Teórica - Excepciones | 10/10 |
| P4 Teórica - Cursores | 8/10 |
| E1 Práctica - Cursor Promedio | 17/20 |
| E2 Práctica - FOR UPDATE | 0/20 |
| E3 Práctica - Tipo Objeto | 15/20 |
| **TOTAL** | **70/100** |

> **Nota final aplicada: 3.1** (escala comprimida por entrega fuera de plazo: Nota = 1.0 + (puntaje/100) × 3.0). Sin penalización, la nota habría sido 5.2.
