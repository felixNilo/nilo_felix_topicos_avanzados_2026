# Revisión Prueba 2 - Maximiliano Cantuarias

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Diferencia Procedimiento vs Función (10 pts)
**Puntaje: 6/10**

**Retroalimentación:**
- La definición tiene errores conceptuales: dice que un procedimiento "no sobrescribe nada" y "sirve para mostrar o revisar valores", lo cual es incorrecto ya que un procedimiento SÍ puede hacer INSERT/UPDATE/DELETE. Sí menciona que la función "puede entrar en acción con los valores" y que devuelve algo (3/5 diferencia).
- Los ejemplos en contexto son aceptables: procedimiento para ver totales, función para calcular tiempos (3/5 ejemplo).

---

### Pregunta 2 - Parámetro IN OUT (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Describe que se crea una variable que recibe horas antes y luego se calcula y asigna después. Se entiende el concepto de entrada/salida (4/5 descripción).
- El ejemplo tiene la estructura correcta: CREATE PROCEDURE con IN OUT, SELECT INTO, asignación `:=`, UPDATE. La lógica demuestra comprensión (4/5 ejemplo).

---

### Pregunta 3 - Función en Consulta SQL (10 pts)
**Puntaje: 5/10**

**Retroalimentación:**
- Explica que se puede usar para definir un límite o filtrar. No es la explicación más precisa pero demuestra comprensión parcial (2/5 explicación).
- La función tiene SELECT INTO con NVL y SUM, correcto en lógica. El uso con FOR LOOP y DBMS_OUTPUT demuestra comprensión aunque está incompleto (3/5 ejemplo).

---

### Pregunta 4 - Trigger (10 pts)
**Puntaje: 7/10**

**Retroalimentación:**
- Define correctamente que un trigger es una modificación automática según condiciones. Menciona INSERT como evento (3/5 explicación).
- El ejemplo tiene AFTER INSERT ON Asignaciones, FOR EACH ROW, UPDATE con condición Estado = 'Abierto'. La lógica es correcta aunque tiene errores de sintaxis (4/5 ejemplo).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Procedimiento registrar_asignacion (20 pts)
**Puntaje: 19/20**

**Retroalimentación:**
- Inserta con NVL(MAX(AsignacionID), 0) + 1 (5/5 inserción).
- Actualiza estado a 'En Proceso' si estaba 'Abierto' (5/5 actualización estado).
- Valida existencia de agente, incidente y duplicado con COUNT y RAISE_APPLICATION_ERROR (5/5 validaciones).
- Tiene EXCEPTION WHEN OTHERS con ROLLBACK y RAISE. Incluye COMMIT (4/5 excepciones).

---

### Ejercicio 2 - Función y Procedimiento (20 pts)
**Puntaje: 19/20**

**Retroalimentación:**
- Función calcular_horas_agente: usa NVL(SUM(Horas), 0), RETURN. Tiene EXCEPTION. Correcta (10/10 función).
- Procedimiento mostrar_carga_agentes: usa FOR ... IN con DBMS_OUTPUT llamando a la función. Correcto y funcional (9/10 procedimiento).

---

### Ejercicio 3 - Trigger de Auditoría (20 pts)
**Puntaje: 17/20**

**Retroalimentación:**
- Tabla AuditoriaAsignaciones con columnas correctas. Agrega FOREIGN KEY que podrían causar problemas con DELETE pero la estructura está bien (8/10 tabla).
- Trigger AFTER INSERT OR DELETE, FOR EACH ROW, IF INSERTING/ELSIF DELETING con :NEW y :OLD. Usa NVL(MAX(...)) para ID. Correcto (9/10 trigger).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Procedimiento vs Función | 6/10 |
| P2 Teórica - IN OUT | 8/10 |
| P3 Teórica - Función en SQL | 5/10 |
| P4 Teórica - Trigger | 7/10 |
| E1 Práctica - registrar_asignacion | 19/20 |
| E2 Práctica - Función + Procedimiento | 19/20 |
| E3 Práctica - Trigger Auditoría | 17/20 |
| **TOTAL** | **81/100** |
