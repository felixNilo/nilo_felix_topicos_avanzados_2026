# Prueba 3 - Castillo, Ignacio

**Nota: 5.7 (79/100)**

## Parte 1 - Teórica

### P1 - Transacciones y Savepoints (8/10)
Buena definición de transacción y ACID. El ejemplo muestra la lógica de savepoints correctamente. -2 pts porque el ejemplo no muestra múltiples savepoints independientes, solo uno antes del INSERT.

### P2 - Data Warehouse (8/10)
Diferenciación OLTP vs DW correcta. Modelo dimensional con Fact, Dim_Agente y Dim_Incidente bien descrito. -2 pts por no mencionar ventajas concretas del modelo vs consultar OLTP.

### P3 - Herencia Oracle (8/10)
Describe la jerarquía correctamente. No incluye código de ejemplo con sintaxis Oracle. -2 pts por ausencia de código.

### P4 - Índices y Particiones (8/10)
Ventajas y desventajas correctas. Menciona índice compuesto y partición. Explica partition pruning. -2 pts por no mostrar código de ejemplo.

## Parte 2 - Práctica

### E1 - Procedimiento registrar_asignacion (15/20)
- Inserción con MAX+1: ✓
- Validación horas con JOIN filtrando 'Abierto': ✓ (hace el INSERT primero y luego valida, lo que es un enfoque válido)
- Validación agentes >= 3: ✓
- Savepoints: los usa pero el orden es incorrecto (valida después de insertar) → -3 pts
- Excepciones: maneja NO_DATA_FOUND y OTHERS → ✓
- -2 pts por lógica de savepoints no independientes

### E2 - Data Warehouse (17/20)
Tablas DW bien diseñadas con surrogate keys. Incluye ETL para poblar dimensiones y hechos. Consulta analítica correcta. -3 pts porque la consulta analítica pedida era sobre tablas transaccionales, no sobre el DW.

### E3 - Índice y Partición (15/20)
Índice compuesto correcto. Partición trimestral correcta. Consulta Q1 correcta. EXPLAIN PLAN presente. -5 pts porque no indica qué ventaja aporta la partición para esta consulta específica.
