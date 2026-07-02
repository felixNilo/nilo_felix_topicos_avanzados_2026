# Prueba 3 - Olivares, Matías

**Nota: 6.2 (86/100)**

## Parte 1 - Teórica

### P1 - Transacciones y Savepoints (9/10)
Excelente definición con propiedades ACID muy bien descritas. El ejemplo muestra múltiples savepoints con bloque anidado y ROLLBACK TO correcto. Explica detalladamente qué ocurre si falla el UPDATE. -1 pt por no usar un procedimiento almacenado (es un bloque anónimo).

### P2 - Data Warehouse (9/10)
Diferenciación OLTP vs DW muy completa. Modelo dimensional en esquema estrella con Fact, Dim_Agente, Dim_Incidente y Dim_Tiempo. Ventajas bien explicadas. -1 pt por no mencionar la ventaja de no impactar el sistema transaccional.

### P3 - Herencia Oracle (9/10)
Jerarquía correcta con NOT FINAL, UNDER y OVERRIDING. Explica NOT INSTANTIABLE correctamente. -1 pt por no incluir TYPE BODY con implementación de calcular_costo().

### P4 - Índices y Particiones (9/10)
Ventajas y desventajas muy bien descritas. Explica partition pruning con impacto en el plan. -1 pt por no mostrar código de ejemplo del índice compuesto.

## Parte 2 - Práctica

### E1 - Procedimiento registrar_asignacion (17/20)
- Inserción con MAX+1: ✓
- Validación horas con JOIN filtrando 'Abierto': ✓
- Validación agentes >= 3 con COUNT DISTINCT: ✓
- Savepoints independientes: ✓
- Excepciones descriptivas: ✓
- -3 pts: hace ROLLBACK TO sp_validacion_horas y luego ROLLBACK TO inicio_procedimiento en la misma excepción, lo que es redundante e inconsistente.

### E2 - Data Warehouse (17/20)
Tablas DW bien diseñadas con surrogate keys. Consulta analítica correcta con SUM, COUNT DISTINCT, JOIN y ORDER BY DESC. -3 pts por no incluir ETL de ejemplo para poblar las tablas DW.

### E3 - Índice y Partición (16/20)
Índice compuesto correcto. Partición trimestral con 4 particiones y sintaxis correcta. Consulta Q1 correcta. EXPLAIN PLAN con DBMS_XPLAN.DISPLAY presente. -4 pts por análisis de la ventaja muy breve (no menciona partition pruning explícitamente).
