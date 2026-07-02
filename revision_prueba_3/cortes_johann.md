# Prueba 3 - Cortés, Johann

**Nota: 6.2 (86/100)**

## Parte 1 - Teórica

### P1 - Transacciones y Savepoints (9/10)
Excelente definición y propiedades ACID bien descritas. El ejemplo muestra dos savepoints con bloque anidado y ROLLBACK TO correcto. Explica bien qué ocurre si falla el UPDATE. -1 pt menor por sintaxis del TYPE BODY en la P3 que se mezcla con la P1.

### P2 - Data Warehouse (9/10)
Diferenciación OLTP vs DW clara. Modelo dimensional correcto con Fact, Dim_Agente y Dim_Incidente. Ventajas bien explicadas. -1 pt por no mencionar la ventaja de no impactar el sistema transaccional.

### P3 - Herencia Oracle (10/10)
Jerarquía perfecta con NOT FINAL, UNDER y OVERRIDING. Incluye TYPE BODY con implementación de calcular_costo() en cada nivel. Explica NOT INSTANTIABLE correctamente.

### P4 - Índices y Particiones (8/10)
Ventajas y desventajas correctas. Explica partition pruning con impacto en I/O. -2 pts por no mostrar código de ejemplo del índice compuesto ni la partición.

## Parte 2 - Práctica

### E1 - Procedimiento registrar_asignacion (16/20)
- Inserción con MAX+1: ✓
- Validación horas con JOIN filtrando 'Abierto': ✓
- Validación agentes >= 3: ✓
- Savepoints independientes: ✓ (usa bloques BEGIN...EXCEPTION...END anidados)
- -4 pts: la lógica de validación no detiene la ejecución cuando falla (usa DBMS_OUTPUT en vez de RAISE), por lo que el INSERT podría quedar aunque la validación falle.

### E2 - Data Warehouse (17/20)
Tablas DW bien diseñadas con IDENTITY para las PKs. Consulta analítica correcta con SUM, COUNT DISTINCT y ORDER BY. -3 pts por no incluir surrogate keys separadas de las PKs transaccionales.

### E3 - Índice y Partición (17/20)
Índice compuesto correcto. Partición trimestral con 4 particiones y sintaxis correcta. Consulta Q1 correcta. EXPLAIN PLAN con DBMS_XPLAN.DISPLAY presente. Menciona partition pruning como ventaja. -3 pts por análisis de la ventaja muy breve.
