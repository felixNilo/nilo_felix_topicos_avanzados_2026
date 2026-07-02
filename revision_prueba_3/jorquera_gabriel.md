# Prueba 3 - Jorquera, Gabriel

**Nota: 6.8 (96/100)**

## Parte 1 - Teórica

### P1 - Transacciones y Savepoints (10/10)
Definición excelente con propiedades ACID bien descritas. El ejemplo muestra múltiples savepoints con bloque anidado y ROLLBACK TO correcto. Explica detalladamente qué ocurre si falla solo el UPDATE, incluyendo el comportamiento del COMMIT parcial.

### P2 - Data Warehouse (10/10)
Diferenciación OLTP vs DW muy completa. Modelo dimensional en esquema estrella con Fact, Dim_Agente y Dim_Incidente bien diseñado. Ventajas analíticas bien explicadas incluyendo historial y simplicidad para BI.

### P3 - Herencia Oracle (10/10)
Jerarquía perfecta con NOT FINAL, UNDER y OVERRIDING en los tres niveles. Incluye TYPE BODY con implementación de calcular_costo(). Explica NOT INSTANTIABLE con sus implicancias correctamente.

### P4 - Índices y Particiones (10/10)
Ventajas y desventajas muy bien descritas para ambos. Explica partition pruning con impacto en el plan (PARTITION RANGE SINGLE vs TABLE ACCESS FULL). Estrategia combinada bien explicada.

## Parte 2 - Práctica

### E1 - Procedimiento registrar_asignacion (19/20)
- Inserción con MAX+1: ✓
- Validación horas con JOIN filtrando 'Abierto' y suma p_horas: ✓
- Validación agentes >= 3 con COUNT DISTINCT: ✓
- Savepoints independientes con ROLLBACK TO correcto para cada excepción: ✓
- Excepciones descriptivas con mensajes detallados: ✓
- -1 pt menor: hace doble ROLLBACK en ex_ExcesoHoras (primero al sp_valida_horas y luego al inicio_procedimiento), lo que es redundante.

### E2 - Data Warehouse (19/20)
Tablas DW bien diseñadas con surrogate keys. Consulta analítica correcta con SUM, COUNT DISTINCT, JOIN y ORDER BY DESC NULLS LAST. -1 pt menor por no incluir ETL de ejemplo.

### E3 - Índice y Partición (18/20)
Índice compuesto correcto. Partición trimestral con 5 particiones (incluye p_resto con MAXVALUE). Consulta Q1 correcta. EXPLAIN PLAN con DBMS_XPLAN.DISPLAY presente. Explica la ventaja del partition pruning con detalle (PSTART/PSTOP). -2 pts por no mostrar la consulta antes del EXPLAIN PLAN.
