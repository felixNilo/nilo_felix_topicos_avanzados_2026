# Prueba 3 - Vega, Cristián

**Nota: 4.8 (64/100)**

## Parte 1 - Teórica

### P1 - Transacciones y Savepoints (7/10)
Define transacción y ACID correctamente. El ejemplo muestra savepoints pero con un error conceptual: usa variables VARCHAR2 para los nombres de savepoints (SAVEPOINT no acepta variables en Oracle, solo identificadores literales). La lógica es correcta. -3 pts por error conceptual en el uso de variables para savepoints.

### P2 - Data Warehouse (7/10)
Diferenciación OLTP vs DW correcta. Modelo dimensional con Fact, Dim_Agente y Dim_Incidente. Ventajas mencionadas. -3 pts por no describir las ventajas concretas del modelo vs consultar OLTP.

### P3 - Herencia Oracle (6/10)
Define el tipo base Agente con NOT INSTANTIABLE pero sin NOT FINAL. Los subtipos AgenteEspecialista y AgentePentester tienen errores de sintaxis (mezcla MEMBER FUNCTION con implementación dentro del CREATE TYPE). -4 pts por errores de sintaxis y ausencia de NOT FINAL.

### P4 - Índices y Particiones (7/10)
Ventajas y desventajas correctas. Muestra código de índice y partición. Explica partition pruning. -3 pts por no mencionar el impacto en el plan de ejecución.

## Parte 2 - Práctica

### E1 - Procedimiento registrar_asignacion (10/20)
- Inserción: usa Asignaciones_SEQ.NEXTVAL (secuencia no definida en el esquema) → -3 pts
- Validación horas con JOIN filtrando 'Abierto': ✓
- Validación agentes >= 3: ✓
- Savepoints: usa variables VARCHAR2 para nombres de savepoints (inválido en Oracle) → -4 pts
- Excepciones: maneja OTHERS → -3 pts por no manejar excepciones específicas

### E2 - Data Warehouse (14/20)
Tablas DW diseñadas. Consulta analítica correcta con SUM, COUNT DISTINCT, JOIN y ORDER BY DESC. -6 pts porque la consulta hace JOIN con Dim_Agente (tabla DW) en vez de Agentes (tabla transaccional como pedía el enunciado).

### E3 - Índice y Partición (13/20)
Índice compuesto correcto. Partición trimestral con 4 particiones y sintaxis correcta. Consulta Q1 correcta. EXPLAIN PLAN presente. -7 pts por no mostrar DBMS_XPLAN.DISPLAY y no indicar la ventaja de la partición.
