# Revisión Prueba 2 - Maicol Aracena

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Diferencia Procedimiento vs Función (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Explica correctamente que un procedimiento no devuelve un valor directamente y se usa para acciones, mientras que una función devuelve un valor específico (5/5 diferencia).
- Da ejemplo con procedimiento que ajusta horas y menciona funciones para cálculos. Se entiende el contexto (4/5 ejemplo).

---

### Pregunta 2 - Parámetro IN OUT (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Describe correctamente que IN OUT permite pasar un valor, modificarlo y devolverlo (5/5 descripción).
- El ejemplo demuestra comprensión: procedimiento con p_HorasTotales IN OUT, SELECT INTO, suma con `:=`, UPDATE. La lógica es correcta (5/5 ejemplo).

---

### Pregunta 3 - Función en Consulta SQL (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Explica que una función puede ser llamada dentro de una consulta SQL para realizar cálculos y devolver un valor (4/5 explicación).
- La función es correcta: SUM(Horas), SELECT INTO, NVL, RETURN. Falta la consulta SQL que la invoca pero la función en sí demuestra comprensión completa (5/5 ejemplo).

---

### Pregunta 4 - Trigger (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Define correctamente que un trigger se ejecuta automáticamente ante eventos. Menciona AFTER INSERT y BEFORE UPDATE como eventos (5/5 explicación).
- El ejemplo es correcto: AFTER INSERT ON Asignaciones, FOR EACH ROW, SELECT Estado, IF 'Abierto' THEN UPDATE a 'En Proceso' con :NEW.IncidenteID (5/5 ejemplo).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Procedimiento registrar_asignacion (20 pts)
**Puntaje: 19/20**

**Retroalimentación:**
- Inserta con NVL(MAX(AsignacionID), 0) + 1 (5/5 inserción).
- Actualiza estado a 'En Proceso' si estaba 'Abierto' (5/5 actualización estado).
- Valida existencia de agente, incidente y duplicado con COUNT y RAISE_APPLICATION_ERROR (5/5 validaciones).
- Tiene EXCEPTION WHEN OTHERS con ROLLBACK y RAISE. Incluye COMMIT (4/5 excepciones).

---

### Ejercicio 2 - Función y Procedimiento (20 pts)
**Puntaje: 20/20**

**Retroalimentación:**
- Función calcular_horas_agente: SUM(Horas), NVL, RETURN. Correcta (10/10 función).
- Procedimiento mostrar_carga_agentes: usa FOR ... IN con DBMS_OUTPUT llamando a la función. Correcto y funcional (10/10 procedimiento).

---

### Ejercicio 3 - Trigger de Auditoría (20 pts)
**Puntaje: 20/20**

**Retroalimentación:**
- Tabla AuditoriaAsignaciones con todas las columnas requeridas (10/10 tabla).
- Trigger AFTER INSERT OR DELETE, FOR EACH ROW, IF INSERTING/ELSIF DELETING con :NEW y :OLD. Correcto y funcional (10/10 trigger).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Procedimiento vs Función | 9/10 |
| P2 Teórica - IN OUT | 10/10 |
| P3 Teórica - Función en SQL | 9/10 |
| P4 Teórica - Trigger | 10/10 |
| E1 Práctica - registrar_asignacion | 19/20 |
| E2 Práctica - Función + Procedimiento | 20/20 |
| E3 Práctica - Trigger Auditoría | 20/20 |
| **TOTAL** | **97/100** |
