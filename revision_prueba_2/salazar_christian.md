# Revisión Prueba 2 - Christian Salazar

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Diferencia Procedimiento vs Función (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Explica correctamente: función obligada a retornar un valor con RETURN y se puede usar en consultas SQL, procedimiento ejecuta acciones sin retornar directamente y se llama con EXECUTE o desde bloque PL/SQL (5/5 diferencia).
- Ejemplos claros en contexto: procedimiento para registrar asignación (INSERT, UPDATE), función para obtener total de horas de un agente para usar en SELECT (5/5 ejemplo).

---

### Pregunta 2 - Parámetro IN OUT (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Describe correctamente que IN OUT funciona como entrada y salida: se pasa un valor inicial, el procedimiento lo modifica y sobreescribe la variable con el resultado final (5/5 descripción).
- El ejemplo está comentado pero es correcto: procedimiento con v_horas_actuales IN OUT, suma del ajuste, UPDATE, COMMIT. Demuestra comprensión completa del flujo (5/5 ejemplo).

---

### Pregunta 3 - Función en Consulta SQL (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Explica correctamente que se llama dentro de SELECT, WHERE o HAVING, y que la función no puede hacer cambios en la BD (no INSERT/UPDATE/DELETE), solo procesar y retornar (5/5 explicación).
- La función está comentada pero es correcta: SUM(Horas) INTO, NVL, RETURN. La consulta SQL la usa correctamente con SELECT ... FROM Incidentes (5/5 ejemplo).

---

### Pregunta 4 - Trigger (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Define correctamente como bloque PL/SQL automático como reacción a un evento. Menciona INSERT (agregar registro) y UPDATE (modificar datos) como eventos (5/5 explicación).
- El ejemplo está comentado pero es correcto: AFTER INSERT ON Asignaciones, FOR EACH ROW, SELECT Estado, IF 'Abierto' THEN UPDATE a 'En Proceso' con :NEW.IncidenteID (5/5 ejemplo).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Procedimiento registrar_asignacion (20 pts)
**Puntaje: 13/20**

**Retroalimentación:**
- Inserta con NVL(MAX(AsignacionID)) + 1 pero falta el `, 0` dentro del NVL (4/5 inserción).
- Actualiza estado a 'En Proceso' si estaba 'Abierto'. Pero la lógica del SELECT Estado se hace antes de las validaciones, lo cual podría causar problemas (4/5 actualización estado).
- Valida existencia de agente e incidente. Falta validación de duplicado explícita. Las variables se declaran después de BEGIN (debería ser antes) (2/5 validaciones).
- Tiene EXCEPTION WHEN OTHERS con ROLLBACK y DBMS_OUTPUT. Incluye COMMIT (3/5 excepciones).

---

### Ejercicio 2 - Función y Procedimiento (20 pts)
**Puntaje: 18/20**

**Retroalimentación:**
- Función calcular_horas_agente: usa NVL(SUM(Horas), 0) (implícito con SUM), RETURN. Correcta (9/10 función).
- Procedimiento mostrar_carga_agentes: usa CURSOR explícito con FOR LOOP, llama a la función, muestra con DBMS_OUTPUT. Correcto (9/10 procedimiento).

---

### Ejercicio 3 - Trigger de Auditoría (20 pts)
**Puntaje: 3/20**

**Retroalimentación:**
- Tabla AuditoriaAsignaciones con GENERATED ALWAYS AS IDENTITY PRIMARY KEY. Correcta (8/10 tabla).
- El trigger es completamente incorrecto: usa CONNECT sys AS sysdba, ALTER SYSTEM, AUDIT y SELECT dentro del trigger. Esto es el sistema AUDIT nativo de Oracle, NO un trigger manual como se pedía. No usa IF INSERTING/DELETING ni :NEW/:OLD. No registra en la tabla de auditoría (0/10 trigger). 

Nota: Se confundió el concepto de auditoría manual con trigger vs auditoría nativa de Oracle.

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Procedimiento vs Función | 10/10 |
| P2 Teórica - IN OUT | 10/10 |
| P3 Teórica - Función en SQL | 10/10 |
| P4 Teórica - Trigger | 10/10 |
| E1 Práctica - registrar_asignacion | 13/20 |
| E2 Práctica - Función + Procedimiento | 18/20 |
| E3 Práctica - Trigger Auditoría | 3/20 |
| **TOTAL** | **74/100** |
