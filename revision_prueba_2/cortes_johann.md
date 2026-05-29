# Revisión Prueba 2 - Johann Cortés

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Diferencia Procedimiento vs Función (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Explica correctamente: procedimiento no retorna valor directo, ejecuta acciones, usa parámetros OUT. Función retorna UN valor, se usa en sentencias SQL. Resume: "Procedimiento = Hacer cosas, Función = Calcular cosas" (5/5 diferencia).
- Ejemplos claros: AsignarAgenteAIncidente como procedimiento, ObtenerHorasAgente como función (5/5 ejemplo).

---

### Pregunta 2 - Parámetro IN OUT (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Describe correctamente que IN OUT permite pasar un valor, modificarlo y devolver el valor actualizado al llamador (5/5 descripción).
- Ejemplo excelente: procedimiento con p_horasAjuste IN OUT, SELECT INTO, suma, UPDATE, COMMIT, EXCEPTION. Además muestra bloque de uso que demuestra el flujo completo (5/5 ejemplo).

---

### Pregunta 3 - Función en Consulta SQL (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Explica correctamente que se usa en SELECT o WHERE, recibiendo parámetros de columnas. Menciona que evita JOINs complejos (5/5 explicación).
- Función ObtenerTotalHorasIncidente correcta: SUM, NVL, RETURN, EXCEPTION. Consulta SQL la usa con ORDER BY (5/5 ejemplo).

---

### Pregunta 4 - Trigger (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Define correctamente como objeto automático ante eventos DML. Menciona INSERT y UPDATE. Explica caso de uso en contexto (5/5 explicación).
- Ejemplo correcto: AFTER INSERT ON Asignaciones, FOR EACH ROW, UPDATE con :NEW.IncidenteID y condición Estado = 'Abierto' (5/5 ejemplo).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Procedimiento registrar_asignacion (20 pts)
**Puntaje: 20/20**

**Retroalimentación:**
- Inserta con MAX(AsignacionID) + 1, maneja caso NULL (5/5 inserción).
- Actualiza estado a 'En Proceso' si estaba 'Abierto' (5/5 actualización estado).
- Valida existencia de agente, incidente y duplicado con COUNT y RAISE_APPLICATION_ERROR (5/5 validaciones).
- Tiene EXCEPTION WHEN OTHERS con ROLLBACK y DBMS_OUTPUT. Incluye COMMIT (5/5 excepciones).

---

### Ejercicio 2 - Función y Procedimiento (20 pts)
**Puntaje: 20/20**

**Retroalimentación:**
- Función calcular_horas_agente: SUM, NVL, RETURN, EXCEPTION. Correcta (10/10 función).
- Procedimiento mostrar_carga_agentes: CURSOR explícito, FOR LOOP, llama función, DBMS_OUTPUT con RPAD. Excelente (10/10 procedimiento).

---

### Ejercicio 3 - Trigger de Auditoría (20 pts)
**Puntaje: 20/20**

**Retroalimentación:**
- Tabla AuditoriaAsignaciones con todas las columnas. Crea secuencia auditoria_seq (10/10 tabla).
- Trigger AFTER INSERT OR DELETE, FOR EACH ROW, IF INSERTING/ELSIF DELETING con :NEW y :OLD. Usa secuencia (10/10 trigger).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Procedimiento vs Función | 10/10 |
| P2 Teórica - IN OUT | 10/10 |
| P3 Teórica - Función en SQL | 10/10 |
| P4 Teórica - Trigger | 10/10 |
| E1 Práctica - registrar_asignacion | 20/20 |
| E2 Práctica - Función + Procedimiento | 20/20 |
| E3 Práctica - Trigger Auditoría | 20/20 |
| **TOTAL** | **100/100** |
