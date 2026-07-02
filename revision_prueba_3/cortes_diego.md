# Prueba 3 - Cortés, Diego

**Nota: 6.2 (87/100)**

## Parte 1 - Teórica

### P1 - Transacciones y Savepoints (9/10)
Buena definición y propiedades ACID. El ejemplo muestra dos savepoints con ROLLBACK TO correcto. Explica bien qué ocurre si falla el UPDATE. -1 pt por no incluir el ejemplo dentro de un procedimiento almacenado.

### P2 - Data Warehouse (9/10)
Diferenciación OLTP vs DW correcta. Modelo dimensional con Fact, Dim_Agente y Dim_Incidente bien descrito. Ventajas bien explicadas. -1 pt por no mencionar ventajas concretas vs consultar OLTP.

### P3 - Herencia Oracle (9/10)
Jerarquía correcta con NOT FINAL, UNDER y OVERRIDING. Explica NOT INSTANTIABLE. -1 pt por no incluir TYPE BODY con implementación de calcular_costo().

### P4 - Índices y Particiones (9/10)
Ventajas y desventajas bien descritas. Ejemplo de partición trimestral correcto. Explica partition pruning. -1 pt por no mencionar el impacto específico en el plan (PARTITION RANGE SINGLE).

## Parte 2 - Práctica

### E1 - Procedimiento registrar_asignacion (17/20)
- Inserción con MAX+1: ✓
- Validación horas con JOIN filtrando 'Abierto': ✓
- Validación agentes >= 3: ✓
- Savepoints independientes con ROLLBACK TO correcto: ✓
- Excepciones descriptivas: ✓
- -3 pts: hace ROLLBACK TO sp_inicio en todas las excepciones, no al savepoint correspondiente a cada validación.

### E2 - Data Warehouse (18/20)
Tablas DW bien diseñadas. Consulta analítica correcta con SUM, COUNT DISTINCT, JOIN y ORDER BY DESC. -2 pts por no incluir surrogate keys separadas.

### E3 - Índice y Partición (16/20)
Índice compuesto correcto. Partición trimestral con 5 particiones (incluye p_future con MAXVALUE, lo cual es válido). Consulta Q1 correcta. EXPLAIN PLAN con DBMS_XPLAN.DISPLAY presente. -4 pts por no indicar qué ventaja aporta la partición para esta consulta.
