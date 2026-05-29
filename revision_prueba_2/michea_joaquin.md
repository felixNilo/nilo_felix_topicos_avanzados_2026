# Revisión Prueba 2 - Joaquín Michea

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Diferencia Procedimiento vs Función (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Explica correctamente que un procedimiento realiza una tarea y no devuelve valor directamente, puede modificar datos. Una función devuelve un valor específico basado en parámetros de entrada (5/5 diferencia).
- Ejemplos en contexto: procedimiento para registrar asignación, función para calcular total de horas. Correctos (4/5 ejemplo).

---

### Pregunta 2 - Parámetro IN OUT (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Describe correctamente que IN OUT se usa para pasar un valor de entrada y luego devolver un valor modificado de retorno (5/5 descripción).
- El ejemplo tiene procedimiento con p_HorasAjuste IN OUT, UPDATE con suma, SELECT INTO para devolver nuevo valor. Lógica correcta (4/5 ejemplo).

---

### Pregunta 3 - Función en Consulta SQL (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Explica que se llama dentro de una consulta SQL como una función normal, dándole parámetros (4/5 explicación).
- La función calcular_horas_incidente es correcta: NVL(SUM(Horas), 0), RETURN. La consulta SQL la usa correctamente con SELECT ... FROM Incidentes (6/5 ejemplo - incluye todas las columnas).

---

### Pregunta 4 - Trigger (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Define correctamente como bloque almacenado que se ejecuta automáticamente ante un evento específico. Menciona INSERT y UPDATE como eventos (5/5 explicación).
- Ejemplo correcto: AFTER INSERT ON Asignaciones, FOR EACH ROW, UPDATE con :NEW.IncidenteID y condición Estado = 'Abierto' (5/5 ejemplo).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Procedimiento registrar_asignacion (20 pts)
**Puntaje: 12/20**

**Retroalimentación:**
- Inserta con NVL(MAX(AsignacionID), 0) + 1 pero no incluye AsignacionID en la lista de columnas del INSERT (usa solo AgenteID, IncidenteID, Horas, Rol) (3/5 inserción).
- Actualiza estado a 'En Proceso' si estaba 'Abierto' (5/5 actualización estado).
- Valida con IF AgenteID IS NULL (no es la forma correcta de verificar existencia) y usa EXISTS que no es válido en PL/SQL de esa forma. Las validaciones se hacen DESPUÉS del INSERT en vez de antes (1/5 validaciones).
- Tiene RAISE_APPLICATION_ERROR pero sin códigos de error. Falta EXCEPTION formal (3/5 excepciones).

---

### Ejercicio 2 - Función y Procedimiento (20 pts)
**Puntaje: 16/20**

**Retroalimentación:**
- Función calcular_horas_agente: usa NVL(SUM(Horas), 0), RETURN. Correcta (10/10 función).
- Procedimiento mostrar_carga_agentes: usa FOR ... IN con DBMS_OUTPUT llamando a la función. Falta `IS` o `AS` después del nombre. La lógica es correcta (6/10 procedimiento).

---

### Ejercicio 3 - Trigger de Auditoría (20 pts)
**Puntaje: 14/20**

**Retroalimentación:**
- Tabla AuditoriaAsignaciones con columnas correctas (8/10 tabla).
- Trigger AFTER INSERT OR DELETE pero falta FOR EACH ROW. Usa IF INSERTING/ELSIF DELETING con :NEW y :OLD. Usa SYSDATE. La lógica es correcta pero sin FOR EACH ROW no funcionaría correctamente (6/10 trigger).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Procedimiento vs Función | 9/10 |
| P2 Teórica - IN OUT | 9/10 |
| P3 Teórica - Función en SQL | 10/10 |
| P4 Teórica - Trigger | 10/10 |
| E1 Práctica - registrar_asignacion | 12/20 |
| E2 Práctica - Función + Procedimiento | 16/20 |
| E3 Práctica - Trigger Auditoría | 14/20 |
| **TOTAL** | **80/100** |
