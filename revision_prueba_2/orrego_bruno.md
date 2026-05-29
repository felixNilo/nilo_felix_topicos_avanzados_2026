# Revisión Prueba 2 - Bruno Orrego

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Diferencia Procedimiento vs Función (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Explica correctamente: función para lectura con RETURN de un único valor, procedimiento para ejecutar acciones lógicas y editar la base de datos. Clara diferencia (5/5 diferencia).
- Ejemplos en contexto: función calcular_horas_agente que retorna horas, procedimiento registrar_asignacion que hace INSERT. Excelente conexión con los ejercicios (5/5 ejemplo).

---

### Pregunta 2 - Parámetro IN OUT (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Describe correctamente que IN OUT tiene un valor inicial que es procesado y al terminar se actualiza y devuelve al llamador (5/5 descripción).
- El ejemplo está comentado pero es correcto: SELECT SUM INTO p_horas_asignadas, suma +2, UPDATE. Demuestra comprensión del flujo IN OUT (4/5 ejemplo).

---

### Pregunta 3 - Función en Consulta SQL (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Explica que se invocan mediante SELECT, WHERE y ORDER BY. Correcto (4/5 explicación).
- La función está comentada pero es correcta: NVL(SUM(horas), 0), RETURN. Demuestra comprensión (5/5 ejemplo).

---

### Pregunta 4 - Trigger (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Define correctamente como bloque PL/SQL automático ante eventos en tablas/vistas. Menciona INSERT y UPDATE como eventos. Útil para automatizar, auditar y mantener integridad (5/5 explicación).
- El ejemplo está comentado pero es correcto: AFTER INSERT ON Asignaciones, FOR EACH ROW, UPDATE con :NEW.IncidenteID y condición Estado = 'Abierto' (5/5 ejemplo).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Procedimiento registrar_asignacion (20 pts)
**Puntaje: 20/20**

**Retroalimentación:**
- Inserta con NVL(MAX(AsignacionID), 0) + 1 (5/5 inserción).
- Actualiza estado a 'En Proceso' si estaba 'Abierto' (5/5 actualización estado).
- Valida existencia de agente (con excepción personalizada), incidente (con NO_DATA_FOUND del SELECT Estado), y duplicado (con excepción personalizada). Usa DECLARE para excepciones propias (5/5 validaciones).
- Tiene EXCEPTION con excepciones personalizadas, NO_DATA_FOUND y WHEN OTHERS, todos con ROLLBACK y DBMS_OUTPUT. Incluye COMMIT (5/5 excepciones).

---

### Ejercicio 2 - Función y Procedimiento (20 pts)
**Puntaje: 20/20**

**Retroalimentación:**
- Función calcular_horas_agente: usa NVL(SUM(Horas), 0), RETURN. Correcta (10/10 función).
- Procedimiento mostrar_carga_agentes: usa FOR ... IN con DBMS_OUTPUT llamando a la función. Correcto y funcional (10/10 procedimiento).

---

### Ejercicio 3 - Trigger de Auditoría (20 pts)
**Puntaje: 20/20**

**Retroalimentación:**
- Tabla AuditoriaAsignaciones con GENERATED ALWAYS AS IDENTITY PRIMARY KEY y todas las columnas requeridas (10/10 tabla).
- Trigger AFTER INSERT OR DELETE, FOR EACH ROW, IF INSERTING/ELSIF DELETING con :NEW y :OLD. Usa SYSDATE. Correcto y funcional (10/10 trigger).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Procedimiento vs Función | 10/10 |
| P2 Teórica - IN OUT | 9/10 |
| P3 Teórica - Función en SQL | 9/10 |
| P4 Teórica - Trigger | 10/10 |
| E1 Práctica - registrar_asignacion | 20/20 |
| E2 Práctica - Función + Procedimiento | 20/20 |
| E3 Práctica - Trigger Auditoría | 20/20 |
| **TOTAL** | **98/100** |
