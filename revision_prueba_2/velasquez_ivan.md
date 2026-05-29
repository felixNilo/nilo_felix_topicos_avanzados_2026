# Revisión Prueba 2 - Iván Velásquez

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Diferencia Procedimiento vs Función (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Explica correctamente: función obligada a devolver un único valor con RETURN y se usa en consultas SQL. Procedimiento ejecuta secuencia de acciones, no obligado a devolver nada, no se puede usar en SELECT (5/5 diferencia).
- Ejemplos en contexto: función para calcular días que lleva abierto un incidente, procedimiento para cierre mensual de incidentes. Correctos (5/5 ejemplo).

---

### Pregunta 2 - Parámetro IN OUT (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Describe correctamente que IN OUT entra con valor inicial, la lógica interna lo modifica, y devuelve el valor modificado en la misma variable. No requiere RETURN (5/5 descripción).
- El ejemplo está en pseudocódigo pero demuestra comprensión completa del flujo: consultar horas actuales, sumar ajuste, actualizar BD, guardar nuevo total en la variable (4/5 ejemplo).

---

### Pregunta 3 - Función en Consulta SQL (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Explica que no debe realizar cambios en la BD y se puede usar como función nativa dentro de un SELECT. Correcto (4/5 explicación).
- El ejemplo está en pseudocódigo con la consulta SQL al final. Demuestra comprensión del concepto (4/5 ejemplo).

---

### Pregunta 4 - Trigger (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Define correctamente como bloque automático ante eventos. Menciona eventos DML (INSERT, UPDATE, DELETE) y DDL (CREATE, ALTER). Completo (5/5 explicación).
- El ejemplo está en pseudocódigo pero la lógica es correcta: después de insertar, verificar estado y cambiar a 'En Proceso' si estaba 'Abierto' (4/5 ejemplo).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Procedimiento registrar_asignacion (20 pts)
**Puntaje: 20/20**

**Retroalimentación:**
- Inserta con NVL(MAX(AsignacionID), 0) + 1 (5/5 inserción).
- Actualiza estado a 'En Proceso' si estaba 'Abierto' con IF y SELECT Estado INTO (5/5 actualización estado).
- Valida existencia de agente, incidente y duplicado con COUNT y excepciones personalizadas (DECLARE EXCEPTION, RAISE) (5/5 validaciones).
- Tiene EXCEPTION con excepciones personalizadas (ex_agente_no_existe, ex_incidente_no_existe, ex_ya_asignado) y WHEN OTHERS con ROLLBACK. Incluye COMMIT. Excelente manejo (5/5 excepciones).

---

### Ejercicio 2 - Función y Procedimiento (20 pts)
**Puntaje: 20/20**

**Retroalimentación:**
- Función calcular_horas_agente: usa NVL(SUM(Horas), 0), RETURN. Inicializa variable en 0. Correcta (10/10 función).
- Procedimiento mostrar_carga_agentes: usa CURSOR explícito, FOR LOOP, llama a la función, muestra con DBMS_OUTPUT formateado con RPAD. Excelente (10/10 procedimiento).

---

### Ejercicio 3 - Trigger de Auditoría (20 pts)
**Puntaje: 20/20**

**Retroalimentación:**
- Tabla AuditoriaAsignaciones con GENERATED ALWAYS AS IDENTITY PRIMARY KEY y todas las columnas (10/10 tabla).
- Trigger AFTER INSERT OR DELETE, FOR EACH ROW, IF INSERTING/ELSIF DELETING con :NEW y :OLD. Usa SYSDATE. Correcto y funcional (10/10 trigger).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Procedimiento vs Función | 10/10 |
| P2 Teórica - IN OUT | 9/10 |
| P3 Teórica - Función en SQL | 8/10 |
| P4 Teórica - Trigger | 9/10 |
| E1 Práctica - registrar_asignacion | 20/20 |
| E2 Práctica - Función + Procedimiento | 20/20 |
| E3 Práctica - Trigger Auditoría | 20/20 |
| **TOTAL** | **96/100** |
