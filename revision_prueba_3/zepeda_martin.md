# Prueba 3 - Zepeda, Martín

**Nota: 5.7 (79/100)**

## Parte 1 - Teórica

### P1 - Transacciones y Savepoints (8/10)
Buena definición con propiedades ACID. El ejemplo muestra dos savepoints con ROLLBACK TO correcto y explica qué ocurre si falla el UPDATE. -2 pts por no usar un procedimiento almacenado (es un bloque anónimo) y por el ejemplo de error simulado con IF p_id_incidente = 999 que es artificial.

### P2 - Data Warehouse (8/10)
Diferenciación OLTP vs DW correcta. Modelo dimensional con Fact y dimensiones Agente y Severidad. Ventajas bien explicadas. -2 pts por usar Dim_Severidad en vez de Dim_Incidente (no captura todos los atributos del incidente).

### P3 - Herencia Oracle (9/10)
Jerarquía correcta con NOT INSTANTIABLE NOT FINAL, UNDER y OVERRIDING. Incluye TYPE BODY con implementación de calcular_costo() con lógica condicional. Explica NOT INSTANTIABLE correctamente. -1 pt menor por no agregar atributos propios en cada nivel de la jerarquía.

### P4 - Índices y Particiones (8/10)
Ventajas y desventajas correctas. Explica partition pruning. -2 pts por no mostrar código de ejemplo del índice compuesto ni la partición.

## Parte 2 - Práctica

### E1 - Procedimiento registrar_asignacion (15/20)
- Inserción con MAX+1: ✓ (dentro de comentario /* */ pero la lógica está)
- Validación horas con JOIN filtrando 'Abierto': ✓
- Validación agentes >= 3: ✓
- Savepoints independientes con ROLLBACK TO correcto: ✓
- Excepciones descriptivas: ✓
- -5 pts: todo el procedimiento está dentro de comentarios /* */, lo que significa que no compilaría. Se evalúa la lógica.

### E2 - Data Warehouse (16/20)
Tablas DW bien diseñadas con surrogate keys y ETL completo (pobla dimensiones y hechos). Consulta analítica correcta. -4 pts porque todo está dentro de comentarios /* */, lo que significa que no compilaría.

### E3 - Índice y Partición (15/20)
Índice compuesto correcto con LOCAL (índice local). Partición trimestral con 5 particiones (incluye p_otros con MAXVALUE). Consulta Q1 correcta. EXPLAIN PLAN con DBMS_XPLAN.DISPLAY presente. Explica la ventaja del partition pruning. -5 pts porque todo está dentro de comentarios /* */, lo que significa que no compilaría.
