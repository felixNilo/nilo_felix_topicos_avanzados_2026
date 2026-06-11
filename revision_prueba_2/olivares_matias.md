# Revisión Prueba 2 Recuperativa - Matías Olivares

> **Nota:** Prueba recuperativa con mayor dificultad. Exigencia al 40%.

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Procedimiento vs Función + Completar Código (10 pts)
**Puntaje: 7/10**

**Retroalimentación:**
- Define correctamente la diferencia: procedimiento no devuelve valor, función sí (3/3 diferencia).
- Completa el código como PROCEDURE con parámetro OUT en vez de FUNCTION con RETURN. El código original era claramente una función (tiene RETURN VARCHAR2 y RETURN valor). El estudiante lo interpreta como procedimiento argumentando que "no devuelve un valor, sino que entrega el resultado a través del parámetro de salida". Sin embargo, el código usa RETURN directamente, lo cual es exclusivo de funciones (2/4 completar código).
- La explicación paso a paso es correcta y detallada (2/3 explicación paso a paso).

---

### Pregunta 2 - IN OUT con UPDATE Múltiple (10 pts)
**Puntaje: 10/10**

**Retroalimentación:**
- Describe correctamente que IN OUT permite pasar un valor y recibir uno de vuelta (5/5 descripción).
- El ejemplo es excelente: UPDATE múltiple con WHERE AgenteID, luego SELECT SUM(Horas) INTO v_total_horas, y finalmente `p_horas := v_total_horas`. Maneja EXCEPTION devolviendo -1. Cumple los 3 requisitos del enunciado (5/5 ejemplo).

---

### Pregunta 3 - Función con COUNT DISTINCT + Consulta con Filtro (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Explica que la función debe devolver un valor para ser usada en consulta (3/5 explicación - no muestra la consulta con filtro WHERE > 1).
- La función es correcta: COUNT(DISTINCT IncidenteID), RETURN, EXCEPTION. Pero falta la consulta SQL que la use con filtro de más de 1 incidente como se pedía (6/5 ejemplo de función - perfecto).

Nota: Falta la consulta `SELECT ... FROM Agentes WHERE contar_incidentes_agente(AgenteID) > 1`.

---

### Pregunta 4 - Trigger BEFORE INSERT con Validación (10 pts)
**Puntaje: 9/10**

**Retroalimentación:**
- Define trigger correctamente. Menciona BEFORE UPDATE y AFTER UPDATE como eventos. Debería haber mencionado INSERT ya que el trigger que implementa es BEFORE INSERT (3/5 explicación).
- El trigger es excelente: BEFORE INSERT ON Asignaciones, FOR EACH ROW, SELECT Severidad, IF 'Critical' THEN SELECT Especialidad, IF NOT IN ('Pentester', 'Forense Digital') THEN RAISE_APPLICATION_ERROR. Maneja NO_DATA_FOUND. Perfecto (6/5 ejemplo).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Procedimiento registrar_asignacion_multiple (20 pts)
**Puntaje: 19/20**

**Retroalimentación:**
- Parsea correctamente con REGEXP_SUBSTR y REGEXP_COUNT en un FOR LOOP (5/5 parseo).
- Valida existencia de agente y duplicado con COUNT (4/4 validaciones).
- Inserta con NVL(MAX(AsignacionID), 0) + 1 (4/4 inserción).
- Actualiza estado a 'En Proceso' si 'Abierto' (2/2 actualización).
- Usa BEGIN/EXCEPTION interno para que fallos individuales no detengan el proceso. Contadores de éxitos/fallos con DBMS_OUTPUT al final (4/5 tolerancia a fallos y reporte).
- Tiene EXCEPTION general. Falta COMMIT explícito (0/1).

---

### Ejercicio 2 - Función Costo + Procedimiento Reporte (20 pts)
**Puntaje: 18/20**

**Retroalimentación:**
- Función calcular_costo_incidente: usa SUM con CASE WHEN por especialidad (Pentester 50000, Analista SOC 35000, Forense Digital 45000). JOIN correcto entre Asignaciones y Agentes. RETURN. EXCEPTION. Excelente (10/10 función).
- Procedimiento reporte_costos (nombrado `reporte_casos`): usa FOR con subconsulta que incluye la función, ORDER BY CostoEstimado DESC. Muestra descripción, severidad, horas y costo. Tiene EXCEPTION. El nombre no coincide exactamente con el enunciado (8/10 procedimiento).

---

### Ejercicio 3 - Trigger Auditoría con UPDATE detallado (20 pts)
**Puntaje: 18/20**

**Retroalimentación:**
- Tabla AuditoriaAsignaciones con todas las columnas requeridas: AuditoriaID, AsignacionID, AgenteID, IncidenteID, Horas, Accion, CampoModificado, ValorAnterior, ValorNuevo, FechaRegistro (10/10 tabla).
- Trigger AFTER INSERT OR UPDATE OR DELETE, FOR EACH ROW. Maneja los 3 casos:
  - INSERT: registra acción con valores nuevos
  - UPDATE: detecta si cambió Horas o Rol con IF :OLD != :NEW, registra campo específico con valor anterior y nuevo
  - DELETE: registra con valores antiguos
  - Usa NVL(:NEW, :OLD) para campos comunes. Tiene `//` en vez de `||` en el EXCEPTION (error menor).
  - Nota: para UPDATE, si cambian Horas Y Rol simultáneamente, solo registra uno (debería hacer dos INSERTs separados como dice el enunciado) (8/10 trigger).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Proc vs Func + Completar | 7/10 |
| P2 Teórica - IN OUT múltiple | 10/10 |
| P3 Teórica - Función COUNT DISTINCT | 9/10 |
| P4 Teórica - Trigger BEFORE con validación | 9/10 |
| E1 Práctica - registrar_asignacion_multiple | 19/20 |
| E2 Práctica - Función costo + Reporte | 18/20 |
| E3 Práctica - Trigger auditoría completo | 18/20 |
| **TOTAL** | **90/100** |

> **Nota final: 6.5** (escala con 40% exigencia: Nota = 1.0 + (puntaje/40) × 3.0 para 0-39 pts, Nota = 4.0 + ((puntaje-40)/60) × 3.0 para 40-100 pts)
