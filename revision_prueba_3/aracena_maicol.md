# Prueba 3 - Aracena, Maicol

**Nota: 6.1 (85/100)**

## Parte 1 - Teórica

### P1 - Transacciones y Savepoints (8/10)
Buena definición de transacción y propiedades ACID. El ejemplo de savepoints es correcto y usa el contexto de la prueba. Se descuenta 2 pts porque el ejemplo solo muestra un savepoint (sp_asignacion) y no múltiples savepoints independientes como pedía el enunciado.

### P2 - Data Warehouse (9/10)
Buena diferenciación OLTP vs DW. El modelo dimensional es correcto con Fact_Asignaciones, Dim_Agente y Dim_Incidente. Las ventajas están bien explicadas. Se descuenta 1 pt por no mencionar ventajas concretas vs consultar OLTP directamente.

### P3 - Herencia Oracle (9/10)
Jerarquía correcta con NOT FINAL y UNDER en los tres niveles. Usa OVERRIDING correctamente. Explica bien NOT INSTANTIABLE. Se descuenta 1 pt porque el tipo base Agente no tiene NOT FINAL declarado explícitamente en el ejemplo.

### P4 - Índices y Particiones (9/10)
Ventajas y desventajas bien descritas. Ejemplo de partición trimestral correcto con sintaxis válida. Explica partition pruning correctamente. Se descuenta 1 pt por no mencionar el impacto específico en el plan de ejecución (PARTITION RANGE SINGLE).

## Parte 2 - Práctica

### E1 - Procedimiento registrar_asignacion (16/20)
- Inserción con MAX+1: ✓
- Validación horas con JOIN a Incidentes filtrando 'Abierto': ✓
- Validación agentes por incidente: usa `> 3` en vez de `>= 3` → -2 pts
- Savepoints: los declara pero hace ROLLBACK TO sp_inicio en todas las excepciones, no al savepoint correspondiente → -2 pts
- Excepciones con mensajes descriptivos: ✓

### E2 - Data Warehouse (18/20)
Tablas DW bien diseñadas con FK correctas. Consulta analítica correcta con SUM, COUNT DISTINCT, JOIN y ORDER BY DESC. Se descuenta 2 pts porque usa COUNT(IncidenteID) sin DISTINCT, lo que puede contar duplicados.

### E3 - Índice y Partición (16/20)
Índice compuesto correcto. Partición trimestral con 4 particiones y sintaxis correcta. Consulta con filtro de Q1 y JOIN correcto. EXPLAIN PLAN presente. Se descuenta 4 pts porque no indica qué ventaja aporta la partición para esta consulta específica.
