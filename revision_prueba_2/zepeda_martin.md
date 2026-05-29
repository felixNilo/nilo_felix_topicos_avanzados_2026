# Revisión Prueba 2 - Martín Zepeda

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Diferencia Procedimiento vs Función (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Explica correctamente que un procedimiento realiza tareas, acepta parámetros IN/OUT/IN OUT y no devuelve valor directamente. Menciona que puede modificar parámetros de salida o realizar acciones (5/5 diferencia).
- Ejemplo en contexto: procedimiento para registrar asignación (insertar y actualizar estado). Correcto pero solo da un ejemplo (4/5 ejemplo).

---

### Pregunta 2 - Parámetro IN OUT (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Describe correctamente que IN OUT permite pasar un valor, modificarlo dentro del procedimiento y devolver el valor modificado al llamador (5/5 descripción).
- No entrega ejemplo de código pero la explicación conceptual es completa y demuestra comprensión (4/5 ejemplo).

---

### Pregunta 3 - Función en Consulta SQL (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Explica correctamente que una función puede usarse en consulta SQL siempre que devuelva un valor escalar (5/5 explicación).
- La función calcular_horas_incidente es correcta: SUM(Horas) INTO, NVL, RETURN, EXCEPTION. La consulta SQL la usa correctamente: SELECT IncidenteID, Descripcion, calcular_horas_incidente(IncidenteID) FROM Incidentes (5/5 ejemplo).

---

### Pregunta 4 - Trigger (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Define correctamente como bloque PL/SQL automático ante acciones específicas. Menciona AFTER INSERT y BEFORE UPDATE como eventos (5/5 explicación).
- El ejemplo es correcto y completo: AFTER INSERT ON Asignaciones, FOR EACH ROW, SELECT Estado, IF 'Abierto' THEN UPDATE. Usa :NEW.IncidenteID. Tiene EXCEPTION (5/5 ejemplo).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Procedimiento registrar_asignacion (20 pts)
**Puntaje: 17/20**

**Retroalimentación:**
- Inserta con NVL(MAX(AsignacionID), 0) + 1 (5/5 inserción).
- Actualiza estado a 'En Proceso' si estaba 'Abierto' con SELECT Estado INTO y IF (5/5 actualización estado).
- Valida existencia de agente, incidente y duplicado con COUNT y RAISE_APPLICATION_ERROR (5/5 validaciones).
- Tiene EXCEPTION WHEN OTHER (falta la 'S' en OTHERS) con ROLLBACK y DBMS_OUTPUT. Incluye COMMIT. Usa `VARCHAR2(30)` en parámetro que no es válido (debería ser solo VARCHAR2) (2/5 excepciones).

---

### Ejercicio 2 - Función y Procedimiento (20 pts)
**Puntaje: 18/20**

**Retroalimentación:**
- Función calcular_horas_agente: usa NVL(SUM(Horas), 0), RETURN. Tiene EXCEPTION. Correcta (10/10 función).
- Procedimiento mostrar_carga_agentes: usa FOR ... IN con DECLARE interno y DBMS_OUTPUT llamando a la función. Tiene EXCEPTION. Usa `WHEN OTHER` (falta 'S'). Lógica correcta (8/10 procedimiento).

---

### Ejercicio 3 - Trigger de Auditoría (20 pts)
**Puntaje: 18/20**

**Retroalimentación:**
- Tabla AuditoriaAsignaciones con todas las columnas requeridas y PRIMARY KEY (10/10 tabla).
- Trigger AFTER INSERT OR DELETE, FOR EACH ROW, IF INSERTING/ELSIF DELETING con :NEW y :OLD. Usa secuencia (AuditoriaAsignaciones_seq, no creada explícitamente). Tiene EXCEPTION. Correcto (8/10 trigger).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Procedimiento vs Función | 9/10 |
| P2 Teórica - IN OUT | 9/10 |
| P3 Teórica - Función en SQL | 10/10 |
| P4 Teórica - Trigger | 10/10 |
| E1 Práctica - registrar_asignacion | 17/20 |
| E2 Práctica - Función + Procedimiento | 18/20 |
| E3 Práctica - Trigger Auditoría | 18/20 |
| **TOTAL** | **91/100** |
