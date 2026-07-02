# Prueba 3 - Godoy, Máximo

**Nota: 5.3 (71/100)**

## Parte 1 - Teórica

### P1 - Transacciones y Savepoints (8/10)
Buena definición de transacción y ACID. El ejemplo muestra savepoints pero solo uno (sp_estado), no múltiples independientes. -2 pts por no mostrar múltiples savepoints independientes.

### P2 - Data Warehouse (7/10)
Diferenciación OLTP vs DW correcta pero breve. Modelo dimensional con Fact y dimensiones Agente y Severidad. -3 pts por no describir las ventajas del modelo vs consultar OLTP directamente.

### P3 - Herencia Oracle (7/10)
Solo define el tipo base Agente sin completar la jerarquía de dos niveles. No incluye AgenteEspecialista ni AgentePentester en el código. -3 pts por jerarquía incompleta.

### P4 - Índices y Particiones (8/10)
Ventajas y desventajas correctas. Menciona índice compuesto y partición. Explica partition pruning brevemente. -2 pts por no mostrar código de ejemplo.

## Parte 2 - Práctica

### E1 - Procedimiento registrar_asignacion (14/20)
- Inserción con MAX+1: ✓
- Validación horas: ✓ (aunque hace el INSERT primero y luego valida)
- Validación agentes: ✓
- Savepoints: los usa pero en orden incorrecto (valida después de insertar) → -3 pts
- Excepciones: solo maneja OTHERS → -3 pts

### E2 - Data Warehouse (14/20)
Tablas DW diseñadas. Consulta analítica presente pero usa JOIN con Dim_Agente en vez de tablas transaccionales como pedía el enunciado. -6 pts por consulta sobre DW en vez de tablas OLTP.

### E3 - Índice y Partición (13/20)
Índice compuesto correcto. Partición trimestral presente. Consulta Q1 presente pero sin JOIN a Asignaciones para obtener las horas. EXPLAIN PLAN presente pero sin DBMS_XPLAN.DISPLAY. -7 pts por consulta incompleta y plan de ejecución incompleto.
