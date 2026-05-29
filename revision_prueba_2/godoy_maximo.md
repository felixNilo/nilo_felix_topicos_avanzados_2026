# Revisión Prueba 2 - Máximo Godoy

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Diferencia Procedimiento vs Función (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Explica que un procedimiento realiza tareas y acepta valores de entrada/salida. La función devuelve un valor y se puede usar dentro de una consulta SQL. Correcto (4/5 diferencia).
- Menciona ejemplos genéricos en contexto (horas asignadas a incidente) (4/5 ejemplo).

---

### Pregunta 2 - Parámetro IN OUT (10 pts)
**Puntaje: 5/10**

**Retroalimentación:**
- Describe que IN OUT "se usa cuando deseamos recibir un valor", vago. No explica claramente el flujo de entrada y salida (2/5 descripción).
- No entrega ejemplo de código. Solo menciona conceptualmente que "las horas se ajustan y se devuelven" (3/5 ejemplo).

---

### Pregunta 3 - Función en Consulta SQL (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Explica que se llama a la función dentro de la consulta (3/5 explicación).
- La función está comentada pero es correcta en lógica: SUM(Horas) INTO, RETURN. Usa el parámetro como calificador en WHERE (5/5 ejemplo).

---

### Pregunta 4 - Trigger (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Define correctamente como bloque que se ejecuta como respuesta ante un evento. Menciona BEFORE INSERT y AFTER DELETE (4/5 explicación).
- El ejemplo está comentado pero es correcto: AFTER INSERT, FOR EACH ROW, UPDATE con :NEW.IncidenteID y condición Estado = 'Abierto' (5/5 ejemplo).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Procedimiento registrar_asignacion (20 pts)
**Puntaje: 6/20**

**Retroalimentación:**
- La estructura es incorrecta: pone INSERT antes de BEGIN, usa RETURN que no existe en procedimientos (1/5 inserción).
- Intenta actualizar estado pero la sintaxis es incorrecta: `SET p_Estado = 'En Proceso'` modifica parámetro, no tabla (1/5 actualización estado).
- Tiene EXCEPTION con NO_DATA_FOUND y DUP_VAL_ON_INDEX, demuestra comprensión de excepciones (2/5 validaciones).
- Estructura general incorrecta pero demuestra intento (2/5 excepciones).

---

### Ejercicio 2 - Función y Procedimiento (20 pts)
**Puntaje: 15/20**

**Retroalimentación:**
- Función calcular_horas_agente: usa SUM(Horas), RETURN. Tiene EXCEPTION con NO_DATA_FOUND. Falta NVL pero la lógica es correcta (8/10 función).
- Procedimiento mostrar_carga_agentes: usa CURSOR explícito con FOR LOOP, llama a la función con DBMS_OUTPUT. Correcto. Tiene EXCEPTION (7/10 procedimiento).

---

### Ejercicio 3 - Trigger de Auditoría (20 pts)
**Puntaje: 5/20**

**Retroalimentación:**
- Tabla AuditoriaAsignaciones con columnas correctas incluyendo FK (5/10 tabla).
- El trigger tiene AFTER INSERT OR DELETE y FOR EACH ROW, pero usa `:NEW.InsertarAccion` y `:NEW.EliminarAccion` que no existen. Debería usar IF INSERTING/ELSIF DELETING. Los INSERT no tienen VALUES (0/10 trigger).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Procedimiento vs Función | 8/10 |
| P2 Teórica - IN OUT | 5/10 |
| P3 Teórica - Función en SQL | 8/10 |
| P4 Teórica - Trigger | 9/10 |
| E1 Práctica - registrar_asignacion | 6/20 |
| E2 Práctica - Función + Procedimiento | 15/20 |
| E3 Práctica - Trigger Auditoría | 5/20 |
| **TOTAL** | **56/100** |
