# Revisión Prueba 3 - Vera, Javier

**Archivo:** `archivos_profe/Pruebas/eva_3.sql`
**Total:** 55/100 → **Nota: 4.3**

---

## Parte Teórica

### T1 - Transacciones y ACID (8/15)
- Define transacción correctamente.
- Lista las 4 propiedades ACID pero el orden es raro (empieza por Consistencia, Atomicidad al final).
- El ejemplo usa T-SQL (SQL Server: BEGIN TRANSACTION, BEGIN TRY/CATCH, THROW) en vez de Oracle PL/SQL.
- No usa savepoints independientes como pide el enunciado — hace ROLLBACK TRANSACTION completo en el CATCH, no ROLLBACK TO SAVEPOINT.
- No responde explícitamente qué ocurre si falla solo la actualización del estado.

### T2 - Data Warehouse y modelo dimensional (11/15)
- Explica DW correctamente y diferencia con BD transaccional (aunque superficialmente).
- Diseña tabla de hechos y 2 dimensiones (Dim_Agente, Dim_Severidad) — correcto.
- Consulta analítica con JOIN y GROUP BY correcta.
- Falta profundidad en las ventajas del modelo dimensional vs consultar tablas transaccionales.

### T3 - Herencia en Oracle (5/15)
- Entiende la idea general de jerarquía.
- Los subtipos no usan UNDER (no hay herencia real, son tipos independientes).
- No declara calcular_costo() en el tipo padre.
- Confunde NOT INSTANTIABLE: dice que "no puede ser usado en otras tablas ni modificado", lo cual es incorrecto.
- La sintaxis de OVERRIDING MEMBER FUNCTION aparece solo en el último tipo y sin cuerpo.

### T4 - Índices y particiones (9/15)
- Explica ventajas/desventajas de índices y particiones, aunque muy superficial.
- Crea índice compuesto correctamente: `CREATE INDEX idx_incidentes_severidad_fecha ON Incidentes (Severidad, FechaDeteccion)`.
- Partición por rango correcta en estructura, pero usa años 2022-2024 en vez de 2026 (no corresponde al esquema de la prueba).
- Explica partition pruning brevemente y correctamente.

---

## Parte Práctica

### E1 - Procedimiento registrar_asignacion (9/15)
- Estructura general correcta: INSERT, validaciones, SAVEPOINT, ROLLBACK TO, COMMIT.
- Error del patrón común: ambas validaciones hacen ROLLBACK TO sp1 (el mismo savepoint inicial), en vez de tener savepoints independientes por validación.
- Sintaxis mezclada: usa `IN p_agenteID` (estilo MySQL/SQL Server) en vez de Oracle (`p_agenteID IN`).
- La lógica de validación de horas incluye las horas recién insertadas en el SUM, lo cual es correcto.
- Validación de 3 agentes usa `> 3` en vez de `>= 3`.

### E2 - DW y consulta analítica (7/15)
- Crea las tablas DW con `CREATE TABLE AS SELECT` — no es diseño DDL correcto para un DW (debería definir estructura + claves + luego INSERT).
- La consulta analítica la hace sobre las tablas DW (Fact_Asignaciones, Dim_Agente) en vez de las tablas transaccionales como pide el enunciado.
- La consulta en sí es correcta (JOIN, SUM, COUNT, GROUP BY, ORDER BY DESC).

### E3 - Índice, partición y EXPLAIN PLAN (6/10)
- Reutiliza el índice y la partición de T4 (años 2022-2024, no 2026).
- EXPLAIN PLAN y DBMS_XPLAN.DISPLAY correctos.
- La consulta filtra por 'Critical' y primer trimestre correctamente.
- No indica explícitamente la ventaja del partition pruning para esta consulta específica.
