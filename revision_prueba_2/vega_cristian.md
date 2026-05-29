# Revisión Prueba 2 - Cristian Vega

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Diferencia Procedimiento vs Función (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Explica correctamente: procedimiento realiza acciones y puede usar cursores, función devuelve un valor y se puede usar dentro de consultas SQL. Menciona que a ambas se les pasan parámetros pero la función tiene como salida el valor que devuelve (5/5 diferencia).
- Ejemplos en código: procedimiento que actualiza horas, función que calcula total de horas por incidente. Ambos correctos en lógica (5/5 ejemplo).

---

### Pregunta 2 - Parámetro IN OUT (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Describe correctamente que IN OUT permite pasar un valor, modificarlo y devolver el valor modificado al llamador (5/5 descripción).
- El ejemplo es correcto: procedimiento con p_total_horas IN OUT, UPDATE con suma, SELECT INTO para devolver nuevo valor. Tiene EXCEPTION (5/5 ejemplo).

---

### Pregunta 3 - Función en Consulta SQL (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Explica que se puede usar siempre que devuelva un valor, se llama en la parte de la consulta donde se necesita el valor (4/5 explicación).
- La función total_horas_incidente es correcta: SUM(Horas) INTO, RETURN, EXCEPTION. La consulta SQL la usa correctamente: SELECT IncidenteID, Descripcion, total_horas_incidente(IncidenteID) FROM Incidentes (6/5 ejemplo - completo).

---

### Pregunta 4 - Trigger (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Define correctamente como bloque SQL que se ejecuta automáticamente ante una acción. Menciona INSERT y UPDATE como eventos. Nota: dice que AFTER es "antes" y BEFORE es "después" (invertido) pero los ejemplos los usa correctamente (4/5 explicación).
- Ejemplo correcto: AFTER INSERT ON Asignaciones, FOR EACH ROW, UPDATE con :NEW.IncidenteID y condición Estado = 'Abierto' (5/5 ejemplo).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Procedimiento registrar_asignacion (20 pts)
**Puntaje: 17/20**

**Retroalimentación:**
- Inserta con secuencia (Asignacion_seq.NEXTVAL) en vez de MAX+1, pero es una solución válida (5/5 inserción).
- Actualiza estado a 'En Proceso' si estaba 'Abierto' (5/5 actualización estado).
- Valida existencia de agente e incidente con SELECT 1 INTO. Valida duplicado con SELECT 1 INTO. Usa DBMS_OUTPUT para errores en vez de RAISE_APPLICATION_ERROR (lo que no detiene ejecución) (4/5 validaciones).
- Tiene EXCEPTION WHEN OTHERS con DBMS_OUTPUT. Incluye COMMIT (3/5 excepciones).

---

### Ejercicio 2 - Función y Procedimiento (20 pts)
**Puntaje: 19/20**

**Retroalimentación:**
- Función calcular_horas_agente: usa SUM(Horas), RETURN. Tiene EXCEPTION que retorna 0. Falta NVL explícito pero maneja NULL con EXCEPTION (9/10 función).
- Procedimiento mostrar_carga_agentes: usa CURSOR explícito con FOR LOOP, llama a la función, muestra con DBMS_OUTPUT nombre, especialidad y horas. Tiene EXCEPTION (10/10 procedimiento).

---

### Ejercicio 3 - Trigger de Auditoría (20 pts)
**Puntaje: 19/20**

**Retroalimentación:**
- Tabla AuditoriaAsignaciones con todas las columnas requeridas y PRIMARY KEY (10/10 tabla).
- Trigger AFTER INSERT OR DELETE, FOR EACH ROW, IF INSERTING/ELSIF DELETING con :NEW y :OLD. Usa secuencia (Auditoria_seq.NEXTVAL). Tiene EXCEPTION. Correcto (9/10 trigger).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Procedimiento vs Función | 10/10 |
| P2 Teórica - IN OUT | 10/10 |
| P3 Teórica - Función en SQL | 10/10 |
| P4 Teórica - Trigger | 9/10 |
| E1 Práctica - registrar_asignacion | 17/20 |
| E2 Práctica - Función + Procedimiento | 19/20 |
| E3 Práctica - Trigger Auditoría | 19/20 |
| **TOTAL** | **94/100** |
