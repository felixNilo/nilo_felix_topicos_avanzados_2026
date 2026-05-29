# Revisión Prueba 2 - Sebastián Arredondo

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Diferencia Procedimiento vs Función (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Explica correctamente que un procedimiento no devuelve un valor y una función sí (5/5 diferencia).
- Da ejemplos en código comentado: procedimiento para registrar asignación y función para calcular horas. Se entiende el contexto y la lógica (4/5 ejemplo).

---

### Pregunta 2 - Parámetro IN OUT (10 pts)
**Puntaje: 6/10**

**Retroalimentación:**
- Describe que IN OUT "se utiliza para pasar valores a un procedimiento o función", vago. No explica claramente que permite pasar Y retornar un valor modificado (2/5 descripción).
- El ejemplo usa IN OUT y hace SELECT SUM INTO y luego suma 2. La lógica demuestra comprensión parcial del concepto aunque el flujo no es el más claro (4/5 ejemplo).

---

### Pregunta 3 - Función en Consulta SQL (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Explica que se usa para simplificar consultas y ejecutar dinámicamente. Muestra la consulta `select nombre, calcular_horas(agenteID) as total from agentes;` que demuestra comprensión de cómo invocarla (4/5 explicación).
- El código de la función usa CREATE PROCEDURE en vez de FUNCTION, pero la lógica (SUM, INTO) y la consulta de uso son correctas. Demuestra comprensión del concepto (4/5 ejemplo).

---

### Pregunta 4 - Trigger (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Define correctamente que un trigger es un disparador automático ante eventos. Menciona INSERT y UPDATE. Da ejemplos de uso (auditoría, actualización de tablas relacionadas) (4/5 explicación).
- El ejemplo tiene la estructura correcta: AFTER INSERT, FOR EACH ROW, UPDATE con :NEW y condición Estado = 'Abierto'. Demuestra comprensión aunque la sintaxis está incompleta (4/5 ejemplo).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Procedimiento registrar_asignacion (20 pts)
**Puntaje: 14/20**

**Retroalimentación:**
- Inserta con MAX(AsignacionID) + 1 (4/5 inserción - no usa NVL para tabla vacía).
- Actualiza estado a 'pendiente' en vez de 'En Proceso', y compara con 'abierto' en minúscula (3/5 actualización estado).
- Valida existencia de agente, incidente y duplicado con COUNT. Pero usa DBMS_OUTPUT en vez de RAISE_APPLICATION_ERROR, lo que no detiene la ejecución (3/5 validaciones).
- Tiene COMMIT y mensaje de éxito (4/5 excepciones).

---

### Ejercicio 2 - Función y Procedimiento (20 pts)
**Puntaje: 19/20**

**Retroalimentación:**
- Función calcular_horas_agente: usa NVL(SUM(Horas), 0), RETURN. Correcta y funcional (10/10 función).
- Procedimiento mostrar_carga_agentes: usa FOR ... IN con DBMS_OUTPUT y llama a la función. Usa RPAD para formateo. Correcto (9/10 procedimiento).

---

### Ejercicio 3 - Trigger de Auditoría (20 pts)
**Puntaje: 19/20**

**Retroalimentación:**
- Tabla AuditoriaAsignaciones con columnas correctas, usa SEQUENCE para ID (10/10 tabla).
- Trigger AFTER INSERT OR DELETE, FOR EACH ROW, IF INSERTING/ELSIF DELETING con :NEW y :OLD. Usa seq_auditoria.NEXTVAL. Correcto (9/10 trigger).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Procedimiento vs Función | 9/10 |
| P2 Teórica - IN OUT | 6/10 |
| P3 Teórica - Función en SQL | 8/10 |
| P4 Teórica - Trigger | 8/10 |
| E1 Práctica - registrar_asignacion | 14/20 |
| E2 Práctica - Función + Procedimiento | 19/20 |
| E3 Práctica - Trigger Auditoría | 19/20 |
| **TOTAL** | **83/100** |
