# Revisión Prueba 2 - Matías Valencia

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Diferencia Procedimiento vs Función (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Explica correctamente que un procedimiento ejecuta consultas/modificaciones sin devolver valor, mientras que una función ejecuta una consulta y devuelve un valor (5/5 diferencia).
- Ejemplos en contexto: procedimiento para asignar agente como líder en incidente crítico, función para ver horas de agentes de apoyo. Correctos (4/5 ejemplo).

---

### Pregunta 2 - Parámetro IN OUT (10 pts)
**Puntaje: 7/10**

**Retroalimentación:**
- Describe que IN OUT se usaría "solamente cuando se tenga que actualizar un dato". Parcialmente correcto pero no explica el flujo de entrada/salida claramente (3/5 descripción).
- El ejemplo tiene p_horas_extra IN OUT, SELECT INTO, suma, UPDATE. La lógica demuestra comprensión aunque tiene errores menores (SELECT con dos columnas INTO una variable) (4/5 ejemplo).

---

### Pregunta 3 - Función en Consulta SQL (10 pts)
**Puntaje: 7/10**

**Retroalimentación:**
- Explica que primero se crea la función y luego se usa. Correcto pero breve (3/5 explicación).
- La función tiene SUM con GROUP BY (innecesario en función con WHERE por ID). La consulta SQL no pasa el parámetro a la función: `contar_horas_incidente()` sin argumento (4/5 ejemplo).

---

### Pregunta 4 - Trigger (10 pts)
**Puntaje: 6/10**

**Retroalimentación:**
- Define como "evento que hace modificaciones en los datos". Menciona antes y después de inserción como eventos. Parcialmente correcto (3/5 explicación).
- El ejemplo tiene errores: `ON Incidentes` y `AFTER INSERT ON Asignaciones` juntos (sintaxis incorrecta), usa variable sin asignarla con :NEW, no tiene WHERE con :NEW.IncidenteID. La lógica se entiende pero la implementación es incorrecta (3/5 ejemplo).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Procedimiento registrar_asignacion (20 pts)
**Puntaje: 9/20**

**Retroalimentación:**
- Inserta con NVL(MAX(AsignacionID)) + 1 pero dentro de VALUES directamente, lo cual no es válido en Oracle. Usa cursores innecesariamente (2/5 inserción).
- Intenta actualizar estado pero usa `SET incidente.Estado = 'En Proceso'` que es sintaxis incorrecta (2/5 actualización estado).
- Valida duplicado con cursor y RAISE excepción personalizada. Valida existencia con NO_DATA_FOUND. Pero la validación de duplicado se hace DESPUÉS del INSERT (2/5 validaciones).
- Tiene EXCEPTION con e_duplicado, NO_DATA_FOUND y WHEN OTHERS con ROLLBACK (3/5 excepciones).

---

### Ejercicio 2 - Función y Procedimiento (20 pts)
**Puntaje: 8/20**

**Retroalimentación:**
- Función calcular_horas_agente: tiene SELECT SUM pero falta INTO v_horas_agente. No asigna el resultado a la variable de retorno. La consulta de uso no pasa parámetro: `calcular_horas_agente()` (4/10 función).
- No hay procedimiento mostrar_carga_agentes. Solo una consulta SELECT que intenta usar la función (4/10 procedimiento).

---

### Ejercicio 3 - Trigger de Auditoría (20 pts)
**Puntaje: 12/20**

**Retroalimentación:**
- Tabla AuditoriaAsignaciones con GENERATED ALWAYS AS IDENTITY. Falta columna Horas y FechaRegistro (5/10 tabla).
- Crea DOS triggers separados (INSERT y DELETE). Usan :NEW y :OLD correctamente. Usa `ON AuditoriaAsignaciones` en vez de `ON Asignaciones` (error). Usa 'Insertado'/'Eliminado' en vez de 'INSERT'/'DELETE' (7/10 trigger).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Procedimiento vs Función | 9/10 |
| P2 Teórica - IN OUT | 7/10 |
| P3 Teórica - Función en SQL | 7/10 |
| P4 Teórica - Trigger | 6/10 |
| E1 Práctica - registrar_asignacion | 9/20 |
| E2 Práctica - Función + Procedimiento | 8/20 |
| E3 Práctica - Trigger Auditoría | 12/20 |
| **TOTAL** | **58/100** |
