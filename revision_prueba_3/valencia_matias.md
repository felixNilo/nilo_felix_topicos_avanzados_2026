# Prueba 3 - Valencia, Matías

**Nota: 4.2 (54/100)**

## Parte 1 - Teórica

### P1 - Transacciones y Savepoints (6/10)
Define transacción mencionando COMMIT, SAVEPOINT y ROLLBACK pero no describe las propiedades ACID. El ejemplo de procedimiento tiene errores graves de sintaxis (SELECT con INTO múltiple inválido, NVL(MAX()) sin FROM). La lógica de savepoints está presente pero el código no compilaría. -4 pts por ausencia de ACID y errores graves de sintaxis.

### P2 - Data Warehouse (6/10)
Diferenciación OLTP vs DW muy breve. Diseña las tablas DW correctamente. La consulta analítica tiene un error: hace JOIN con alias incorrectos (ag, inc no definidos). -4 pts por consulta con errores y diferenciación muy superficial.

### P3 - Herencia Oracle (5/10)
Confunde herencia de tipos de objetos con herencia de tablas (intenta hacer NOT FINAL en una tabla, lo que no es válido). Los tipos AgenteEspecialista y AgentePentester no heredan del tipo base correctamente. -5 pts por confusión conceptual entre tablas y tipos de objetos.

### P4 - Índices y Particiones (6/10)
Ventajas y desventajas muy breves. Muestra código de partición pero con errores de sintaxis (PARTITION BY RANGE sin columna, fechas incorrectas). -4 pts por errores de sintaxis en la partición y ausencia de partition pruning.

## Parte 2 - Práctica

### E1 - Procedimiento registrar_asignacion (8/20)
- Inserción: usa NVL(MAX(AsignacionID)) sin FROM → error de sintaxis grave → -5 pts
- Validación horas: SELECT con múltiples INTO inválido → -3 pts
- Validación agentes: lógica presente pero con errores → -2 pts
- Savepoints: presentes pero el código no compilaría → -2 pts

### E2 - Data Warehouse (13/20)
Tablas DW bien diseñadas con ETL. Consulta analítica con ORDER BY ASC en vez de DESC como pedía el enunciado. -7 pts por ORDER BY incorrecto y JOIN con alias no definidos en la consulta.

### E3 - Índice y Partición (10/20)
Índice compuesto correcto. Partición con errores de sintaxis (PARTITION BY RANGE sin columna). Consulta Q1 con dos cláusulas WHERE (inválido en SQL). EXPLAIN PLAN presente. -10 pts por errores graves de sintaxis en partición y consulta.
