# Prueba 3 - Salazar, Christian

**Nota: 5.1 (69/100)**

## Parte 1 - Teórica

### P1 - Transacciones y Savepoints (8/10)
Buena definición de transacción y ACID. El ejemplo muestra savepoints pero con errores de sintaxis (SAVEPOINT declarado dentro del IS). La lógica es correcta. -2 pts por errores de sintaxis en la ubicación de los savepoints.

### P2 - Data Warehouse (7/10)
Diferenciación OLTP vs DW correcta pero breve. Modelo dimensional con Fact y dimensiones Agente e Incidente. -3 pts por no describir las ventajas del modelo vs consultar OLTP directamente.

### P3 - Herencia Oracle (7/10)
Describe la jerarquía con UNDER y OVERRIDING. No incluye NOT FINAL en el tipo base. -3 pts por ausencia de NOT FINAL y TYPE BODY.

### P4 - Índices y Particiones (8/10)
Ventajas y desventajas correctas. Muestra código de índice y partición. Explica partition pruning. -2 pts por no mencionar el impacto en el plan de ejecución.

## Parte 2 - Práctica

### E1 - Procedimiento registrar_asignacion (13/20)
- Inserción: no inserta en el procedimiento (el INSERT y SELECT están fuera del END) → -5 pts
- Validación horas con JOIN filtrando 'Abierto': ✓
- Validación agentes >= 3: ✓
- Savepoints: los usa pero el INSERT está fuera del procedimiento → -3 pts
- Excepciones: solo OTHERS con ROLLBACK → -2 pts por no manejar excepciones específicas

### E2 - Data Warehouse (14/20)
Tablas DW diseñadas. Consulta analítica presente pero filtra por `Estado = 'Abierto'` en Asignaciones (columna que no existe en esa tabla). -6 pts por error en la consulta analítica.

### E3 - Índice y Partición (12/20)
Índice compuesto correcto. Partición trimestral presente. Consulta Q1 muy simplificada (sin JOIN a Asignaciones para obtener horas). Sin EXPLAIN PLAN ni DBMS_XPLAN. -8 pts por consulta incompleta y ausencia de plan de ejecución.
