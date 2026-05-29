# Revisión Prueba 2 - Diego Cortés

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Diferencia Procedimiento vs Función (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Explica correctamente que un procedimiento realiza una tarea y no devuelve un valor, mientras que una función devuelve un valor (5/5 diferencia).
- Ejemplos en contexto: procedimiento para actualizar estado, función para calcular horas. Correctos (4/5 ejemplo).

---

### Pregunta 2 - Parámetro IN OUT (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Describe correctamente que IN OUT permite recibir un valor, modificarlo y devolverlo (4/5 descripción).
- El ejemplo usa OUT en vez de IN OUT pero la lógica es correcta: SELECT INTO, suma, UPDATE. Demuestra comprensión del concepto (4/5 ejemplo).

---

### Pregunta 3 - Función en Consulta SQL (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Explica que se usa "como cualquier otra función, dándole parámetros". Correcto (3/5 explicación).
- La función y la consulta SQL demuestran comprensión: SELECT con función FROM Incidentes. Errores menores de sintaxis (5/5 ejemplo).

---

### Pregunta 4 - Trigger (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Define correctamente como bloque automático ante eventos. Menciona INSERT y UPDATE (5/5 explicación).
- Ejemplo correcto: AFTER INSERT ON Asignaciones, FOR EACH ROW, UPDATE con :NEW.IncidenteID y condición Estado = 'Abierto' (5/5 ejemplo).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Procedimiento registrar_asignacion (20 pts)
**Puntaje: 14/20**

**Retroalimentación:**
- Inserta con NVL(MAX(AsignacionID), 0) + 1 (5/5 inserción).
- Actualiza estado a 'En Proceso' si estaba 'Abierto' (5/5 actualización estado).
- Valida existencia de agente, incidente y duplicado con COUNT y RAISE_APPLICATION_ERROR. Usa `//` en vez de `||` para concatenación (3/5 validaciones).
- Tiene EXCEPTION WHEN OTHERS con DBMS_OUTPUT y ROLLBACK. Usa `:` en vez de `;` en INSERT (1/5 excepciones).

---

### Ejercicio 2 - Función y Procedimiento (20 pts)
**Puntaje: 0/20**

**Retroalimentación:**
- No entregó el ejercicio 2.

---

### Ejercicio 3 - Trigger de Auditoría (20 pts)
**Puntaje: 16/20**

**Retroalimentación:**
- Tabla AuditoriaAsignaciones con columnas correctas. No tiene PRIMARY KEY ni mecanismo de ID (7/10 tabla).
- Trigger AFTER INSERT OR DELETE, FOR EACH ROW, IF INSERTING/ELSIF DELETING con :NEW y :OLD. Usa SYSDATE. Correcto (9/10 trigger).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Procedimiento vs Función | 9/10 |
| P2 Teórica - IN OUT | 8/10 |
| P3 Teórica - Función en SQL | 8/10 |
| P4 Teórica - Trigger | 10/10 |
| E1 Práctica - registrar_asignacion | 14/20 |
| E2 Práctica - Función + Procedimiento | 0/20 |
| E3 Práctica - Trigger Auditoría | 16/20 |
| **TOTAL** | **65/100** |
