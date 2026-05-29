# Revisión Prueba 2 - Dylan Hernández

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Diferencia Procedimiento vs Función (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Explica correctamente que un procedimiento hace una tarea específica y no devuelve valor, mientras que una función sí devuelve un valor (5/5 diferencia).
- No da ejemplos concretos en el contexto de la prueba (3/5 ejemplo).

---

### Pregunta 2 - Parámetro IN OUT (10 pts)
**Puntaje: 7/10**

**Retroalimentación:**
- Describe correctamente que IN OUT permite pasar un valor, modificarlo dentro del procedimiento y que el valor modificado pueda accederse fuera (4/5 descripción).
- No entrega ejemplo de código (3/5 ejemplo - la descripción conceptual es correcta).

---

### Pregunta 3 - Función en Consulta SQL (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Explica que basta con llamarla por su nombre y pasarle los parámetros necesarios. Correcto (3/5 explicación).
- La función está comentada pero es correcta: SUM(Horas) INTO, RETURN. La consulta SQL que la usa también es correcta: SELECT con función FROM Incidentes (5/5 ejemplo).

---

### Pregunta 4 - Trigger (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Define correctamente que un trigger se ejecuta automáticamente después o antes de alguna modificación. Menciona INSERT y UPDATE como eventos (4/5 explicación).
- No entrega ejemplo de código para el trigger (4/5 ejemplo - la explicación conceptual demuestra comprensión).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Procedimiento registrar_asignacion (20 pts)
**Puntaje: 14/20**

**Retroalimentación:**
- Inserta con AsignacionID como parámetro de entrada (no calcula el próximo disponible como se pedía) (3/5 inserción).
- Actualiza estado a 'En proceso' si estaba 'Abierto' (5/5 actualización estado).
- Valida existencia de agente e incidente con COUNT. Usa RAISE NO_DATA_FOUND si alguno es 0, lo cual es válido (3/5 validaciones - no valida duplicado de asignación).
- Tiene EXCEPTION con NO_DATA_FOUND y WHEN OTHERS con ROLLBACK y DBMS_OUTPUT (3/5 excepciones).

---

### Ejercicio 2 - Función y Procedimiento (20 pts)
**Puntaje: 16/20**

**Retroalimentación:**
- Función calcular_horas_agente: usa SUM(Horas), RETURN. Falta NVL pero la lógica es correcta (8/10 función).
- Procedimiento mostrar_carga_agentes: usa FOR ... IN con SELECT que incluye la función directamente en la consulta. Muestra con DBMS_OUTPUT nombre, especialidad y horas. Correcto (8/10 procedimiento).

---

### Ejercicio 3 - Trigger de Auditoría (20 pts)
**Puntaje: 8/20**

**Retroalimentación:**
- Tabla AuditoriaAsignaciones con columnas correctas incluyendo Rol adicional (5/10 tabla).
- El trigger tiene AFTER INSERT OR DELETE, FOR EACH ROW, IF INSERTING THEN INSERT con :NEW. Pero está incompleto: el código se corta a mitad del INSERT y no tiene la parte de DELETING ni END (3/10 trigger).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Procedimiento vs Función | 8/10 |
| P2 Teórica - IN OUT | 7/10 |
| P3 Teórica - Función en SQL | 8/10 |
| P4 Teórica - Trigger | 8/10 |
| E1 Práctica - registrar_asignacion | 14/20 |
| E2 Práctica - Función + Procedimiento | 16/20 |
| E3 Práctica - Trigger Auditoría | 8/20 |
| **TOTAL** | **69/100** |
