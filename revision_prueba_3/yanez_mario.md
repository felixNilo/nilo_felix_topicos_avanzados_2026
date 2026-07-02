# Prueba 3 - Yáñez, Mario

**Nota: 6.1 (85/100)**

## Parte 1 - Teórica

### P1 - Transacciones y Savepoints (9/10)
Excelente definición con propiedades ACID bien descritas. El ejemplo muestra dos savepoints con ROLLBACK TO correcto. Explica bien qué ocurre si falla el UPDATE. -1 pt por no usar un procedimiento almacenado (es un bloque anónimo).

### P2 - Data Warehouse (9/10)
Diferenciación OLTP vs DW muy completa. Modelo dimensional en esquema estrella con Fact, Dim_Agente y Dim_Incidente. Ventajas bien explicadas. -1 pt por no mencionar la ventaja de no impactar el sistema transaccional.

### P3 - Herencia Oracle (9/10)
Jerarquía correcta con NOT FINAL NOT INSTANTIABLE, UNDER y OVERRIDING. Explica NOT INSTANTIABLE correctamente. -1 pt por no incluir TYPE BODY con implementación de calcular_costo().

### P4 - Índices y Particiones (9/10)
Ventajas y desventajas bien descritas. Explica partition pruning con impacto en el plan. -1 pt por no mostrar código de ejemplo del índice compuesto.

## Parte 2 - Práctica

### E1 - Procedimiento registrar_asignacion (16/20)
- Inserción con MAX+1: ✓
- Validación horas con JOIN filtrando 'Abierto': ✓
- Validación agentes: usa `> 3` en vez de `>= 3` (ya insertó antes de validar, lógica válida en este contexto) → ✓
- Savepoints independientes: ✓
- Excepciones descriptivas: ✓
- -4 pts: hace ROLLBACK TO inicio_proc en todas las excepciones, no al savepoint correspondiente a cada validación.

### E2 - Data Warehouse (17/20)
Tablas DW bien diseñadas. Consulta analítica correcta con SUM, COUNT DISTINCT, JOIN y ORDER BY DESC. -3 pts por no incluir surrogate keys separadas de las PKs transaccionales.

### E3 - Índice y Partición (16/20)
Índice compuesto correcto. Partición trimestral con 4 particiones y sintaxis correcta. Consulta Q1 correcta. EXPLAIN PLAN con DBMS_XPLAN.DISPLAY presente. Explica la ventaja del partition pruning. -4 pts por análisis de la ventaja muy breve.
