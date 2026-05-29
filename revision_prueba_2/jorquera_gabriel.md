# Revisión Prueba 2 - Gabriel Jorquera

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Diferencia Procedimiento vs Función (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Explica correctamente que un procedimiento ejecuta acciones y una función retorna un valor. Menciona que los procedimientos usan funciones para ejecutar acciones (5/5 diferencia).
- Ejemplo en contexto: función para obtener total de horas, procedimiento para mostrar asignaciones de todos los agentes usando la función. Correcto (4/5 ejemplo).

---

### Pregunta 2 - Parámetro IN OUT (10 pts)
**Puntaje: 7/10**

**Retroalimentación:**
- Describe que IN OUT permite que el procedimiento accione cambios en la variable si corresponde. Se entiende el concepto (3/5 descripción).
- El ejemplo tiene un procedimiento con `horas_asignacion IN OUT NUMBER` que modifica el valor con IF y `:=`. La lógica demuestra comprensión aunque es simplificado (no hace UPDATE ni SELECT) (4/5 ejemplo).

---

### Pregunta 3 - Función en Consulta SQL (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Explica que se usa como bloque PL/SQL que retorna un resultado a través de una variable (4/5 explicación).
- La función total_horas_incidente es correcta: SUM(Horas) INTO, RETURN, EXCEPTION. La consulta SQL la usa correctamente: SELECT IncidenteID, total_horas_incidente(IncidenteID) FROM Incidentes (5/5 ejemplo).

---

### Pregunta 4 - Trigger (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Define correctamente como bloque PL/SQL que se ejecuta automáticamente ante acciones DML. Clasifica por momento (BEFORE, AFTER) y menciona INSERT y UPDATE como eventos (5/5 explicación).
- El ejemplo tiene AFTER INSERT ON Asignacion (falta la 'es'), FOR EACH ROW, SELECT Estado, IF 'Abierto' THEN UPDATE. Usa :NEW.IncidenteID. Lógica correcta (4/5 ejemplo).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Procedimiento registrar_asignacion (20 pts)
**Puntaje: 13/20**

**Retroalimentación:**
- Inserta con NVL(MAX(AsignacionID), 0) + 1. Pero no incluye AsignacionID en el INSERT (falta en la lista de columnas) (3/5 inserción).
- Actualiza estado pero compara `p_incidente_id = 'Abierto'` (compara el ID con un string en vez del estado). Error de lógica (2/5 actualización estado).
- Valida existencia de agente con SELECT INTO (lanza NO_DATA_FOUND si no existe), verifica duplicado con COUNT y RAISE_APPLICATION_ERROR. Valida incidente con SQL%ROWCOUNT (4/5 validaciones).
- Tiene EXCEPTION WHEN OTHERS con ROLLBACK y DBMS_OUTPUT. Incluye COMMIT (4/5 excepciones).

---

### Ejercicio 2 - Función y Procedimiento (20 pts)
**Puntaje: 16/20**

**Retroalimentación:**
- Función calcular_horas_agente: usa SUM con JOIN (innecesario pero válido), RETURN, EXCEPTION con NO_DATA_FOUND. Falta NVL (8/10 función).
- Procedimiento mostrar_carga_agentes: usa CURSOR con SELECT que incluye la función. FOR LOOP con DBMS_OUTPUT. Usa `agente.Total` en vez de `agente.Total_Horas` (error de nombre de alias) (8/10 procedimiento).

---

### Ejercicio 3 - Trigger de Auditoría (20 pts)
**Puntaje: 14/20**

**Retroalimentación:**
- Tabla AuditoriaAsignaciones con columnas correctas (8/10 tabla).
- Crea DOS triggers separados (uno para INSERT, otro para DELETE) en vez de uno combinado. Es una solución válida aunque no es lo que se pedía exactamente. Usa :NEW y :OLD correctamente con SYSDATE. Falta VARCHAR2 size en la variable (6/10 trigger).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Procedimiento vs Función | 9/10 |
| P2 Teórica - IN OUT | 7/10 |
| P3 Teórica - Función en SQL | 9/10 |
| P4 Teórica - Trigger | 9/10 |
| E1 Práctica - registrar_asignacion | 13/20 |
| E2 Práctica - Función + Procedimiento | 16/20 |
| E3 Práctica - Trigger Auditoría | 14/20 |
| **TOTAL** | **77/100** |
