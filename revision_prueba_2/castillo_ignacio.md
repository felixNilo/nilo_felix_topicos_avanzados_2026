# Revisión Prueba 2 - Ignacio Castillo

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Diferencia Procedimiento vs Función (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Explica correctamente que un procedimiento puede devolver cero o varios valores por OUT y no se usa en consultas, mientras que una función devuelve un único valor con RETURN y se usa dentro de consultas SQL (5/5 diferencia).
- Da ejemplos en contexto: procedimiento para crear_asignacion, función para total_horas_incidentes. Correctos (4/5 ejemplo).

---

### Pregunta 2 - Parámetro IN OUT (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Describe correctamente que se usa para pasar un valor que será modificado y devuelto (4/5 descripción).
- El ejemplo usa OUT en vez de IN OUT, pero la lógica es correcta: SELECT INTO, suma, UPDATE, RETURNING INTO. Demuestra comprensión del concepto de devolver un valor modificado (4/5 ejemplo).

---

### Pregunta 3 - Función en Consulta SQL (10 pts)
**Puntaje: 5/10**

**Retroalimentación:**
- No hay explicación textual de cómo se usa en una consulta (0/5 explicación).
- La función está incompleta (falta FROM, RETURN, END) pero la consulta SQL que la usa es correcta en estructura (5/5 ejemplo).

---

### Pregunta 4 - Trigger (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Define correctamente como bloque PL/SQL automático. Menciona BEFORE, AFTER, ROW, STATEMENT como tipos, y INSERT, UPDATE como operaciones (5/5 explicación).
- El ejemplo es correcto y completo: AFTER INSERT ON Asignaciones, FOR EACH ROW, SELECT Estado, IF 'Abierto' THEN UPDATE. Tiene EXCEPTION (5/5 ejemplo).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Procedimiento registrar_asignacion (20 pts)
**Puntaje: 16/20**

**Retroalimentación:**
- Inserta pero usa `v_AsignacionID` que no fue calculado con MAX+1 antes del INSERT (la variable se reutiliza para COUNT). Falta el cálculo del próximo ID (3/5 inserción).
- Actualiza estado a 'En Proceso' si estaba 'Abierto' con SELECT Estado INTO y IF (5/5 actualización estado).
- Valida existencia de agente, incidente y duplicado con COUNT y RAISE_APPLICATION_ERROR (5/5 validaciones).
- Tiene EXCEPTION WHEN OTHERS con ROLLBACK y DBMS_OUTPUT. Incluye COMMIT (3/5 excepciones).

---

### Ejercicio 2 - Función y Procedimiento (20 pts)
**Puntaje: 19/20**

**Retroalimentación:**
- Función calcular_horas_agente: usa NVL(SUM(Horas), 0), RETURN. Tiene EXCEPTION. Correcta (10/10 función).
- Procedimiento mostrar_carga_agentes: usa FOR ... IN con DBMS_OUTPUT llamando a la función. Correcto. Tiene EXCEPTION (9/10 procedimiento).

---

### Ejercicio 3 - Trigger de Auditoría (20 pts)
**Puntaje: 17/20**

**Retroalimentación:**
- Tabla AuditoriaAsignaciones con columnas correctas. Usa `Fechaa` en vez de `FechaRegistro` pero tiene la información (8/10 tabla).
- Trigger AFTER INSERT OR DELETE, FOR EACH ROW. Usa variable para acción y IF INSERTING/ELSIF DELETING con :NEW y :OLD. Usa secuencia (no creada). Correcto en lógica (9/10 trigger).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Procedimiento vs Función | 9/10 |
| P2 Teórica - IN OUT | 8/10 |
| P3 Teórica - Función en SQL | 5/10 |
| P4 Teórica - Trigger | 10/10 |
| E1 Práctica - registrar_asignacion | 16/20 |
| E2 Práctica - Función + Procedimiento | 19/20 |
| E3 Práctica - Trigger Auditoría | 17/20 |
| **TOTAL** | **84/100** |
