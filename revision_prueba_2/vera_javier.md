# Revisión Prueba 2 - Javier Vera

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Diferencia Procedimiento vs Función (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Explica correctamente que un procedimiento no devuelve un valor, mientras que una función devuelve un valor (5/5 diferencia).
- Ejemplos en contexto: procedimiento para insertar registro, función para cálculo que devuelva valor. Correctos pero breves (3/5 ejemplo).

---

### Pregunta 2 - Parámetro IN OUT (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Describe correctamente que IN OUT permite recibir un valor de entrada y luego actualizarlo para devolverlo a la entidad que lo llame (5/5 descripción).
- El ejemplo es correcto y bien comentado: UPDATE con suma, SELECT INTO para devolver nuevo valor. Demuestra comprensión completa (5/5 ejemplo).

---

### Pregunta 3 - Función en Consulta SQL (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Explica que se llama a la función enviándole los parámetros necesarios para que devuelva un resultado (4/5 explicación).
- La función calcular_horas_totales es correcta: SUM(Horas) INTO, RETURN. La consulta SQL la usa correctamente: SELECT con función FROM Incidentes (6/5 ejemplo).

---

### Pregunta 4 - Trigger (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Define correctamente que se ejecuta automáticamente durante ciertos eventos. Menciona AFTER INSERT y BEFORE UPDATE como tipos. Explica que depende de acciones específicas (5/5 explicación).
- Ejemplo correcto y bien comentado: AFTER INSERT ON Asignaciones, FOR EACH ROW, UPDATE con :NEW.IncidenteID y condición Estado = 'Abierto'. Explica :NEW (5/5 ejemplo).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Procedimiento registrar_asignacion (20 pts)
**Puntaje: 17/20**

**Retroalimentación:**
- Inserta con NVL(MAX(AsignacionID), 0) + 1 (5/5 inserción).
- Actualiza estado a 'En Proceso' si estaba 'Abierto' (5/5 actualización estado).
- Valida existencia de agente, incidente y duplicado con COUNT y RAISE_APPLICATION_ERROR (5/5 validaciones).
- Tiene EXCEPTION WHEN OTHERS con RAISE. Usa DECLARE dentro de BEGIN (estructura inusual pero funcional). Falta COMMIT y ROLLBACK explícitos (2/5 excepciones).

---

### Ejercicio 2 - Función y Procedimiento (20 pts)
**Puntaje: 19/20**

**Retroalimentación:**
- Función calcular_horas_agente: usa SUM(Horas) INTO, NVL, RETURN. Correcta y bien comentada (10/10 función).
- Procedimiento mostrar_carga_agentes: usa FOR ... IN con DBMS_OUTPUT llamando a la función. Correcto. Falta `/` al final (9/10 procedimiento).

---

### Ejercicio 3 - Trigger de Auditoría (20 pts)
**Puntaje: 15/20**

**Retroalimentación:**
- Tabla AuditoriaAsignaciones con todas las columnas requeridas y PRIMARY KEY (10/10 tabla).
- Trigger AFTER INSERT OR DELETE, FOR EACH ROW. Usa CASE WHEN INSERTING/DELETING y SYSDATE. Pero usa solo :OLD para ambos casos (INSERT y DELETE), lo cual es incorrecto para INSERT (debería usar :NEW). Usa subquery para MAX(AuditoriaID)+1 dentro del INSERT (5/10 trigger).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Procedimiento vs Función | 8/10 |
| P2 Teórica - IN OUT | 10/10 |
| P3 Teórica - Función en SQL | 10/10 |
| P4 Teórica - Trigger | 10/10 |
| E1 Práctica - registrar_asignacion | 17/20 |
| E2 Práctica - Función + Procedimiento | 19/20 |
| E3 Práctica - Trigger Auditoría | 15/20 |
| **TOTAL** | **89/100** |
