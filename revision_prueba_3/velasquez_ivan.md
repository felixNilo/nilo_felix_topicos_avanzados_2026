# Revisión Prueba 3 - Velásquez, Iván

**Archivo:** `prueba3.sql`
**Total:** 87/100 → **Nota: 6.2**

---

## Parte Teórica

### T1 - Transacciones y ACID (8/10)
- Define transacción correctamente.
- Las 4 propiedades ACID bien explicadas con descripción clara de cada una.
- Ejemplo con dos savepoints independientes (sp_inicio, sp_antes_estado) correcto en lógica.
- Responde correctamente qué ocurre si falla solo la actualización del estado.
- El ejemplo está dentro de un comentario, no es código PL/SQL ejecutable.

### T2 - Data Warehouse y modelo dimensional (8/10)
- Diferencia OLTP vs OLAP bien explicada (normalización vs desnormalización, escritura vs lectura masiva).
- Modelo dimensional con tabla de hechos (Fact_Horas) y 2 dimensiones (Dim_Agente, Dim_Severidad) correcto.
- Ventajas bien argumentadas: reducción de JOINs, velocidad en agregaciones históricas.
- No escribe el DDL de las tablas (solo las describe textualmente).

### T3 - Herencia en Oracle (8/10)
- Jerarquía correcta: Agente → AgenteEspecialista → AgentePentester usando UNDER en ambos niveles.
- NOT INSTANTIABLE bien explicado como "clase abstracta", no se pueden crear objetos directamente.
- Declara calcular_costo() en el tipo base y OVERRIDING en los subtipos.
- No escribe el TYPE BODY con la implementación concreta de los métodos.

### T4 - Índices y particiones (9/10)
- Ventajas y desventajas de índices y particiones bien explicadas con ejemplos concretos.
- Partition pruning explicado correctamente: descarta particiones irrelevantes, impacto en plan de ejecución (Full Table Scan → Partition Range Single).
- Menciona índice LOCAL compuesto como la combinación correcta.

---

## Parte Práctica

### E1 - Procedimiento registrar_asignacion (16/20)
- Orden lógico correcto: valida primero, inserta después (evita insertar y luego revertir).
- Incluye las nuevas horas (+ p_Horas) en el cálculo del total — correcto y más preciso.
- Savepoints independientes por cada validación e inserción.
- Manejo de excepciones con SQLCODE para hacer ROLLBACK al savepoint correspondiente — buena solución.
- Error: RAISE_APPLICATION_ERROR lanza la excepción inmediatamente al WHEN OTHERS, pero el ROLLBACK TO en el handler referencia el savepoint de la validación que falló, no el anterior — la asignación no se ha hecho aún en ese punto, por lo que el ROLLBACK TO es redundante pero no incorrecto.
- Usa %TYPE implícitamente con NUMBER/VARCHAR2 directamente (menor detalle).

### E2 - DW y consulta analítica (19/20)
- DDL de las 3 tablas DW correcto: claves primarias, foreign keys, tipos de datos apropiados.
- Usa sufijo _DW para distinguir las tablas del DW de las transaccionales (buena práctica).
- Consulta analítica sobre tablas transaccionales correcta: JOIN, SUM(Horas), COUNT(DISTINCT IncidenteID), GROUP BY, ORDER BY DESC.
- Falta FechaDeteccion en Dim_Incidente_DW (dato útil para análisis temporal).

### E3 - Índice, partición y EXPLAIN PLAN (19/20)
- Índice compuesto en Incidentes correcto.
- Tabla particionada trimestralmente para 2026 perfecta: 4 particiones Q1-Q4 con fechas correctas.
- Consulta de horas por incidente Critical en Q1 2026 correcta: JOIN con Asignaciones, SUM, GROUP BY, filtros correctos.
- EXPLAIN PLAN y DBMS_XPLAN.DISPLAY correctos.
- Explica la ventaja del partition pruning específicamente para esta consulta (solo accede a p_2026_q1).
- El índice no es LOCAL (falta la cláusula LOCAL para que sea particionado junto a la tabla).
