# Revisión PAR (Examen Final) - Javier Vera

**Archivo:** `archivos_profe/Pruebas/eva_3.sql`

---

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Transacciones, ACID y Savepoints (10 pts)
**Puntaje: 7/10**

**Retroalimentación:**
- Define transacción correctamente como unidad indivisible de trabajo (✓).
- Lista las 4 propiedades ACID correctamente con descripción adecuada para cada una (✓ 4/4 ACID).
- El ejemplo usa T-SQL (SQL Server) en vez de Oracle PL/SQL, pero la lógica es correcta: usa `SAVE TRANSACTION SP1`, dos operaciones secuenciales, `COMMIT` si todo va bien y `ROLLBACK` en el `CATCH`. La idea de savepoint y manejo de error parcial está presente.
- Responde brevemente qué ocurre si falla la actualización del estado: "se revertirá la transacción" — correcto aunque escueto.
- El punto débil es que solo usa un savepoint (no múltiples independientes por operación como pide el enunciado), y el ROLLBACK es total, no parcial.
- **[4/4] ACID** | **[3/6] Savepoints con 3 operaciones**

---

### Pregunta 2 - Data Warehouse y modelo dimensional (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Explica DW correctamente y diferencia con BD transaccional (✓).
- Diseña tabla de hechos `Hechos_Tiempo_Trabajado` con PK, métricas (Horas) y FK implícitas a dimensiones (✓).
- Crea `Dim_Agente` y `Dim_Severidad` con PKs — dos dimensiones coherentes y bien estructuradas (✓).
- La consulta analítica es completa: JOIN doble a ambas dimensiones, SUM(Horas), GROUP BY con Nombre + Cargo + Severidad, ORDER BY DESC (✓).
- Menciona 3 ventajas del modelo dimensional vs tablas transaccionales (✓).
- Falta `Dim_Tiempo` con atributos temporales, que sería la dimensión más natural para análisis histórico.
- La diferencia OLTP vs DW es correcta pero superficial.
- **[2/3] Diferencia OLTP vs DW** | **[3/4] Modelo dimensional** | **[3/3] Consulta + ventajas**

---

### Pregunta 3 - Herencia con tipos de objetos (10 pts)
**Puntaje: 4/10**

**Retroalimentación:**
- Entiende la idea general de jerarquía de tipos y la aplica parcialmente (✓).
- Declara el tipo base `agente_obj` con `NOT INSTANTIABLE` — concepto presente (✓).
- Usa `UNDER agente_especialista_obj` en `agente_pentester_obj` y `OVERRIDING MEMBER FUNCTION calcular_costo()` — demuestra conocimiento de la sintaxis de herencia en Oracle (✓).
- El tipo base no tiene `NOT FINAL`, lo que en Oracle impediría usar `UNDER`. Tampoco declara `calcular_costo()` en el padre.
- `agente_especialista_obj` no usa `UNDER agente_obj` — la cadena de herencia queda incompleta en el nivel intermedio.
- La explicación de `NOT INSTANTIABLE` es incorrecta: dice que "no puede ser usado en otras tablas ni modificado", cuando significa que no se pueden crear instancias directas del tipo.
- **[2/4] Concepto de herencia** | **[2/6] Jerarquía de dos niveles**

---

### Pregunta 4 - Índices, particiones y partition pruning (10 pts)
**Puntaje: 7/10**

**Retroalimentación:**
- Explica ventajas y desventajas de índices y particiones — los conceptos son correctos aunque expresados de forma simple (✓).
- Crea índice compuesto correctamente: `CREATE INDEX idx_incidentes_severidad_fecha ON Incidentes (Severidad, FechaDeteccion)` (✓).
- Tabla particionada por rango con `PARTITION BY RANGE (FechaDeteccion)` y sintaxis Oracle correcta (✓). Los años usados son 2022-2024 en vez de semestres 2026, pero la mecánica es correcta.
- Define partition pruning correctamente: "técnica de optimización que permite mejorar el rendimiento en bases de datos particionadas" (✓).
- No profundiza en cómo impacta en el plan de ejecución (no menciona `PARTITION RANGE SINGLE` ni qué particiones se descartan).
- **[2/3] Ventajas/desventajas** | **[3/4] DDL tabla e índice** | **[2/3] Partition pruning**

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Procedimiento registrar_asignacion (20 pts)
**Puntaje: 14/20**

**Retroalimentación:**
- El enunciado de la PAR pide `registrar_asignacion` — Vera lo responde correctamente (✓).
- Estructura general sólida: INSERT con secuencia, validaciones con IF, SAVEPOINT, ROLLBACK TO, COMMIT (✓).
- Usa `AsignacionID_SEQ.NEXTVAL` para el próximo ID disponible (✓).
- Validación de horas totales con `SUM(Horas)` incluyendo las recién insertadas — lógica correcta (✓).
- Usa `RAISE_APPLICATION_ERROR` con mensajes descriptivos para ambas validaciones (✓).
- Sintaxis de parámetros incorrecta para Oracle: `IN p_agenteID NUMBER` en vez de `p_agenteID IN NUMBER`.
- Ambas validaciones hacen `ROLLBACK TO sp1` (el mismo savepoint inicial) — no son savepoints independientes por validación como pide el enunciado.
- Validación de 3 agentes usa `> 3` en vez de `>= 3`.
- **[3/4] Validación existencia/estado** | **[4/4] INSERT y lógica principal** | **[3/4] Advertencia condicional** | **[2/4] Savepoints** | **[2/4] Excepciones**

---

### Ejercicio 2 - DW y consulta analítica (20 pts)
**Puntaje: 14/20**

**Retroalimentación:**
- Crea las 3 tablas pedidas: `Fact_Asignaciones`, `Dim_Agente` y `Dim_Incidente` (✓).
- `Dim_Incidente` incluye Severidad, FechaDeteccion y Descripcion — dimensión bien pensada (✓).
- La consulta analítica sobre las tablas DW es correcta: JOIN, SUM(Horas), COUNT(IncidenteID), GROUP BY Nombre, ORDER BY TotalHoras DESC (✓).
- Usa `CREATE TABLE AS SELECT` — funcional pero no es diseño DDL formal para un DW (sin PKs ni FKs explícitas).
- La consulta se hace sobre las tablas DW en vez de las tablas transaccionales como pide el enunciado — error de interpretación.
- **[3/6] Diseño tablas DW** | **[7/8] Consulta analítica** | **[4/6] Estructura general**

---

### Ejercicio 3 - Partición por rango e índice (20 pts)
**Puntaje: 13/20**

**Retroalimentación:**
- Crea índice compuesto sobre `(Severidad, FechaDeteccion)` correctamente (✓).
- Tabla particionada por rango con sintaxis Oracle correcta (✓). Reutiliza las particiones de T4 (años 2022-2024) en vez de trimestral 2026 — las particiones no cubren el período consultado.
- La consulta filtra por `Severidad = 'Critical'` y primer trimestre de 2026 correctamente, con JOIN a Asignaciones y SUM(Horas) agrupado por incidente (✓).
- `EXPLAIN PLAN FOR` y `SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY)` presentes y correctos (✓).
- No indica explícitamente la ventaja del partition pruning para esta consulta — falta mencionar qué particiones se descartan y el impacto en I/O.
- **[3/6] Tabla particionada** | **[4/4] Índice** | **[4/4] Consulta** | **[2/6] Plan y análisis**

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| T1 - Transacciones, ACID y Savepoints | 7/10 |
| T2 - Data Warehouse y modelo dimensional | 8/10 |
| T3 - Herencia con tipos de objetos | 4/10 |
| T4 - Índices, particiones y partition pruning | 7/10 |
| E1 - Procedimiento registrar_asignacion | 14/20 |
| E2 - DW y consulta analítica | 14/20 |
| E3 - Partición por rango e índice | 13/20 |
| **TOTAL** | **67/100** |

**Nota final: 1.0 + (67/100) × 6.0 = 5.02 → Nota: 5.0**
