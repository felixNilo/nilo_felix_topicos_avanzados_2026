# Prueba 3 - Orrego, Bruno

**Nota: 6.2 (86/100)**

## Parte 1 - Teórica

### P1 - Transacciones y Savepoints (9/10)
Excelente definición con propiedades ACID bien descritas. El ejemplo muestra dos savepoints con ROLLBACK TO correcto. Explica bien qué ocurre si falla el UPDATE. -1 pt por no usar un procedimiento almacenado (es un bloque anónimo).

### P2 - Data Warehouse (9/10)
Diferenciación OLTP vs DW muy completa con comparación clara. Modelo dimensional con Fact, Dim_Agente y Dim_Incidente bien descrito. Ventajas bien explicadas. -1 pt por no mencionar la ventaja de no impactar el sistema transaccional.

### P3 - Herencia Oracle (9/10)
Jerarquía correcta con NOT INSTANTIABLE NOT FINAL, UNDER y OVERRIDING. Incluye TYPE BODY con implementación de calcular_costo(). Explica NOT INSTANTIABLE correctamente. -1 pt por error menor: el TYPE BODY de AgenteEspecialista tiene un comentario incorrecto sobre cerrar el TYPE BODY.

### P4 - Índices y Particiones (9/10)
Ventajas y desventajas muy bien descritas. Explica partition pruning con impacto en el plan (TABLE ACCESS FULL vs PARTITION RANGE SINGLE). -1 pt por no mostrar código de ejemplo del índice compuesto.

## Parte 2 - Práctica

### E1 - Procedimiento registrar_asignacion (16/20)
- Inserción con MAX+1: ✓
- Validación horas con JOIN filtrando 'Abierto': ✓
- Validación agentes: usa `> 3` en vez de `>= 3` (ya insertó el agente antes de validar) → lógica válida en este contexto ✓
- Savepoints independientes: ✓
- Excepciones descriptivas: ✓
- -4 pts: hace ROLLBACK TO sp_inicio en todas las excepciones, no al savepoint correspondiente a cada validación.

### E2 - Data Warehouse (17/20)
Tablas DW bien diseñadas. Consulta analítica correcta con SUM, COUNT DISTINCT, JOIN y ORDER BY DESC. -3 pts por no incluir surrogate keys separadas de las PKs transaccionales.

### E3 - Índice y Partición (17/20)
Índice compuesto correcto. Partición trimestral con 5 particiones (incluye p_max con MAXVALUE). Consulta Q1 correcta. EXPLAIN PLAN con DBMS_XPLAN.DISPLAY presente. Explica la ventaja del partition pruning con detalle. -3 pts por no mostrar la consulta antes del EXPLAIN PLAN.
