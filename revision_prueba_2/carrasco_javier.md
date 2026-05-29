# Revisión Prueba 2 - Javier Carrasco

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Diferencia Procedimiento vs Función (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Explica correctamente que un procedimiento ejecuta acciones (INSERT, UPDATE) sin devolver valor, y una función devuelve un valor con RETURN y se usa en expresiones SQL (5/5 diferencia).
- Da ejemplos claros en contexto: procedimiento para E1 (registrar asignación) y función para E2 (calcular horas). Excelente conexión (5/5 ejemplo).

---

### Pregunta 2 - Parámetro IN OUT (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Describe correctamente que IN OUT permite recibir un valor inicial, modificarlo y devolver el valor actualizado (5/5 descripción).
- El ejemplo es correcto: CREATE PROCEDURE con p_HorasActualizadas IN OUT, UPDATE, SELECT INTO para devolver nuevo valor. Usa SQL%ROWCOUNT para validar y RAISE_APPLICATION_ERROR. Demuestra comprensión completa (5/5 ejemplo).

---

### Pregunta 3 - Función en Consulta SQL (10 pts)
**Puntaje: 7/10**

**Retroalimentación:**
- Explica que se realizan cálculos y se retorna el valor para usarlo en consultas. Correcto pero breve (3/5 explicación).
- La función tiene SUM(Horas) INTO pero falta FROM (incompleta). La consulta SQL que la usa es correcta en estructura (4/5 ejemplo).

---

### Pregunta 4 - Trigger (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Define correctamente como bloque PL/SQL automático ante eventos. Menciona triggers a nivel fila/sentencia, y eventos INSERT, UPDATE, DELETE. También menciona DDL (5/5 explicación).
- El ejemplo tiene AFTER INSERT, FOR EACH ROW, UPDATE con :NEW.IncidenteID y condición Estado = 'Abierto'. Typo 'En Procreso' pero la lógica es correcta (4/5 ejemplo).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Procedimiento registrar_asignacion (20 pts)
**Puntaje: 17/20**

**Retroalimentación:**
- Inserta con NVL(MAX(AsignacionID), 0) + 1 (5/5 inserción).
- Actualiza estado a 'En Proceso' si estaba 'ABIERTO' (usa UPPER(NVL(...))) lo cual es robusto (5/5 actualización estado).
- Valida existencia de agente con COUNT, incidente con SELECT Estado (NO_DATA_FOUND), y duplicado con COUNT y RAISE_APPLICATION_ERROR (4/5 validaciones).
- Tiene EXCEPTION WHEN OTHERS con ROLLBACK. Incluye COMMIT. Typo `DMB_OUTPUT` en vez de `DBMS_OUTPUT` (3/5 excepciones).

---

### Ejercicio 2 - Función y Procedimiento (20 pts)
**Puntaje: 20/20**

**Retroalimentación:**
- Función calcular_horas_agente: usa NVL(SUM(Horas), 0), RETURN. Tiene EXCEPTION. Correcta (10/10 función).
- Procedimiento mostrar_carga_agentes: usa CURSOR explícito con FOR LOOP, llama a la función y muestra con DBMS_OUTPUT. Bien formateado (10/10 procedimiento).

---

### Ejercicio 3 - Trigger de Auditoría (20 pts)
**Puntaje: 18/20**

**Retroalimentación:**
- Tabla AuditoriaAsignaciones con todas las columnas requeridas. Usa secuencia `aud_asignaciones_seq` (no creada explícitamente) (8/10 tabla).
- Trigger AFTER INSERT OR DELETE, FOR EACH ROW. Usa NVL(:NEW, :OLD) con CASE WHEN INSERTING/DELETING, forma válida y elegante (10/10 trigger).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Procedimiento vs Función | 10/10 |
| P2 Teórica - IN OUT | 10/10 |
| P3 Teórica - Función en SQL | 7/10 |
| P4 Teórica - Trigger | 9/10 |
| E1 Práctica - registrar_asignacion | 17/20 |
| E2 Práctica - Función + Procedimiento | 20/20 |
| E3 Práctica - Trigger Auditoría | 18/20 |
| **TOTAL** | **91/100** |
