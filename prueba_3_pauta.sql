/*
================================================================================
PAUTA PRUEBA 3 - TÓPICOS AVANZADOS DE BASES DE DATOS
================================================================================
Puntaje total : 100 puntos
Corte aprobación: 50 puntos (nota 4.0)
Escala: nota = 1.0 + (puntaje / 100.0) * 6.0

CRITERIO GENERAL PARTE TEÓRICA:
  - Se evalúa la lógica y el concepto, NO la sintaxis exacta.
  - Errores menores de sintaxis en código de ejemplo NO penalizan si la idea
    es correcta.
  - Solo penalizar errores conceptuales.

CRITERIO GENERAL PARTE PRÁCTICA:
  - El código debe compilar y ejecutarse correctamente.
  - No penalizar si el estudiante usa tablas distintas a las del esquema,
    salvo que el enunciado lo pida explícitamente.
================================================================================

================================================================================
PARTE 1 - PREGUNTAS TEÓRICAS (40 puntos)
================================================================================

------------------------------------------------------------------------
PREGUNTA 1 (10 puntos): Transacciones, ACID y Savepoints múltiples
------------------------------------------------------------------------

RESPUESTA ESPERADA:

Una transacción es un conjunto de operaciones DML que se ejecutan como unidad
atómica. Garantiza las propiedades ACID:
  - Atomicidad: todas las operaciones tienen éxito o ninguna.
  - Consistencia: la BD pasa de un estado válido a otro.
  - Aislamiento: transacciones concurrentes no se interfieren entre sí.
  - Durabilidad: los cambios confirmados con COMMIT persisten ante fallos.

Los SAVEPOINTs permiten hacer ROLLBACK parcial a un punto intermedio sin
deshacer toda la transacción. Esto es útil cuando un procedimiento realiza
múltiples operaciones independientes y solo una falla.

Ejemplo en contexto:

  BEGIN
      -- Operación 1: insertar asignación
      SAVEPOINT sp_asignacion;
      INSERT INTO Asignaciones (AsignacionID, AgenteID, IncidenteID, Horas, Rol)
      VALUES (10, 101, 201, 20, 'Apoyo');

      -- Operación 2: actualizar estado del incidente
      SAVEPOINT sp_estado;
      UPDATE Incidentes SET Estado = 'En Proceso' WHERE IncidenteID = 201;

      -- Si falla la actualización del estado:
      -- ROLLBACK TO sp_estado deshace solo el UPDATE, conservando el INSERT
      -- La asignación queda registrada aunque el estado no se haya actualizado

      COMMIT;
  EXCEPTION
      WHEN OTHERS THEN
          ROLLBACK TO sp_estado;
          DBMS_OUTPUT.PUT_LINE('Error al actualizar estado: ' || SQLERRM);
  END;

Si falla solo la actualización del estado, el ROLLBACK TO sp_estado deshace
únicamente ese UPDATE. La inserción de la asignación (sp_asignacion) se
conserva y puede confirmarse con COMMIT.

CRITERIOS DE EVALUACIÓN (10 puntos):

  [4 pts] Propiedades ACID:
    - 4 pts: describe correctamente las 4 propiedades (puede ser brevemente)
    - 2 pts: menciona solo 2 o 3 propiedades correctamente
    - 0 pts: no menciona ACID o las describe incorrectamente

  [6 pts] Savepoints múltiples:
    - 3 pts: explica que cada SAVEPOINT es independiente y ROLLBACK TO solo
             deshace desde ese punto hacia adelante
    - 3 pts: ejemplo coherente con Asignaciones/Incidentes que muestra dos
             SAVEPOINTs y explica qué pasa si falla solo el segundo

------------------------------------------------------------------------
PREGUNTA 2 (10 puntos): Data Warehouse y modelo dimensional
------------------------------------------------------------------------

RESPUESTA ESPERADA:

Un Data Warehouse (DW) es un repositorio centralizado para análisis histórico
(OLAP). Se diferencia de una BD transaccional (OLTP) en:

  | Aspecto        | OLTP                        | Data Warehouse          |
  |----------------|-----------------------------|-------------------------|
  | Propósito      | Operaciones del día a día   | Análisis histórico      |
  | Consultas      | Simples, alta frecuencia    | Complejas, agregaciones |
  | Datos          | Actuales, normalizados      | Históricos, desnorm.    |
  | Optimización   | Escritura rápida            | Lectura/agregación      |

Modelo dimensional para horas por agente y severidad:

  -- Dimensión Agente
  CREATE TABLE Dim_Agente (
      AgenteKey    NUMBER PRIMARY KEY,
      AgenteID     NUMBER,
      Nombre       VARCHAR2(50),
      Especialidad VARCHAR2(50)
  );

  -- Dimensión Incidente
  CREATE TABLE Dim_Incidente (
      IncidenteKey   NUMBER PRIMARY KEY,
      IncidenteID    NUMBER,
      Descripcion    VARCHAR2(100),
      Severidad      VARCHAR2(20),
      Estado         VARCHAR2(20)
  );

  -- Tabla de hechos
  CREATE TABLE Fact_Asignaciones (
      FactID         NUMBER PRIMARY KEY,
      AgenteKey      NUMBER,
      IncidenteKey   NUMBER,
      Mes            NUMBER,
      Anio           NUMBER,
      HorasTotales   NUMBER,
      NroIncidentes  NUMBER,
      FOREIGN KEY (AgenteKey)    REFERENCES Dim_Agente(AgenteKey),
      FOREIGN KEY (IncidenteKey) REFERENCES Dim_Incidente(IncidenteKey)
  );

Ventajas del modelo dimensional vs consultar tablas OLTP directamente:
  - Las consultas analíticas son más simples (menos JOINs).
  - Los datos están pre-agregados, lo que mejora el rendimiento.
  - Permite análisis histórico sin afectar el rendimiento del sistema
    transaccional.
  - Facilita el uso de herramientas de BI.

CRITERIOS DE EVALUACIÓN (10 puntos):

  [3 pts] Diferencia OLTP vs DW:
    - 3 pts: distingue propósito y menciona al menos 2 diferencias concretas
    - 1 pt : solo menciona que uno es para operaciones y otro para análisis

  [4 pts] Modelo dimensional:
    - 2 pts: Fact_Asignaciones con métricas (Horas) y FK a dimensiones
    - 2 pts: al menos 2 dimensiones coherentes (Agente, Incidente, Tiempo, etc.)

  [3 pts] Ventajas del modelo dimensional:
    - 3 pts: menciona al menos 2 ventajas concretas vs consultar OLTP
    - 1 pt : menciona solo una ventaja genérica

------------------------------------------------------------------------
PREGUNTA 3 (10 puntos): Herencia con tipos de objetos - dos niveles
------------------------------------------------------------------------

RESPUESTA ESPERADA:

Oracle implementa herencia con NOT FINAL (permite subtipos) y UNDER (define
el subtipo). Un tipo NOT INSTANTIABLE no puede instanciarse directamente,
solo sus subtipos concretos pueden usarse para crear objetos.

  -- Nivel 1: tipo base
  CREATE OR REPLACE TYPE t_Agente AS OBJECT (
      AgenteID     NUMBER,
      Nombre       VARCHAR2(50),
      Especialidad VARCHAR2(50),
      MEMBER FUNCTION calcular_costo RETURN NUMBER
  ) NOT FINAL;
  /

  -- Nivel 2: subtipo intermedio
  CREATE OR REPLACE TYPE t_AgenteEspecialista UNDER t_Agente (
      NivelCertificacion VARCHAR2(20),
      OVERRIDING MEMBER FUNCTION calcular_costo RETURN NUMBER
  ) NOT FINAL;
  /

  -- Nivel 3: subtipo concreto
  CREATE OR REPLACE TYPE t_AgentePentester UNDER t_AgenteEspecialista (
      HerramientasPrincipal VARCHAR2(50),
      OVERRIDING MEMBER FUNCTION calcular_costo RETURN NUMBER
  );
  /

Cada nivel hereda los atributos del nivel superior y puede sobreescribir
calcular_costo() con OVERRIDING para implementar su propia lógica de costo.

NOT INSTANTIABLE: si t_Agente se declara NOT INSTANTIABLE, no se pueden
crear objetos de ese tipo directamente. Solo se pueden crear instancias de
t_AgenteEspecialista o t_AgentePentester. Es útil para tipos abstractos que
solo definen la estructura base.

CRITERIOS DE EVALUACIÓN (10 puntos):

  [4 pts] Concepto de herencia en Oracle:
    - 2 pts: menciona NOT FINAL y UNDER correctamente
    - 2 pts: explica NOT INSTANTIABLE y su implicancia

  [6 pts] Jerarquía de dos niveles:
    - 3 pts: define los 3 tipos con la jerarquía correcta (Agente →
             AgenteEspecialista → AgentePentester) con NOT FINAL en los
             intermedios
    - 3 pts: usa OVERRIDING en calcular_costo() en al menos 2 niveles y
             agrega atributos propios en cada subtipo

------------------------------------------------------------------------
PREGUNTA 4 (10 puntos): Índices, particiones y partition pruning
------------------------------------------------------------------------

RESPUESTA ESPERADA:

ÍNDICES:
  Ventajas: aceleran SELECT con filtros y JOINs; evitan full table scans.
  Desventajas: espacio adicional en disco; penalizan INSERT/UPDATE/DELETE
               porque el índice debe actualizarse.

PARTICIONES:
  Ventajas: partition pruning (Oracle solo lee particiones relevantes);
            facilitan mantenimiento (purgar datos por partición).
  Desventajas: mayor complejidad de diseño y administración; no benefician
               consultas sin filtro por la clave de partición.

Aplicación en Incidentes:

  -- Índice compuesto para filtros por Severidad y FechaDeteccion
  CREATE INDEX idx_inc_sev_fecha ON Incidentes (Severidad, FechaDeteccion);

  -- Tabla particionada trimestralmente
  CREATE TABLE Incidentes (
      IncidenteID    NUMBER PRIMARY KEY,
      Descripcion    VARCHAR2(100),
      Severidad      VARCHAR2(20),
      Estado         VARCHAR2(20),
      FechaDeteccion DATE
  )
  PARTITION BY RANGE (FechaDeteccion) (
      PARTITION p_q1 VALUES LESS THAN (TO_DATE('2026-04-01','YYYY-MM-DD')),
      PARTITION p_q2 VALUES LESS THAN (TO_DATE('2026-07-01','YYYY-MM-DD')),
      PARTITION p_q3 VALUES LESS THAN (TO_DATE('2026-10-01','YYYY-MM-DD')),
      PARTITION p_q4 VALUES LESS THAN (TO_DATE('2027-01-01','YYYY-MM-DD'))
  );

Partition pruning: cuando una consulta filtra por FechaDeteccion, Oracle
identifica en tiempo de compilación o ejecución qué particiones contienen
los datos relevantes y omite el resto. En el plan de ejecución aparece
PARTITION RANGE SINGLE o PARTITION RANGE ITERATOR en vez de un full scan
de todas las particiones, reduciendo significativamente el I/O.

CRITERIOS DE EVALUACIÓN (10 puntos):

  [3 pts] Ventajas y desventajas:
    - 1 pt : al menos 1 ventaja y 1 desventaja de índices
    - 1 pt : al menos 1 ventaja y 1 desventaja de particiones
    - 1 pt : las desventajas son específicas (no genéricas)

  [4 pts] Aplicación en Incidentes:
    - 2 pts: índice compuesto con Severidad y FechaDeteccion
    - 2 pts: partición por rango de FechaDeteccion con al menos 2 particiones
             trimestrales

  [3 pts] Partition pruning:
    - 3 pts: explica que Oracle omite particiones irrelevantes y menciona cómo
             se ve en el plan (PARTITION RANGE SINGLE, etc.)
    - 1 pt : menciona que mejora el rendimiento pero sin explicar el mecanismo

================================================================================
PARTE 2 - EJERCICIOS PRÁCTICOS (60 puntos)
================================================================================

------------------------------------------------------------------------
EJERCICIO 1 (20 puntos): Procedimiento registrar_asignacion
------------------------------------------------------------------------

RESPUESTA CORRECTA:

  CREATE OR REPLACE PROCEDURE registrar_asignacion(
      p_agente_id    IN NUMBER,
      p_incidente_id IN NUMBER,
      p_horas        IN NUMBER,
      p_rol          IN VARCHAR2
  ) AS
      v_nuevo_id       NUMBER;
      v_horas_agente   NUMBER;
      v_nro_agentes    NUMBER;
      e_limite_horas   EXCEPTION;
      e_limite_agentes EXCEPTION;
  BEGIN
      SELECT NVL(MAX(AsignacionID), 0) + 1 INTO v_nuevo_id FROM Asignaciones;

      -- Validación 1: horas totales del agente en incidentes abiertos
      SAVEPOINT sp_validacion_horas;

      SELECT NVL(SUM(A.Horas), 0)
        INTO v_horas_agente
        FROM Asignaciones A
        JOIN Incidentes I ON A.IncidenteID = I.IncidenteID
       WHERE A.AgenteID = p_agente_id
         AND I.Estado   = 'Abierto';

      IF v_horas_agente + p_horas > 100 THEN
          RAISE e_limite_horas;
      END IF;

      -- Validación 2: número de agentes ya asignados al incidente
      SAVEPOINT sp_validacion_agentes;

      SELECT COUNT(*)
        INTO v_nro_agentes
        FROM Asignaciones
       WHERE IncidenteID = p_incidente_id;

      IF v_nro_agentes >= 3 THEN
          RAISE e_limite_agentes;
      END IF;

      -- Inserción
      INSERT INTO Asignaciones (AsignacionID, AgenteID, IncidenteID, Horas, Rol)
      VALUES (v_nuevo_id, p_agente_id, p_incidente_id, p_horas, p_rol);

      COMMIT;
      DBMS_OUTPUT.PUT_LINE('Asignación registrada. ID: ' || v_nuevo_id);

  EXCEPTION
      WHEN e_limite_horas THEN
          ROLLBACK TO sp_validacion_horas;
          DBMS_OUTPUT.PUT_LINE('Error: el agente supera las 100 horas en incidentes abiertos.');
      WHEN e_limite_agentes THEN
          ROLLBACK TO sp_validacion_agentes;
          DBMS_OUTPUT.PUT_LINE('Error: el incidente ya tiene 3 o más agentes asignados.');
      WHEN OTHERS THEN
          ROLLBACK;
          DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM);
  END;
  /

CRITERIOS DE EVALUACIÓN (20 puntos):

  [4 pts] Inserción con AsignacionID calculado:
    - 4 pts: usa MAX(AsignacionID)+1 o secuencia
    - 2 pts: inserta pero sin calcular el ID correctamente

  [5 pts] Validación horas totales del agente:
    - 5 pts: consulta SUM(Horas) con JOIN a Incidentes filtrando Estado='Abierto'
             y suma p_horas antes de comparar con 100
    - 3 pts: valida horas pero sin filtrar por Estado='Abierto' o sin sumar
             p_horas al total existente
    - 0 pts: no valida

  [5 pts] Validación número de agentes por incidente:
    - 5 pts: COUNT(*) en Asignaciones filtrando por IncidenteID y compara >= 3
    - 3 pts: lógica correcta pero con error menor (ej: compara > 3 en vez de >= 3)
    - 0 pts: no valida

  [6 pts] Savepoints independientes y excepciones:
    - 3 pts: usa un SAVEPOINT distinto para cada validación y hace ROLLBACK TO
             al savepoint correspondiente en cada excepción
    - 3 pts: maneja las excepciones con mensajes descriptivos e incluye OTHERS
    - 1 pt : usa SAVEPOINT pero hace ROLLBACK general en todas las excepciones

------------------------------------------------------------------------
EJERCICIO 2 (20 puntos): Data Warehouse con función de ventana
------------------------------------------------------------------------

RESPUESTA CORRECTA:

  -- Dimensión Agente
  CREATE TABLE Dim_Agente (
      AgenteKey    NUMBER PRIMARY KEY,
      AgenteID     NUMBER,
      Nombre       VARCHAR2(50),
      Especialidad VARCHAR2(50)
  );

  -- Dimensión Incidente
  CREATE TABLE Dim_Incidente (
      IncidenteKey NUMBER PRIMARY KEY,
      IncidenteID  NUMBER,
      Descripcion  VARCHAR2(100),
      Severidad    VARCHAR2(20),
      Estado       VARCHAR2(20)
  );

  -- Tabla de hechos
  CREATE TABLE Fact_Asignaciones (
      FactID        NUMBER PRIMARY KEY,
      AgenteKey     NUMBER,
      IncidenteKey  NUMBER,
      HorasTotales  NUMBER,
      FOREIGN KEY (AgenteKey)    REFERENCES Dim_Agente(AgenteKey),
      FOREIGN KEY (IncidenteKey) REFERENCES Dim_Incidente(IncidenteKey)
  );

  -- Consulta analítica simple (sobre tablas OLTP)
  SELECT
      AG.Nombre                         AS Agente,
      AG.Especialidad,
      SUM(A.Horas)                      AS TotalHoras,
      COUNT(DISTINCT A.IncidenteID)     AS NroIncidentes
  FROM Asignaciones A
  JOIN Agentes AG ON A.AgenteID = AG.AgenteID
  GROUP BY AG.Nombre, AG.Especialidad
  ORDER BY TotalHoras DESC;

CRITERIOS DE EVALUACIÓN (20 puntos):

  [6 pts] Diseño de tablas DW:
    - 2 pts: Fact_Asignaciones con métricas y FK a dimensiones
    - 2 pts: Dim_Agente con atributos descriptivos
    - 2 pts: Dim_Incidente con atributos descriptivos (incluyendo Severidad)

  [8 pts] Consulta analítica (sobre tablas OLTP):
    - 4 pts: JOIN correcto entre Asignaciones y Agentes
    - 2 pts: SUM(Horas) y COUNT(DISTINCT IncidenteID) por agente
    - 2 pts: GROUP BY y ORDER BY TotalHoras DESC correctos

------------------------------------------------------------------------
EJERCICIO 3 (20 puntos): Índice compuesto, partición e índice local
------------------------------------------------------------------------

RESPUESTA CORRECTA:

  -- Parte A: Índice compuesto
  CREATE INDEX idx_inc_sev_fecha ON Incidentes (Severidad, FechaDeteccion);

  -- Parte B: Tabla Incidentes particionada trimestralmente
  CREATE TABLE Incidentes (
      IncidenteID    NUMBER PRIMARY KEY,
      Descripcion    VARCHAR2(100),
      Severidad      VARCHAR2(20),
      Estado         VARCHAR2(20),
      FechaDeteccion DATE
  )
  PARTITION BY RANGE (FechaDeteccion) (
      PARTITION p_q1 VALUES LESS THAN (TO_DATE('2026-04-01','YYYY-MM-DD')),
      PARTITION p_q2 VALUES LESS THAN (TO_DATE('2026-07-01','YYYY-MM-DD')),
      PARTITION p_q3 VALUES LESS THAN (TO_DATE('2026-10-01','YYYY-MM-DD')),
      PARTITION p_q4 VALUES LESS THAN (TO_DATE('2027-01-01','YYYY-MM-DD'))
  );

  -- Parte C: Consulta Q1 2026 con incidentes Critical
  SELECT I.IncidenteID, I.Descripcion, SUM(A.Horas) AS TotalHoras
  FROM Incidentes I
  JOIN Asignaciones A ON I.IncidenteID = A.IncidenteID
  WHERE I.Severidad      = 'Critical'
    AND I.FechaDeteccion >= TO_DATE('2026-01-01','YYYY-MM-DD')
    AND I.FechaDeteccion <  TO_DATE('2026-04-01','YYYY-MM-DD')
  GROUP BY I.IncidenteID, I.Descripcion
  ORDER BY TotalHoras DESC;

  -- Parte D: Plan de ejecución
  EXPLAIN PLAN FOR
  SELECT I.IncidenteID, I.Descripcion, SUM(A.Horas) AS TotalHoras
  FROM Incidentes I
  JOIN Asignaciones A ON I.IncidenteID = A.IncidenteID
  WHERE I.Severidad      = 'Critical'
    AND I.FechaDeteccion >= TO_DATE('2026-01-01','YYYY-MM-DD')
    AND I.FechaDeteccion <  TO_DATE('2026-04-01','YYYY-MM-DD')
  GROUP BY I.IncidenteID, I.Descripcion;

  SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

  -- Análisis esperado del plan:
  --   PARTITION RANGE SINGLE → Oracle accede solo a p_q1 (partition pruning
  --                            por FechaDeteccion en Q1 2026)
  --   INDEX RANGE SCAN       → usa idx_inc_local_sev para filtrar Severidad
  --                            dentro de la partición p_q1
  --   HASH JOIN              → join entre Incidentes y Asignaciones
  --   Sin partición: Oracle haría FULL TABLE SCAN en todas las particiones

CRITERIOS DE EVALUACIÓN (20 puntos):

  [4 pts] Índice compuesto:
    - 4 pts: CREATE INDEX con Severidad y FechaDeteccion
    - 2 pts: índice con solo una columna

  [8 pts] Partición trimestral:
    - 8 pts: PARTITION BY RANGE (FechaDeteccion) con 4 trimestres de 2026
             con sintaxis correcta
    - 5 pts: sintaxis correcta pero con menos de 4 trimestres o fechas
             incorrectas
    - 2 pts: menciona la idea de particionar pero la sintaxis es muy incorrecta

  [4 pts] Consulta Q1 2026 Critical:
    - 4 pts: filtra por Severidad='Critical' y rango de fechas Q1, hace JOIN
             con Asignaciones y agrupa por incidente
    - 2 pts: lógica correcta pero filtra por mes con EXTRACT en vez de rango

  [4 pts] Plan de ejecución:
    - 2 pts: usa EXPLAIN PLAN + DBMS_XPLAN.DISPLAY
    - 2 pts: menciona al menos una ventaja concreta de la partición para esta
             consulta (ej: Oracle solo lee p_q1, evita leer el resto)

================================================================================
TABLA DE NOTAS
================================================================================

  Puntaje  | Nota
  ---------|------
   0 -  9  | 1.0
  10 - 19  | 1.6
  20 - 29  | 2.2
  30 - 39  | 2.8
  40 - 49  | 3.4
  50 - 59  | 4.0  ← mínimo aprobación
  60 - 69  | 4.6
  70 - 79  | 5.2
  80 - 89  | 5.8
  90 - 99  | 6.4
    100    | 7.0

  Fórmula exacta: nota = 1.0 + (puntaje / 100.0) * 6.0

================================================================================
*/
