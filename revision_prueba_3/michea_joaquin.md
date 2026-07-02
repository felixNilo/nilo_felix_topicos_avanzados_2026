# Prueba 3 - Michea, Joaquín

**Nota: 5.0 (66/100)**

## Parte 1 - Teórica

### P1 - Transacciones y Savepoints (7/10)
Define transacción y ACID correctamente. El ejemplo muestra savepoints pero solo menciona que "si falla la transacción se deshará" sin explicar el comportamiento específico con múltiples savepoints. -3 pts por no mostrar múltiples savepoints independientes ni explicar qué ocurre si falla solo el UPDATE.

### P2 - Data Warehouse (7/10)
Diferenciación OLTP vs DW correcta pero breve. Modelo dimensional con Fact y dimensiones Agente e Incidente. -3 pts por no describir las ventajas del modelo vs consultar OLTP directamente.

### P3 - Herencia Oracle (7/10)
Muestra la jerarquía con NOT INSTANTIABLE en el tipo base. Usa UNDER y OVERRIDING correctamente. -3 pts por no incluir TYPE BODY con implementación de calcular_costo() y por no explicar NOT INSTANTIABLE.

### P4 - Índices y Particiones (7/10)
Ventajas y desventajas correctas pero genéricas. Muestra código de índice y partición. -3 pts por no explicar partition pruning ni su impacto en el plan de ejecución.

## Parte 2 - Práctica

### E1 - Procedimiento registrar_asignacion (13/20)
- Inserción con MAX+1: ✓
- Validación horas con JOIN filtrando 'Abierto': ✓
- Validación agentes: usa `>= 3` pero verifica el estado del incidente antes (lógica adicional no pedida) → ✓
- Savepoints: los usa pero no son independientes (ambos hacen ROLLBACK TO antes_validacion_agente) → -4 pts
- Excepciones: maneja NO_DATA_FOUND y OTHERS → ✓
- -3 pts por lógica de savepoints incorrecta

### E2 - Data Warehouse (13/20)
Tablas DW diseñadas pero Fact_Asignaciones referencia directamente a Agentes e Incidentes (tablas OLTP) en vez de a las dimensiones DW. Crea una función calcular_horas_agente_dim que no era pedida. Consulta analítica usa la función en vez de SUM directo. -7 pts por diseño incorrecto de FK en Fact y consulta no estándar.

### E3 - Índice y Partición (12/20)
Índice compuesto correcto. Intenta hacer ALTER TABLE para agregar partición (no válido en Oracle). EXPLAIN PLAN presente pero sin consulta previa. -8 pts por uso de ALTER TABLE para particionar (no es válido) y por no mostrar la consulta de Q1.
