# Prueba 3 - Cantuarias, Maximiliano

**Nota: 6.3 (89/100)**

## Parte 1 - Teórica

### P1 - Transacciones y Savepoints (9/10)
Excelente definición de transacción y propiedades ACID. El ejemplo muestra dos savepoints independientes con ROLLBACK TO correcto para cada caso. Explica bien qué ocurre si falla solo la actualización del estado. -1 pt por no incluir el ejemplo dentro de un procedimiento (es un bloque anónimo).

### P2 - Data Warehouse (9/10)
Buena diferenciación OLTP vs DW con tabla comparativa. Modelo dimensional correcto con Fact, Dim_Agente y Dim_Incidente. Ventajas bien explicadas. -1 pt por no mencionar explícitamente la ventaja de no afectar el rendimiento del sistema transaccional.

### P3 - Herencia Oracle (10/10)
Jerarquía de dos niveles perfecta con NOT FINAL, UNDER y OVERRIDING. Incluye TYPE BODY con implementación de calcular_costo() en cada nivel. Explica NOT INSTANTIABLE correctamente con sus implicancias.

### P4 - Índices y Particiones (9/10)
Ventajas y desventajas bien descritas para ambos. Ejemplo de partición trimestral correcto. Explica partition pruning con impacto en el plan de ejecución. -1 pt por no mostrar el índice compuesto en el código de ejemplo.

## Parte 2 - Práctica

### E1 - Procedimiento registrar_asignacion (18/20)
- Inserción con MAX+1: ✓
- Validación horas con JOIN filtrando 'Abierto' y suma p_Horas: ✓
- Validación agentes >= 3: ✓
- Savepoints independientes con ROLLBACK TO correcto: ✓
- Excepciones descriptivas: ✓
- -2 pts: hace ROLLBACK TO sp_insercion en el EXCEPTION de inserción, pero el savepoint se declara después del INSERT, lo que puede generar comportamiento inesperado.

### E2 - Data Warehouse (17/20)
Tablas DW bien diseñadas con surrogate keys. Consulta analítica correcta con SUM, COUNT DISTINCT, JOIN y ORDER BY DESC. Incluye además consulta sobre el DW. -3 pts porque la consulta analítica pedida era sobre tablas transaccionales, no sobre el DW.

### E3 - Índice y Partición (17/20)
Índice compuesto correcto. Partición trimestral con 4 particiones y sintaxis correcta. Consulta Q1 con filtro correcto. EXPLAIN PLAN con DBMS_XPLAN.DISPLAY presente. -3 pts porque no indica explícitamente qué ventaja aporta la partición para esta consulta.
