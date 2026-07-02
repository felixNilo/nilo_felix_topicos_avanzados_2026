# Prueba 3 - Arredondo, Sebastián

**Nota: 5.2 (70/100)**

## Parte 1 - Teórica

### P1 - Transacciones y Savepoints (7/10)
Define bien la transacción y las propiedades ACID. El ejemplo de savepoints muestra la lógica correcta pero tiene errores de sintaxis importantes: declara SAVEPOINT dentro del IS (fuera del BEGIN), lo que no es válido en PL/SQL. Se evalúa la lógica: la idea de dos savepoints independientes está presente. -3 pts por errores conceptuales en la ubicación de los savepoints.

### P2 - Data Warehouse (7/10)
Diferencia OLTP vs DW correcta pero muy breve. El modelo dimensional propone una tabla de hechos "horastotales" con dimensiones Agentes y Severidad, lo cual es válido conceptualmente aunque no usa los nombres pedidos. -3 pts por no describir las ventajas del modelo vs consultar OLTP directamente.

### P3 - Herencia Oracle (7/10)
Describe correctamente la jerarquía con UNDER y OVERRIDING. Menciona NOT INSTANTIABLE correctamente. Sin embargo, no incluye código de ejemplo con la sintaxis Oracle (solo descripción textual). -3 pts por ausencia de ejemplo con código.

### P4 - Índices y Particiones (7/10)
Ventajas y desventajas correctas pero genéricas. Menciona índice compuesto y partición por rango. Explica partition pruning brevemente. -3 pts por no mostrar ejemplo de código y por descripción superficial del impacto en el plan de ejecución.

## Parte 2 - Práctica

### E1 - Procedimiento registrar_asignacion (13/20)
- Inserción con MAX+1: ✓ (al final del procedimiento)
- Validación horas con JOIN filtrando 'Abierto': ✓
- Validación agentes: usa `incidenteid` en vez de `incidenteid` (typo en nombre de columna) → -2 pts
- Savepoints: los usa pero el ROLLBACK TO en las excepciones hace ROLLBACK general, no al savepoint correspondiente → -3 pts
- Excepciones: maneja OTHERS con ROLLBACK general → -2 pts

### E2 - Data Warehouse (15/20)
Tablas DW bien diseñadas. Consulta analítica correcta con SUM, COUNT DISTINCT y ORDER BY. -5 pts porque la consulta usa `incidentid` en vez de `IncidenteID` (nombre incorrecto de columna, inconsistente con el esquema).

### E3 - Índice y Partición (14/20)
Índice compuesto correcto. Partición trimestral con sintaxis correcta usando `date '2026-04-01'`. Consulta de Q1 correcta con rango de fechas. EXPLAIN PLAN presente. Menciona la ventaja de la partición. -6 pts porque no muestra DBMS_XPLAN.DISPLAY para ver el plan y el análisis de la ventaja es muy breve.
