# Prueba 3 - Carrasco, Javier

**Nota: 6.3 (89/100)**

## Parte 1 - Teórica

### P1 - Transacciones y Savepoints (9/10)
Excelente definición con propiedades ACID bien descritas. El ejemplo muestra dos savepoints con bloques anidados y ROLLBACK TO correcto. Explica claramente qué ocurre si falla solo el UPDATE. -1 pt por no usar un procedimiento almacenado (es un bloque anónimo DECLARE).

### P2 - Data Warehouse (9/10)
Diferenciación OLTP vs DW clara con tabla comparativa. Modelo dimensional correcto con tres dimensiones (Agente, Incidente, Tiempo). Ventajas bien explicadas. -1 pt menor por no mencionar la ventaja de no impactar el sistema transaccional.

### P3 - Herencia Oracle (10/10)
Jerarquía perfecta con NOT FINAL, UNDER y OVERRIDING en los tres niveles. Incluye TYPE BODY con implementación de calcular_costo(). Explica NOT INSTANTIABLE con sus implicancias correctamente.

### P4 - Índices y Particiones (9/10)
Ventajas y desventajas bien descritas. Ejemplo de partición trimestral correcto. Explica partition pruning con impacto en el plan (PARTITION RANGE SINGLE). -1 pt por no mostrar el índice compuesto en el código.

## Parte 2 - Práctica

### E1 - Procedimiento registrar_asignacion (17/20)
- Inserción con MAX+1: ✓
- Validación horas con JOIN filtrando 'Abierto': ✓
- Validación agentes >= 3: ✓
- Savepoints independientes: ✓
- Excepciones descriptivas: ✓
- -3 pts: en el EXCEPTION hace ROLLBACK general en vez de ROLLBACK TO al savepoint correspondiente.

### E2 - Data Warehouse (18/20)
Tablas DW bien diseñadas. Consulta analítica correcta con SUM, COUNT DISTINCT, JOIN y ORDER BY DESC. -2 pts por no incluir las dimensiones con surrogate keys (usa las mismas PKs transaccionales).

### E3 - Índice y Partición (17/20)
Índice compuesto correcto. Partición trimestral con 4 particiones y sintaxis correcta. Consulta Q1 correcta. EXPLAIN PLAN con DBMS_XPLAN.DISPLAY presente. Menciona la ventaja del partition pruning. -3 pts por análisis de la ventaja muy breve (una línea).
