/*
================================================================================
PAUTA EXAMEN FINAL - TÓPICOS AVANZADOS DE BASES DE DATOS
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
PREGUNTA 1 (10 puntos): Transacciones, ACID y savepoints con 3 operaciones
------------------------------------------------------------------------

RESPUESTA ESPERADA:

Una transacción es un conjunto de operaciones DML que se ejecutan como unidad
atómica. Garantiza las propiedades ACID:
  - Atomicidad: todas las operaciones tienen éxito o ninguna.
  - Consistencia: la BD pasa de un estado válido a otro.
  - Aislamiento: transacciones concurrentes no se interfieren entre sí.
  - Durabilidad: los cambios confirmados con COMMIT persisten ante fallos.

Ejemplo con 3 operaciones y savepoints:

  BEGIN
      -- Operación 1: Insertar agente
      SAVEPOINT sp_agente;
      INSERT INTO Agentes (AgenteID, Nombre, Especialidad, FechaIngreso)
      VALUES (106, 'Roberto Silva', 'Analista SOC', SYSDATE);

      -- Operación 2: Insertar incidente
      SAVEPOINT sp_incidente;
      INSERT INTO Incidentes (IncidenteID, Descripcion, Severidad, Estado, FechaDeteccion)
      VALUES (208, 'Brute force en SSH', 'High', 'Abierto', SYSDATE);

      -- Operación 3: Insertar asignación
      SAVEPOINT sp_asignacion;
      INSERT INTO Asignaciones (AsignacionID, AgenteID, IncidenteID, Horas, Rol)
      VALUES (13, 106, 208, 20, 'Lider');

      COMMIT;
  EXCEPTION
      WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
  END;
  /

Flujo de ROLLBACK TO:
  - Si falla la asignación: ROLLBACK TO sp_asignacion deshace solo el INSERT
    de Asignaciones. El agente y el incidente quedan intactos. Se puede hacer
    COMMIT para guardar agente + incidente.
  - Si falla el incidente: ROLLBACK TO sp_incidente deshace el INSERT del
    incidente y todo lo posterior (la asignación nunca se ejecutó). El agente
    queda intacto porque está antes de sp_incidente. Se puede hacer COMMIT
    para guardar solo el agente.

CRITERIOS DE EVALUACIÓN (10 puntos):

  [4 pts] Propiedades ACID:
    - 4 pts: describe correctamente las 4 propiedades
    - 2 pts: menciona solo 2 o 3 propiedades correctamente
    - 0 pts: no menciona ACID o las describe incorrectamente

  [6 pts] Savepoints con 3 operaciones:
    - 3 pts: usa un SAVEPOINT antes de cada operación y explica que
             ROLLBACK TO deshace desde ese punto hacia adelante
    - 3 pts: explica correctamente ambos escenarios de fallo (falla
             asignación vs falla incidente) y qué se mantiene en cada caso

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

Modelo dimensional (esquema estrella) para rendimiento por agente:

  -- Dimensión Agente
  CREATE TABLE Dim_Agente (
      AgenteKey    NUMBER PRIMARY KEY,
      AgenteID     NUMBER,
      Nombre       VARCHAR2(50),
      Especialidad VARCHAR2(50)
  );

  -- Dimensión Tiempo
  CREATE TABLE Dim_Tiempo (
      TiempoKey  NUMBER PRIMARY KEY,
      Fecha      DATE,
      Mes        NUMBER,
      Trimestre  NUMBER,
      Anio       NUMBER
  );

  -- Tabla de hechos
  CREATE TABLE Fact_Rendimiento_Agente (
      FactID         NUMBER PRIMARY KEY,
      AgenteKey      NUMBER,
      TiempoKey      NUMBER,
      Severidad      VARCHAR2(20),
      HorasTotales   NUMBER,
      NroIncidentes  NUMBER,
      FOREIGN KEY (AgenteKey) REFERENCES Dim_Agente(AgenteKey),
      FOREIGN KEY (TiempoKey) REFERENCES Dim_Tiempo(TiempoKey)
  );

Las tablas del DW están desnormalizadas porque:
  - Reducen la cantidad de JOINs necesarios para consultas analíticas.
  - Los datos redundantes permiten agregaciones directas sin recorrer
    múltiples tablas normalizadas.
  - Optimizan lectura masiva a costa de espacio en disco.

Ventajas vs consultar OLTP directamente:
  - Consultas más simples y rápidas (menos JOINs).
  - No afecta el rendimiento del sistema transaccional.
  - Permite análisis histórico con datos pre-agregados.
  - Facilita el uso de herramientas de BI.

CRITERIOS DE EVALUACIÓN (10 puntos):

  [3 pts] Diferencia OLTP vs DW:
    - 3 pts: distingue propósito y menciona al menos 2 diferencias concretas
    - 1 pt : solo menciona que uno es para operaciones y otro para análisis

  [4 pts] Modelo dimensional:
    - 2 pts: Fact_Rendimiento_Agente con métricas y FK a dimensiones
    - 2 pts: al menos 2 dimensiones coherentes (Agente, Tiempo, etc.)

  [3 pts] Desnormalización y ventajas:
    - 3 pts: explica por qué se desnormaliza y al menos 2 ventajas vs OLTP
    - 1 pt : menciona solo una ventaja genérica

------------------------------------------------------------------------
PREGUNTA 3 (10 puntos): Herencia con tipos de objetos - dos niveles
------------------------------------------------------------------------

RESPUESTA ESPERADA:

Oracle implementa herencia con NOT FINAL (permite subtipos) y UNDER (define
el subtipo). Un tipo NOT INSTANTIABLE no puede instanciarse directamente,
solo sus subtipos concretos pueden usarse para crear objetos.

NOT FINAL: indica que el tipo puede tener subtipos (hijos). Sin NOT FINAL,
no se puede usar UNDER para heredar de él.

NOT INSTANTIABLE: no se pueden crear objetos directamente de ese tipo. Solo
sirve como plantilla base. Es como una clase abstracta.

  -- Nivel 1: tipo base (abstracto)
  CREATE OR REPLACE TYPE t_Agente AS OBJECT (
      AgenteID     NUMBER,
      Nombre       VARCHAR2(50),
      Especialidad VARCHAR2(50),
      MEMBER FUNCTION calcular_prioridad RETURN NUMBER
  ) NOT FINAL NOT INSTANTIABLE;
  /

  -- Nivel 2: subtipo intermedio
  CREATE OR REPLACE TYPE t_AgenteEspecialista UNDER t_Agente (
      NivelCertificacion VARCHAR2(20),
      OVERRIDING MEMBER FUNCTION calcular_prioridad RETURN NUMBER
  ) NOT FINAL;
  /

  -- Nivel 3: subtipo concreto
  CREATE OR REPLACE TYPE t_AgentePentester UNDER t_AgenteEspecialista (
      HerramientaPrincipal VARCHAR2(50),
      OVERRIDING MEMBER FUNCTION calcular_prioridad RETURN NUMBER
  );
  /

  -- Implementación del método en AgenteEspecialista
  CREATE OR REPLACE TYPE BODY t_AgenteEspecialista AS
      OVERRIDING MEMBER FUNCTION calcular_prioridad RETURN NUMBER IS
      BEGIN
          RETURN 2; -- prioridad media
      END;
  END;
  /

  -- Implementación del método en AgentePentester
  CREATE OR REPLACE TYPE BODY t_AgentePentester AS
      OVERRIDING MEMBER FUNCTION calcular_prioridad RETURN NUMBER IS
      BEGIN
          RETURN 1; -- prioridad alta
      END;
  END;
  /

Cada nivel hereda los atributos del nivel superior y puede sobreescribir
calcular_prioridad() con OVERRIDING para implementar su propia lógica.

CRITERIOS DE EVALUACIÓN (10 puntos):

  [4 pts] Concepto de herencia en Oracle:
    - 2 pts: menciona NOT FINAL y UNDER correctamente
    - 2 pts: explica NOT INSTANTIABLE y NOT FINAL con sus implicancias

  [6 pts] Jerarquía de dos niveles:
    - 3 pts: define los 3 tipos con la jerarquía correcta (Agente →
             AgenteEspecialista → AgentePentester) con NOT FINAL en los
             intermedios
    - 3 pts: usa OVERRIDING en calcular_prioridad() en al menos 2 niveles
             y agrega atributos propios en cada subtipo

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

Aplicación en Incidentes (semestral 2026 + índice compuesto):

  -- Tabla particionada semestralmente
  CREATE TABLE Incidentes_Part (
      IncidenteID    NUMBER PRIMARY KEY,
      Descripcion    VARCHAR2(100),
      Severidad      VARCHAR2(20),
      Estado         VARCHAR2(20),
      FechaDeteccion DATE
  )
  PARTITION BY RANGE (FechaDeteccion) (
      PARTITION p_s1 VALUES LESS THAN (TO_DATE('2026-07-01','YYYY-MM-DD')),
      PARTITION p_s2 VALUES LESS THAN (TO_DATE('2027-01-01','YYYY-MM-DD'))
  );

  -- Índice compuesto sobre Estado y Severidad
  CREATE INDEX idx_inc_estado_sev ON Incidentes_Part(Estado, Severidad);

  -- Consulta optimizada
  SELECT * FROM Incidentes_Part
  WHERE Estado = 'Abierto'
    AND Severidad = 'Critical'
    AND FechaDeteccion >= TO_DATE('2026-01-01','YYYY-MM-DD')
    AND FechaDeteccion <  TO_DATE('2026-07-01','YYYY-MM-DD');

Partition pruning: cuando la consulta filtra por FechaDeteccion en el primer
semestre, Oracle identifica que solo la partición p_s1 contiene datos
relevantes y omite p_s2 completamente. En el plan de ejecución aparece
PARTITION RANGE SINGLE en vez de un full scan de todas las particiones.
Además, dentro de p_s1 usa INDEX RANGE SCAN con idx_inc_estado_sev para
filtrar por Estado y Severidad.

CRITERIOS DE EVALUACIÓN (10 puntos):

  [3 pts] Ventajas y desventajas:
    - 1 pt : al menos 1 ventaja y 1 desventaja de índices
    - 1 pt : al menos 1 ventaja y 1 desventaja de particiones
    - 1 pt : las desventajas son específicas (no genéricas)

  [4 pts] DDL de tabla particionada e índice:
    - 2 pts: partición por rango de FechaDeteccion con 2 semestres
    - 2 pts: índice compuesto con Estado y Severidad

  [3 pts] Partition pruning y plan de ejecución:
    - 3 pts: explica que Oracle omite particiones irrelevantes y menciona
             PARTITION RANGE SINGLE o similar en el plan
    - 1 pt : menciona que mejora el rendimiento pero sin explicar el mecanismo

================================================================================
PARTE 2 - EJERCICIOS PRÁCTICOS (60 puntos)
================================================================================

------------------------------------------------------------------------
EJERCICIO 1 (20 puntos): Procedimiento cerrar_incidente
------------------------------------------------------------------------

RESPUESTA CORRECTA:

  CREATE OR REPLACE PROCEDURE cerrar_incidente(
      p_incidente_id IN  NUMBER,
      p_total_horas  OUT NUMBER
  ) AS
      v_estado       VARCHAR2(20);
      e_no_existe    EXCEPTION;
      e_ya_cerrado   EXCEPTION;
  BEGIN
      -- Validar existencia y estado
      BEGIN
          SELECT Estado INTO v_estado
          FROM Incidentes
          WHERE IncidenteID = p_incidente_id;
      EXCEPTION
          WHEN NO_DATA_FOUND THEN
              RAISE e_no_existe;
      END;

      IF v_estado = 'Cerrado' THEN
          RAISE e_ya_cerrado;
      END IF;

      -- Actualizar estado
      SAVEPOINT sp_actualizar_estado;
      UPDATE Incidentes
      SET Estado = 'Cerrado'
      WHERE IncidenteID = p_incidente_id;

      -- Calcular horas totales
      SAVEPOINT sp_calcular_horas;
      SELECT NVL(SUM(Horas), 0)
      INTO p_total_horas
      FROM Asignaciones
      WHERE IncidenteID = p_incidente_id;

      -- Advertencia si supera 80 horas
      IF p_total_horas > 80 THEN
          DBMS_OUTPUT.PUT_LINE('ADVERTENCIA: Incidente ' || p_incidente_id ||
              ' fue de alto esfuerzo (' || p_total_horas || ' horas).');
      END IF;

      COMMIT;
      DBMS_OUTPUT.PUT_LINE('Incidente ' || p_incidente_id || ' cerrado. Horas totales: ' || p_total_horas);

  EXCEPTION
      WHEN e_no_existe THEN
          DBMS_OUTPUT.PUT_LINE('Error: el incidente ' || p_incidente_id || ' no existe.');
      WHEN e_ya_cerrado THEN
          DBMS_OUTPUT.PUT_LINE('Error: el incidente ' || p_incidente_id || ' ya está cerrado.');
      WHEN OTHERS THEN
          ROLLBACK TO sp_actualizar_estado;
          DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM);
  END;
  /

  -- Prueba:
  DECLARE
      v_horas NUMBER;
  BEGIN
      cerrar_incidente(201, v_horas);
      DBMS_OUTPUT.PUT_LINE('Horas retornadas: ' || v_horas);
  END;
  /

CRITERIOS DE EVALUACIÓN (20 puntos):

  [4 pts] Validación de existencia y estado:
    - 2 pts: SELECT con NO_DATA_FOUND para incidente inexistente
    - 2 pts: valida que Estado sea 'Abierto' (o no sea 'Cerrado')

  [4 pts] UPDATE del estado y parámetro OUT:
    - 2 pts: UPDATE Incidentes SET Estado = 'Cerrado'
    - 2 pts: SUM(Horas) retornado en el parámetro OUT correctamente

  [4 pts] Advertencia y lógica condicional:
    - 4 pts: IF total > 80 con DBMS_OUTPUT de advertencia
    - 2 pts: tiene la lógica pero el umbral o mensaje es incorrecto

  [4 pts] Savepoints:
    - 4 pts: savepoint entre UPDATE y cálculo de horas, ROLLBACK TO en
             EXCEPTION que preserva el UPDATE si falla el cálculo
    - 2 pts: usa savepoint pero no lo aplica correctamente en excepciones

  [4 pts] Manejo de excepciones:
    - 4 pts: maneja excepciones (no existe, ya cerrado, OTHERS) con
             mensajes descriptivos
    - 2 pts: maneja solo 1 excepción o mensajes genéricos

------------------------------------------------------------------------
EJERCICIO 2 (20 puntos): DW y consulta analítica con GROUP BY
------------------------------------------------------------------------

RESPUESTA CORRECTA:

  -- Dimensión Agente
  CREATE TABLE Dim_Agente (
      AgenteKey    NUMBER PRIMARY KEY,
      AgenteID     NUMBER,
      Nombre       VARCHAR2(50),
      Especialidad VARCHAR2(50)
  );

  -- Dimensión Tiempo
  CREATE TABLE Dim_Tiempo (
      TiempoKey  NUMBER PRIMARY KEY,
      Fecha      DATE,
      Mes        NUMBER,
      Trimestre  NUMBER,
      Anio       NUMBER
  );

  -- Tabla de hechos
  CREATE TABLE Fact_Horas_Agente (
      FactID       NUMBER PRIMARY KEY,
      AgenteKey    NUMBER,
      TiempoKey    NUMBER,
      HorasTotales NUMBER,
      NroIncidentes NUMBER,
      FOREIGN KEY (AgenteKey) REFERENCES Dim_Agente(AgenteKey),
      FOREIGN KEY (TiempoKey) REFERENCES Dim_Tiempo(TiempoKey)
  );

  -- Consulta analítica sobre tablas transaccionales
  SELECT
      AG.Especialidad,
      AG.Nombre,
      SUM(A.Horas) AS TotalHoras,
      COUNT(DISTINCT A.IncidenteID) AS NroIncidentes
  FROM Asignaciones A
  JOIN Agentes AG ON A.AgenteID = AG.AgenteID
  GROUP BY AG.Especialidad, AG.Nombre
  ORDER BY TotalHoras DESC;

  -- Resultado esperado:
  -- Analista SOC  | Diego Muñoz       | 105 | 3
  -- Pentester     | Camila Reyes      |  75 | 2
  -- Analista SOC  | Valentina Soto    |  70 | 3
  -- Forense Dig.  | Matías Fernández  |  65 | 2
  -- Pentester     | Francisca López   |  55 | 2

CRITERIOS DE EVALUACIÓN (20 puntos):

  [6 pts] Diseño de tablas DW:
    - 2 pts: Fact_Horas_Agente con métricas y FK a dimensiones
    - 2 pts: Dim_Agente con atributos descriptivos
    - 2 pts: Dim_Tiempo con atributos temporales (Mes, Trimestre, Año)

  [8 pts] Consulta analítica:
    - 4 pts: JOIN correcto entre Asignaciones y Agentes
    - 2 pts: SUM(Horas) y COUNT(DISTINCT IncidenteID) por agente
    - 2 pts: GROUP BY y ORDER BY TotalHoras DESC correctos

  [6 pts] Estructura general:
    - 3 pts: incluye Especialidad en el SELECT y GROUP BY
    - 3 pts: resultado coherente con los datos de la prueba

------------------------------------------------------------------------
EJERCICIO 3 (20 puntos): Partición por rango de Horas e índice LOCAL
------------------------------------------------------------------------

RESPUESTA CORRECTA:

  -- Tabla Asignaciones particionada por rango de Horas
  CREATE TABLE Asignaciones_Part (
      AsignacionID NUMBER,
      AgenteID     NUMBER,
      IncidenteID  NUMBER,
      Horas        NUMBER,
      Rol          VARCHAR2(30)
  )
  PARTITION BY RANGE (Horas) (
      PARTITION p_baja  VALUES LESS THAN (21),
      PARTITION p_media VALUES LESS THAN (51),
      PARTITION p_alta  VALUES LESS THAN (MAXVALUE)
  );

  -- Índice compuesto
  CREATE INDEX idx_asig_ag_inc
  ON Asignaciones_Part(AgenteID, IncidenteID);

  -- Consulta: agentes con asignaciones de carga alta
  SELECT AG.Nombre, AG.Especialidad, AP.Horas, I.Descripcion
  FROM Asignaciones_Part AP
  JOIN Agentes AG ON AP.AgenteID = AG.AgenteID
  JOIN Incidentes I ON AP.IncidenteID = I.IncidenteID
  WHERE AP.Horas > 50;

  -- Plan de ejecución
  EXPLAIN PLAN FOR
  SELECT AG.Nombre, AG.Especialidad, AP.Horas, I.Descripcion
  FROM Asignaciones_Part AP
  JOIN Agentes AG ON AP.AgenteID = AG.AgenteID
  JOIN Incidentes I ON AP.IncidenteID = I.IncidenteID
  WHERE AP.Horas > 50;

  SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

  -- Análisis del plan:
  --   PARTITION RANGE SINGLE → Oracle accede solo a p_alta (partition pruning
  --                            porque Horas > 50 cae exclusivamente en esa
  --                            partición)
  --   Las particiones p_baja y p_media son completamente ignoradas
  --   INDEX RANGE SCAN → usa idx_asig_ag_inc solo en p_alta
  --   Beneficio: reduce I/O a ~1/3 de la tabla total

CRITERIOS DE EVALUACIÓN (20 puntos):

  [6 pts] Tabla particionada por Horas:
    - 6 pts: PARTITION BY RANGE (Horas) con 3 particiones correctas
             (baja <21, media <51, alta MAXVALUE o similar)
    - 4 pts: partición correcta pero con solo 2 rangos o límites distintos
    - 2 pts: menciona la idea pero sintaxis muy incorrecta

  [4 pts] Índice compuesto:
    - 4 pts: CREATE INDEX ... (AgenteID, IncidenteID)
    - 2 pts: índice con solo una columna

  [4 pts] Consulta:
    - 4 pts: JOIN con Agentes e Incidentes, filtra Horas > 50, muestra
             nombre del agente y descripción del incidente
    - 2 pts: consulta correcta pero sin JOIN a alguna tabla

  [6 pts] Plan de ejecución y análisis:
    - 3 pts: EXPLAIN PLAN + DBMS_XPLAN.DISPLAY
    - 3 pts: explica que partition pruning descarta p_baja y p_media,
             accediendo solo a p_alta

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
