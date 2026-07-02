# Revisión Prueba 3 - Hernández, Dylan

**Archivo:** `prueba_3.sql`
**Total:** 77/100 → **Nota: 5.6**

---

## Parte Teórica

### T1 - Transacciones y ACID (8/10)
- Define transacción y las 4 propiedades ACID correctamente.
- Ejemplo con dos savepoints independientes (sp_antes_asignacion, sp_antes_estado) bien estructurado.
- Responde correctamente qué ocurre si falla la actualización del estado.
- Error: en el bloque EXCEPTION hace ROLLBACK TO sp_inicio_global en vez de sp_antes_estado, lo que deshace también la asignación válida.

### T2 - Data Warehouse y modelo dimensional (7/10)
- Diferencia DW vs BD transaccional correcta y bien explicada.
- Enumera 3 ventajas concretas del modelo dimensional (eliminación de JOINs, agregaciones pre-calculadas, historial inmutable).
- No diseña las tablas explícitamente (no hay DDL de tabla de hechos ni dimensiones).

### T3 - Herencia en Oracle (10/10)
- Jerarquía completa y correcta: t_agente_base → t_agente_especialista → t_agente_pentester.
- Usa UNDER correctamente en ambos niveles.
- NOT INSTANTIABLE explicado correctamente ("como una clase abstracta, Oracle prohíbe instanciarla directamente").
- OVERRIDING MEMBER FUNCTION con cuerpo implementado en los 3 niveles, con lógica diferente en cada uno.

### T4 - Índices y particiones (9/10)
- Explica ventajas/desventajas de índices y particiones con buena profundidad.
- Partition pruning explicado correctamente con impacto en plan de ejecución (PARTITION RANGE SINGLE, INDEX RANGE SCAN).
- Crea tabla particionada por rango con fechas 2026 y índice LOCAL compuesto.
- Muestra EXPLAIN PLAN y describe el resultado esperado del plan.
- Falta el EXPLAIN PLAN FOR antes de la consulta (solo muestra DBMS_XPLAN.DISPLAY).

---

## Parte Práctica

### E1 - Procedimiento registrar_asignacion (14/20)
- Estructura correcta: INSERT, savepoints independientes por validación, COMMIT, EXCEPTION handlers.
- Validación de horas filtra por Estado='Abierto' (detalle correcto y más preciso que la pauta).
- Error de typo: `RAISE s` en vez de `RAISE limite_horas`.
- Error del patrón común: en los handlers EXCEPTION hace ROLLBACK TO save_inicio en vez del savepoint correspondiente a cada validación.
- Usa %TYPE para los parámetros (buena práctica).

### E2 - DW y consulta analítica (17/20)
- Diseña las 3 tablas DW con DDL correcto: claves primarias, foreign keys, tipos de datos apropiados.
- Agrega índices en las FK de Fact_Asignaciones (buena práctica).
- Consulta analítica sobre tablas transaccionales correcta: LEFT JOIN, SUM(Horas), COUNT(DISTINCT IncidenteID), GROUP BY, ORDER BY DESC.
- Error menor: el alias en ORDER BY usa comillas distintas al definido en SELECT (`"total de horas trabajadas"` vs `"Total Horas Trabajadas"`).
- Nota: hay código duplicado (las tablas DW se crean dos veces con DROP/CREATE).

### E3 - Índice, partición y EXPLAIN PLAN (12/20)
- Crea tabla particionada con buena estructura, pero usa particiones mensuales de 2025 en vez de trimestrales de 2026 como pedía el enunciado.
- El índice no es LOCAL (falta la cláusula LOCAL para que sea un índice local particionado).
- EXPLAIN PLAN presente y correcto.
- No escribe la consulta específica de horas por incidente Critical en el primer trimestre de 2026.
